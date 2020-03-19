From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Mar 2020 22:56:57 +0100
Subject: [Buildroot] [PATCH] boot/barebox-aux: exclude git downloads from
 hash check
Message-ID: <20200319215657.5419-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When barebox, and thus barebox-aux, are downloaded from a git tree, then
barebox-aux download fails because a hash check is attempted on the
downloaded archive:

    Could not fetch special ref 'v2020.03.0'; assuming it is not special.
    ERROR: No hash found for barebox-aux-v2020.03.0.tar.gz

This is because we only exclude from the check the archive of the bare
barebox:

    BR_NO_CHECK_HASH_FOR += $(BAREBOX_SOURCE)

However, the default name of an archive is based on the package name,
which for barebox-aux is not 'barebox'.

Since barebox-aux really uses the exact same source as the bare barebox,
it should also share the archive name.

This has two direct consequences and advantages:

  - the hash check is completely avoided for the barebox-aux archive;

  - the barebox-aux archive is not downloaded as it is already
    downloaded for barebox.

Reported-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Note: that last claim about the download being done only once requires
that a previous patch be applied first (with typoes fixed):
    https://patchwork.ozlabs.org/patch/1258482/
---
 boot/barebox/barebox.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 3d7492598f..1efe5665de 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -25,6 +25,10 @@ $(1)_SOURCE = $$(notdir $$($(1)_TARBALL))
 else ifeq ($$(BR2_TARGET_BAREBOX_CUSTOM_GIT),y)
 $(1)_SITE = $$(call qstrip,$$(BR2_TARGET_BAREBOX_CUSTOM_GIT_REPO_URL))
 $(1)_SITE_METHOD = git
+# Override the default value of _SOURCE to 'barebox-*' so that it is not
+# downloaded a second time for barebox-aux; also alows avoiding the hash
+# check:
+$(1)_SOURCE = barebox-$$($(1)_VERSION).tar.gz
 else
 # Handle stable official Barebox versions
 $(1)_SOURCE = barebox-$$($(1)_VERSION).tar.bz2
-- 
2.20.1
