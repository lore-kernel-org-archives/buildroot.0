From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 May 2016 22:53:54 +0200
Subject: [Buildroot] [git commit] toolchain/helper: don't follow symlinks
	when copying libs to target
Message-ID: <20160530205650.E576B81DD1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49648d4b01e8056c294001e80bf4bd487593a5a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

To copy the required libraries from staging into target, we scan the
staging directory for all occurences of the required libraries, and copy
them over to target, keeping the same directory layout relative to the
sysroot.

For example:
    .../sysroot/usr/lib/libfoo.so   -->  .../target/usr/lib/libfoo.so
    .../sysroot/usr/lib32/libbar.so -->  .../target/usr/lib32/libbar.so
    .../sysroot/usr/lib64/libbuz.so -->  .../target/usr/lib64/libbuz.so

So, when we copy over the libraries from our staging to the target
directory, the "find -L .../sysroot -name libblabla.so.*" would find
multiple instances of libblabla, each in the /usr/lib /usr/lib32 and
/usr/lib64 locations (they are all the exact same file, though).

Since we do have the /usr/lib32->lib symlink, all is OK (but there are
two copies going on, which could be avoided). However, since we do not
have the /usr/lib64->lib symlink, the /usr/lib64/ directory is created.

This was very difficult to observe, as no /lib64/ directory is created,
only the /usr/lib64/ one was. To top it off, this only happens with a
merged /usr, which does not seem like not a common case without systemd.

Since the reason to use -L was to be sure to enter our staging
directory, we just need to ensure that the path ends up with a slash, as
was already talked about in this thread:
    http://lists.busybox.net/pipermail/buildroot/2016-April/159737.html

After further discussion, it turns out that the original patch came along
because of the confusion between output/staging (which is a symlink) and
$(STAGING_DIR) which expands to output/host/usr/<tupple>/sysroot (which is
never a symlink), so the symlink handling isn't really needed at all.

[Peter: drop description comment, extend description]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
