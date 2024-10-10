Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A9ECEDDA9
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 01:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3E964078A;
	Thu, 10 Oct 2024 01:44:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gk7ohi10Rx1J; Thu, 10 Oct 2024 01:44:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3DAB4080E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3DAB4080E;
	Thu, 10 Oct 2024 01:44:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CB111BF983
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 01:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BE0D4028B
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 01:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLNQ6eksLA-F for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 01:44:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E7D6D4027D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7D6D4027D
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7D6D4027D
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 01:44:26 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-8353fd2cacbso18083339f.1
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 18:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728524666; x=1729129466;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JoBqrRLxu8N0ekSEZK9MW6PDMBliZEZuibW+e6RUj7s=;
 b=CRJibitGr2MH2YgLsof4a8z3EMOaAocKnjRxpnax5AABE4NdH0La8sQPB74IoFNcab
 hFEocfbBtSObuf7xj+d5wfrXhBBa0nGUtht2JD2uDuLWVqpOlZu+n1d96fcHu10lnXeg
 XMjuh/i4tA6z7x3gItN7JOrRxxIskNiSpDKmnU2HWxGQF9tAMEwh8DMl0w2AX3+b4rt6
 nPFTLQwowTyaeRyi3MQ5lgjWbHH/7s/m/OyX35WtU9mwkaTMYXQQ9UVJkWx94uglgwdS
 CV5udL1lL4Uei2n21SJucc1teavId/2GJzGd0kKSFnz41XgdTuI4AQxS0lsNuWZnQvq5
 wfxg==
X-Gm-Message-State: AOJu0YxN45hEBn8TiLzbfOgjQoJWF30N8GuGaQ8AmrLVQvWkk/tQquC2
 BmJ1K6SnVAiLN0nnzlfy3Q9lL+WUGetpxcPlTT/qKZOfo7yPEybo
X-Google-Smtp-Source: AGHT+IHooYTk/a/xm57I/UqttP0roBy59Dlh4WQ+JldAyM782EWgtEkFkNJVe3g3VCCNjxUpGYvC2g==
X-Received: by 2002:a05:6e02:138a:b0:39b:3894:9298 with SMTP id
 e9e14a558f8ab-3a397b7d2a5mr45034235ab.0.1728524665641; 
 Wed, 09 Oct 2024 18:44:25 -0700 (PDT)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net.
 [207.191.210.45]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dbadaa9957sm58766173.148.2024.10.09.18.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 18:44:25 -0700 (PDT)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Wed, 09 Oct 2024 20:44:24 -0500
MIME-Version: 1.0
Message-Id: <20241009-git-2-47-0-wchar-v1-1-23c261a5fdc7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHcxB2cC/x2MywqAIBAAf0X23MJqT/uV6CC11V4sNCoI/z3pO
 DAzL0QOwhF69ULgS6LsPoMuFEyb8yujzJnBkKk0kcVVTjRYtUh4ZyNgY93SkJvrzpaQsyPwIs+
 /HMaUPkpB2vFiAAAA
X-Change-ID: 20241009-git-2-47-0-wchar-69af60ad5893
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728524666; x=1729129466; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JoBqrRLxu8N0ekSEZK9MW6PDMBliZEZuibW+e6RUj7s=;
 b=LZLjQUlLQoJ+2Zl1590kIpvQy6sLkejWNZUJyM1SOnHSBCH8hzxALe7/DTfp/Eptki
 3R+eWscGAsGTLRjqR3BJz8+j7Y+nQgjmfNf8M+Nrw2apqzqoELSV0nPDRiO0hHSNG6XA
 IhvXp1EqGkcz1f3pv5bd13StKnGQz8GMTrpLTkQivEmFSgg7KHYX8Yiv8arflvjN6i++
 j5S3vlBxacJdRrUbRilYsRL6sX+Q8b680G3zJQRZN9tn9B8pEl/x+TbtQmef4M9brbxm
 kqrh67tNrmb8OWZRLggtu9qP7LV9BVwG7SYq+C0PO5612SOvDR7khKJR/5m+3UsRGwne
 Dptw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LZLjQUlL
Subject: [Buildroot] [PATCH] package/git: require wchar
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
Cc: Brandon Maier <brandon.maier@gmail.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The latest release of git ported its unit-testing framework to a new
library that uses wchar.

Commit that added wchar: https://github.com/git/git/commit/9b7caa2809cba618f2af702d35b12bc99535f2b9
Fixes: http://autobuild.buildroot.org/results/15e/15e2f470ae6ba0c9c4bf40f306955aaa317bf87e//

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 package/git/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/git/Config.in b/package/git/Config.in
index d53921d7d533b40ab37eb645baa87b6ebdd1b03b..44e38430d2fea7b1e6d447de802be4111d7acfdd 100644
--- a/package/git/Config.in
+++ b/package/git/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GIT
 	bool "git"
 	depends on BR2_USE_MMU # uses fork()
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help

---
base-commit: 449d72426bf78c744b8aa0aaec029ba926c70337
change-id: 20241009-git-2-47-0-wchar-69af60ad5893

Best regards,
-- 
Brandon Maier <brandon.maier@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
