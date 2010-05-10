From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 May 2010 23:39:47 +0200
Subject: [Buildroot] [PATCH 1/5] grep: give hints to ./configure on where
	gettext() is
In-Reply-To: <cover.1273527584.git.thomas.petazzoni@free-electrons.com>
References: <cover.1273527584.git.thomas.petazzoni@free-electrons.com>
Message-ID: <73fa57064639d2877081f70b1e176b1163cd4583.1273527584.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build of grep fails with:

fgrep.o: In function `add_count':
fgrep.c:(.text+0x90): undefined reference to `libintl_gettext'

This is because the ./configure script of grep thought that gettext
was part of the C library instead of part of libintl:

checking for GNU gettext in libc... (cached) yes

Therefore, it forgot to add -lintl while linking grep and related
applications. Passing gt_cv_func_gnugettext_libc=no forces grep to use
libintl instead.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/grep/grep.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index acef6e9..3fa671c 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -6,6 +6,7 @@
 GREP_VERSION:=2.5.3
 GREP_SOURCE:=grep-$(GREP_VERSION).tar.bz2
 GREP_SITE:=$(BR2_GNU_MIRROR)/grep
+GREP_CONF_ENV = gt_cv_func_gnugettext_libc=no
 GREP_CONF_OPT = --disable-perl-regexp --without-included-regex
 
 GREP_DEPENDENCIES = $(if $(BR2_ENABLE_LOCALE),gettext libintl)
-- 
1.6.3.3
