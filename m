From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 23:19:53 +0200
Subject: [Buildroot] [git commit] toolchain: replace absolute symlinks by
	relative symlinks during sysroot copy
Message-ID: <20170705212308.3C6778043E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b291525ac74273191c1a53a8361b9e7a6a58e79f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 32bec8ee2fb00c6750fa842bbb0eb79b0c081fa2
("toolchain-external: copy ld*.so* for all C libraries") we changed
how the musl dynamic linker symbolic link was being created. Instead
of having specific logic in Buildroot, we switched to simply copying
the ld*.so.* symbolic link from staging to target, as well as the
target of this symbolic link.

However, it turns out that by default, musl creates its dynamic linker
symbolic link with an absolute path as the target of the link:
/lib/libc.so.

Therefore, external Musl toolchains built with Buildroot look like
this:

  lrwxrwxrwx 1 thomas thomas      12 Jul  4 19:46 ld-musl-armhf.so.1 -> /lib/libc.so

The principle of the copy_toolchain_lib_root function, which is used
to copy libraries from staging to target, is to copy symbolic links
and follow their targets. In this case, it means we end up copying
/lib/libc.so (from the host machine) into the target folder. From
there on, there are two cases:

 1. /lib/libc.so exists in your host system. It gets copied to the
    target. But later on, Buildroot also copies /lib/libc.so from
    staging to target, overwriting the bogus libc.so. So everything
    works fine, even though it's admittedly ugly.

 2. /lib/libc.so doesn't exist in your host system. In this case, the
    build fails with no clear error message.

This problem does not happen with Musl toolchains built by
Crosstool-NG, because Crosstool-NG replaces the absolute target of the
dynamic linker symbolic link by a relative path.

However, since we want to support existing Buildroot Musl toolchains
and generally work with the fact that Musl by default installs an
absolute symlink, the following commit improves the
copy_toolchain_sysroot function to replace symbolic links with an
absolute destination to use a relative destination. I.e, in staging,
the ld-musl-armhf.so.1 symbolic link looks like this:

lrwxrwxrwx 1 thomas thomas 14 Jul  5 22:59 output/staging/lib/ld-musl-armhf.so.1 -> ../lib/libc.so

Fixes:

  http://autobuild.buildroot.net/results/ce80264575918a8f71d9eab1091c21df85b65b1a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 9942ce4..e9e36d2 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -117,6 +117,15 @@ copy_toolchain_sysroot = \
 				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
 		fi ; \
 	done ; \
+	for link in $$(find $(STAGING_DIR) -type l); do \
+		target=$$(readlink $${link}) ; \
+		if [ "$${target}" == "$${target\#/}" ] ; then \
+			continue ; \
+		fi ; \
+		relpath="$(call relpath_prefix,$${target\#/})" ; \
+		echo "Fixing symlink $${link} from $${target} to $${relpath}$${target\#/}" ; \
+		ln -sf $${relpath}$${target\#/} $${link} ; \
+	done ; \
 	relpath="$(call relpath_prefix,$${ARCH_LIB_DIR})" ; \
 	if [ "$${relpath}" != "" ]; then \
 		for i in $$(find -H $(STAGING_DIR)/$${ARCH_LIB_DIR} $(STAGING_DIR)/usr/$${ARCH_LIB_DIR} -type l -xtype l); do \
