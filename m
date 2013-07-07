From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 7 Jul 2013 21:19:45 +0200
Subject: [Buildroot] [git commit] iptables: fix build after linux-headers
	changes
Message-ID: <20130707200243.C7F4C9A591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=478f826518e1cf769abfb69da9361d931be15f8c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by 'scanf' on IRC, the iptables now fails to build because
of a missing <asm/cache.h> header in the kernel headers. The package
directly uses $(LINUX_HEADERS_DIR), which is not correct: this is the
source directory of the kernel, not where they are installed, and in
addition, this directory is empty/does not exist when using external
toolchains.

Instead, we use $(STAGING_DIR)/usr, which contains the kernel headers,
as part of the toolchain headers.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iptables/iptables.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index cfb227a..f548cb9 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -12,7 +12,7 @@ IPTABLES_DEPENDENCIES = host-pkgconf
 IPTABLES_LICENSE = GPLv2
 IPTABLES_LICENSE_FILES = COPYING
 
-IPTABLES_CONF_OPT = --libexecdir=/usr/lib --with-kernel=$(LINUX_HEADERS_DIR)
+IPTABLES_CONF_OPT = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr
 
 define IPTABLES_TARGET_SYMLINK_CREATE
 	ln -sf xtables-multi $(TARGET_DIR)/usr/sbin/iptables
