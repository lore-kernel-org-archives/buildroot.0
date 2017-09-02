From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  2 Sep 2017 22:54:19 +0200
Subject: [Buildroot] [PATCH v2 07/11] package/flex: disable reallocarray
In-Reply-To: <20170902205423.21288-1-romain.naour@gmail.com>
References: <20170902205423.21288-1-romain.naour@gmail.com>
Message-ID: <20170902205423.21288-8-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This doesn't compile with glibc 2.26 where reallocarray() as been introduced.

Fixes:
stage1flex-misc.o: In function `allocate_array':
misc.c:(.text+0x38f): undefined reference to `reallocarray'
stage1flex-misc.o: In function `reallocate_array':
misc.c:(.text+0xc8a): undefined reference to `reallocarray'
collect2: error: ld returned 1 exit status

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/flex/flex.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index b782699..0196624 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -10,7 +10,8 @@ FLEX_INSTALL_STAGING = YES
 FLEX_LICENSE = FLEX
 FLEX_LICENSE_FILES = COPYING
 FLEX_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-m4
-FLEX_CONF_ENV = ac_cv_path_M4=/usr/bin/m4
+FLEX_CONF_ENV = ac_cv_path_M4=/usr/bin/m4 \
+	ac_cv_func_reallocarray=no
 HOST_FLEX_DEPENDENCIES = host-m4
 
 define FLEX_DISABLE_PROGRAM
-- 
2.9.5
