From: Peter Seiderer <ps.report@gmx.net>
Date: Sat,  6 Dec 2014 00:23:35 +0100
Subject: [Buildroot] [PATCH] ruby: fix verconf.h related build failure
Message-ID: <1417821815-9924-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See [1] for failure analysis.

Fixes:
   http://autobuild.buildroot.net/results/c94fef5d2cfb00a336905ae3c110d7680f6d5416/
   http://autobuild.buildroot.net/results/4375cb1e325a336dbf59f22f975be9165ad0648a/

[1] http://lists.busybox.net/pipermail/buildroot/2014-December/114273.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ruby/ruby.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index 20a2a11..00a785c 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -64,6 +64,13 @@ else
 	RUBY_CONF_OPTS += --without-gmp
 endif
 
+# workaround for amazing build failure, see
+# http://lists.busybox.net/pipermail/buildroot/2014-December/114273.html
+define RUBY_REMOVE_VERCONF_H
+	rm -f $(@D)/verconf.h
+endef
+RUBY_POST_CONFIGURE_HOOKS += RUBY_REMOVE_VERCONF_H
+
 # Remove rubygems and friends, as they need extensions that aren't
 # built and a target compiler.
 RUBY_EXTENSIONS_REMOVE = rake* rdoc* rubygems*
-- 
2.1.2
