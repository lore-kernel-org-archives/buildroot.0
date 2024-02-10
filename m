Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D093C48260
	for <buildroot@archiver.kernel.org>; Sat, 10 Feb 2024 08:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87D1860854;
	Sat, 10 Feb 2024 08:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Eac6raNV9_Fb; Sat, 10 Feb 2024 08:28:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65DE860887
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65DE860887;
	Sat, 10 Feb 2024 08:28:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1765C1BF3B8
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 08:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 11AA584641
 for <buildroot@lists.busybox.net>; Sat, 10 Feb 2024 08:28:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0occMCMXOHQd for <buildroot@lists.busybox.net>;
 Sat, 10 Feb 2024 08:28:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A686E8463A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A686E8463A
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A686E8463A
 for <buildroot@busybox.net>; Sat, 10 Feb 2024 08:28:03 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41099cdb526so808545e9.3
 for <buildroot@busybox.net>; Sat, 10 Feb 2024 00:28:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707553681; x=1708158481;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TdzK/+lMFI99o8psLTSAuZJjUjiDP5Z+97USWW766MU=;
 b=IwPxkPz0Bps3CtlqnSQyjpj/PisVkmtiiEGPGZQPGM5dv0CXRkhA5vsAb6a/4yDh74
 iXEoGeLylRMYo/osvLEECWX29Thvh1a59y2Y/peseXwzNWxzRsK8sPVM8NOvzV+RCK7W
 pL060xKJbb5ZZuIosjkgZKhpn4yrBnz8ppbeQ4dQ2Lh5LcRMx9Rl3riNevhPRasOAD/7
 qr4JiB9cZww1v7GvPdJpNYgCMt8A3i629WQumcs1RD9jH2v0ACavK0GCeCyPNllJekPr
 CVp1m+CM86/CzfRtHTzQXHqJNqzeTceEY+Cxa8/XMciek/B47ixHUFIkkbVz86yu4Vld
 5ZgQ==
X-Gm-Message-State: AOJu0YxAzys+9IdSI/yIb7vX9UDKwhVnhMRSKAca6qg57blMxzgLrPpF
 f9bP2pKgB5NnNFCnmVlUy+ScizEQI+B2XmuaOP7NpuolSVuXSMdodmfgOsyS00A=
X-Google-Smtp-Source: AGHT+IGUmZu/vlvsBte0KuBKnacJRWWeq7yq+Fttrg6QZY0sNqFC4nHWqVZh4+SF1H7i50GwQdmK+Q==
X-Received: by 2002:adf:fc8b:0:b0:33b:607a:ba29 with SMTP id
 g11-20020adffc8b000000b0033b607aba29mr877923wrr.53.1707553681157; 
 Sat, 10 Feb 2024 00:28:01 -0800 (PST)
Received: from xubuntu-23.. ([37.66.33.127]) by smtp.gmail.com with ESMTPSA id
 n16-20020a5d67d0000000b0033af26545c8sm1245330wrw.50.2024.02.10.00.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Feb 2024 00:28:00 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 10 Feb 2024 09:27:51 +0100
Message-Id: <20240210082751.12920-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707553681; x=1708158481; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TdzK/+lMFI99o8psLTSAuZJjUjiDP5Z+97USWW766MU=;
 b=EItF9C8le/d1/IpPDmIJhcRQ7ifQ86NcA5iVily6hJjshiM0P9r5njqUJpYBsB2dzl
 lzV+qLMvR6FC8OTgzVIXicgMKLsmjmhNbOVdz+ScGDsj3UzJaK+YdQHqeTPZ6los0EaS
 oTkpPJl9k5379HCekAJGBmCRUjLMlpRwZ61/24DzgWm1CzrSGiJ6sVfyR3nZW0GVJsAX
 tT9YWQUNNF92+o6l40aolOnn4UQw2vadrb08HXSP2y2P2TUK2hrCjR01XkJ8lvauZu7P
 wXpUSMqZjE9QsJfuiIWtuOBr/jVacFLm9axFATkDVlbAu2Kw/M2YW5gWKi0xVPvXcOeK
 d9vA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EItF9C8l
Subject: [Buildroot] [PATCH] package/lua-http: fix CVE-2023-4540
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
 ...andle-EOF-when-body_read_type-length.patch | 68 +++++++++++++++++++
 package/lua-http/lua-http.mk                  |  3 +
 2 files changed, 71 insertions(+)
 create mode 100644 package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch

diff --git a/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch b/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch
new file mode 100644
index 000000000..e8f88f1ae
--- /dev/null
+++ b/package/lua-http/0001-http-h1_stream-handle-EOF-when-body_read_type-length.patch
@@ -0,0 +1,68 @@
+From ddab2835c583d45dec62680ca8d3cbde55e0bae6 Mon Sep 17 00:00:00 2001
+From: daurnimator <quae@daurnimator.com>
+Date: Tue, 22 Aug 2023 23:30:20 +1000
+Subject: [PATCH] http/h1_stream: handle EOF when `body_read_type==length`
+
+If a client closes the connection before sending the expected number of bytes
+then return `EPIPE`.
+This fixes a potential infinite draining loop when trying to trying to
+`:shutdown()` a stream.
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
