From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 May 2016 18:09:41 +0200
Subject: [Buildroot] [PATCH] ustr: Makefile fixes for link failures
In-Reply-To: <CANn-YGSiK9XikXa8UHTO_VwUMr7Uk9U2em0np2O49zjgO7aeFg@mail.gmail.com>
References: <1464187973-11273-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <20160525171627.072cade5@free-electrons.com>
 <CANn-YGSiK9XikXa8UHTO_VwUMr7Uk9U2em0np2O49zjgO7aeFg@mail.gmail.com>
Message-ID: <20160525180941.1c7bbed7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 May 2016 10:44:57 -0500, Clayton Shotwell wrote:

> I completely agree with your assessment but I am unfortunately out of
> ideas on what could be causing the build failures.

Inspecting the log and looking at the makefile, I believe I have a
possible interpretation.

Here is the relevant part of the Makefile:

"""
install: install-opt install-dbg

install-opt: install-dirs install-opt-lib install-common

install-dbg: install-dirs install-dbg-lib install-common

install-opt-lib: $(OPT_LIB_STATIC) $(OPT_LIB_SHARED) ustr.pc
                @echo Installing files
                install -m 644 -t $(DESTDIR)$(libdir) $(OPT_LIB_STATIC)
                install -m 755 -t $(DESTDIR)$(libdir) $(OPT_LIB_SHARED)
                -rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
                ln -s $(OPT_LIB_SHARED) $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
                -rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
                ln -s $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
                -rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV_BSO)
                ln -s $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV_BSO)
                $(LDCONFIG) -n $(DESTDIR)$(libdir)
                install -pm 644 -t $(DESTDIR)$(libdir)/pkgconfig ustr.pc

install-dbg-lib: $(DBG_LIB_STATIC) $(DBG_LIB_SHARED) ustr-debug.pc
                @echo Installing files
                install -m 644 -t $(DESTDIR)$(libdir) $(DBG_LIB_STATIC)
                install -m 755 -t $(DESTDIR)$(libdir) $(DBG_LIB_SHARED)
                -rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
                ln -s $(DBG_LIB_SHARED) $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
                -rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
                ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
                -rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV_BSO)
                ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV_BSO)
                $(LDCONFIG) -n $(DESTDIR)$(libdir)
                install -pm 644 -t $(DESTDIR)$(libdir)/pkgconfig ustr-debug.pc
"""

Since install-opt-lib and install-dbg-lib don't have any dependency on
each other, they can execute concurrently.

What is important to realize is that $(LDCONFIG) -n $(DESTDIR)$(libdir)
will create the symbolic links to the libraries if they don't exist.
So, if you have the following sequence of step:

 [1] The install-dbg-lib installs its libraries and removes its
     symbolic link:

     install -m 644 -t $(DESTDIR)$(libdir) $(DBG_LIB_STATIC)
     install -m 755 -t $(DESTDIR)$(libdir) $(DBG_LIB_SHARED)
     -rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)

 [2] The install-opt-lib runs its LDCONFIG

     $(LDCONFIG) -n $(DESTDIR)$(libdir)

 [3] The install-dbg-lib continues its work and creates symlinks:

     ln -s $(DBG_LIB_SHARED) $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)

Then, when [3] will run, the symbolic link will already have been
created by step [2], and [3] will therefore fail. Of course, there is
only a very short window of time between the "rm" and the "ln", but it
might be sufficient for the ldconfig to create the symbolic link during
this, causing the failure.

Possible solutions:

 (1) Get rid of ldconfig by passing LDCONFIG=/bin/true in the
     environment. Probably the easiest.

 (2) Add -f in the option to ln to not fail if the link already exists.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
