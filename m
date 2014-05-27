From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 May 2014 22:03:36 +0200
Subject: [Buildroot] [PATCH 1/1] xserver_xorg-server: Fix race condition
	when installing man page
In-Reply-To: <1401219970-32159-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Tue, 27 May 2014 21:46:10 +0200")
References: <1401219970-32159-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87wqd7c7l3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Reproduced the bug using BR2_JLEVEL=16
 > Fixes race condition by disabling the installation of Xserver.1

 > http://autobuild.buildroot.net/results/11e/11ece737078ca8da2fee4249432148675b4e630e//
 > http://autobuild.buildroot.net/results/a95/a952932b832ee3296d6c225c7a9df408ca3eef9f//

 > While being at it, rename xserver_xorg-server-mips.patch.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  ...erver-mips.patch => xserver_xorg-server-0001-mips.patch} |    0
 >  .../xserver_xorg-server-0002-disable_man.patch              |   11 +++++++++++
 >  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk    |    1 +
 >  3 files changed, 12 insertions(+)
 >  rename package/x11r7/xserver_xorg-server/{xserver_xorg-server-mips.patch => xserver_xorg-server-0001-mips.patch} (100%)
 >  create mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-0002-disable_man.patch

 > diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-mips.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-0001-mips.patch
 > similarity index 100%
 > rename from package/x11r7/xserver_xorg-server/xserver_xorg-server-mips.patch
 > rename to package/x11r7/xserver_xorg-server/xserver_xorg-server-0001-mips.patch
 > diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-0002-disable_man.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-0002-disable_man.patch
 > new file mode 100644
 > index 0000000..f571e06
 > --- /dev/null
 > +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server-0002-disable_man.patch
 > @@ -0,0 +1,11 @@
 > +diff -uNr xorg-server-1.15.1.org/Makefile.am xorg-server-1.15.1/Makefile.am
 > +--- xorg-server-1.15.1.org/Makefile.am	2014-04-14 04:54:49.000000000 +0200
 > ++++ xorg-server-1.15.1/Makefile.am	2014-05-27 21:36:10.763116057 +0200
 > +@@ -27,7 +27,6 @@
 > + 
 > + SUBDIRS = \
 > + 	doc \
 > +-	man \

Thanks, but patches need a description and a signed-off-by tag. From the
above it seems like you are not actually fixing the race condition, but
just working around it by not handling the manual pages. Can't we
instead fix the issue so the patch can be upstreamed?

-- 
Bye, Peter Korsgaard
