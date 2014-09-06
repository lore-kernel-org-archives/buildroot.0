From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  6 Sep 2014 15:59:27 +0200
Subject: [Buildroot] [PATCH 2/2] ruby: add support for gmp as an optional
	dependency
In-Reply-To: <1410011967-16277-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1410011967-16277-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1410011967-16277-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ruby can now use gmp optionally, so make sure that if the gmp package
for the target is enabled, it gets built before the ruby package, and
the appropriate configure options are passed to Ruby.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ruby/ruby.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 384cc88..8c094b5 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -54,6 +54,12 @@ endif
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 	RUBY_DEPENDENCIES += zlib
 endif
+ifeq ($(BR2_PACKAGE_GMP),y)
+	RUBY_DEPENDENCIES += gmp
+	RUBY_CONF_OPT += --with-gmp
+else
+	RUBY_CONF_OPT += --without-gmp
+endif
 
 # Remove rubygems and friends, as they need extensions that aren't
 # built and a target compiler.
-- 
2.0.0
