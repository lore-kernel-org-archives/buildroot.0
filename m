Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4D4E7F13B
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 21:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8BB8613A4;
	Tue, 26 Sep 2023 21:45:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8BB8613A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hPn4t9azjZeD; Tue, 26 Sep 2023 21:45:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 063FC613A8;
	Tue, 26 Sep 2023 21:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 063FC613A8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DAE61BF279
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 21:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24A0A40A4B
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 21:45:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24A0A40A4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KRvJTXNcvA-a for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 21:45:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0889B4004A
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 21:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0889B4004A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E846C81D55; Tue, 26 Sep 2023 21:45:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 23:40:54 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: c132c520872ca3435e7c4218da498358fe0e3053
X-Git-Newrev: 4983ac79ff7da263392fb347b5b8f70bd8180c21
X-Patchwork-Hint: ignore
Message-Id: <20230926214535.E846C81D55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] Revert
 "package/docker-cli: backport fix for host header check"
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

commit: https://git.buildroot.net/buildroot/commit/?id=4983ac79ff7da263392fb347b5b8f70bd8180c21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

This reverts commit ce1b80f27dc86d7b23aa221b7d1601dcd57e451e.

With the bump to go 1.19.13, this workaround is no longer needed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-backport-fix-for-go-Host-header-check.patch | 127 ---------------------
 1 file changed, 127 deletions(-)

diff --git a/package/docker-cli/0001-backport-fix-for-go-Host-header-check.patch b/package/docker-cli/0001-backport-fix-for-go-Host-header-check.patch
deleted file mode 100644
index 2b58582538..0000000000
--- a/package/docker-cli/0001-backport-fix-for-go-Host-header-check.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-From 4dc783e2bdf414761ef7c209b435d0a30f17c858 Mon Sep 17 00:00:00 2001
-From: Sebastiaan van Stijn <github@gone.nl>
-Date: Sat, 15 Jul 2023 02:22:10 +0200
-Subject: [PATCH] backport fix for go Host header check
-
-Go 1.20.6 and 1.19.11 include a security check of the http Host header:
-    
-  https://github.com/golang/go/issues/60374
-
-docker-cli fails this check:
-
-  $ docker exec -it ctr bash
-  http: invalid Host header
-
-This is a backported patch to fix this issue.
-
-Issue: https://github.com/moby/moby/issues/45935
-Upstream PR: https://github.com/moby/moby/pull/45942
-
-The upstream PR has been merged and will be included in v24.0.5.
-
-Signed-off-by: Christian Stewart <christian@aperture.us>
-[Peter: drop vendor.mod/vendor.sum changes]
----
-
-For local communications (npipe://, unix://), the hostname is not used,
-but we need valid and meaningful hostname.
-
-The current code used the socket path as hostname, which gets rejected by
-go1.20.6 and go1.19.11 because of a security fix for [CVE-2023-29406 ][1],
-which was implemented in  https://go.dev/issue/60374.
-
-Prior versions go Go would clean the host header, and strip slashes in the
-process, but go1.20.6 and go1.19.11 no longer do, and reject the host
-header.
----
- .../github.com/docker/docker/client/client.go | 30 +++++++++++++++++
- .../github.com/docker/docker/client/hijack.go |  6 +++-
- .../docker/docker/client/request.go           | 10 +++---
- 4 files changed, 72 insertions(+), 40 deletions(-)
-
-diff --git a/vendor/github.com/docker/docker/client/client.go b/vendor/github.com/docker/docker/client/client.go
-index 1c081a51ae..54fa36cca8 100644
---- a/vendor/github.com/docker/docker/client/client.go
-+++ b/vendor/github.com/docker/docker/client/client.go
-@@ -56,6 +56,36 @@ import (
- 	"github.com/pkg/errors"
- )
- 
-+// DummyHost is a hostname used for local communication.
-+//
-+// It acts as a valid formatted hostname for local connections (such as "unix://"
-+// or "npipe://") which do not require a hostname. It should never be resolved,
-+// but uses the special-purpose ".localhost" TLD (as defined in [RFC 2606, Section 2]
-+// and [RFC 6761, Section 6.3]).
-+//
-+// [RFC 7230, Section 5.4] defines that an empty header must be used for such
-+// cases:
-+//
-+//	If the authority component is missing or undefined for the target URI,
-+//	then a client MUST send a Host header field with an empty field-value.
-+//
-+// However, [Go stdlib] enforces the semantics of HTTP(S) over TCP, does not
-+// allow an empty header to be used, and requires req.URL.Scheme to be either
-+// "http" or "https".
-+//
-+// For further details, refer to:
-+//
-+//   - https://github.com/docker/engine-api/issues/189
-+//   - https://github.com/golang/go/issues/13624
-+//   - https://github.com/golang/go/issues/61076
-+//   - https://github.com/moby/moby/issues/45935
-+//
-+// [RFC 2606, Section 2]: https://www.rfc-editor.org/rfc/rfc2606.html#section-2
-+// [RFC 6761, Section 6.3]: https://www.rfc-editor.org/rfc/rfc6761#section-6.3
-+// [RFC 7230, Section 5.4]: https://datatracker.ietf.org/doc/html/rfc7230#section-5.4
-+// [Go stdlib]: https://github.com/golang/go/blob/6244b1946bc2101b01955468f1be502dbadd6807/src/net/http/transport.go#L558-L569
-+const DummyHost = "api.moby.localhost"
-+
- // ErrRedirect is the error returned by checkRedirect when the request is non-GET.
- var ErrRedirect = errors.New("unexpected redirect in response")
- 
-diff --git a/vendor/github.com/docker/docker/client/hijack.go b/vendor/github.com/docker/docker/client/hijack.go
-index 6bdacab10a..4dcaaca4c5 100644
---- a/vendor/github.com/docker/docker/client/hijack.go
-+++ b/vendor/github.com/docker/docker/client/hijack.go
-@@ -64,7 +64,11 @@ func fallbackDial(proto, addr string, tlsConfig *tls.Config) (net.Conn, error) {
- }
- 
- func (cli *Client) setupHijackConn(ctx context.Context, req *http.Request, proto string) (net.Conn, string, error) {
--	req.Host = cli.addr
-+	req.URL.Host = cli.addr
-+	if cli.proto == "unix" || cli.proto == "npipe" {
-+		// Override host header for non-tcp connections.
-+		req.Host = DummyHost
-+	}
- 	req.Header.Set("Connection", "Upgrade")
- 	req.Header.Set("Upgrade", proto)
- 
-diff --git a/vendor/github.com/docker/docker/client/request.go b/vendor/github.com/docker/docker/client/request.go
-index c799095c12..bcedcf3bd9 100644
---- a/vendor/github.com/docker/docker/client/request.go
-+++ b/vendor/github.com/docker/docker/client/request.go
-@@ -96,16 +96,14 @@ func (cli *Client) buildRequest(method, path string, body io.Reader, headers hea
- 		return nil, err
- 	}
- 	req = cli.addHeaders(req, headers)
-+	req.URL.Scheme = cli.scheme
-+	req.URL.Host = cli.addr
- 
- 	if cli.proto == "unix" || cli.proto == "npipe" {
--		// For local communications, it doesn't matter what the host is. We just
--		// need a valid and meaningful host name. (See #189)
--		req.Host = "docker"
-+		// Override host header for non-tcp connections.
-+		req.Host = DummyHost
- 	}
- 
--	req.URL.Host = cli.addr
--	req.URL.Scheme = cli.scheme
--
- 	if expectedPayload && req.Header.Get("Content-Type") == "" {
- 		req.Header.Set("Content-Type", "text/plain")
- 	}
--- 
-2.41.0
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
