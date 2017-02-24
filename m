From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 25 Feb 2017 00:06:10 +0100
Subject: [Buildroot] [PATCH/next v2] linux: preserve VCS info when using
	OVERRIDE_SRCDIR
Message-ID: <20170224230610.23747-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Linux build system will try to include VCS information into the
kernel version. This is very convenient when developing to be sure
you're looking at the right kernel.

However, since Buildroot rsyncs everything to the build directory,
but leaves the .git directory behind, this version information is
lost.

Fortunately, the kernel's setlocalversion script supports this kind
of situation: it can save the VCS info in a file ".scmversion" and
use that during the build. Calling the script with --save-scmversion
will create .scmversion.

The --save-scmversion option exists since v2.6.35. On older kernels,
we just ignore the error. It can be assumed that people using older
kernel don't do a lot of development anymore :-)

We can just unconditionally run this in a POST_RSYNC_HOOK - it will
only get executed when LINUX_OVERRIDE_SRCDIR is used.

Note that in kernels before v3.14, the Buildroot git commit would be
used, which is even more confusing.

Note that if we ever support out-of-tree builds for the kernel, this
patch will no longer be needed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
In a similar vein, it would be useful to save some version information
for the normal kernel builds. Currently, for v3.14+ kernels, we just
get the upstream kernel version even if it is a vendor/local kernel.
And for older kernels, we get the Buildroot VCS info.

However, it turns out to be quite complicated to get this version info.
For CUSTOM_TARBALL it's plain impossible. For CUSTOM_VERSION it's not
necessary, because (at least for v3.14+ kernels) setlocalversion
already produces the correct value. For CUSTOM_GIT/HG/SVN, we do have
version info, but it's not nicely formatted like the results of
setlocalversion. In those cases we should run setlocalversion from
within the download helper script...

Changes v2: actually added the || true - forgot to commit --amend,
            a skill I learned from Yann :-P
---
 linux/linux.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7f4432e7b1..b5b27aac2f 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -51,6 +51,13 @@ LINUX_SITE := $(LINUX_SITE)/testing
 endif # -rc
 endif
 
+# Conserve VCS information for override srcdir
+define LINUX_ADD_LOCALVERSION
+	cd $(@D); \
+	./scripts/setlocalversion --save-scmversion $(LINUX_OVERRIDE_SRCDIR) || true
+endef
+LINUX_POST_RSYNC_HOOKS += LINUX_ADD_LOCALVERSION
+
 LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
 # We rely on the generic package infrastructure to download and apply
-- 
2.11.0
