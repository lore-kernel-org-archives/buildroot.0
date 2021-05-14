From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 May 2021 22:59:49 +0200
Subject: [Buildroot] [git commit] package/docker-engine: fix port forwarding
 for hosts without IPv6
Message-ID: <20210514203237.5285F874ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fd33900f50f6df058263582fba0b0e7c0367996
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

docker-engine 20.10.6 broke container port forwarding for hosts without IPv6
support:

docker: Error response from daemon: driver failed programming external
connectivity on endpoint naughty_moore
(038e9ed4b5ea77e1c52462d6d04ad001fbad9beb185a6511aadc217c8a271608): Error
starting userland proxy: listen tcp6 [::]:80: socket: address family not
supported by protocol.

Add a libnetwork patch from an upstream pull request to fix this, after
adjusting the patch to apply to docker-engine (which has libnetwork vendored
under vendor/github.com/docker/libnetwork):

- https://github.com/moby/libnetwork/pull/2635,
- https://github.com/moby/moby/pull/42322

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-fix-port-forwarding-with-ipv6.disable-1.patch | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/package/docker-engine/0001-fix-port-forwarding-with-ipv6.disable-1.patch b/package/docker-engine/0001-fix-port-forwarding-with-ipv6.disable-1.patch
new file mode 100644
index 0000000000..c5161ef0db
--- /dev/null
+++ b/package/docker-engine/0001-fix-port-forwarding-with-ipv6.disable-1.patch
@@ -0,0 +1,74 @@
+From 7b9c2905883df5171fda10a364a81b8c6176c8e2 Mon Sep 17 00:00:00 2001
+From: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
+Date: Mon, 26 Apr 2021 15:28:40 +0900
+Subject: [PATCH] fix port forwarding with ipv6.disable=1
+
+Make `docker run -p 80:80` functional again on environments with kernel boot parameter `ipv6.disable=1`.
+
+Fix moby/moby issue 42288
+
+Signed-off-by: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
+[Upstream: https://github.com/moby/libnetwork/pull/2635,
+           https://github.com/moby/moby/pull/42322]
+[Rework path/drop test for docker-engine]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ vendor/github.com/docker/libnetwork/drivers/bridge/port_mapping.go | 31 +++++++++++++++++++++++++++++++
+ 1 file changed, 35 insertions(+), 0 deletion(-)
+
+diff --git a/vendor/github.com/docker/libnetwork/drivers/bridge/port_mapping.go b/vendor/github.com/docker/libnetwork/drivers/bridge/port_mapping.go
+index 946130ec..17bf36f9 100644
+--- a/vendor/github.com/docker/libnetwork/drivers/bridge/port_mapping.go
++++ b/vendor/github.com/docker/libnetwork/drivers/bridge/port_mapping.go
+@@ -5,6 +5,7 @@ import (
+ 	"errors"
+ 	"fmt"
+ 	"net"
++	"sync"
+ 
+ 	"github.com/docker/libnetwork/types"
+ 	"github.com/ishidawataru/sctp"
+@@ -50,6 +51,13 @@ func (n *bridgeNetwork) allocatePortsInternal(bindings []types.PortBinding, cont
+ 			bs = append(bs, bIPv4)
+ 		}
+ 
++		// skip adding implicit v6 addr, when the kernel was booted with `ipv6.disable=1`
++		// https://github.com/moby/moby/issues/42288
++		isV6Binding := c.HostIP != nil && c.HostIP.To4() == nil
++		if !isV6Binding && !IsV6Listenable() {
++			continue
++		}
++
+ 		// Allocate IPv6 Port mappings
+ 		// If the container has no IPv6 address, allow proxying host IPv6 traffic to it
+ 		// by setting up the binding with the IPv4 interface if the userland proxy is enabled
+@@ -211,3 +219,26 @@ func (n *bridgeNetwork) releasePort(bnd types.PortBinding) error {
+ 
+ 	return portmapper.Unmap(host)
+ }
++
++var (
++	v6ListenableCached bool
++	v6ListenableOnce   sync.Once
++)
++
++// IsV6Listenable returns true when `[::1]:0` is listenable.
++// IsV6Listenable returns false mostly when the kernel was booted with `ipv6.disable=1` option.
++func IsV6Listenable() bool {
++	v6ListenableOnce.Do(func() {
++		ln, err := net.Listen("tcp6", "[::1]:0")
++		if err != nil {
++			// When the kernel was booted with `ipv6.disable=1`,
++			// we get err "listen tcp6 [::1]:0: socket: address family not supported by protocol"
++			// https://github.com/moby/moby/issues/42288
++			logrus.Debugf("port_mapping: v6Listenable=false (%v)", err)
++		} else {
++			v6ListenableCached = true
++			ln.Close()
++		}
++	})
++	return v6ListenableCached
++}
+-- 
+2.20.1
+
