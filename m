From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  2 May 2015 11:05:02 +0200
Subject: [Buildroot] [PATCH 3/7 v2] boot/barebox: do not check hash for
	custom versions
In-Reply-To: <cover.1430557268.git.yann.morin.1998@free.fr>
References: <cover.1430557268.git.yann.morin.1998@free.fr>
Message-ID: <51c3ed95e58cb3930401729b861d1f69f3c46f23.1430557268.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As we recently did for U-Boot, disable checking hashes for custom
versions of barebox.

Note that we currently have no hash file for barebox, but avoiding the
check will already be in place when we do add it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/barebox/barebox.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 54f52bb..764791d 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -11,6 +11,7 @@ ifeq ($(BAREBOX_VERSION),custom)
 BAREBOX_TARBALL = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_TARBALL_LOCATION))
 BAREBOX_SITE = $(patsubst %/,%,$(dir $(BAREBOX_TARBALL)))
 BAREBOX_SOURCE = $(notdir $(BAREBOX_TARBALL))
+BR_NO_CHECK_HASH_FOR += $(BAREBOX_SOURCE)
 else ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_GIT),y)
 BAREBOX_SITE = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_GIT_REPO_URL))
 BAREBOX_SITE_METHOD = git
@@ -18,6 +19,9 @@ else
 # Handle stable official Barebox versions
 BAREBOX_SOURCE = barebox-$(BAREBOX_VERSION).tar.bz2
 BAREBOX_SITE = http://www.barebox.org/download
+ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_VERSION),y)
+BR_NO_CHECK_HASH_FOR += $(BAREBOX_SOURCE)
+endif
 endif
 
 BAREBOX_DEPENDENCIES = host-lzop
-- 
1.9.1
