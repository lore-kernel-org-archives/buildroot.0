From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Nov 2011 08:35:12 -0300
Subject: [Buildroot] [PATCH 2/2] ruby: fix host build breakage
In-Reply-To: <1322220912-20268-1-git-send-email-gustavo@zacarias.com.ar>
References: <1322220912-20268-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1322220912-20268-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building host-ruby with ncurses enabled on an x86_64 host we get a
"relocation R_X86_64_32 against `_nc_globals' can not be used when making
a shared object; recompile with -fPIC" error when building.
Just disable ncurses and readline support for the host version - we
don't need it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ruby/ruby.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index a34a251..ad791f8 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -11,8 +11,7 @@ HOST_RUBY_AUTORECONF = YES
 RUBY_DEPENDENCIES = host-ruby
 RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
 RUBY_CONF_OPT = --disable-install-doc --disable-rpath
-
-HOST_RUBY_CONF_OPT = --disable-install-doc
+HOST_RUBY_CONF_OPT = --disable-install-doc --without-ncurses --without-readline
 
 # Force optionals to build before we do
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
-- 
1.7.3.4
