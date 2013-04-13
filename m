From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Apr 2013 16:09:10 +0200
Subject: [Buildroot] [PATCH 1/2] gdb: properly set the gdb site in all cases
Message-ID: <1365862152-24325-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Until now, the gdb site for AVR32 was adjusted only when GDB_VERSION
was not set, i.e only when the cross-gdb is *not* built. We should in
fact also set the site when the cross-gdb is built, so when
GDB_VERSION is defined through package/gdb/Config.in.host.

So, instead, we now have something like:

ifeq ($(GDB_VERSION),)
 # we define here a default version that is used when the cross-gdb is
 # not built and only the target gdb is selected.
endif

ifeq ($(GDB_VERSION),something-special)
GDB_SITE = some-special-site-for-some-special-gdb-version
endif

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 73ff7a4..398ef7b 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -16,12 +16,15 @@ ifeq ($(BR2_bfin),y)
 GDB_VERSION = 6.6a
 else ifeq ($(BR2_avr32),y)
 GDB_VERSION = 6.7.1-avr32-2.1.5
-GDB_SITE    = ftp://www.at91.com/pub/buildroot/
 else
 GDB_VERSION = 7.5.1
 endif
 endif
 
+ifeq ($(GDB_VERSION),6.7.1-avr32-2.1.5)
+GDB_SITE = ftp://www.at91.com/pub/buildroot/
+endif
+
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.bz2
 GDB_LICENSE = GPLv2+ LGPLv2+ GPLv3+ LGPLv3+
 GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
-- 
1.7.9.5
