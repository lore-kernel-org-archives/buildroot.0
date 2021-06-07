From: Christian Stewart <christian@paral.in>
Date: Sun,  6 Jun 2021 23:07:29 -0700
Subject: [Buildroot] [PATCH 1/2] package/docker-engine: bump version to
 20.10.7
Message-ID: <20210607060730.1476825-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstreamed patch fix-port-forwarding-with-ipv6.

Upstream commit: d29a55c6c344a536089d6b1bcd92be9cdea20641

Signed-off-by: Christian Stewart <christian@paral.in>
---
 ...-port-forwarding-with-ipv6.disable-1.patch | 74 -------------------
 package/docker-engine/docker-engine.hash      |  2 +-
 package/docker-engine/docker-engine.mk        |  2 +-
 3 files changed, 2 insertions(+), 76 deletions(-)
 delete mode 100644 package/docker-engine/0001-fix-port-forwarding-with-ipv6.disable-1.patch

diff --git a/package/docker-engine/0001-fix-port-forwarding-with-ipv6.disable-1.patch b/package/docker-engine/0001-fix-port-forwarding-with-ipv6.disable-1.patch
deleted file mode 100644
index c5161ef0db..0000000000
--- a/package/docker-engine/0001-fix-port-forwarding-with-ipv6.disable-1.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 7b9c2905883df5171fda10a364a81b8c6176c8e2 Mon Sep 17 00:00:00 2001
-From: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
-Date: Mon, 26 Apr 2021 15:28:40 +0900
-Subject: [PATCH] fix port forwarding with ipv6.disable=1
-
-Make `docker run -p 80:80` functional again on environments with kernel boot parameter `ipv6.disable=1`.
-
-Fix moby/moby issue 42288
-
-Signed-off-by: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
-[Upstream: https://github.com/moby/libnetwork/pull/2635,
-           https://github.com/moby/moby/pull/42322]
-[Rework path/drop test for docker-engine]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- vendor/github.com/docker/libnetwork/drivers/bridge/port_mapping.go | 31 +++++++++++++++++++++++++++++++
- 1 file changed, 35 insertions(+), 0 deletion(-)
-
-diff --git a/vendor/github.com/docker/libnetwork/drivers/bridge/port_mapping.go b/vendor/github.com/docker/libnetwork/drivers/bridge/port_mapping.go
-index 946130ec..17bf36f9 100644
---- a/vendor/github.com/docker/libnetwork/drivers/bridge/port_mapping.go
-+++ b/vendor/github.com/docker/libnetwork/drivers/bridge/port_mapping.go
-@@ -5,6 +5,7 @@ import (
- 	"errors"
- 	"fmt"
- 	"net"
-+	"sync"
- 
- 	"github.com/docker/libnetwork/types"
- 	"github.com/ishidawataru/sctp"
-@@ -50,6 +51,13 @@ func (n *bridgeNetwork) allocatePortsInternal(bindings []types.PortBinding, cont
- 			bs = append(bs, bIPv4)
- 		}
- 
-+		// skip adding implicit v6 addr, when the kernel was booted with `ipv6.disable=1`
-+		// https://github.com/moby/moby/issues/42288
-+		isV6Binding := c.HostIP != nil && c.HostIP.To4() == nil
-+		if !isV6Binding && !IsV6Listenable() {
-+			continue
-+		}
-+
- 		// Allocate IPv6 Port mappings
- 		// If the container has no IPv6 address, allow proxying host IPv6 traffic to it
- 		// by setting up the binding with the IPv4 interface if the userland proxy is enabled
-@@ -211,3 +219,26 @@ func (n *bridgeNetwork) releasePort(bnd types.PortBinding) error {
- 
- 	return portmapper.Unmap(host)
- }
-+
-+var (
-+	v6ListenableCached bool
-+	v6ListenableOnce   sync.Once
-+)
-+
-+// IsV6Listenable returns true when `[::1]:0` is listenable.
-+// IsV6Listenable returns false mostly when the kernel was booted with `ipv6.disable=1` option.
-+func IsV6Listenable() bool {
-+	v6ListenableOnce.Do(func() {
-+		ln, err := net.Listen("tcp6", "[::1]:0")
-+		if err != nil {
-+			// When the kernel was booted with `ipv6.disable=1`,
-+			// we get err "listen tcp6 [::1]:0: socket: address family not supported by protocol"
-+			// https://github.com/moby/moby/issues/42288
-+			logrus.Debugf("port_mapping: v6Listenable=false (%v)", err)
-+		} else {
-+			v6ListenableCached = true
-+			ln.Close()
-+		}
-+	})
-+	return v6ListenableCached
-+}
--- 
-2.20.1
-
diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 6c55b9a9b9..d07ca33307 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fd7f5571b1f64f26b5ca520a3e1fefb33c190f3732b931051c23a76bdba5000e  docker-engine-20.10.6.tar.gz
+sha256  b80142035de46904605fb7b8f18075cd94154f8c3d67ff346ea554d1e9d579b9  docker-engine-20.10.7.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 10ecbf603a..372717775b 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 20.10.6
+DOCKER_ENGINE_VERSION = 20.10.7
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.31.1
