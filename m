From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Jun 2015 09:27:05 +0200
Subject: [Buildroot] [git commit] infra/pkg-kconfig: require an non-empty
	KCONFIG_FILE
Message-ID: <20150610073829.5AD3481E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=932a958672b1239d2fb872573f723aa99bf8991b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we only check that the variable is defined, which is not
enough since we really want it to be non-empty.

We however can't check it points to an existing file, because the
package might well not be extracted yet, and we may use an internal
defconfig. If that file does not eventually exist, there will be a
failure down the road at build time when we try to copy it...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index dcaed53..7a00fff 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -70,7 +70,7 @@ $$($(2)_TARGET_CONFIGURE): $$($(2)_DIR)/.stamp_kconfig_fixup_done
 ifeq ($$($$($(2)_KCONFIG_VAR)),y)
 
 # FOO_KCONFIG_FILE is required
-ifndef $(2)_KCONFIG_FILE
+ifeq ($$($(2)_KCONFIG_FILE),)
 $$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
 endif
 
