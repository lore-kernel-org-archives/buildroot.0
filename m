From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 17 Jun 2016 15:48:31 +0100
Subject: [Buildroot] [PATCH 3/3] elfutils: put all the "lfs mode" stuff
	together
In-Reply-To: <1466174911-13566-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1466174911-13566-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1466174911-13566-3-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/elfutils/elfutils.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 074ca02..a2012d6 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -16,17 +16,18 @@ ELFUTILS_DEPENDENCIES = zlib
 ELFUTILS_AUTORECONF = YES
 ELFUTILS_CONF_OPTS += --disable-werror
 
-ELFUTILS_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
-
 # sparc64 needs -fPIC instead of -fpic
 ifeq ($(BR2_sparc64),y)
 ELFUTILS_CFLAGS += -fPIC
 endif
 
 # elfutils gets confused when lfs mode is forced, so don't
+ELFUTILS_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
+ELFUTILS_CPPFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))
+
 ELFUTILS_CONF_ENV += \
 	CFLAGS="$(ELFUTILS_CFLAGS)" \
-	CPPFLAGS="$(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))"
+	CPPFLAGS="$(ELFUTILS_CPPFLAGS)"
 
 ELFUTILS_LDFLAGS = $(TARGET_LDFLAGS)
 
-- 
2.7.3
