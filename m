Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E639ECA600B
	for <buildroot@archiver.kernel.org>; Thu,  8 Oct 2026 06:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D01381068;
	Thu,  8 Oct 2026 06:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-0zG69PmF9f; Thu,  8 Oct 2026 06:52:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AB6C48100F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791442372;
	b=WeQlwZAoV5ge0QdH7iJxo2w4yUFui8ku10KxHCNQbgQyXdeSGCq6d5WeLs7bVixR02bB
	 9LSHU+Ku4QnXj7UenoUAtLoj/g2pPNFJ95VbQFS/ekKE7fDBo4r+B72M6pkFU5Z0FkD/l
	 vI2WVCJGLgVUQ8Nyn87BbJnJF8bdoCLhcZKhrhPEsaiMsGQgqvWGh0xtJHyrc4yo90w3B
	 AopOPgvrM5UurzNRU+CHGco+jxmx90qLxGwvzd1E9oR58KThi5W80ZZxquwZk3jBcaa5c
	 vIPk7vGMFIr5klUqISPG07Fa2rFU/BfxCvd0IyPrRBU9eXdc2dlUgN0o9SLJk5nfJxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791442372;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=GSyHlq0ZFa/nGxU1jEnsbFDlfjfwiB4X1Q4lT4xMWxE=;
	b=RvA9XCcq73ltcG6uIp6ysrwV7RQwUapXp1GXCFiknx7UtA9rYmurUj3ySixuh1Oo2C8N
	 P61a+a9Kg/WQcO8QUnaq9IGpgR7NmXCpIgwWIpEGHUE4kWyq/SkJSULaF5SROM/sfIf2n
	 4+peqgs5K2ZmBW3uwKy9WV+uGBb4qahUMgEblHp4gds8+Ph9UFPig5ZDqh3IafbzLdVCD
	 UkDBaB1BmOKOq5smTckJ0U/We2+SC/vXBJJo+GZAxGydIy/VXQylz94u+TBxxV0Q6vOKm
	 jq0jbPaM5FlTbpao/rVhKo83Tsj6Qf/1wTVe2Iskha+RrwxAW6Y9KLhcQh2nQ2vw2Tw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791442372;
	bh=GSyHlq0ZFa/nGxU1jEnsbFDlfjfwiB4X1Q4lT4xMWxE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=IKJAZ71CgAGRX/UGEoh9L5ZQCx8gdqfJKGAwfyzv1rPjX1TuOvGmaxAePevdqcEb5
	 hT/qMJCnyUEeZ3TgtvxSejBeUMB4gQ59R34zJtlElThBDGQGVL858b8Z1ETmWxVDif
	 b9Az1iGpwYouPK8VbPxPYg5g6A6cslh7XbNSYt6it6YDYJJ91Yak5Lw1rpqo3IKk+r
	 bCoku7ESkarc1Re3aqUEB2TQdYRmjR0INkV1BelO2e9rl2WxPl/kCQYxPNv/K6QByp
	 04R0a32mT24JchKvH5B07YOp8ZWT+IV9mSjNrXRcl0vs1rs+lF0mdifAlqYEj5r67c
	 LXAmFFh/JVhJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB6C48100F;
	Thu,  8 Oct 2026 06:52:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 50960317
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 06:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 361A180FF5
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 06:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WtpAcdKgCKDU for <buildroot@buildroot.org>;
 Thu,  8 Oct 2026 06:52:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 102BD8100F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791442370;
 b=i6FtGE6TQX2wkeV2edroOb2T2lui9M4DPD4oV/nh4pYxmBs7Cpo3h1SC7DKt88pGUcFX
 2Y6RJbJjiwoPYpzsVlIev9kNhDf9EDTYU6fPm85r7dAALkXEVp5PJ6qx8yf6rF2xS3Q0s
 79t3SNEiTG2M4EWjpK3xZ0HQzkDlVEKhd4s1gaAzgcIqXmfWbXBaRY/TDuCkF0MtUv2EW
 E0Mk6CEW90LXY7dMiwjO0GkZOTOvqsd3RHjpX0ZEF5P3Epv1y5yLgegKG23aQ79n2bc7n
 jyc7m5Z+0j5kejPJ6VVRBaKU4nVx5L7aBOOwOl/N/NX135JOjiY73lamNOrMvFM7Gpg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791442370;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=beK+xyZlSA9IQGK2WGWgEB+7KjS9BST+xDjahSZx7b8=;
 b=G3M/VTGIlbhdsiAi1jQzJVyQhE820xinUrb0u9VyGwfNUxTn88KhH241RWCInZu8GYG5
 NVG29hM+b9hJXW1xqUMIiKgvT8u6+6nmVIv80F8h7zC0QhOQcz8LpGTvzSUrY7TUUKSI+
 ZtOhunTJHX6uu21hB83oCHbOe9HJ9+5aOQzs0uLniuHEVf0QEQOgfIVDpiTLi6YIdNRZV
 wbEg1cYgaMm1pjnUV1M7JWowlg1BEW876eL+sJMvLYJFT+k54QYHj5vZb+uzAEm4N+uXB
 l1ykmdr/ucgufLkkL68TcxRWhi2C2jK9NGj0zNa3AP21AiqFTz8CFiULPS/78owXRDQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=VdKzEXCR; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::530"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 102BD8100F
 for <buildroot@buildroot.org>; Thu,  8 Oct 2026 06:52:48 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-6acbdbc1725so6993266a12.3
 for <buildroot@buildroot.org>; Wed, 07 Oct 2026 23:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791442367; x=1792047167;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=beK+xyZlSA9IQGK2WGWgEB+7KjS9BST+xDjahSZx7b8=;
 b=Zarotgsk4bRybLvzUJ87FwPgUHTino/i7TlzPZNNPpLRuaoxJU2caOJphzgYISC0Ig
 /Nn4R451QsjBBupUxvSLR7Fy0e7y/POjuQDq8o0PlZ4FruaSE4SpK9n1Ovv4/Z7trLEN
 f5Dzg7gFRc0R/FlcN14MTRckWk7SnDj8k0lxbcj8Id1Zt4bgg2t+tLN481qw3kJ4H2FR
 HMhRIocXk6dqGrrAGQlt739m6JYvTWCOjRI7Lr9oxd3PiQFso6yrMzt6CEk4/XrgmmtX
 nRVOQWKFiPJSWp/2FxCBD44gGZGgKAbp+4tlf7qoVzZDefCHQG/PzUPHgyFLV5EeNV3e
 Wpnw==
X-Gm-Message-State: AFq9FYLwYEsBNxNXtiv3Xjfr005aRRsjaOd3nHzIK/zJXvRrMMWWUEsi
 FgwzpETvxe9tL0Dpd8R2IoPGcZWhWzGdjVVKrOLU37gSBWnqqY/gi8H4RQEdyg==
X-Gm-Gg: AYBFou2Dps0JoSFatV3cvSWysxGk4NAKRI6RUEbnccKisoQAMzBv+pRAMmcfgylZlN6
 bE1CCedLwoFPiT3RRFfNbG+SyDFObZzgFb3aiEGcXN81YLsumy8zuTUqvOn9FM9u7EFBDUb2wMj
 3ARJCEa0PPrO58LmpT8ilYnDT3Y7d8gb7J2JPvTI9uxsEJQ7cB0kuEerujSI9cAWpZMao5YoqpJ
 Ivr7Xv5YOHlGugTodcG6HJgCj5LsbMlsSurMorx4G4I+yETjXe9u4MCA5UrHJaBc0POJpd4M2lK
 kG+cuIJsEr0L36iT8Cy4P8aD796rXVLoDOb6ZCCvZhSDGF8fHYTOuHaJQVXRNGvs3D/9b2R0umb
 DfmZTI+llGYfioSd2z/+N6rRcagD8riIadHYmDjQYUZ6nNySaXnN0+KChV2xi6X6o7tTUymMlFV
 Nc9P/GeI/I2BzhmwvdsIv8BjVLA6ETLJagxfhr3oB8g1HccpA6c24tS+cRBfMfcO99I/PCAAMdr
 g7H3z/9xongM7i3wdoml41e5IHyTKSfad/tVCXHbdqzdQw=
X-Received: by 2002:a05:6402:23c9:b0:6a5:f202:c1c7 with SMTP id
 4fb4d7f45d1cf-6aff377c995mr3516025a12.8.1791442366496; 
 Wed, 07 Oct 2026 23:52:46 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b00a36706fsm1032035a12.18.2026.10.07.23.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 23:52:45 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Oct 2026 08:52:37 +0200
Message-Id: <20261008065237.3866315-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-types-psutil: fix build with
 setuptools < 82.0.1
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, bernd@kuhls.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Since version 7.2.2.20260906, pyproject.toml requires setuptools >=
82.0.1, as it uses 'psutil-stubs' as a tool.setuptools.package-data
key, which older setuptools versions reject as it is not a valid
python module name.

Buildroot still provides setuptools 80.9.0 (the bump to 82.0.0 was
reverted as it breaks older U-Boot versions), so use the '*' wildcard
key instead, which is equivalent as there is only one package, and
drop the setuptools version requirement.

Fixes: https://autobuild.buildroot.org/results/c62ecb7a6f33680c4f515e135955a0aeacbc090b

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-types-psutil/python-types-psutil.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/python-types-psutil/python-types-psutil.mk b/package/python-types-psutil/python-types-psutil.mk
index 0e0875345a..a40d02d8d6 100644
--- a/package/python-types-psutil/python-types-psutil.mk
+++ b/package/python-types-psutil/python-types-psutil.mk
@@ -11,4 +11,16 @@ PYTHON_TYPES_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_TYPES_PSUTIL_LICENSE = Apache-2.0
 PYTHON_TYPES_PSUTIL_LICENSE_FILES = LICENSE
 
+# pyproject.toml requires setuptools >= 82.0.1, as older versions
+# reject 'psutil-stubs' as a package-data key, it not being a valid
+# python module name. As there is only one package, use the '*'
+# wildcard instead and drop the version requirement, so that it
+# builds with our setuptools.
+define PYTHON_TYPES_PSUTIL_FIX_SETUPTOOLS
+	$(SED) "s/\"setuptools>=[0-9.]*\"/\"setuptools\"/" \
+		-e "s/^'psutil-stubs' = /'*' = /" \
+		$(@D)/pyproject.toml
+endef
+HOST_PYTHON_TYPES_PSUTIL_POST_PATCH_HOOKS += PYTHON_TYPES_PSUTIL_FIX_SETUPTOOLS
+
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
