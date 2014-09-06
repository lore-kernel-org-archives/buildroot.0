From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Sep 2014 22:12:37 +0200
Subject: [Buildroot] [git commit] ruby: add support for gmp as an optional
	dependency
Message-ID: <20140906202004.D4D059D61D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a9d64bb496215a8dfbfe23960141ee7bf86c203
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Ruby can now use gmp optionally, so make sure that if the gmp package
for the target is enabled, it gets built before the ruby package, and
the appropriate configure options are passed to Ruby.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ruby/ruby.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

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
