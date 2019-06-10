From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jun 2019 20:44:08 +0200
Subject: [Buildroot] [git commit] package/pkg-golang: do not set static
 linking for host target
Message-ID: <20190610184353.43F408F5B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60d455f20b9c656c2a23ce4e8dc03719e55f7453
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current logic will set the "-static" flag when building go
host packages if BR2_STATIC_LIBS is set, this will not work as
there is no support to link host packages statically.

Fix this by applying this logic only for target builds.

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-golang.mk | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 72e8f6b7af..e47de17aba 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -58,10 +58,6 @@ define inner-golang-package
 
 $(2)_WORKSPACE ?= _gopath
 
-ifeq ($(BR2_STATIC_LIBS),y)
-$(2)_LDFLAGS += -extldflags '-static'
-endif
-
 $(2)_BUILD_OPTS += \
 	-ldflags "$$($(2)_LDFLAGS)" \
 	-tags "$$($(2)_TAGS)" \
@@ -106,6 +102,11 @@ endif
 # file.
 ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
+
+ifeq ($(BR2_STATIC_LIBS),y)
+$(2)_LDFLAGS += -extldflags '-static'
+endif
+
 # Build package for target
 define $(2)_BUILD_CMDS
 	$$(foreach d,$$($(2)_BUILD_TARGETS),\
