From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Mar 2020 23:51:14 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] boot/barebox-aux: exclude
 git downloads from hash check
Message-ID: <20200327225323.5CCC388735@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=630283a7f79107d93a8502a8467571f61c99d24d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

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
Tested-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 451ee6fa5454158b5d95cef0f404c0443dde868e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/barebox.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 814e21f945..5e423f9b2c 100644
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
