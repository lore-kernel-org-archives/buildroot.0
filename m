From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Nov 2014 15:04:50 +0100
Subject: [Buildroot] [git commit] e2fsprogs: fix static linking issues with
	libintl
Message-ID: <20141119140906.60A139D438@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=32c2385f268bd7a2f7d1f55d712c5de648bfc657
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Util-linux (and hence libuuid) links against libintl if
BR2_NEEDS_GETTEXT_IF_LOCALE, so e2fsprogs needs to link against it as when
when statically linking, otherwise the configure test for libuuid (and later
linking) fails.

Fixes:
http://autobuild.buildroot.net/results/833/8338a03028de9502be506a80bd947d80b3e50a49/
http://autobuild.buildroot.net/results/361/361aa2e47a7561ff6624829bdfcfe66ecaddc4a6/
http://autobuild.buildroot.net/results/4dc/4dc157bb9cd2e86b9b88ff9c1b66468fa930ede4/
http://autobuild.buildroot.net/results/ebf/ebf02964de98f82e7d5509c68cbfacdb5bc6f87e/

And many more.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/e2fsprogs/e2fsprogs.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 3961a94..8ee316a 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -29,6 +29,12 @@ ifeq ($(BR2_nios2),y)
 E2FSPROGS_CONF_ENV += ac_cv_func_fallocate=no
 endif
 
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+# util-linux libuuid pulls in libintl if needed, so ensure we also
+# link against it, otherwise static linking fails
+E2FSPROGS_CONF_ENV += LIBS=-lintl
+endif
+
 E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
 
 E2FSPROGS_MAKE_OPTS = \
