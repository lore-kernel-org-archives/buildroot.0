From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 May 2016 17:17:53 +0200
Subject: [Buildroot] [PATCH 2/2] toolchain/helper: don't follow symlinks
	when copying libs to target
In-Reply-To: <cover.1464534979.git.yann.morin.1998@free.fr>
References: <cover.1464534979.git.yann.morin.1998@free.fr>
Message-ID: <16dd334fb29148489afa344c652208a4c512f445.1464534979.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In 2a87b64 (toolchain-external: align library locations in target and
staging dir), copying the libraries from the sysroot to the target was
changed to a simple find-based solution.

To be sure that the staging directory was entered to find the libraries,
in case the variable was pointing to a symlink, the -L clause to find
was used.

However, that causes extraneous libraries to be copied over.

For example, a ct-ng toolchain would have this sysroot (e.g for an arm
32-bit toolchain):

    .../sysroot/lib/
    .../sysroot/lib32 -> lib
    .../sysroot/lib64 -> lib
    .../sysroot/usr/lib/
    .../sysroot/usr/lib32 -> lib
    .../sysroot/usr/lib64 -> lib

Which we would carry as-is to our own sysroot.

But then, in target, our skeleton creates the /lib/ and /usr/lib
directories, with the necessary lib32 or lib64 symlink pointing to it.
In this case, a lib32->lib symlink is created, but no lib64 symlink
since this is a 32-bit architecture.

So, when we copy over the libraries from our staging to the target
directory, we end creating a /usr/lib64/ directory.

This was very difficult to observe, as no /lib64/ directory is created
and this only happens with a merged /usr.

Since the reason to use -L was to be sure to enter our staging
directory, we just need to ensure that the path ends up with a slash, as
was already talked about in this thread:
    http://lists.busybox.net/pipermail/buildroot/2016-April/159737.html

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/helpers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 5512759..b3510b6 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -11,7 +11,7 @@
 copy_toolchain_lib_root = \
 	LIB="$(strip $1)"; \
 \
-	LIBPATHS=`find -L $(STAGING_DIR) -name "$${LIB}" 2>/dev/null` ; \
+	LIBPATHS=`find $(STAGING_DIR)/ -name "$${LIB}" 2>/dev/null` ; \
 	for LIBPATH in $${LIBPATHS} ; do \
 		DESTDIR=`echo $${LIBPATH} | sed "s,^$(STAGING_DIR)/,," | xargs dirname` ; \
 		mkdir -p $(TARGET_DIR)/$${DESTDIR}; \
-- 
2.7.4
