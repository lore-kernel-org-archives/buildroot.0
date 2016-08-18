From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Date: Thu, 18 Aug 2016 12:17:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/elfutils: set program-prefix to
	default ("eu-")
Message-ID: <1471515467-21065-1-git-send-email-marcin.nowakowski@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Elfutils program names collide with binutils' binaries. By default
applications provided by elfutils are prefixed with "eu-", but in
Buildroot that setting is overridden by pkg-autotools.
The option in pkg-autotools rules was added to avoid including a target
triple in some packages as a prefix, so restore elfutils default
behaviour by adding a "eu-" program-prefix.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 package/elfutils/elfutils.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index b999d0f..0aa11a6 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -14,7 +14,9 @@ ELFUTILS_DEPENDENCIES = zlib
 
 # We patch configure.ac
 ELFUTILS_AUTORECONF = YES
-ELFUTILS_CONF_OPTS += --disable-werror
+ELFUTILS_CONF_OPTS += \
+	--disable-werror \
+	--program-prefix="eu-"
 
 # elfutils gets confused when lfs mode is forced, so don't
 ELFUTILS_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
-- 
2.7.4
