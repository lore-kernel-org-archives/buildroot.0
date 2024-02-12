Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA04C48297
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 17:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3DED402B0;
	Mon, 12 Feb 2024 17:26:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBrmrksP8Nwa; Mon, 12 Feb 2024 17:26:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF744402A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF744402A9;
	Mon, 12 Feb 2024 17:26:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABA651BF39C
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 17:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5F1C812E7
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 17:26:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xBqH9x1FMB3e for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 17:26:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6372D812A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6372D812A1
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6372D812A1
 for <buildroot@busybox.net>; Mon, 12 Feb 2024 17:26:24 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-410e676c6bbso7177905e9.1
 for <buildroot@busybox.net>; Mon, 12 Feb 2024 09:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707758782; x=1708363582;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H7SctcAmaYCen7uQwWz7PCF9nyYBcQI5/IdDyWhZuPA=;
 b=dyqjpLM2yT7ESqjOQdtjhJByS5wWOOwFiKwTQSnfPJGTTno7Spz5jmUgkILr762nsj
 8SZPg+8LiDFBfX+DSpSvY59IG1h1l6kcMkwAsAe0qvKZK3S0nMLItg8ZXcBhOlLZoJH8
 PX3BFZwB0A9ZbjiCmhbrlLYw1JIfwE6tPGq12xpa21NZ5YHOdfI3X5lYJCHL02gRN8bO
 7vmPw+853c33SYI7eQzGbu2jrTQfJYFu96DTiFYLH6CDMoHChapAYwE45BW24/RTPA0K
 5TsiG7eCahy3Wj/8+U0BwXZumiZQ4dfCgsMVWcpGTyt3X9bRWnFop8YAP/pfuMsj6jW8
 KA6A==
X-Gm-Message-State: AOJu0YxkImaF3cj+z/e0+995JnKbJf1pjIPj9PiVTw/abzz1ug8mf0B6
 CZdDnVEOUM6Sdrt9wM4Mgf78tJp4D2jI1i0XAPLoPCrCtKCifDULqfmeJOO6
X-Google-Smtp-Source: AGHT+IFjozvGj//7eKsAdgskHpMr0/TxyTNVvdm6OoNIUlCcsfUtsvGiiEQ84vex1mQQtaI/wJuKtg==
X-Received: by 2002:a05:600c:4ed0:b0:410:8240:38e with SMTP id
 g16-20020a05600c4ed000b004108240038emr5789840wmq.7.1707758782065; 
 Mon, 12 Feb 2024 09:26:22 -0800 (PST)
Received: from xubuntu-23.. ([37.66.33.127]) by smtp.gmail.com with ESMTPSA id
 a4-20020a05600c224400b00410ebcf8180sm2157392wmm.43.2024.02.12.09.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 09:26:21 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 12 Feb 2024 18:26:19 +0100
Message-Id: <20240212172619.13550-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707758782; x=1708363582; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=H7SctcAmaYCen7uQwWz7PCF9nyYBcQI5/IdDyWhZuPA=;
 b=S9R+LqMgZninyko34xG7RNRWp8YoHTlwmw5ljK0IdkK3P6P+W6kWdrZmvLPPiz0ywp
 aHZsb4taz7WOLLb9SjEIeszzoj0e76JAKAz5jWvb0cxZOsEZew+n78HLdWjf8e+BFS8b
 GljPSthfgCWqbuc1XBuuy+2lntZc+7C5bO8eUrE2uo/BGg4cxZTciHTfuGa7Be4dz1FP
 bwJb2nbLvMfsaoYmt+PiA0xlbwUEL6ZuiijYU9vR7YRd4B73tNpg0HNS/o81Bo4hI70u
 +8DwylXIE2OOYP2zlpPk3AptleY++y3Csjhl7C9TCJfNAUPpSjevdgTlAeapHEGhVKmz
 yLNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=S9R+LqMg
Subject: [Buildroot] [PATCH v2] package/lua-http: fix CVE-2023-4540
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

see https://nvd.nist.gov/vuln/detail/CVE-2023-4540
  & https://cert.pl/en/posts/2023/09/CVE-2023-4540

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...andle-EOF-when-body_read_type-length.patch | 71 +++++++++++++++++++
 package/lua-http/lua-http.mk                  |  3 +
 2 files changed, 74 insertions(+)
 create mode 100644 package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch

diff --git a/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch b/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch
new file mode 100644
index 000000000..fdbf5243f
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
index df3e2c005..34387c12e 100644
--- a/package/lua-http/lua-http.mk
+++ b/package/lua-http/lua-http.mk
@@ -13,4 +13,7 @@ LUA_HTTP_LICENSE_FILES = $(LUA_HTTP_SUBDIR)/LICENSE.md
 LUA_HTTP_CPE_ID_VERSION = $(LUA_HTTP_VERSION_UPSTREAM)
 LUA_HTTP_CPE_ID_VENDOR = daurnimator
 
+# 0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch
+LUA_HTTP_IGNORE_CVES += CVE-2023-4540
+
 $(eval $(luarocks-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
