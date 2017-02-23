From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Feb 2017 18:00:25 +0100
Subject: [Buildroot] [PATCH 03/25] luarocks-package: use $(HOST_PKG_VERSION)
	instead of $(PKG_VERSION)
In-Reply-To: <20170223170047.24417-1-arnout@mind.be>
References: <20170223170047.24417-1-arnout@mind.be>
Message-ID: <20170223170047.24417-4-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The inner-luarocks-package macro was using $(3)_VERSION as the package
version, i.e. the version of the target package, even when it's the
host package. We should instead use $(2)_VERSION, i.e. the host package
version, like is done in inner-generic-package.

Since luarocks-package doesn't even support a host version, it doens't
make a whole lot of difference, but let's keep things consistent.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-luarocks.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
index da5c912c81..aa83e74a0e 100644
--- a/package/pkg-luarocks.mk
+++ b/package/pkg-luarocks.mk
@@ -34,9 +34,9 @@
 define inner-luarocks-package
 
 $(2)_BUILD_OPTS		?=
-$(2)_SUBDIR		?= $(1)-$$(shell echo "$$($(3)_VERSION)" | sed -e "s/-[0-9]$$$$//")
-$(2)_ROCKSPEC		?= $(1)-$$($(3)_VERSION).rockspec
-$(2)_SOURCE		?= $(1)-$$($(3)_VERSION).src.rock
+$(2)_SUBDIR		?= $(1)-$$(shell echo "$$($(2)_VERSION)" | sed -e "s/-[0-9]$$$$//")
+$(2)_ROCKSPEC		?= $(1)-$$($(2)_VERSION).rockspec
+$(2)_SOURCE		?= $(1)-$$($(2)_VERSION).src.rock
 $(2)_SITE		?= $$(call qstrip,$$(BR2_LUAROCKS_MIRROR))
 
 # Since we do not support host-luarocks-package, we know this is
-- 
2.11.0
