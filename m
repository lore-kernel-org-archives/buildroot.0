From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 May 2014 10:44:22 -0300
Subject: [Buildroot] [PATCH 3/3] ruby: remove rubygems
In-Reply-To: <1400593462-9247-1-git-send-email-gustavo@zacarias.com.ar>
References: <1400593462-9247-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1400593462-9247-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's currently in a non-working state since it requires a couple of
extensions that don't build at the moment (they try to execute tests in
configure) and also requires a target compiler.
So remove it to avoid false expectations and reclaim target space back
of about 1.5 MiB.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ruby/ruby.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 86d0089..7359cf1 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -6,6 +6,8 @@
 
 RUBY_VERSION_MAJOR = 1.9
 RUBY_VERSION = $(RUBY_VERSION_MAJOR).3-p545
+# 1.9.1 directory used for exts
+RUBY_VERSION_EXT = 1.9.1
 RUBY_SITE = ftp://ftp.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_DEPENDENCIES = host-pkgconf host-ruby
 HOST_RUBY_DEPENDENCIES = host-pkgconf
@@ -48,5 +50,16 @@ ifeq ($(BR2_PACKAGE_ZLIB),y)
 	RUBY_DEPENDENCIES += zlib
 endif
 
+# Remove rubygems & friends
+# Needs exts that aren't built and a target compiler
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
-- 
1.8.5.5
