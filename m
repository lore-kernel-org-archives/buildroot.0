From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Oct 2016 20:01:48 +0200
Subject: [Buildroot] [PATCHv2] toolchain/external: fix arch-subdir
Message-ID: <1477591308-26500-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For a multilib toolchain (like the Sourcery CodeBench ARM 2014.05), the
linker expects the C library (libc, libcrypt, libdl etc...) to be in a
sub-directory if the main sysroot for certain variants. For example,
that Sourcery toolchain has:
    sysroot/
    sysroot/armv4t/
    sysroot/thumb/

We call the last component of that path the 'arch subdir'. For the main
variant, there is no arch subdir, while for the other two variants above,
the arch subdir are, respectively, 'armv4t' and 'thumb'.

However, when we copy the libraries from the original sysroot into our
working copy, we put all copies in /lib or /usr/lib, entirely
disregading their original location. Thus, the linker would not find
them. We fix that by creating a symbolic link with the name of the arch
subdir and pointing to '.' so that our sysroot is also available from
the path the linker expects.

When there is no architecture-specific sub-directory in the sysroot,
there is no arch subdir.

However, the current code improprely extracts the arch subdir part of
the arch sysroot (with an intrumented copy_toolchain_sysroot, when
copying a ct-ng toolchain):

    >>> toolchain-external undefined Copying external toolchain sysroot to
    >>> staging...
    main sysroot: /home/ymorin/x-tools/armv6-unknown-linux-gnueabihf/armv6-unknown-linux-gnueabihf/sysroot/
    arch sysroot: /home/ymorin/x-tools/armv6-unknown-linux-gnueabihf/armv6-unknown-linux-gnueabihf/sysroot/
    arch subdir:  /home/ymorin/x-tools/armv6-unknown-linux-gnueabihf/armv6-unknown-linux-gnueabihf/sysroot/
    lib dir:      lib
    support dir:

... when we would have expected 'arch subdir' to be empty, or even a
single dot '.' .

To be noted, is the fact that this has no practical impact in the
resulting copy of the sysroot, since the arch subdir part is only used
when the arch sysroot is not the same as the main sysroot.

Except this causes the arch-subdir directory to be created in the
sysroot, so there is a duplicated path, which is now detected since
938f47c (core/pkg-generic: check proper package installation) and causes
a build failure.

Besides, this is still a little bit alarming. Our code handling external
toolchains is very complex and very fragile. This is a recipe for even
more hard-to-debug failures in the future.

Fix the matching pattern to correctly return an empty string if there is
no arch subdir: what we really want to do is get rid of the leading path
to the sysroot, and remove any trailing slash (since the number of
slashes in the arch subdir part is used to know how deep the symlink
will be located in and how deep backward it will have to point back to).

Reported-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>

---
Notes:

This patch was lingering in my tree since last May, and I knew there was
something fishy in that code. The first iteration did not gather a very
warm feedback, and there was no proof of ill-doing so I did not respin.

But now, 938f47c (which I brought upon myself!) exposes the issue for
real. My fear are now confirmed, but I can stand still now: I was not
paranoid! ;-)

This is an alternative to the patch proposed by Vicente:
    https://patchwork.ozlabs.org/patch/687750/

To be discussed what patch we want.
---
 toolchain/toolchain-external/toolchain-external.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index f7c6a19..770a50f 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -665,7 +665,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
 			SUPPORT_LIB_DIR=`readlink -f $${LIBSTDCPP_A_LOCATION} | sed -r -e 's:libstdc\+\+\.a::'` ; \
 		fi ; \
 	fi ; \
-	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
+	ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}::; s:/+$$::;` ; \
 	$(call MESSAGE,"Copying external toolchain sysroot to staging...") ; \
 	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
 endef
-- 
2.7.4
