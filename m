Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F35EE14D0
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 19:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF162401CC;
	Wed,  6 Sep 2023 19:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF162401CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cw0FJc1uhE51; Wed,  6 Sep 2023 19:07:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D076541566;
	Wed,  6 Sep 2023 19:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D076541566
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F9E01BF46D
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68BF782179
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68BF782179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kQq19j_IEAaC for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 19:07:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EC6282171
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 19:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EC6282171
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D70586992; Wed,  6 Sep 2023 19:07:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Sep 2023 21:07:38 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 0b608f0252f51b7d2f54219153976eac7e30669c
X-Git-Newrev: ce1b80f27dc86d7b23aa221b7d1601dcd57e451e
X-Patchwork-Hint: ignore
Message-Id: <20230906190754.1D70586992@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/docker-cli:
 backport fix for host header check
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ce1b80f27dc86d7b23aa221b7d1601dcd57e451e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Go 1.20.6 and 1.19.11 include a security check of the http Host header:

  https://github.com/golang/go/issues/60374

docker-cli does not satisfy this check:

  $ docker exec -it ctr bash
  http: invalid Host header

This is a backported patch to fix this issue:

Issue: https://github.com/moby/moby/issues/45935
Upstream PR: https://github.com/moby/moby/pull/45942

The upstream PR has been merged and will be included in v24.0.5.

Signed-off-by: Christian Stewart <christian@aperture.us>
Tested-by: TIAN Yuanhao <tianyuanhao3@163.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |   1 +
 ...001-backport-fix-for-go-Host-header-check.patch | 127 +++++++++++++++++++++
 2 files changed, 128 insertions(+)

diff --git a/.checkpackageignore b/.checkpackageignore
index 06ef794b05..bad664e6d3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -361,6 +361,7 @@ package/dmalloc/0005-configure-use-LD-instead-of-hard-coding-ld.patch Upstream
 package/dmraid/0001-fix-compilation-under-musl.patch Upstream
 package/dmraid/S20dmraid Variables
 package/dnsmasq/S80dnsmasq Shellcheck Variables
+package/docker-cli/0001-backport-fix-for-go-Host-header-check.patch Upstream
 package/docker-engine/0001-client-define-a-dummy-hostname-to-use-for-local-conn.patch Upstream
 package/docker-engine/0002-pkg-plugins-use-a-dummy-hostname-for-local-connectio.patch Upstream
 package/docker-engine/S60dockerd Indent Shellcheck Variables
diff --git a/package/docker-cli/0001-backport-fix-for-go-Host-header-check.patch b/package/docker-cli/0001-backport-fix-for-go-Host-header-check.patch
new file mode 100644
index 0000000000..2b58582538
--- /dev/null
+++ b/package/docker-cli/0001-backport-fix-for-go-Host-header-check.patch
@@ -0,0 +1,127 @@
+From 4dc783e2bdf414761ef7c209b435d0a30f17c858 Mon Sep 17 00:00:00 2001
+From: Sebastiaan van Stijn <github@gone.nl>
+Date: Sat, 15 Jul 2023 02:22:10 +0200
+Subject: [PATCH] backport fix for go Host header check
+
+Go 1.20.6 and 1.19.11 include a security check of the http Host header:
+    
+  https://github.com/golang/go/issues/60374
+
+docker-cli fails this check:
+
+  $ docker exec -it ctr bash
+  http: invalid Host header
+
+This is a backported patch to fix this issue.
+
+Issue: https://github.com/moby/moby/issues/45935
+Upstream PR: https://github.com/moby/moby/pull/45942
+
+The upstream PR has been merged and will be included in v24.0.5.
+
+Signed-off-by: Christian Stewart <christian@aperture.us>
+[Peter: drop vendor.mod/vendor.sum changes]
+---
+
+For local communications (npipe://, unix://), the hostname is not used,
+but we need valid and meaningful hostname.
+
+The current code used the socket path as hostname, which gets rejected by
+go1.20.6 and go1.19.11 because of a security fix for [CVE-2023-29406 ][1],
+which was implemented in  https://go.dev/issue/60374.
+
+Prior versions go Go would clean the host header, and strip slashes in the
+process, but go1.20.6 and go1.19.11 no longer do, and reject the host
+header.
+---
+ .../github.com/docker/docker/client/client.go | 30 +++++++++++++++++
+ .../github.com/docker/docker/client/hijack.go |  6 +++-
+ .../docker/docker/client/request.go           | 10 +++---
+ 4 files changed, 72 insertions(+), 40 deletions(-)
+
+diff --git a/vendor/github.com/docker/docker/client/client.go b/vendor/github.com/docker/docker/client/client.go
+index 1c081a51ae..54fa36cca8 100644
+--- a/vendor/github.com/docker/docker/client/client.go
++++ b/vendor/github.com/docker/docker/client/client.go
+@@ -56,6 +56,36 @@ import (
+ 	"github.com/pkg/errors"
+ )
+ 
++// DummyHost is a hostname used for local communication.
++//
++// It acts as a valid formatted hostname for local connections (such as "unix://"
++// or "npipe://") which do not require a hostname. It should never be resolved,
++// but uses the special-purpose ".localhost" TLD (as defined in [RFC 2606, Section 2]
++// and [RFC 6761, Section 6.3]).
++//
++// [RFC 7230, Section 5.4] defines that an empty header must be used for such
++// cases:
++//
++//	If the authority component is missing or undefined for the target URI,
++//	then a client MUST send a Host header field with an empty field-value.
++//
++// However, [Go stdlib] enforces the semantics of HTTP(S) over TCP, does not
++// allow an empty header to be used, and requires req.URL.Scheme to be either
++// "http" or "https".
++//
++// For further details, refer to:
++//
++//   - https://github.com/docker/engine-api/issues/189
++//   - https://github.com/golang/go/issues/13624
++//   - https://github.com/golang/go/issues/61076
++//   - https://github.com/moby/moby/issues/45935
++//
++// [RFC 2606, Section 2]: https://www.rfc-editor.org/rfc/rfc2606.html#section-2
++// [RFC 6761, Section 6.3]: https://www.rfc-editor.org/rfc/rfc6761#section-6.3
++// [RFC 7230, Section 5.4]: https://datatracker.ietf.org/doc/html/rfc7230#section-5.4
++// [Go stdlib]: https://github.com/golang/go/blob/6244b1946bc2101b01955468f1be502dbadd6807/src/net/http/transport.go#L558-L569
++const DummyHost = "api.moby.localhost"
++
+ // ErrRedirect is the error returned by checkRedirect when the request is non-GET.
+ var ErrRedirect = errors.New("unexpected redirect in response")
+ 
+diff --git a/vendor/github.com/docker/docker/client/hijack.go b/vendor/github.com/docker/docker/client/hijack.go
+index 6bdacab10a..4dcaaca4c5 100644
+--- a/vendor/github.com/docker/docker/client/hijack.go
++++ b/vendor/github.com/docker/docker/client/hijack.go
+@@ -64,7 +64,11 @@ func fallbackDial(proto, addr string, tlsConfig *tls.Config) (net.Conn, error) {
+ }
+ 
+ func (cli *Client) setupHijackConn(ctx context.Context, req *http.Request, proto string) (net.Conn, string, error) {
+-	req.Host = cli.addr
++	req.URL.Host = cli.addr
++	if cli.proto == "unix" || cli.proto == "npipe" {
++		// Override host header for non-tcp connections.
++		req.Host = DummyHost
++	}
+ 	req.Header.Set("Connection", "Upgrade")
+ 	req.Header.Set("Upgrade", proto)
+ 
+diff --git a/vendor/github.com/docker/docker/client/request.go b/vendor/github.com/docker/docker/client/request.go
+index c799095c12..bcedcf3bd9 100644
+--- a/vendor/github.com/docker/docker/client/request.go
++++ b/vendor/github.com/docker/docker/client/request.go
+@@ -96,16 +96,14 @@ func (cli *Client) buildRequest(method, path string, body io.Reader, headers hea
+ 		return nil, err
+ 	}
+ 	req = cli.addHeaders(req, headers)
++	req.URL.Scheme = cli.scheme
++	req.URL.Host = cli.addr
+ 
+ 	if cli.proto == "unix" || cli.proto == "npipe" {
+-		// For local communications, it doesn't matter what the host is. We just
+-		// need a valid and meaningful host name. (See #189)
+-		req.Host = "docker"
++		// Override host header for non-tcp connections.
++		req.Host = DummyHost
+ 	}
+ 
+-	req.URL.Host = cli.addr
+-	req.URL.Scheme = cli.scheme
+-
+ 	if expectedPayload && req.Header.Get("Content-Type") == "" {
+ 		req.Header.Set("Content-Type", "text/plain")
+ 	}
+-- 
+2.41.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
