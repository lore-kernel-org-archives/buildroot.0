From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Nov 2014 14:33:07 +0100
Subject: [Buildroot] [git commit] grep: fix build failure for musl
Message-ID: <20141107133601.0F1BCB2BF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de903755d79e67dc84fa0715e162b19e94d6c137
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

musl doesn't implement re_match and friends and grep fails to
detect this properly, so force internal regex routines for musl.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grep/grep.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
