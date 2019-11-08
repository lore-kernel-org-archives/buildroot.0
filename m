From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 8 Nov 2019 22:28:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/vnstat: fix build failure due
 to double install of programs
In-Reply-To: <20191031121848.7914-1-fontaine.fabrice@gmail.com>
References: <20191031121848.7914-1-fontaine.fabrice@gmail.com>
Message-ID: <20191108222826.14ea446c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu, 31 Oct 2019 13:18:48 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/3aefa8d63f710b71720fc114450110d2f885820b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Why is this happening just 3 times? Is it a parallel build issue? Also,
when I build vnstat a first time, and then do "make vnstat-rebuild",
which reinstalls the same files at the same place, it doesn't fail. So
why does it fail in those situations ?

> +-install-data-hook: install-exec
> ++install-data-hook:

This solution is anyway not good, because it reverts upstream commit
3a76e18434fb033d8ac80955626fc8e2ca966cfa, which is necessary. Look at
the Makefile.am, in the native compilation case:

install-data-hook: install-exec
        if [ -f $(DESTDIR)$(man1dir)/vnstatd.1 ]; then rm -f $(DESTDIR)$(man1dir)/vnstatd.1; fi
        $(MKDIR_P) $(DESTDIR)$(sysconfdir)
if IS_CROSSCOMPILED
        if [ ! -f $(DESTDIR)$(sysconfdir)/vnstat.conf ]; \
        then cp -fv $(srcdir)/cfg/vnstat.conf $(DESTDIR)$(sysconfdir)/vnstat.conf; \
        fi
else
        $(DESTDIR)$(bindir)/vnstat$(EXEEXT) --showconfig >vnstat.conf.new
        if [ -f $(DESTDIR)$(sysconfdir)/vnstat.conf ]; \
        then cp -fv $(DESTDIR)$(sysconfdir)/vnstat.conf vnstat.conf.old; \
        fi
        cp -fv vnstat.conf.new $(DESTDIR)$(sysconfdir)/vnstat.conf
endif

It runs the vnstat program itself! So it has to make sure it has been
installed before running it. Of course, this could be changed to run
the vnstat from the build directory instead of from the installation
location.

But as it is, your patch breaks things for upstream. For the Buildroot
case, it works fine, but we want more details as to what the problem
is, and why it happens so infrequently.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
