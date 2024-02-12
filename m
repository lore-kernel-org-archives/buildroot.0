Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E2AC4829E
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 21:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E13CE4069D;
	Mon, 12 Feb 2024 21:57:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JPIqDyxl6sTo; Mon, 12 Feb 2024 21:57:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6B5E4075D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6B5E4075D;
	Mon, 12 Feb 2024 21:57:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34C6F1BF853
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20A2D80DF9
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:57:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EstH1gpWpgWq for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 21:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35025802CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35025802CA
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 21:57:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 208B7878D7; Mon, 12 Feb 2024 21:57:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 22:56:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed804a9f0c09a151f32be36f63ae4c924b9dc360
X-Git-Newrev: 431c02174078e359b6379b8021e6aeb06b2dbb9d
X-Patchwork-Hint: ignore
Message-Id: <20240212215749.208B7878D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-http: fix CVE-2023-4540
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=431c02174078e359b6379b8021e6aeb06b2dbb9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

see https://nvd.nist.gov/vuln/detail/CVE-2023-4540
  & https://cert.pl/en/posts/2023/09/CVE-2023-4540

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...eam-handle-EOF-when-body_read_type-length.patch | 71 ++++++++++++++++++++++
 package/lua-http/lua-http.mk                       |  3 +
 2 files changed, 74 insertions(+)

diff --git a/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch b/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch
new file mode 100644
index 0000000000..fdbf5243f5
--- /dev/null
+++ b/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch
@@ -0,0 +1,71 @@
+From ddab2835c583d45dec62680ca8d3cbde55e0bae6 Mon Sep 17 00:00:00 2001
+From: daurnimator <quae@daurnimator.com>
+Date: Tue, 22 Aug 2023 23:30:20 +1000
+Subject: [PATCH] http/h1_stream: handle EOF when `body_read_type==length`
+
+If a client closes the connection before sending the expected number of bytes
+then return `EPIPE`.
+This fixes a potential infinite draining loop when trying to trying to
+`:shutdown()` a stream.
+
+Upstream: https://github.com/daurnimator/lua-http/commit/ddab2835c583d45dec62680ca8d3cbde55e0bae6
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ http/h1_stream.lua      |  2 ++
+ spec/h1_stream_spec.lua | 27 +++++++++++++++++++++++++++
+ 2 files changed, 29 insertions(+)
+
+diff --git a/lua-http-0.4/http/h1_stream.lua b/lua-http-0.4/http/h1_stream.lua
+index b2469a1..b0ca821 100644
+--- a/lua-http-0.4/http/h1_stream.lua
++++ b/lua-http-0.4/http/h1_stream.lua
+@@ -861,6 +861,8 @@ function stream_methods:read_next_chunk(timeout)
+ 			if chunk ~= nil then
+ 				self.body_read_left = length_n - #chunk
+ 				end_stream = (self.body_read_left == 0)
++			elseif err == nil then
++				return nil, ce.strerror(ce.EPIPE), ce.EPIPE
+ 			end
+ 		elseif length_n == 0 then
+ 			chunk = ""
+diff --git a/lua-http-0.4/spec/h1_stream_spec.lua b/lua-http-0.4/spec/h1_stream_spec.lua
+index f9cfea9..1303f94 100644
+--- a/lua-http-0.4/spec/h1_stream_spec.lua
++++ b/lua-http-0.4/spec/h1_stream_spec.lua
+@@ -295,6 +295,33 @@ describe("http1 stream", function()
+ 		server:close()
+ 		client:close()
+ 	end)
++	it("Doesn't hang when a content-length delimited stream is closed", function()
++		local server, client = new_pair(1.1)
++		local cq = cqueues.new()
++		cq:wrap(function()
++			local stream = client:new_stream()
++			local headers = new_headers()
++			headers:append(":method", "GET")
++			headers:append(":scheme", "http")
++			headers:append(":authority", "myauthority")
++			headers:append(":path", "/a")
++			assert(stream:write_headers(headers, true))
++		end)
++		cq:wrap(function()
++			local stream = server:get_next_incoming_stream()
++			assert(stream:get_headers())
++			local res_headers = new_headers()
++			res_headers:append(":status", "200")
++			res_headers:append("content-length", "100")
++			assert(stream:write_headers(res_headers, false))
++			assert(stream:write_chunk("foo", false))
++			assert(stream:shutdown())
++		end)
++		assert_loop(cq, TEST_TIMEOUT)
++		assert.truthy(cq:empty())
++		server:close()
++		client:close()
++	end)
+ 	it("allows pipelining", function()
+ 		local server, client = new_pair(1.1)
+ 		local cq = cqueues.new()
+-- 
+2.40.1
+
diff --git a/package/lua-http/lua-http.mk b/package/lua-http/lua-http.mk
index df3e2c0059..34387c12e5 100644
--- a/package/lua-http/lua-http.mk
+++ b/package/lua-http/lua-http.mk
@@ -13,4 +13,7 @@ LUA_HTTP_LICENSE_FILES = $(LUA_HTTP_SUBDIR)/LICENSE.md
 LUA_HTTP_CPE_ID_VERSION = $(LUA_HTTP_VERSION_UPSTREAM)
 LUA_HTTP_CPE_ID_VENDOR = daurnimator
 
+# 0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch
+LUA_HTTP_IGNORE_CVES += CVE-2023-4540
+
 $(eval $(luarocks-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
