From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  9 Nov 2015 21:25:11 +0100
Subject: [Buildroot] [PATCH 2/2] ruby: explicitly disable SSP support
In-Reply-To: <1447100711-16463-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1447100711-16463-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1447100711-16463-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The SSP support checks of the Ruby configure script do not do a full
link, and therefore don't properly detect if SSP support is fully
functional or not, which causes some build failures if the compiler
supports -fstack-protector but the C library does not provide the SSP
implementation.

To avoid this, we explicitly tell ruby if SSP support is available or
not.

Fixes:

  http://autobuild.buildroot.net/results/001/00154b0142f51c197d5d53ae36f7adc4f8250d9d/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ruby/ruby.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 298493c..17104b6 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -36,6 +36,10 @@ RUBY_CONF_ENV += ac_cv_func_dl_iterate_phdr=no
 RUBY_CONF_OPTS += --with-out-ext=fiddle
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
+RUBY_CONF_ENV += stack_protector=no
+endif
+
 # Force optionals to build before we do
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
 RUBY_DEPENDENCIES += berkeleydb
-- 
2.6.3
