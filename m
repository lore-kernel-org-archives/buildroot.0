From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2009 21:50:59 +0200
Subject: [Buildroot] xlib libXt build problem
In-Reply-To: <8109ECD0-3E25-4BAD-B4D7-DE97BEEBE007@earthlink.net>
References: <8109ECD0-3E25-4BAD-B4D7-DE97BEEBE007@earthlink.net>
Message-ID: <20090727215059.2aa274de@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 27 Jul 2009 13:30:44 -0400,
Steve Bennett <sablists@earthlink.net> a ?crit :

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

I'd say the issue is that makestrs is a program compiled for the host,
and the way we compile it in Buildroot assumes that the development
headers for X11 are installed on your host (through your distribution).
On my Ubuntu system, X11/Xos.h is part of the x11proto-core-dev package.

On my system, this package is installed, so when makestrs gets
compiled, the host gcc compiler uses /usr/include/X11/Xos.h during the
compilation.

When building some packages requires things from the host, we have
currently two different approaches in Buildroot:
 * for some dependencies, we rebuild it, and install it in $(HOST_DIR)
 * for some other dependencies, we assume that it is available on the
   host

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
