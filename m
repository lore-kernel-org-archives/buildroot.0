From: Steve Bennett <sablists@earthlink.net>
Date: Mon, 27 Jul 2009 16:09:19 -0400
Subject: [Buildroot] xlib libXt build problem
In-Reply-To: <8109ECD0-3E25-4BAD-B4D7-DE97BEEBE007@earthlink.net>
References: <8109ECD0-3E25-4BAD-B4D7-DE97BEEBE007@earthlink.net>
Message-ID: <2AD98A57-D816-4DE1-A9CC-2A63B4B15B25@earthlink.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Okay... That change didn't work, but through a lot of  
experimentation, I discovered that makestrs is a build-time tool and  
it's depending on the full X11 development header set to be in your  
standard include path.   I solved it through the quick hack of  
copying the header set from my staging directory to my /usr/include/ 
X11 folder.

I'm mostly posting this so anyone else who has a similar problem can  
find the answer without having to spend hours trying to figure things  
out.

Thanks,
-->Steve Bennett

On Jul 27, 2009, at 1:30 PM, Steve Bennett wrote:

> Hi!
>
> I've been trying to setup a buildroot configuration (in this case  
> an x86 environment, although PPC is next...) and have run into a  
> snag getting an X11 environment included.   I've done pretty much  
> the minimum configuration needed - setting the X Windows System  
> server to tinyx and turning on xorg-server.
>
> But the build is hanging in the middle of the X11 build, in  
> particular when building the makestrs.c module in the xlib libXt  
> package.   It fails with an error:
>
> 	makestrs.c:33:21: error: X11/Xos.h: No such file or directory
>
> I've put the full output at the end of this message.  (The string  
> library function warnings bother me too, but they're at least just  
> warnings...)  I've done quite a lot of searching and trying to  
> figure this out before coming here, and it looks to me like the  
> compiler command line is missing an include path to the staging  
> directory's /usr/include directory.   That seems to be correctly  
> referenced in the packages xlib_libXt.mk file (in  
> XLIB_LIBXT_CONF_ENV), but there is also a patch (xlib_libXt-1.0.5- 
> makestrs-nocc.patch) in the package folder which sets it up to use  
> gcc (the HOST_CC part of the patch) and doesn't seem to take into  
> account the staging directory.
>
> I'm making an educated guess that the patch effectively overrides  
> the XLIB_LIBXT_CONF_ENV setting (or something else isn't including  
> that setting), but I'm not sure what the right fix for this is.   A  
> brute force fix would be something like changing the patch to read:
>
> 	HOST_CC=gcc -I$(STAGING_DIR)/usr/include
>
> ...but is that the correct approach here?  And why hasn't anything  
> regarding this issue come up before?  It seems odd that nobody else  
> is running into this.
>
> -->Steve Bennett
>
