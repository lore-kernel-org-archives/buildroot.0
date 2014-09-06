From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  6 Sep 2014 15:59:26 +0200
Subject: [Buildroot] [PATCH 1/2] ruby: don't try to use gmp on the host
Message-ID: <1410011967-16277-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building host-ruby, if gmp seems to be available (for example
when host-gmp is built as a dependency of building the toolchain),
Ruby tries to use it. Unfortunately, it fails to use it because there
is no static version of host-gmp that is built and installed.

Since we anyway don't care much about gmp support in host-ruby, simply
disable it.

This issue was introduced since the bump to Ruby 2.1.0, and this
commit fixes:

  http://autobuild.buildroot.org/results/e19/e197f20bd5ec4aae6d8692d67df4f539a9df33e2/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ruby/ruby.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 297e902..384cc88 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -14,7 +14,8 @@ RUBY_MAKE_ENV = $(TARGET_MAKE_ENV)
 RUBY_MAKE = $(MAKE1)
 RUBY_CONF_OPT = --disable-install-doc --disable-rpath
 HOST_RUBY_CONF_OPT = --disable-install-doc \
-	--with-out-ext=curses,openssl,readline
+	--with-out-ext=curses,openssl,readline \
+	--without-gmp
 RUBY_LICENSE = Ruby or BSD-2c, BSD-3c, others
 RUBY_LICENSE_FILES = LEGAL COPYING BSDL
 
-- 
2.0.0
