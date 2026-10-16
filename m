Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE05CCA464
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 09:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6715409EC;
	Fri, 16 Oct 2026 09:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IBqdu81CnLdr; Fri, 16 Oct 2026 09:07:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C440E409F2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792141679;
	b=o91qD7E7PDeQNHCbEo6HfMmtslc0yccRkZy1GcZdvDAvQkTnoefFgDCPpEs3xHWpMcOM
	 SpsD2Pw7h7ZrBIXdCZtD9ibx8/Hsb6WJQ0n6lF5bMhkBaKFM3X5BqnXEAmjdDVn4WN6QF
	 +JSBAfZIkt91mJD3JJnzMYNBVBCQ/VkhI9O9YQ5ph/L7eekDKa6DTW3PEtj8Lg1H+e6L+
	 Is6vKgbGNfsi7RDA4iVm/twydu89/e1+5c8bZEqso5zYmhGcTYMr1g0tTaRhLRh46LWgm
	 lF4m7P0kCQooLXecWOQG1OQ82tpm9GSKwkd1X+S8Z0nJQfPH7U0IlkW5gZiq0Ii3EYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792141679;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Organization:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2u/LmZO5Db0WsMc8zGYyOl1bdKWy3IdsbZivzOp6bUA=;
	b=ecwdWzj7vmObH9acW2UQpfNJl7UDfdh4pHmlTkpGTb1u1RvAFk1yUD1BKkBF9h0erBRS
	 7zw7g8u0ocwCNVEnBPBvEMuJ120NdGQMCRoVHxnjrVcuZqEjK6p99Yb7CPqGw5g4LKHSD
	 yYwqT/OQSL81oPSU6KH6LXi3WKco5e89mIGk3ri+IntbgYrXBe9CUue9UdChhG+XupGuv
	 lVtCCTeOZ2m46ueQoZnHBKopMkua4zNN1z/VeeRa9WT8fbD55oL+4AG/Fh7UOxviaAn5f
	 nuvC6RPGK3kUs7TpSWWzudhCvqEKgBWzEPy4kTxLsZqRrEIzsbK90UUDzgbRegi+5GQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ku79HQPo;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792141679;
	bh=2u/LmZO5Db0WsMc8zGYyOl1bdKWy3IdsbZivzOp6bUA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cpsQQ6ytg3LnSFb0kzTc6EJmr0vgU4aZS32VkU9YWZA6IulZjTO11HolrpyRdp8bq
	 Fy36vIfpEohqVvx+gVPoWlcYEKLslFxI+7rTJkL1+WYX99oh9PeEAMIJ5W/LNB3px6
	 i8tbRVNSSe+ZyVHyymVapKiDFPMPBA0EsbMUKP/XFa4Yu6QWidlJBjIQMaFJYFl/wg
	 QDLFi9A8haIVD0aYN9nthotjtHiEP9TtNBaBj2aH8rlNctVa/Hpr20JnafRFMXBOyC
	 K0Txd4RhHaGP8PA++1mtv8hOTc3TSwZKhpD7VSMDmYoOl7Ewnz6byx0SA2IYcmm2+u
	 tS2GpzYB6435g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C440E409F2;
	Fri, 16 Oct 2026 09:07:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA5ED920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 09:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C900409F4
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 09:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y016BnoqIZX2 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 09:07:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 789FF409F3
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792141676;
 b=MaElyetl3P3IR8XAulyQlpcqLBMP+PCw3IUh1jHJUzNKVir4TT//L+cDfEcRqb13XwWF
 CwgWX0bhEYDI8Dyzm5wx7EkItjedmw3NWybzr8IyxVAKi3qZkNjvoZ6vAFqOsvB9nVvGu
 +K/vSj/W2FoT+D36huSUpg11uslHnEeFjFVGy95f6TYWcy+JCdAJEV6CBNCQHsZblzQdb
 VyhoymHWb5HXLRmDq3dxJahfpJNCScHOpP6PdafPl+qsk5YNBn2bu3HGB+rY8F5vwOjRN
 E9FbaK+VWZPGJRaDxfqxK8oOXitp+c5uMLA9lRbQcxrmxUMFIPFOP87CylRaa0IdM/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792141676;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Organization:
 Content-Transfer-Encoding;
 bh=h5XFsNVBpGBD7Uob37f2oTGQfzMNWBkt826dRvjGov4=;
 b=J1VmvOcBqIzVPtgF6fM/Bb92dj+EMiVqzIdfcM9KV8iJtnaiTnC7yvMKI6xk3eh77WEX
 LTFA8CU/c6OQ0/Sb2qvRMrGNOeAyq4DAqE3gA2WAEpBemgoWEvfAJTevSCTZ0OcfZ9XZS
 9XtMWsmC2TjLcZQpYSymxHcce4AZthDo2/gCwV7V1gxorp9cuimHfDfxa8UZKqiD9biRz
 BW4SKUFVrmDHqXUlzYaS0AhzgjJHnJPFpbfa6iVBN7TYxjHkcm0eA3aDWE28bhM8bu9Dn
 16SBy5EGbM1p+2uAIpVG0Wm2aliqXpYQvq8lCa4yCuoVUx7N3Ui3btQk8kKuH0UNDAQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ku79HQPo; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ku79HQPo
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 789FF409F3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 09:07:56 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c247f6687dcso45761766b.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 02:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792141674; x=1792746474; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=h5XFsNVBpGBD7Uob37f2oTGQfzMNWBkt826dRvjGov4=;
 b=ku79HQPoCaxr64Qi0BE9sUNT6pOrAcezR53TP0kWqQ8mT9P5QZd178mRiR0NUqh+FR
 KpAdudqg6+YRP6dHnbJauAzqaVtgIQvUp3RgVwdCtbdDZQiBmpBIYppTXKKqpRAbQ3cH
 CpixfazkF+oWpWrsuLjryU2upAkz7pIqEW3kVsNtt1WnHMN+EqzW1D2iAejQXeGPfH7+
 JtRWMy6P6UY4a3S7fD44bZJjv8d6oDuXyPcJwtDb7UDdKDWEpvnsuSRDwM6plCboTgCb
 mETZfgXWwNwlwMyR5rKE0oU7f3ZzdGJKp2TMTUilkjN+dmOkjtWvLwgndRq9RTU84ftO
 uCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792141674; x=1792746474;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=h5XFsNVBpGBD7Uob37f2oTGQfzMNWBkt826dRvjGov4=;
 b=vD6jAz5W4ibgeSR6/XfeGc7Fj+wmgCFUUm024ustAKFnKGlHKyzX1PI6OBclB/GHoM
 AS2Hke2TrQSVlOq7WKWb777+JSMecmrlxsPliexU9QYgI84MuiOzI4dSUduKJHg23hK0
 Amo2rW1s7PXThl+oEtetKnvVGDaC2NyLQ6632y2IHwgv8Pdc9Wqp/KZj+CYZjuX9Rqw4
 QO8ofixuwFcpN0T1WtfU8+Lx3pocp44Mh+YfOlzgRxxhT7o3YzJvhdD18F4Yc2RV1qhv
 LgZ8RD7k6DLl2tUkJVKfxEdQcHgoQNm60zM77e9CVyF5jXQOiRyWYd+p/SGIN6maYuVq
 FQ6A==
X-Gm-Message-State: AFq9FYJdp/TNlS0MWuyV0Nrq1yBZQpWS0HMm9IJolcAAt4Yh59EKeEdI
 q5riGxhiLzSLFu3jnmlj0SkUQvP1DANJ6mfuKcVEVjOHKMeNXe2f00lpJnX2kPxP
X-Gm-Gg: AYBFou074ia/8Qoqhvcrqyy0xSvqxpmc/3jPmtsgTp6ajPKwKsIdGdZxYUg11O/R096
 Slb6N1aYLVYeiQ6T4HqGh+eU6VH5rCr/ATDSsbIvMKMIJfPUnAALT+BFU3plmjLsq9nA5LCXOu5
 oTB+79bWxYnuSVB7VGWsesJMGOrp4jShokt88eb+1q7ASV3hS/DqUZJzfyzC1U2rQqifuJ4YNeB
 nO+pH2mYhBjA1HnbKzKlAVQIk/Q+4ptJzA27PAT2esdirCtZuuzELNMihY4GHaKmBlnaReFnNaO
 54sjgnqAyqhkrLE2UfydKIhA2MjsaiXA9UQ4nKqekvtsLsSpI5XYIXYWEDfazeSnLRxmDpnHTk7
 1Rtrx3/BeVanIrVPaK+cE1x3jaOAlrMfQBUi3L/T+XEuptxMdnET7DAjFPmIGvX522P0Mplyrzt
 bUmLhd+LccUfEx8G6wz97ihEAUO93TVL7arFdtwzfji7tFrchkzq36sEZK5karT57oSWK+SjEVz
 JQvTHmoFYSYxIr3Kq5F9i2ztsc70PmNU3co
X-Received: by 2002:a17:907:2d91:b0:c40:6ed9:b962 with SMTP id
 a640c23a62f3a-c406ed9da28mr137448166b.26.1792141673739; 
 Fri, 16 Oct 2026 02:07:53 -0700 (PDT)
Received: from gimli.addiva.ad (h-46-59-24-110.NA.cust.bahnhof.se.
 [46.59.24.110]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b38a1b140fsm711799a12.9.2026.10.16.02.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 02:07:52 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Fri, 16 Oct 2026 11:07:47 +0200
Message-ID: <20261016090747.4170285-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH 1/1] package/mg: bump to v4.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes at:

- https://github.com/troglobit/mg/releases/tag/v4.2
- https://github.com/troglobit/mg/releases/tag/v4.3
- https://github.com/troglobit/mg/releases/tag/v4.4

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/mg/mg.hash | 4 ++--
 package/mg/mg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mg/mg.hash b/package/mg/mg.hash
index 85e5efa8db..cc10cea187 100644
--- a/package/mg/mg.hash
+++ b/package/mg/mg.hash
@@ -1,4 +1,4 @@
-# From https://github.com/troglobit/mg/releases/tag/v4.0
-sha256  6b33adb70d59d1449b40343be1162201576026242470dbf76985aefad5d4b0ee  mg-4.1.tar.gz
+# From https://github.com/troglobit/mg/releases/
+sha256  5955f48138bd5fc3ac53945d610f4089446afc5eea99bfb5f0a01f079426907e  mg-4.4.tar.gz
 # Locally computed:
 sha256  7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
diff --git a/package/mg/mg.mk b/package/mg/mg.mk
index 49e90532f9..a831e5e86a 100644
--- a/package/mg/mg.mk
+++ b/package/mg/mg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MG_VERSION = 4.1
+MG_VERSION = 4.4
 MG_SITE = https://github.com/troglobit/mg/releases/download/v$(MG_VERSION)
 MG_LICENSE = Public Domain
 MG_LICENSE_FILES = UNLICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
