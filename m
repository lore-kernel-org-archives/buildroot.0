Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB43E7F138
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 21:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FC46613A8;
	Tue, 26 Sep 2023 21:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FC46613A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fYmawXciwG73; Tue, 26 Sep 2023 21:45:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 512AD60A5D;
	Tue, 26 Sep 2023 21:45:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 512AD60A5D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 866001BF279
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 21:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F722613A8
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 21:45:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F722613A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qDr23BRo5jXx for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 21:45:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15A1E613A4
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 21:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15A1E613A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00A9C81D5C; Tue, 26 Sep 2023 21:45:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Sep 2023 23:41:11 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 4983ac79ff7da263392fb347b5b8f70bd8180c21
X-Git-Newrev: a0a7113ae8d7efd7455e361d320d5d8b60bb9b02
X-Patchwork-Hint: ignore
Message-Id: <20230926214536.00A9C81D5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] Revert
 "package/docker-engine: backport fix for host header check"
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0a7113ae8d7efd7455e361d320d5d8b60bb9b02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

This reverts commit 0b608f0252f51b7d2f54219153976eac7e30669c.

With the bump to go 1.19.13, this workaround is no longer needed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ne-a-dummy-hostname-to-use-for-local-conn.patch | 174 ---------------------
 ...-use-a-dummy-hostname-for-local-connectio.patch |  69 --------
 2 files changed, 243 deletions(-)

diff --git a/package/docker-engine/0001-client-define-a-dummy-hostname-to-use-for-local-conn.patch b/package/docker-engine/0001-client-define-a-dummy-hostname-to-use-for-local-conn.patch
deleted file mode 100644
index c5f8d1eb71..0000000000
--- a/package/docker-engine/0001-client-define-a-dummy-hostname-to-use-for-local-conn.patch
+++ /dev/null
@@ -1,174 +0,0 @@
-From 8ced4331e5e3a6760465a8ce2bd42c66d3232c96 Mon Sep 17 00:00:00 2001
-From: Sebastiaan van Stijn <github@gone.nl>
-Date: Wed, 12 Jul 2023 14:15:38 +0200
-Subject: [PATCH] client: define a "dummy" hostname to use for local
- connections
-
-Go 1.20.6 and 1.19.11 include a security check of the http Host header:
-    
-  https://github.com/golang/go/issues/60374
-
-This is a backported patch to fix this issue.
-
-Issue: https://github.com/moby/moby/issues/45935
-Upstream PR: https://github.com/moby/moby/pull/45942
-
-The upstream PR has been merged and will be included in v24.0.5.
-
-Signed-off-by: Christian Stewart <christian@aperture.us>
-
----
-
-For local communications (npipe://, unix://), the hostname is not used,
-but we need valid and meaningful hostname.
-
-The current code used the client's `addr` as hostname in some cases, which
-could contain the path for the unix-socket (`/var/run/docker.sock`), which
-gets rejected by go1.20.6 and go1.19.11 because of a security fix for
-[CVE-2023-29406 ][1], which was implemented in  https://go.dev/issue/60374.
-
-Prior versions go Go would clean the host header, and strip slashes in the
-process, but go1.20.6 and go1.19.11 no longer do, and reject the host
-header.
-
-This patch introduces a `DummyHost` const, and uses this dummy host for
-cases where we don't need an actual hostname.
-
-Before this patch (using go1.20.6):
-
-    make GO_VERSION=1.20.6 TEST_FILTER=TestAttach test-integration
-    === RUN   TestAttachWithTTY
-        attach_test.go:46: assertion failed: error is not nil: http: invalid Host header
-    --- FAIL: TestAttachWithTTY (0.11s)
-    === RUN   TestAttachWithoutTTy
-        attach_test.go:46: assertion failed: error is not nil: http: invalid Host header
-    --- FAIL: TestAttachWithoutTTy (0.02s)
-    FAIL
-
-With this patch applied:
-
-    make GO_VERSION=1.20.6 TEST_FILTER=TestAttach test-integration
-    INFO: Testing against a local daemon
-    === RUN   TestAttachWithTTY
-    --- PASS: TestAttachWithTTY (0.12s)
-    === RUN   TestAttachWithoutTTy
-    --- PASS: TestAttachWithoutTTy (0.02s)
-    PASS
-
-[1]: https://github.com/advisories/GHSA-f8f7-69v5-w4vx
-
-Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
-(cherry picked from commit 92975f0c11f0566cc3c36659f5e3bb9faf5cb176)
-Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
----
- client/client.go       | 30 ++++++++++++++++++++++++++++++
- client/hijack.go       |  6 +++++-
- client/request.go      | 10 ++++------
- client/request_test.go |  4 ++--
- 4 files changed, 41 insertions(+), 9 deletions(-)
-
-diff --git a/client/client.go b/client/client.go
-index 1c081a51ae..54fa36cca8 100644
---- a/client/client.go
-+++ b/client/client.go
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
-diff --git a/client/hijack.go b/client/hijack.go
-index 6bdacab10a..4dcaaca4c5 100644
---- a/client/hijack.go
-+++ b/client/hijack.go
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
-diff --git a/client/request.go b/client/request.go
-index c799095c12..bcedcf3bd9 100644
---- a/client/request.go
-+++ b/client/request.go
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
-diff --git a/client/request_test.go b/client/request_test.go
-index 6e5a6e81f2..50b09d954c 100644
---- a/client/request_test.go
-+++ b/client/request_test.go
-@@ -29,12 +29,12 @@ func TestSetHostHeader(t *testing.T) {
- 	}{
- 		{
- 			"unix:///var/run/docker.sock",
--			"docker",
-+			DummyHost,
- 			"/var/run/docker.sock",
- 		},
- 		{
- 			"npipe:////./pipe/docker_engine",
--			"docker",
-+			DummyHost,
- 			"//./pipe/docker_engine",
- 		},
- 		{
--- 
-2.41.0
-
diff --git a/package/docker-engine/0002-pkg-plugins-use-a-dummy-hostname-for-local-connectio.patch b/package/docker-engine/0002-pkg-plugins-use-a-dummy-hostname-for-local-connectio.patch
deleted file mode 100644
index 5bd8682927..0000000000
--- a/package/docker-engine/0002-pkg-plugins-use-a-dummy-hostname-for-local-connectio.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 09306e7eb3c26ade69ef1e4c99d5b1fd9c0b7364 Mon Sep 17 00:00:00 2001
-From: Sebastiaan van Stijn <github@gone.nl>
-Date: Wed, 12 Jul 2023 15:07:59 +0200
-Subject: [PATCH] pkg/plugins: use a dummy hostname for local connections
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
-
-Before this patch, tests would fail on go1.20.6:
-
-    === FAIL: pkg/authorization TestAuthZRequestPlugin (15.01s)
-    time="2023-07-12T12:53:45Z" level=warning msg="Unable to connect to plugin: //tmp/authz2422457390/authz-test-plugin.sock/AuthZPlugin.AuthZReq: Post \"http://%2F%2Ftmp%2Fauthz2422457390%2Fauthz-test-plugin.sock/AuthZPlugin.AuthZReq\": http: invalid Host header, retrying in 1s"
-    time="2023-07-12T12:53:46Z" level=warning msg="Unable to connect to plugin: //tmp/authz2422457390/authz-test-plugin.sock/AuthZPlugin.AuthZReq: Post \"http://%2F%2Ftmp%2Fauthz2422457390%2Fauthz-test-plugin.sock/AuthZPlugin.AuthZReq\": http: invalid Host header, retrying in 2s"
-    time="2023-07-12T12:53:48Z" level=warning msg="Unable to connect to plugin: //tmp/authz2422457390/authz-test-plugin.sock/AuthZPlugin.AuthZReq: Post \"http://%2F%2Ftmp%2Fauthz2422457390%2Fauthz-test-plugin.sock/AuthZPlugin.AuthZReq\": http: invalid Host header, retrying in 4s"
-    time="2023-07-12T12:53:52Z" level=warning msg="Unable to connect to plugin: //tmp/authz2422457390/authz-test-plugin.sock/AuthZPlugin.AuthZReq: Post \"http://%2F%2Ftmp%2Fauthz2422457390%2Fauthz-test-plugin.sock/AuthZPlugin.AuthZReq\": http: invalid Host header, retrying in 8s"
-        authz_unix_test.go:82: Failed to authorize request Post "http://%2F%2Ftmp%2Fauthz2422457390%2Fauthz-test-plugin.sock/AuthZPlugin.AuthZReq": http: invalid Host header
-
-[1]: https://github.com/advisories/GHSA-f8f7-69v5-w4vx
-
-Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
-(cherry picked from commit 6b7705d5b29e226a24902a8dcc488836faaee33c)
-Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
----
- pkg/plugins/client.go | 14 ++++++++++++--
- 1 file changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/pkg/plugins/client.go b/pkg/plugins/client.go
-index 752fecd0ae..e683eb777d 100644
---- a/pkg/plugins/client.go
-+++ b/pkg/plugins/client.go
-@@ -18,6 +18,12 @@ import (
- 
- const (
- 	defaultTimeOut = 30
-+
-+	// dummyHost is a hostname used for local communication.
-+	//
-+	// For local communications (npipe://, unix://), the hostname is not used,
-+	// but we need valid and meaningful hostname.
-+	dummyHost = "plugin.moby.localhost"
- )
- 
- func newTransport(addr string, tlsConfig *tlsconfig.Options) (transport.Transport, error) {
-@@ -44,8 +50,12 @@ func newTransport(addr string, tlsConfig *tlsconfig.Options) (transport.Transpor
- 		return nil, err
- 	}
- 	scheme := httpScheme(u)
--
--	return transport.NewHTTPTransport(tr, scheme, socket), nil
-+	hostName := u.Host
-+	if hostName == "" || u.Scheme == "unix" || u.Scheme == "npipe" {
-+		// Override host header for non-tcp connections.
-+		hostName = dummyHost
-+	}
-+	return transport.NewHTTPTransport(tr, scheme, hostName), nil
- }
- 
- // NewClient creates a new plugin client (http).
--- 
-2.41.0
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
