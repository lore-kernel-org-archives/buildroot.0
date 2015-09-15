From: Brendan Heading <brendanheading@gmail.com>
Date: Tue, 15 Sep 2015 20:56:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/ruby: disable use of stack
	protector when not available
Message-ID: <1442347019-28368-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/22e/22eced2dc9ca1bc90ef193b4dc40891c47157e89/

ruby, by default, attempts to use the stack protector if configure detects
that it exists. The stack protector detection does not attempt to link
libssp, which can cause a false positive.

Instead, check if the stack protector is enabled in the buildroot
toolchain config, and set the stack_protector=no environment variable to
force the stack protector off.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
 package/ruby/ruby.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 243cd0b..9f78c33 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -36,6 +36,11 @@ RUBY_CONF_ENV = ac_cv_func_dl_iterate_phdr=no
 RUBY_CONF_OPTS += --with-out-ext=fiddle
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),)
+# Don't force -fstack-protector when SSP is not available in toolchain
+RUBY_CONF_ENV += stack_protector=no
+endif
+
 # Force optionals to build before we do
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
 RUBY_DEPENDENCIES += berkeleydb
-- 
2.4.3
