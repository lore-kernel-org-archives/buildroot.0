From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Dec 2013 18:20:59 +0100
Subject: [Buildroot] [PATCH 16/16] gdb: add host-texinfo dependency for Git
	versions
In-Reply-To: <1386264059-14057-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386264059-14057-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386264059-14057-17-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just like for binutils, gdb versions pulled from Git want to
regenerate their documentation, and none of the MAKEINFO tricks we've
tried worked properly, so we're simply adding host-texinfo as a
dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index fbe1641..d06b61b 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -24,11 +24,13 @@ endif
 ifeq ($(BR2_arc),y)
 GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gdb,$(GDB_VERSION))
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
+GDB_FROM_GIT = y
 endif
 
 ifeq ($(BR2_microblaze),y)
 GDB_SITE = $(call github,Xilinx,gdb,$(GDB_VERSION))
 GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
+GDB_FROM_GIT = y
 endif
 
 ifeq ($(GDB_VERSION),6.7.1-avr32-2.1.5)
@@ -126,6 +128,10 @@ HOST_GDB_CONF_OPT = \
 	--without-included-gettext \
 	--disable-sim
 
+ifeq ($(GDB_FROM_GIT),y)
+HOST_GDB_DEPENDENCIES += host-texinfo
+endif
+
 # legacy $arch-linux-gdb symlink
 define HOST_GDB_ADD_SYMLINK
 	cd $(HOST_DIR)/usr/bin && \
-- 
1.8.1.2
