Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A4BCD98F0
	for <buildroot@archiver.kernel.org>; Sun, 21 Jun 2026 16:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF3264F16E;
	Sun, 21 Jun 2026 16:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NYEx7Zt-9I-Y; Sun, 21 Jun 2026 16:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50F664EE5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782060406;
	bh=M8bqajUi6SZkNIYI6Rq47xBHCCM/rDfLxOKC+0fsaPg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NM6mm2Sywvm98iLyjDObD9TaIja7M6lPWd8ng4sjqQKfK57zRjjOzFy7lQ/tFf59F
	 RzE8BXLNhwWde8E6GMOTjpK6oWznRk51WDUHlB9SR/ahwfgWWZ+Gf3O2fNk4RjBEYW
	 d/wSuNyF99RQ57W1d8RL9Cj2l4npbOoKxNTV8Y3eBiCtzFvE/vq5Faigd50VLd8BFr
	 mozreinpTv0bpQ0rRdTpZf2dcsAjV6VMUhCRZvx0HOYibGHNksTdFufV7vuDSDEUdL
	 DWmn+QUofvjmAYP8w4ueFlPVLOizqkK175uGz2bhq1Q9c72tCNppjg/47aSdtiuPy2
	 Y1XPM9FSxKDsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50F664EE5A;
	Sun, 21 Jun 2026 16:46:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B6FE24D
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 16:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6057865C1
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 16:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5tUmbb229B0B for <buildroot@buildroot.org>;
 Sun, 21 Jun 2026 16:46:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1FE32865C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FE32865C0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1FE32865C0
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 16:46:44 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-45ef779c1c2so2795762f8f.1
 for <buildroot@buildroot.org>; Sun, 21 Jun 2026 09:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782060402; x=1782665202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Zly6ZMfBFwg/p/IiZCLYjB4XRrbcbEZ7xIi+fUQqszc=;
 b=jUcFT9qfJmrNTMY21oQFazdOprTS5KpIyfK/VQsDUi4oJy6rCcUIozp/03AYrJ8smj
 ombgDs5t3z0ifBBbMBrE25JA+mRQKYBOEkmsOs0sUFDJSyCoIiOC2rRBrXLPKvny+FdN
 f4//LLWSQk3RDvz7a2JKHNg11+UuyvdLEuhS5RQHJFz2lD5AmhomQ0fnQmN5YSvoIBYY
 KpL43m+Jy7cqqfeOYpWvTqMJDU6Smz6MxivxwChB0mv2hpbMCsQ/kFYA+F5G4rnECXav
 5txBwHxyZ49jbeeMHrzgG7lGLif9GN1+DsTM7qy32KxEAlxhIWJmo0k39q/GLVtRvMMK
 t/Ww==
X-Gm-Message-State: AOJu0Yz9MfXky5zrW5bPU53S3a2lhw1H2fTwEn5gMrMMWtvM7i3g2uyU
 VzEpTYYE3yUFjnLtO7mk5jMhlp7VsjKi6QPUTpPzedjYI3G+OX+iubkP9pJ+6uXspoVh3V6tNIR
 Op7ja
X-Gm-Gg: AfdE7ckWuMLef+gop/ikeeoj7vMzPVMhFh7bkKV47tma9crfqxr3m41u21M5qsbDvhR
 16+1i4zjx/9FLln2B0UMBQSZILjqxijDU2pVOo2Rk+3ikFXvfPbtiS4mrQY60GaaNd5EzkrOzBd
 lTV7IcxOvC9ouoPFrgRMpUxuKGFcMzx/vio2GCORZgehmibnY4vKbk7MNqu2xzbmEFRsPU3AWgt
 WBVspHy683wO5g2LbrBFmsJv5YL6UWqQpImbUY9ri4qS6hqkFZwqRoRpbG+S5/T1c3FZKMFQqL0
 1tVY+59PzKFfQiUqgeMkxqhytAKeu/at9pFLn/XA1bXCew/9XjWTaa9BWg/BzXmnOtIEKhrc+/1
 EKQsiX46/4lBT3rPvPKP8LcCor6NIqTqRmUeDz0wo3x9qSPaYagK05ows6JaxKB0z0IAyKqc3xi
 OAddvvE9bsj5lefucj3ONXBQuTzjMtJz+l5HqwnR0wN1ne8hV5ei9HckUNhNTRY0Ol/slYJfHgs
 3bmuUcbZp+va4c=
X-Received: by 2002:a5d:5846:0:b0:461:a169:f965 with SMTP id
 ffacd0b85a97d-465091bc7b6mr22124470f8f.34.1782060401995; 
 Sun, 21 Jun 2026 09:46:41 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4666678828dsm18051329f8f.19.2026.06.21.09.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jun 2026 09:46:41 -0700 (PDT)
To: buildroot@buildroot.org
Cc: ju.o@free.fr, dowan.gullient@smile.fr, Romain Naour <romain.naour@smile.fr>
Date: Sun, 21 Jun 2026 18:46:33 +0200
Message-ID: <20260621164634.2423931-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260621164634.2423931-1-romain.naour@smile.fr>
References: <20260621164634.2423931-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782060402; x=1782665202; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zly6ZMfBFwg/p/IiZCLYjB4XRrbcbEZ7xIi+fUQqszc=;
 b=lJF4PH5hHrh6hMMGuBTHKA9pPMMPv3cKLL8DcdL+dTXWXiSzyXlg+J3f89/hG3Lguz
 MOCCWza6OuNU55BB2Iol57sxkGk43N0TXKVu58+j3lEgtO77nCHudNr0jzYgCeZOUw5a
 WXF+NSd/djfDDLWbh5FI9OLGlEvKKZK/fN9Ew=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=lJF4PH5h
Subject: [Buildroot] [PATCH 2/3] support/testing: TestIptables: check for
 netfilter legacy tables enabled
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

TestIptables expect netfilter legacy tables enabled in the kernel.

Make sure we use iptables-legacy:

  iptables --version
  iptables v1.8.11 (legacy)

The test would fail if nftables compat (iptables-nft) is enabled.

  iptables --version
  iptables v1.8.11 (nf_tables)

Add the following configuration fragment to enable iptables-nft:

  BR2_PACKAGE_IPTABLES_NFTABLES=y
  BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT=y

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
TestIptables should be extended to test with iptables-nft by adding
a new TestIptablesNftables test case.
---
 support/testing/tests/package/test_iptables.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
index 72f2dd71a4..eeb4ccb5dd 100644
--- a/support/testing/tests/package/test_iptables.py
+++ b/support/testing/tests/package/test_iptables.py
@@ -38,7 +38,10 @@ class TestIptables(infra.basetest.BRTest):
         self.emulator.login()
 
         # We check the program can execute.
-        self.assertRunOk("iptables --version")
+        cmd = "iptables --version"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertTrue(output[0].endswith("(legacy)"))
 
         # We delete all rules in all chains. We also set default
         # policies to ACCEPT for INPUT and OUTPUT chains. This should
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
