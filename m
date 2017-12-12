From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Dec 2017 07:10:05 +0100
Subject: [Buildroot] [PATCH] lynx: new package
In-Reply-To: <20171210174901.GB9766@momiji>
References: <20171210143404.29210-1-mlang@blind.guru>
 <20171210174901.GB9766@momiji>
Message-ID: <20171212071005.2acc987b@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Dec 2017 17:49:01 +0200, Adrian Perez de Castro wrote:

> > +	select BR2_PACKAGE_NCURSES
> > +	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
> > +	help
> > +	  Text mode web browser.
> > +  
> 
> You could add one additional line in the "help" section with the project
> URL (http://lynx.browser.org/)

Indeed.


> > +LYNX_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) ncurses
> > +LYNX_CONF_OPTS = --with-screen=ncurses --with-curses-dir=$(TARGET_DIR)/usr  

What is the curses-dir used for? It doesn't seem correct to point to
$(TARGET_DIR)/usr:

 - If it's used at build time, then you should use $(STAGING_DIR)/usr

 - If it's used at run time, then it's wrong, because $(TARGET_DIR)/usr
   doesn't exist at runtime.


> It is also possible to use "--with-screen=ncursesw", and AFAIU it should be
> preferred when ncurses is being built with wide-character support (that is:
> BR2_PACKAGE_NCURSES_WCHAR=y).
> 
> Lynx also supports being built with Slang instead of ncurses. There is a
> "slang" package in Buildroot: You might want to consider doing a follow-up
> patch which chooses slang when ncurses is not enabled (and slang is). I don't
> see this is very important because most builds will have ncurses anyway, but
> it could be a nice touch :-)

If slang can be used as an alternative to ncurses, it would be indeed
good to support that, like the OpenSSL/GnuTLS logic that Mario has
already added.

Mario, could you rework your patch according to Adrian's comments?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
