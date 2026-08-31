Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E34DC61DFD
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 20:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A775080ABB;
	Mon, 31 Aug 2026 20:57:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UyCkYHU9U_Bn; Mon, 31 Aug 2026 20:57:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788209834;
	bh=HvXvzn2y8YLszADRJYcONkTt9aTBQ0TZ0lVUPfxQLqY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i3SjpZX2Bpr+OnHt8GPzGD+0gicPhNBndk98SwhZVYN6gEMXh0b9wIfm/JvmRnjJm
	 60lq+zFc3O3b5MvsyCb1wPRQrjY587G+B4ztYAVTIZ4zLjrByJ7NE7MBgxoTLmNDh9
	 wqSMjzDqMR+8xPrAZvJxLgbJZL6k1JVdJkuuujGNmc4t+EvYxmxjQmtKrWSZIFDkJm
	 eoOW9Bnv8bnL09lbfkLMe5lnIUccnADHKEYBVK6qT/YVvQAHioOQeyKY+yyMm5nCfV
	 lthKwCUIXxydH+Qp4MJ2YujhMYPieo2BigaSW48cgGsftBqCpJoq11OYyQDrwzP506
	 FK5e0SMYlTcww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE09980AAA;
	Mon, 31 Aug 2026 20:57:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 114C4265
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 20:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBE0280AAA
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 20:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uc03Mnck9qFx for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 20:57:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BFF780AA9
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 20:57:10 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-49b8eeb3ff2so29504335e9.2
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 13:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788209829; x=1788814629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Cl4zvY/iKTLA9X8dVUZ/zRQTxR64R69cD0I/ctubX1o=;
 b=jL4lLUq3wIe28PwRbEE2C5T6bwzgVeLwYV6nIKt+TmASQCqlp6wLl7Ar9ovXtPv7IH
 qySkhAO8SpqrG/Jk3PUIEzC5FxkivStwYobtstJtA+EA0oPCnOxen1ikA2MOZbLXefDS
 huVNpxCM5sKlqe1d/KUGm1HnH+cyPKhY/c+Scd2p67HYX8FSglT1JlnGzZwWiSz5SciY
 zTwmBD1JxLpx+FAxvXVs3DEtOx+kys7hqhYwLHIILw49EKGOTS9wuK6JwQdoHafS2/Ay
 akWbGItkNCZ2T/rWJUvB+PRj2qVrBCEtSNmhc1H7SqCiV7dReRVIkz7THR2Ws5apZaDE
 oL0Q==
X-Gm-Message-State: AFuF++mfg8JFwH0hHRNYjyM9AmEoOK8SHa+XBhYk44BbpwmIjKqCIpZb
 eBE7PxslRHUKA6b0ucxm3UJ7BhMQ+UsdXkBKqbs/f2JX8ve4qNtVXqIcKY8WhR1hybVoR8xPyAB
 z3Tudwds=
X-Gm-Gg: AR+sD13UaQwWnOHdn1Hx36S58rThzmYN6BMvZF/n0nJRWfDkn1+SNArSFZRM0D0kWBx
 HtbmLrzU/neC5O973aPRQqmROFCjcJ4cxUfPuDazarny3IvfoM7/X3MmOUKcAU6mSaqHLunvFBf
 DfKRKHW6B04oGXj2zQF3yGcRDGqzx8yd6TH64LzT0yXnVW1fHhWRRuPWYG2JpN0fUSnuKpaxD4l
 S9gQGWN4HXB2/l+Kh8zY2Fc/C44YISHTLa9CxCoGyZyvg+Jv7qKDlJSBlYxthsrXDj7OxNDLJNf
 hSbiAbGz8mJx1vnkrCJLXNb2uc92R5FnSAxMCVLdWN9ULVi3BRks8ab+tF9J6yB3R7oBtWS8HGU
 3hlTl4LVFn4UG1eMKt8eKw9t23sVc1gaJYg4hgAya199qgY8RTPUbx67FUK8B7LqK7d9SGv8Srf
 oRFuqObVjaxOPpYzjI2Tgs7TjmVcVJ0RegnFMRTTi6dOhDUet8w9YrRixg7dnwHI3DobGBUftVX
 Y8RGy/6nrmKOvEXNIpf1FxUqws+4ey+SM/LhjAIktWWQo9jTgF0B8j4jHvJQ1o=
X-Received: by 2002:a05:600c:5391:b0:49c:cedf:f870 with SMTP id
 5b1f17b1804b1-49cdc555577mr64136005e9.16.1788209828953; 
 Mon, 31 Aug 2026 13:57:08 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ccd1e19desm274116265e9.1.2026.08.31.13.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 13:57:08 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Mon, 31 Aug 2026 22:57:03 +0200
Message-ID: <20260831205703.3909457-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831205703.3909457-1-romain.naour@smile.fr>
References: <20260831205703.3909457-1-romain.naour@smile.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] support/testing: TestMdnsd: improve test
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The mdnsd runtime test can randomly fail on slow runners.

It's hard to reproduce locally (only one failure after a few attempts)
but we can reproduce it easily by removing the while loop entirely.

It turns out that mdnsd is started by S50mdnsd before the
emulator.login() change the system date:

  [BRTEST# date -s @1788032864
  Sat Aug 29 19:47:44 UTC 2026

Since the minimal rootfs.cpio generated	for TestMdnsd doesn't have any
ntp client installed, it start with "January 1, 1970".

The date change may cause some issue to the mdnsd daemon which blocks
any response from mquery command.

When the problem occurs, "mquery -T _http._tcp" reply is empty:

  # mquery -T _http._tcp
  Querying _http._tcp.local. for PTR (12) ... press Ctrl-C to stop

To workaround the issue, restart mdnsd manually.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/16185948555

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_mdnsd.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/testing/tests/package/test_mdnsd.py b/support/testing/tests/package/test_mdnsd.py
index 214eea7dd9..ebb8971e38 100644
--- a/support/testing/tests/package/test_mdnsd.py
+++ b/support/testing/tests/package/test_mdnsd.py
@@ -23,6 +23,10 @@ class TestMdnsd(infra.basetest.BRTest):
                                     "-net", "user"])
         self.emulator.login()
 
+        # Restart mdnsd after setting the date in emulator.login() setup.
+        cmd = "/etc/init.d/S50mdnsd restart"
+        self.assertRunOk(cmd, timeout=30)
+
         # We check the program can execute.
         self.assertRunOk("mdnsd -v")
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
