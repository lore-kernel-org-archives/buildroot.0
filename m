Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA52CC46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 17:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56FD6405B5;
	Sat, 14 Jan 2023 17:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56FD6405B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v_N3c5Keh8mB; Sat, 14 Jan 2023 17:01:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A1BE40643;
	Sat, 14 Jan 2023 17:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A1BE40643
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E89BA1BF380
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 17:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFF72415DF
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 17:01:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFF72415DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OkA7yge3wTB0 for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 17:01:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73835415E3
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73835415E3
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 17:01:36 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id b5so2559595wrn.0
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 09:01:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ylpvv1W5FU5RG7u9wrR1simpV6/sLKqnL/O54yb8cmk=;
 b=k1v4fyWlcuBVHgIn6fSiW/qEYGRMa8gfXShKvoktdoew6TDHwYCKtTw9X80kN/C/mv
 E5eTKvoMdA54DCvQJrWjRh7uV2lk/fTfO8u9j/GbYdPeb1mChJp4jT9Dqk9ZyfjjipGP
 SzmrIUkVb3PyNxB3aQHrn6zcgxJiygoQjzyV6d44HLi7qekGOn+j8UnbocnEVNeJGCdc
 HukuH6uiDCaf90C6i7QHkgXS7tpbtwCKgbLgLHwCSsot/v77AAcTr63ePZHZNDtEUyIz
 afyDfdyORM0zOizCW1q1CbHnRCLVUybZCQ5OR7fi31qcNMcPtd9q0FRVZJLJPBzqG1+L
 QwIQ==
X-Gm-Message-State: AFqh2kobM++GcSUQ8hCQeQ/OMjWrm9wDMlFeDiad16Bn/xjnuStMfgZr
 kldTMypJGD4Bz+aqXPRYQN9rF02KK9U=
X-Google-Smtp-Source: AMrXdXsgnpi97RSUj2xrvOnxHt/HGB0LE3PlQf96W20LM3wBYjU7EpGj1XvoRGbaZd4yYWyI2RHYaw==
X-Received: by 2002:adf:f4c1:0:b0:27e:7f5:6634 with SMTP id
 h1-20020adff4c1000000b0027e07f56634mr44342254wrp.60.1673715694384; 
 Sat, 14 Jan 2023 09:01:34 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bq14-20020a5d5a0e000000b002bdf2739cabsm1725691wrb.1.2023.01.14.09.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 09:01:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 18:01:26 +0100
Message-Id: <20230114170126.1085188-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114170126.1085188-1-fontaine.fabrice@gmail.com>
References: <20230114170126.1085188-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ylpvv1W5FU5RG7u9wrR1simpV6/sLKqnL/O54yb8cmk=;
 b=h3Z5QDfLQgGqwF9zS3YGi5Ba28CyF9gu0PFjcamVRkZlrymogZXXtwJDsavaJlX/wr
 LwwMwXLhQJbWIcVqXlBUrEwRnSUFtgDriCPPCp7du0Tim1kfVki98M8S8+uHmoLxUEr/
 V+jBTPRcbX1Y/v1MYAr+SXQjYcZeLWsla8LMFihkL/iaMXRvu0z9YiXuuUmUCZD7/1+h
 cXE7UVAHwFFyd94+JMmyZRhXqr0ndPmUB9BdRr+gAiItf/3DF9dsNR8p1NxiIRI7KqVu
 qgjq8fz1iHu3QbDtRIWYcRs42Gx4MnrfbUJs5QXnGc7VuIB+qxh3x+xRrcwppDnLAsma
 mWBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=h3Z5QDfL
Subject: [Buildroot] [PATCH 2/2] package/janus-gateway: fix libcurl build
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
Cc: Gregory Dymarek <gregd72002@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following libcurl build failure raised since bump to version
1.1.1 in commit 01518e5660366be41e6a8e0a0f2b487d7cdf48a2:

In file included from /home/autobuild/autobuild/instance-11/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/curl/curl.h:3195,
                 from turnrest.c:21:
turnrest.c: In function 'janus_turnrest_request':
turnrest.c:168:2: error: void value not ignored as it ought to be
  168 |  curl_easy_setopt(curl, api_http_get ? CURLOPT_HTTPGET : CURLOPT_POST, 1);
      |  ^

Fixes:
 - http://autobuild.buildroot.org/results/11bb0079f5a7d06d3494a61b411f0af2e8c4d342

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...se-parentheses-to-ensure-compilation.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/janus-gateway/0003-Use-parentheses-to-ensure-compilation.patch

diff --git a/package/janus-gateway/0003-Use-parentheses-to-ensure-compilation.patch b/package/janus-gateway/0003-Use-parentheses-to-ensure-compilation.patch
new file mode 100644
index 0000000000..f91c13d1f6
--- /dev/null
+++ b/package/janus-gateway/0003-Use-parentheses-to-ensure-compilation.patch
@@ -0,0 +1,27 @@
+From 51431c36cd5f2997c0f7723909195b9883ae0486 Mon Sep 17 00:00:00 2001
+From: Benson Muite <bkmgit@users.noreply.github.com>
+Date: Wed, 4 Jan 2023 13:33:36 +0300
+Subject: [PATCH] Use parentheses to ensure compilation (#3138)
+
+Compiler fails with latest Curl release. Use parenthesis to ensure compiler evaluates expression correctly.
+
+[Retrieved from:
+https://github.com/meetecho/janus-gateway/commit/51431c36cd5f2997c0f7723909195b9883ae0486]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/turnrest.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/turnrest.c b/src/turnrest.c
+index b8560d22f2..42e6114de8 100644
+--- a/src/turnrest.c
++++ b/src/turnrest.c
+@@ -165,7 +165,7 @@ janus_turnrest_response *janus_turnrest_request(const char *user) {
+ 	JANUS_LOG(LOG_VERB, "Sending request: %s\n", request_uri);
+ 	janus_mutex_unlock(&api_mutex);
+ 	curl_easy_setopt(curl, CURLOPT_URL, request_uri);
+-	curl_easy_setopt(curl, api_http_get ? CURLOPT_HTTPGET : CURLOPT_POST, 1);
++	curl_easy_setopt(curl, (api_http_get ? CURLOPT_HTTPGET : CURLOPT_POST), 1);
+ 	if(!api_http_get) {
+ 		/* FIXME Some servers don't like a POST with no data */
+ 		curl_easy_setopt(curl, CURLOPT_POSTFIELDS, query_string);
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
