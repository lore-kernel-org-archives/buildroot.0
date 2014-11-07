From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  7 Nov 2014 09:56:57 -0300
Subject: [Buildroot] [PATCHv2] grep: fix build failure for musl
Message-ID: <1415365017-14860-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

musl doesn't implement re_match and friends and grep fails to
detect this properly, so force internal regex routines for musl.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/grep/grep.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index e07f169..2c2477c 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -9,7 +9,8 @@ GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPLv3+
 GREP_LICENSE_FILES = COPYING
-GREP_CONF_OPTS = --disable-perl-regexp --without-included-regex
+GREP_CONF_OPTS = --disable-perl-regexp \
+	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
 GREP_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
 # link with iconv if enabled
-- 
2.0.4
