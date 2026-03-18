Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E688A103E19D
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 21:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C35760D9C;
	Wed, 18 Mar 2026 21:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JzUA4Y0DfqeF; Wed, 18 Mar 2026 21:38:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DF5D60D9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773869898;
	bh=1t16wca1E/wcNc/tz3n7OczoM9wWJgp7iNE/kZBI7mc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=CEZfhUiorbd3utppHwTCv/NSy3vYRGnm1a6bSf25y+9zcaSVPI2YLCY/D1cXMu+9h
	 a/1ggyf6ilwwoac1xPxaFBrOy8F0T3b+798gHC/3kiczqAv6vg+hM8F/O2HnQJthYM
	 n9FUFsEl6K5G0JTEZ/6cBTk8W/+FSFcTJzn3gcK55PzEM3fx7k70legX63vcs0e8iy
	 Nv/OA/0qUEBGNMuVnRWBO+zg8Bt9r4l8wyJN/Z9cjzmc2Qgy7U2eSwMtteqk3mpxJ+
	 +tfiSiU5YDoE2w0DKukoK90jHWUR5wSBpaRRg8R7HtvqQoEw6+bk4EWQwN76jQzuz8
	 Ifzy/HbSi7QnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DF5D60D9D;
	Wed, 18 Mar 2026 21:38:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E56D1AD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 21:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FBD960D9D
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 21:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HJP0302UEJzF for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 21:38:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2BE3C60D9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BE3C60D9C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2BE3C60D9C
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 21:38:15 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id BA6FB19F574;
 Wed, 18 Mar 2026 22:38:12 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Wed, 18 Mar 2026 22:38:05 +0100
Message-ID: <20260318213805.640458-1-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773869894;
 bh=oC56QfX8IXSfrCfldKg/EUoo5NxR0p+SG2kiASY6IDA=;
 h=From:To:Cc:Subject:Date:From;
 b=bWWyT5t9HN2YoTzWXOmbt9ZPiKpYVhAg0HE/Kk0OEgbinNI1sz9ZAbHX9vaL9mGgF
 niAVw9BLLEytkaGENCug8lEM0vGb0YR7D7gYOcQ1Se1DhhaGIP5kwJwvqwCwWaQsbp
 ciEOl8fJH9y1EOD+8bK5XOsYy68Yti1KUlqkF7tT2x0quU+NK/7ZfLiL1HkELv3Y3C
 4dsjbtjsoDfHD+6Yk7fyprX6A9S+Sn6SERFxcrEepinnONYvJD35AMkJdzXO2JHwQe
 VHb9WEcd0TpC1Ag/SaQo0QiVv2f9k3WZwUlPiPc89AVvDRHwu0Fg3wKQ/b6d7rs2QZ
 JIsqECWNS/fHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bWWyT5t9
Subject: [Buildroot] [PATCH 1/1] support/testing: test_aichat: improve test
 reliability
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since llama.cpp update in Buildroot commit [1], the test_aichat can
fail for several reasons:

The loop checking for the llama-server availability can fail if curl
succeed, but the returned json data is not formatted as expected.
This can happen if the server is ready but the model is not completely
loaded. In that case, the server returns:

    {"error":{"message":"Loading model","type":"unavailable_error","code":503}}

This commit ignore Python KeyError exceptions while doing the
server test, to avoid failing if this message is received.

Also, this new llama-server version introduced a prompt caching, which
uses too much memory. This commit completely disable this prompt
caching by adding "--cache-ram 0" in the llama-server options.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/05c36d5d875713521f99b7bad48be316dcde2510

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_aichat.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/package/test_aichat.py b/support/testing/tests/package/test_aichat.py
index 5fc554bbb5..50c07f87dc 100644
--- a/support/testing/tests/package/test_aichat.py
+++ b/support/testing/tests/package/test_aichat.py
@@ -70,6 +70,8 @@ class TestAiChat(infra.basetest.BRTest):
         llama_opts = "--log-file /tmp/llama-server.log"
         # We set a fixed seed, to reduce variability of the test
         llama_opts += " --seed 123456789"
+        # We disable prompt caching to reduce RAM usage
+        llama_opts += " --cache-ram 0"
         llama_opts += f" --hf-repo {hf_model}"
 
         # We start a llama-server in background, which will expose an
@@ -91,9 +93,12 @@ class TestAiChat(infra.basetest.BRTest):
             if ret == 0:
                 models_json = "".join(out)
                 models = json.loads(models_json)
-                model_name = models['models'][0]['name']
-                if model_name == hf_model:
-                    break
+                try:
+                    model_name = models['models'][0]['name']
+                    if model_name == hf_model:
+                        break
+                except KeyError:
+                    pass
         else:
             self.fail("Timeout while waiting for llama-server.")
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
