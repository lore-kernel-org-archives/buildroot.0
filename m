From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 Mar 2011 10:29:35 +0200
Subject: [Buildroot] [git commit master 1/1] hostcc/hostcxx: fix noccache
	variant setting
Message-ID: <20110328083106.7E918819D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0df02e1233c5990391c030f40ab4263cfaa83a40
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current code accidentally sets up HOSTCC_NOCCACHE and HOSTCXX_NOCCACHE
only when the respective HOSTCC or HOSTCXX values are not set.  So if you
do something like:
	make HOSTCC=gcc menuconfig
The build fails because HOSTCC_NOCCACHE is not set anywhere.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 7ae3787..9aa7399 100644
--- a/Makefile
+++ b/Makefile
@@ -126,13 +126,13 @@ endif
 ifndef HOSTCC
 HOSTCC:=gcc
 HOSTCC:=$(shell which $(HOSTCC) || type -p $(HOSTCC) || echo gcc)
-HOSTCC_NOCCACHE:=$(HOSTCC)
 endif
+HOSTCC_NOCCACHE:=$(HOSTCC)
 ifndef HOSTCXX
 HOSTCXX:=g++
 HOSTCXX:=$(shell which $(HOSTCXX) || type -p $(HOSTCXX) || echo g++)
-HOSTCXX_NOCCACHE:=$(HOSTCXX)
 endif
+HOSTCXX_NOCCACHE:=$(HOSTCXX)
 ifndef HOSTFC
 HOSTFC:=gfortran
 endif
-- 
1.7.3.4
