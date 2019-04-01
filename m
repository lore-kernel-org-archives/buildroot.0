From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 22:57:17 +0200
Subject: [Buildroot] [git commit] package/pkg-generic: depend on host-{xz,
 lzip} only for fitting archives
Message-ID: <20190401210240.A1E2B846DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=004960e967a559e59e58fbc0848212e4ebecab62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, host-xz and host-lzip are built as soon as the
corresponding tools are not provided by the system, independently of
whether they are really needed by the Buildroot configuration. This is
particularly annoying for host-lzip, which is only needed for very few
packages.

This commit modifies the generic package infrastructure to only add
host-lzip and host-xz as dependencies when really needed.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
[Thomas:
 - improve commit log
 - as suggested by Yann E. Morin, make the lzip case similar to the xz
   case]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index dd3e20ca57..c86338b856 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -615,12 +615,16 @@ $(2)_EXTRACT_DEPENDENCIES += $$(BR2_TAR_HOST_DEPENDENCY)
 endif
 
 ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
+ifneq ($$(filter .xz .lzma,$$(suffix $$($(2)_SOURCE))),)
 $(2)_EXTRACT_DEPENDENCIES += $$(BR2_XZCAT_HOST_DEPENDENCY)
 endif
+endif
 
 ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate,$(1)),)
+ifneq ($$(filter .lz,$$(suffix $$($(2)_SOURCE))),)
 $(2)_EXTRACT_DEPENDENCIES += $$(BR2_LZIP_HOST_DEPENDENCY)
 endif
+endif
 
 ifeq ($$(BR2_CCACHE),y)
 ifeq ($$(filter host-tar host-skeleton host-xz host-lzip host-fakedate host-ccache,$(1)),)
