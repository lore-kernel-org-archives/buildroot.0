From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 28 Mar 2014 00:06:33 +0100
Subject: [Buildroot] [PATCH 2/2] slang: add ncurses optional dependency
In-Reply-To: <1395961593-9826-1-git-send-email-romain.naour@openwide.fr>
References: <1395961593-9826-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1395961593-9826-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ncurses check need to be disabled if ncurses package is not
selected.
If we don't do that, host's ncurses5-config may be used by
configure script.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
Note: others optional dependencies may be missing
(pcre oniguruma png z iconv)

 package/slang/slang.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 38f0b6f..2006c71 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -13,6 +13,12 @@ SLANG_LICENSE_FILES = COPYING
 SLANG_INSTALL_STAGING = YES
 SLANG_MAKE = $(MAKE1)
 
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+	SLANG_DEPENDENCIES = ncurses
+else
+	SLANG_CONF_OPT = ac_cv_path_nc5config=no
+endif
+
 # The installation location of the slang library
 # does not take into account the DESTDIR directory.
 # So SLANG_INST_LIB is initialized with -L/usr/lib/
-- 
1.9.0
