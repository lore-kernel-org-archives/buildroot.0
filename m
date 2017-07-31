From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 23:56:57 +0200
Subject: [Buildroot] [git commit] package/skeleton: drop dependency on
	host-mkpasswd
Message-ID: <20170731215752.9859882156@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c1692df6f72ae4c3581a6a43cd2479b11c5ed84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Setting the root pasword is done in a target-finalize hook, so we do not
need to enforce a dependency from the skeleton onto host-mkpasswd.

Dropping that dependency will simplify making skeleton a virtual
package (in up-coming changes).

Instead, it is now selected as any other package. As such, it is
guaranteed to be built before target-finalize.

This however introduces a slight change in behaviour: previously,
host-mkpasswd would only be built if we needed to hash the root password
from its plain-text value. Now, host-mkpasswd is always built as soon as
the root password is non-empty, even if already pre-hashed.

Since host-mkpasswd is a really tiny weeny package bundled in Buildroot,
with only two C files, built as a single unit with a single gcc call,
the overhead is really minimal. Compared to the simplifications this
will allow in the skeleton packages (plural: common, sysv, systemd,
custom) to come, this overhead is acceptable.

Yet another simplification, even if small, to ease providing multiple
skeletons.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/skeleton/skeleton.mk | 1 -
 system/Config.in             | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index f5106f7..41da177 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -120,7 +120,6 @@ SKELETON_ROOT_PASSWORD =
 else ifneq ($(filter $$1$$% $$5$$% $$6$$%,$(SKELETON_TARGET_GENERIC_ROOT_PASSWD)),)
 SKELETON_ROOT_PASSWORD = '$(SKELETON_TARGET_GENERIC_ROOT_PASSWD)'
 else
-SKELETON_DEPENDENCIES += host-mkpasswd
 # This variable will only be evaluated in the finalize stage, so we can
 # be sure that host-mkpasswd will have already been built by that time.
 SKELETON_ROOT_PASSWORD = "`$(MKPASSWD) -m "$(SKELETON_TARGET_GENERIC_PASSWD_METHOD)" "$(SKELETON_TARGET_GENERIC_ROOT_PASSWD)"`"
diff --git a/system/Config.in b/system/Config.in
index 828df42..1ee76e8 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -218,6 +218,7 @@ config BR2_ROOTFS_MERGED_USR
 config BR2_TARGET_ENABLE_ROOT_LOGIN
 	bool "Enable root login with password"
 	default y
+	select BR2_PACKAGE_HOST_MKPASSWD if BR2_TARGET_GENERIC_ROOT_PASSWD != ""
 	help
 	  Allow root to log in with a password.
 
