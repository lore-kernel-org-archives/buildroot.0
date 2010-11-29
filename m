From: Matt Johnson <mj1856@hotmail.com>
Date: Sun, 28 Nov 2010 20:55:59 -0700
Subject: [Buildroot] packages not using target cflags
In-Reply-To: <87d3pp21xb.fsf@macbook.be.48ers.dk>
References: <BAY145-w13F5F6FEBA012526351555C2220@phx.gbl>,
	<87pqtq1mts.fsf@macbook.be.48ers.dk>,
	<BAY145-w235510FA6AD15BE8E1516BC2230@phx.gbl>,
	<87d3pp21xb.fsf@macbook.be.48ers.dk>
Message-ID: <BAY145-w42FA8982BB7DA1147B863EC2240@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Matt> BTW - I'm having similar Illegal Instruction problems with
> Matt> fontconfig and freetype. I will post back when I have solutions
> Matt> for those. I'm all ears if you have suggestions - as I don't see
> Matt> the same CFLAGS issue as the main xserver package.
>
> I atleast see a CFLAGS override in the fontconfig package, so that might
> be why.

Okay, I have workarounds, but I need some help here.
 
For fontconfig, there is a line at the top of fontconfig.mk with the following comments:
 
# This package does not like using the target cflags for some reason.
FONTCONFIG_CONF_ENV = CFLAGS="-I$(STAGING_DIR)/usr/include/freetype2"
 
The statement about it not liking the target cflags appears to be incorrect - at least for me.  Simple commenting out (or removing) the lines takes care of the problem and fontconfig builds properly.  Perhaps whomever added this had a specific case that failed?  At any rate, it doesn't seem right to not pass target cflags.
 
 
For freetype, I'm not sure how to get the required changes into freetype.mk.  I don't know enough about how freetype's makefiles were designed. But on line 90 of output/build/freetype-2.3.12/builds/unix/unix-cc.mk, there is a definition for CCraw as follows:
 
CCraw := $(CC) 
 
Changing this to:
 
CCraw := $(CC) $(CFLAGS)
 
takes care of the problem.  I'm uncomfortable with this though, because of the "raw" in the variable name, I'm thinking there was some purpose to not include the cflags to begin with, but I have no idea what that would be.  Further down the same file on line 108 is where the usage of CCraw is, and this is the compilation that causes the illegal instruction in my case because of the missing -march=armvt from my CFLAGS.
 
To get this change in to the freetype.mk file, wouldn't you have to inlclude the CFLAGS into the actual CC variable?  Is there a simple way to do this with buildroot's existing syntax?  Or should I approach the freetype community about changing their makefile?
 
Thanks,
Matt 		 	   		  
