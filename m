Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FD7CA0FF2
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 21:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15703838AF;
	Sun, 31 Aug 2025 21:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YoanYLgoYiU7; Sun, 31 Aug 2025 21:38:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E2BF838B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E2BF838B2;
	Sun, 31 Aug 2025 21:38:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 90CE910E
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 21:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82B1640C95
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 21:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gT33zCotzKd4 for <buildroot@buildroot.org>;
 Sun, 31 Aug 2025 21:38:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6598D41117
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6598D41117
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6598D41117
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 21:38:56 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45b883aa3c9so5599205e9.2
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 14:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756676334; x=1757281134;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nu9wb9wW87C1Ki8Ufwf//jqABuu4o2JyJLaIN80N66w=;
 b=KKnA2Ec6IzRukASBYQBZalsrYQ4yYhkihMLkwvAVLt+XcLrgA6Z4VmoFw1xIwEM71n
 ZY+vNTzmlRWBsBSPYG4E+2jnAbYsmrO4dD49XTad/xHD/rJ/DF8a03A60V80p2j5+IoV
 DJb8YPgzrmEoNYq84Xqb1o2Ce+axxKjPdkMwrJwLCbRv8SSq2KPtYnztkuPqV1HTo4Bc
 Sdt9EBxFYQIebIfsVWmLqQLxQ3PZTBET7D0QJQTuWY2JOEN1yFqgGeu8iIrpey9QCRf7
 p1xoMjGx8G81S4JGvcOzA9Z9f67UvNmsw+AjXafIIpWkL0WeLSEeS9+LmlgMNMWlYz0x
 1acg==
X-Gm-Message-State: AOJu0YzOYFMaGel3l8KwpVVctDgGh9Boza7M/jJkOJUfi++bGuOTxd1V
 /LCaKoebYfyAP9XUOFUypymZySALe6abYeQ55eKDHW4d2zH7lS+DVtL+RKwEAL42XX829O3B1mk
 3NHfT
X-Gm-Gg: ASbGncvkr2dlgSaGh5+Gt7XibR5zzGNVRD92QAeBKm1aAxRhA3wXGadhMcan8zeF54h
 nUCNe8DyUe0umFdB1TSeym+eFGUimlOo4LyIlxjNppwys5rpbnfy8oJVtuhXg4V6AQUrzZThIfr
 CeLBUT7lvHUI3evMvwh9iDwJ3uhXVcgSpj9fBDNNxGxafkf0/ulkTyVfrUWoYlWSxnJ0c8MqUWs
 Iv/ni+L7L1SQCoqOQ8LnhQHFffuS097noqYbBNNAFIG+GN14JYE0OGsWovvZDjt/SB79wXI6QrO
 IgudMtO2/9p8oh4dFkgjU/+7+XAHkHH13iaqRwJTuHjo+NhMSs61ORVqOOBgAkqCVE3K3h2b/7S
 m9xR9kE3BlTWZzQQ4ry4VTmWecyHulFFVp1yjD7Yax9f/VA2ORi9TIH5Qp7nwjiukhhZ01HytYx
 UnHCelROmEhPF0PUdTNw2zlcv78SYy4Ck=
X-Google-Smtp-Source: AGHT+IEtxizirpc+zKPmkoOkCURS/lYCQs0fKLnTCWsUBgsYM+gFe2YG6/0ils7hTL/u4fvDACcy1Q==
X-Received: by 2002:a05:600c:474f:b0:45b:7951:92a2 with SMTP id
 5b1f17b1804b1-45b85571351mr42700325e9.18.1756676333999; 
 Sun, 31 Aug 2025 14:38:53 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d0c344f6e3sm11329032f8f.35.2025.08.31.14.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Aug 2025 14:38:53 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Sun, 31 Aug 2025 23:38:42 +0200
Message-ID: <20250831213843.1310171-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756676334; x=1757281134; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nu9wb9wW87C1Ki8Ufwf//jqABuu4o2JyJLaIN80N66w=;
 b=K25NlfhY5+jQSYnDANWF7P9zX0quaQ2OBEpFP/oRq2fcyOkA1/g48jk0qYL8hV96sb
 5OI0ksvyEpK7Fm3R26n3YWv7pmhTLQtmGe353Juzvn9b8TeZplnGZGKn8L5ThjIOOO2x
 QLsRiDoiSjHlAHqGuVMRdCqlTP+Kgd+ku56qI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=K25NlfhY
Subject: [Buildroot] [PATCH 1/2] support/testing: TestSWIPL: increase
 timeout value
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

The swipl runtime test is unreliable, depending on the execution speed
of its runner or local host.

Running on a build server, the last test resolve the sudoku in
30sec while the timeout is 10sec.

  # time swipl -g top -t halt /root/sudoku.pl
  Sudoku solution:
  [9, 8, 7, 6, 5, 4, 3, 2, 1].
  [2, 4, 6, 1, 7, 3, 9, 8, 5].
  [3, 5, 1, 9, 2, 8, 7, 4, 6].
  [1, 2, 8, 5, 3, 7, 6, 9, 4].
  [6, 3, 4, 8, 9, 2, 1, 5, 7].
  [7, 9, 5, 4, 6, 1, 8, 3, 2].
  [5, 1, 9, 2, 8, 6, 4, 7, 3].
  [4, 7, 2, 3, 1, 9, 5, 6, 8].
  [8, 6, 3, 7, 4, 5, 2, 1, 9].
  real	0m 28.53s
  user	0m 27.99s
  sys	0m 0.51s

Increase the timout to 120sec.

Note: On Gitlab-CI, every emulator timeout are increased by a factor 10
to avoid sporadic failures in elastic runners.

https://gitlab.com/buildroot.org/buildroot/-/blame/2025.08-rc3/support/misc/gitlab-ci.yml.in?ref_type=tags#L101

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_swipl.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_swipl.py b/support/testing/tests/package/test_swipl.py
index 0839101599..0f317bb617 100644
--- a/support/testing/tests/package/test_swipl.py
+++ b/support/testing/tests/package/test_swipl.py
@@ -43,4 +43,4 @@ class TestSWIPL(infra.basetest.BRTest):
 
         # Run a more complex logic program (solve a sudoku).
         cmd = "swipl -g top -t halt /root/sudoku.pl"
-        self.assertRunOk(cmd, timeout=10)
+        self.assertRunOk(cmd, timeout=120)
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
