From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 14 Dec 2010 14:00:57 -0500
Subject: [Buildroot] [PATCH] hostcc/hostcxx: fix noccache variant setting
Message-ID: <1292353257-13594-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current code accidentally sets up HOSTCC_NOCCACHE and HOSTCXX_NOCCACHE
only when the respective HOSTCC or HOSTCXX values are not set.  So if you
do something like:
	make HOSTCC=gcc menuconfig
The build fails because HOSTCC_NOCCACHE is not set anywhere.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 Makefile |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index f6ab07e..34d28a3 100644
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
1.7.3.3
