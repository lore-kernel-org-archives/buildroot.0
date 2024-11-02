Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856F7E67805
	for <buildroot@archiver.kernel.org>; Sat,  2 Nov 2024 19:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CD4784175;
	Sat,  2 Nov 2024 19:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0eA63U98pJTv; Sat,  2 Nov 2024 19:17:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 811AC8416F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 811AC8416F;
	Sat,  2 Nov 2024 19:17:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 20A67112A
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 19:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3B5D416DD
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 19:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKDbV3VAvSv9 for <buildroot@buildroot.org>;
 Sat,  2 Nov 2024 19:17:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3866140995
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3866140995
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3866140995
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 19:17:15 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-37d49a7207cso1890091f8f.0
 for <buildroot@buildroot.org>; Sat, 02 Nov 2024 12:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730575034; x=1731179834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5xd7us0gkG39ghJ9k34uv6w35yUDT8bV/Q8cupmqqFk=;
 b=GcDGu62qwrCkiXvYTRIqTiqGf3DK2xsvkxhAFm/KRwgrfvqy6ApNJi7dcr0FkTHqdO
 t67CejcSmR+X90hLGYd+fAER1peVq/Fz4ghnqhrPiHhHI8YosdziVc5sPcG6sicry8EK
 1xpUOUWYVfxNjK5UIOp5afC6YOFvXx22WddAVo7ynbOFLV5a5xL7ItZju3vnKvSfQAeW
 MONVfeLrYGVOw9n/GStAJlRrsV11dTwxd2E0BY2P++6pjI9KDqKG0B/e+itQlEoiCYcn
 kz18QAFfOJNCYS/vdFTjJdgJITkz2nbWCBRqnr02v+CsfhuQzsv8uzf2ll00tkppkXRn
 rLaQ==
X-Gm-Message-State: AOJu0YxLRF+upGxIDq6neGtNAfWF50lxvPiqq9q+tsLJ9CKjSC0NOzOS
 4sD/h2h7f6xdrEc3crio8Vr6q9Dndqvw688+DrTNEH5W1aTnyQfquVUuXZ1BEzkey5HwjnzNAZC
 w
X-Google-Smtp-Source: AGHT+IFF7hyy8lUFShN4pyLxoXua7L4YFFtT8V8utoEw81dXQz47XdZmpymJnUJaIrxe2I28Foclsg==
X-Received: by 2002:a05:6000:2aa:b0:374:ca16:e09b with SMTP id
 ffacd0b85a97d-381c7a3a2bdmr6545072f8f.9.1730575033385; 
 Sat, 02 Nov 2024 12:17:13 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9ca747sm132546115e9.45.2024.11.02.12.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 12:17:12 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat,  2 Nov 2024 20:17:11 +0100
Message-ID: <20241102191711.677252-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730575034; x=1731179834; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5xd7us0gkG39ghJ9k34uv6w35yUDT8bV/Q8cupmqqFk=;
 b=CmaDOK1In6X3+fPBkPN+ZzT9C27RT3Vel0Al+Fi29QB+FX/o2y895MEaWdXqcbYjVb
 8ww7WJfyEm//hD+MJHN3P870B+aC9idRp39O0TMcfbjbhKWBvKb6mmAuq2fBMYonHfAp
 05onxQHeWjjqrphXTGjtby70AlxCM117VaRRk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=CmaDOK1I
Subject: [Buildroot] [PATCH] package/exfatprogs: fix TestExfatProgs
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

There is a regression in exfatlabel since exfatprogs 1.2.5.

exfatlabel tool error out when we try to set a new volume serial or
label.

  exfatlabel /dev/sda1 "new label"
  exfatlabel -i /dev/sda1 0x12345678

Error out only if too few argument is given, ignore additional
arguments.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992419

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...rogs-fix-argument-validation-check-2.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/exfatprogs/0001-exfatprogs-fix-argument-validation-check-2.patch

diff --git a/package/exfatprogs/0001-exfatprogs-fix-argument-validation-check-2.patch b/package/exfatprogs/0001-exfatprogs-fix-argument-validation-check-2.patch
new file mode 100644
index 0000000000..28c9a71466
--- /dev/null
+++ b/package/exfatprogs/0001-exfatprogs-fix-argument-validation-check-2.patch
@@ -0,0 +1,41 @@
+From 5055bc4e852e18ddbfc618623cdaa2c0572d5f0e Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Sat, 2 Nov 2024 19:27:46 +0100
+Subject: [PATCH] exfatprogs: fix argument validation check (2)
+
+Since commit 7d354e5be83ed3bb981c59b3435ff64da56d185d
+("exfatprogs: fix argument validation check"), exfatlabel tool
+error out when we try to set a new volume serial or label.
+
+  exfatlabel /dev/sda1 "new label"
+  exfatlabel -i /dev/sda1 0x12345678
+
+Error out only if too few argument is given, ignore
+additional arguments.
+
+Fixes:
+https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992419
+
+Upstream: https://github.com/exfatprogs/exfatprogs/pull/279
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ label/label.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/label/label.c b/label/label.c
+index 12d027b..9c8aff3 100644
+--- a/label/label.c
++++ b/label/label.c
+@@ -78,7 +78,7 @@ int main(int argc, char *argv[])
+ 	if (version_only)
+ 		exit(EXIT_FAILURE);
+ 
+-	if (argc - optind != 1)
++	if (argc - optind < 1)
+ 		usage();
+ 
+ 	ui.dev_name = argv[serial_mode + 1];
+-- 
+2.45.0
+
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
