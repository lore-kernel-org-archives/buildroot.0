Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B942C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:11:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 222B460EBC
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 222B460EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC7F840291;
	Tue,  3 Aug 2021 21:11:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QutJfq_BeJXo; Tue,  3 Aug 2021 21:11:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39B1A40261;
	Tue,  3 Aug 2021 21:11:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 208161BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A6E7605E0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 37Zune76dUKv for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA637605CF
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3D92187BB7; Tue,  3 Aug 2021 21:09:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 May 2021 22:59:49 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6ad1c7f12e57ab7c6f022470e0aacec442d14267
X-Git-Newrev: 2fd33900f50f6df058263582fba0b0e7c0367996
X-Patchwork-Hint: ignore
Message-Id: <20210803210936.3D92187BB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/docker-engine: fix
 port forwarding for hosts without IPv6
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=2fd33900f50f6df058263582fba0b0e7c0367996
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
