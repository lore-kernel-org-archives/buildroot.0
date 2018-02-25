From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 25 Feb 2018 19:34:14 +0100
Subject: [Buildroot] [PATCH 2/3] package/strace: add missing libunwind
 optional dependency
In-Reply-To: <20180225183415.8362-1-romain.naour@gmail.com>
References: <20180225183415.8362-1-romain.naour@gmail.com>
Message-ID: <20180225183415.8362-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This improve the reproducible build.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/strace/strace.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index e292c60f2a..9c1fab3871 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -10,6 +10,13 @@ STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSI
 STRACE_LICENSE = BSD-3-Clause
 STRACE_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+STRACE_DEPENDENCIES += libunwind
+STRACE_CONF_OPTS += --with-libunwind
+else
+STRACE_CONF_OPTS += --without-libunwind
+endif
+
 # strace bundle some kernel headers to build libmpers, this mixes userspace
 # headers and kernel headers which break the build with musl.
 # The stddef.h from gcc is used instead of the one from musl.
-- 
2.14.3
