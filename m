From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 12:06:39 +0200
Subject: [Buildroot] [git commit] ruby: remove rubygems
Message-ID: <20140609100656.830B99CF25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=feacc29ef98ba3a83805ffa9318f1ea0e00011d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's currently in a non-working state since it requires a couple of
extensions that don't build at the moment (they try to execute tests in
configure) and also requires a target compiler.
So remove it to avoid false expectations and reclaim target space back
of about 1.5 MiB.

[Thomas: slightly reword comments.]

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ruby/ruby.mk |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 4ecf49d..66556c3 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -6,6 +6,8 @@
 
 RUBY_VERSION_MAJOR = 1.9
 RUBY_VERSION = $(RUBY_VERSION_MAJOR).3-p545
+# 1.9.1 directory used for extensions
+RUBY_VERSION_EXT = 1.9.1
 RUBY_SITE = ftp://ftp.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
 HOST_RUBY_DEPENDENCIES = host-pkgconf
@@ -49,5 +51,16 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
 	RUBY_DEPENDENCIES += zlib
 endif
 
+# Remove rubygems and friends, as they need extensions that aren't
+# built and a target compiler.
+RUBY_EXTENSIONS_REMOVE = rake* rdoc* rubygems*
+define RUBY_REMOVE_RUBYGEMS
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, gem rdoc ri rake)
+	rm -rf $(TARGET_DIR)/usr/lib/ruby/gems
+	rm -rf $(addprefix $(TARGET_DIR)/usr/lib/ruby/$(RUBY_VERSION_EXT)/, \
+		$(RUBY_EXTENSIONS_REMOVE))
+endef
+RUBY_POST_INSTALL_TARGET_HOOKS += RUBY_REMOVE_RUBYGEMS
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
