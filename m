From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 23 Jun 2008 15:58:14 +0200
Subject: [Buildroot] Out of tree builds (was Re: svn commit: trunk/buildroot)
In-Reply-To: <20080623134749.009043C2B3@busybox.net> (jacmet@uclibc.org's
	message of "Mon\, 23 Jun 2008 06\:47\:48 -0700 \(PDT\)")
References: <20080623134749.009043C2B3@busybox.net>
Message-ID: <87bq1si77t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "jacmet" == jacmet  <jacmet@uclibc.org> writes:

Hi,

 jacmet> Author: jacmet
 jacmet> Date: 2008-06-23 06:47:37 -0700 (Mon, 23 Jun 2008)
 jacmet> New Revision: 22481

 jacmet> Log:
 jacmet> Makefile: don't include .config from TOPDIR

 jacmet> If we ever want to support building out of tree, having the
 jacmet> .config in the tree is probably not what we want.

Do we want to support out of tree builds? The toplevel Makefile has
had a TOPDIR variable since forever, but it'll take a bit of work to
get it running.

The basics are easy to do, E.G.:

diff --git a/Makefile b/Makefile
index 73d9208..b81d330 100644
--- a/Makefile
+++ b/Makefile
@@ -21,10 +21,17 @@
 # Just run 'make menuconfig', configure stuff, then run 'make'.
 # You shouldn't need to mess with anything beyond this point...
 #--------------------------------------------------------------
-TOPDIR=./
-CONFIG_CONFIG_IN=Config.in
-CONFIG_DEFCONFIG=.defconfig
+
+# buildroot sources are in same directory as Makefile
+TOPDIR:=$(dir $(firstword $(MAKEFILE_LIST)))
+
+# for kbuild
+srctree:=$(TOPDIR)
+export srctree
+
+CONFIG_CONFIG_IN=$(TOPDIR)/Config.in
+CONFIG_DEFCONFIG=$(TOPDIR)/.defconfig
-CONFIG=package/config
+CONFIG=$(TOPDIR)/package/config
 DATE:=$(shell date +%Y%m%d)
 
 noconfig_targets:=menuconfig config oldconfig randconfig \

But the big issue is everywhere we expect to be in the source
directory, so we'll need to prepend $(TOPDIR)/ to every include line
(make -I doesn't work for wildcards), patch-kernel.sh calls and so on.

With all that in place it should be possible to do:

% mkdir build && cd build
% make -f /path/to/buildroot/Makefile  menuconfig
% make -f /path/to/buildroot/Makefile

What do you say?

-- 
Bye, Peter Korsgaard
