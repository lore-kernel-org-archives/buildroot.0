Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E94CCA464
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 21:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C82860ACC;
	Thu, 15 Oct 2026 21:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id onuNz6nZdUlH; Thu, 15 Oct 2026 21:52:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 32B0660AE1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792101155;
	b=J1Hjd+yg40gJY5j0lqZzlvdFGSg/8fCbFJREmwmK1E+J1xBr8VRIApDLJ+HyXbXRQIOZ
	 tHYbOm5NYviFOPt34dl23QVZT8dUxed/71CIzz+idVaoYZQZ6qiebnbf2nyvvUirOCoeo
	 q/YvqYipiDEky7ygSw0WY2yX3cYs5XNeVEQAaAQpMKR23vuVQEdGBZ+N3yW0t1fEkLulY
	 8VP+InloAB+M9pbS4q0C9xycfTi/l6yhG2dKBASH+TROHtLM03TXEMjQe9pAOXhT0tMTT
	 Ng2Lc8kbx4xgXXYksyNHmmrkF1sdSbEM8Y1OhUTqn8mWSfEOzWuTRfg3N0mFLHd0+vA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792101155;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hU/ba4ja2BoECt21tDhQAQWcxXIENTyUxwf3f/uHubg=;
	b=JXD8BKUwN4DXWHNLBrUVKs/sb+ucT3HrE3Qi9ug7ja/h/egbLI3qYI3C3oYn2ad8VtXg
	 z+wZby8pSt0wK06kS2txVpJK9Xv4m10MDkt5PvzeC33wz8QfDEnjIfeFYPkFFzstPiaRp
	 ZFX5g/wsNuceTAveAHZjMuNcbFLJwI/iJRYktNbVND7jCOzMfwFt7YpBPT81qV9+t8XId
	 5VArhbu0x+NVkn5l0N2VotEFrxasSMJEVvPii9ONHLK/J7+msyYnUs1WLlpWgh+0zK0eF
	 W/7YyU/BFfeP2ZmlFp16qZr2ShNKfYQXLxZ/eflBsirXpZ8mWk86rnFr6SfFGDBUG5A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792101155;
	bh=hU/ba4ja2BoECt21tDhQAQWcxXIENTyUxwf3f/uHubg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Jvs1vmN4tFExt4kK9TYrG6TdkAWao4k0AXVfJ0mPSACH6PKGOLC5hJVu8AgXwYbDf
	 5pw63pyQTqOo7YLg5eOBb7gXnGR/wff2sNd02gt2uue7GrOAdZMmIE0wgvfW+N9Ova
	 xg+dzt5uXzrI/jckeITgZudloEfZ9v8Csjv8R0CUrc6uo4O4dnTGutFGzd5XsgVTtw
	 xJ4DPY6vRMshlQVAviyy5xHJr38DbGLluwbARHGpoJoLM1D9scVko0UiVMA1OPARHd
	 gfo+FAi2VhkG6MrEwF3ByDFawuMaCtuNfQEJ4ek9JrBHi1L/pUc7I7fASnVTZ3i83I
	 foTE4gyHYFf9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32B0660AE1;
	Thu, 15 Oct 2026 21:52:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77B93362
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DBBB40087
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lK12p9ImAj9n for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 21:52:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 51D4D400CB
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792101152;
 b=dfUdw1OmUOTt4QCQTJWsHkDymtcFGQz2dVRuDp9YsnAfLZ00UP9Gzh2c+jcsXngeOrpJ
 w/t6DW0uqKIHMlJqzcoiWQ7Vlxv3QYrwZJxSISyb6Iw25nAvuvIgWPjTwtykO+yxTkTQS
 +SKxXv19QJs6YaecJ2S5o2e0++M6lINXTZxXazJSpjlGKI1OtWDQvi+9OreEmNsRMVFAo
 +yX4CRmEO5Jh/SfRPWZh18TWf41VBIsq78knZitAWT++b/zlD914DOeaO+v6RC9jGt7by
 eW9DkBotii88/BLzPvqo1epgESk38crKfeuaT/+PLUHtKN5E8r7+m21mcyPUja48nGA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792101152;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=zvlLbJsDiabbxj0DquwNeJZUfxkuykHP2OrKn9Os/wM=;
 b=doJsL4921M/MRrnHicjOIWKAxUwP8Yi92lVI3+EnwevrzspshQiE6n66r/U7kqBTrExZ
 TOnjKmf8LNf69O3PQXNIP/4LdWBn/QGFTDbUvS/EbiIma4rKhc2p0p8O6uZSiMi8wY/aU
 HDD7UqZTgx7RC7uWr2Ji6p9m7kOquRvqGYATEzh+qQIEiw6805qMseu0Q3t3dWLMmMaPe
 jCxyX5PQQY/GVxDZoKDNwhoWYmUhIxHclQJLqD1aPXtTLz8Mnh80RAEnwCcxY66lgldKM
 tdIVZDD0ZCoPElFTN5wBOm19CEoCILPN0Dbja4l8urvXiWX4ov0c7nAzJE1QgcLDxdA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=an9tVP+f; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::22a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=an9tVP+f
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51D4D400CB
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:31 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-4f9b643b13aso1612109b6e.1
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 14:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792101151; x=1792705951; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zvlLbJsDiabbxj0DquwNeJZUfxkuykHP2OrKn9Os/wM=;
 b=an9tVP+fP1QHk3K1VQoOj+Wit1Np+wWA9uz5SQivtDBAHTrppnXthsDfaih++/dlw7
 H7fuYn7Meccndvlj/SDSfA562ZfD9BEG3c7dY+XvEQBKYiP+k3TdvUytrqVZ/+DLJSaj
 uzeeX6vEfh4+GOo9y21DcJ3siSfzAe9DX2AynaOKKVZuEhs/AhgmcpiBEXUq62IY6CPd
 TbIWxZ+pVasnMXX6ENkuwPtFeBz0knLoJp/skYJeufsx3CvvWR3BeGS79llcEU/TiZ6l
 TFhpPTXS7qrMJE2mHxR9XXplUH47wrT51dPbg6PdghNupAQQDSucaHNCcT1PlskHJrsh
 Fq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792101151; x=1792705951;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zvlLbJsDiabbxj0DquwNeJZUfxkuykHP2OrKn9Os/wM=;
 b=lb5HHORu5okk8ZTwpognVjOnj10F5BclzUTU9Y6NTTapW6mKLPzMVyKGtX/Dy3ytMe
 r98JLRX6cAfwKGHtQxdefvIfKTFMFFK1jQOUN++Y5sukYZr56SykTVpxS5/AD5dhZuPc
 836myPXO3gWbg0SRpHtZzhUxyewRUXuO7Q01rBU+zYdMC2B5YCsQ4vzNCb4AWHZW1Psi
 SW2bjAa2j7fCG9ml/Q8RQu05/GM+z1awu2ZqYV2Q7c62tfqqrzorHgTtyAGPP3fkDLld
 4hXrh63K7UL4JjlGd2fCX3UPgRdd1y1xChK8lNAPNcWC/Qbjjv1LZUDxJpeR35yg9S0Z
 ZC5w==
X-Gm-Message-State: AFq9FYLzDvlkThcz8uR7w8MbOykmeneG7aENcXJKtphtHkFG6O4tjztC
 ij2KvBRGtdZUC1MgbkPCAELS2MB+M/X3kUPE7b2fLbJOVIKqyY4h1K61qVpDJg==
X-Gm-Gg: AYBFou2yTJYB0dWQhPk+0B0QmlQJ4XuDj8NrPd3Mea6SjYolLsH7GjmjkukcOxplg1H
 t+uPPl6/gikXRurkTdSRQRHp1MEWwS4hdQhqQxD/SzBsRz9MCF/efPTxh7bkRLeprfONmGJephA
 kUg+miPOGX0ZYAF0S1A/l/I5qP6fCh6YXeBUXr+11d7GiEpc/Gvhs5ij6dzm+2wUJ23/D6v5BR2
 fNCR4FIrWkd5eRifRbm8DKAw+A4wSENx2enxFbqrAOGmjSm/qCBcv/+AkTsYJYnTB/lcC+lpmqi
 Y1YBrAAaNFD2vDNMwLLiHIki0Mm9eFZEDaMkcb/oG+sM1cWrb1YlT1MhkeTz6E2FcL5orjRcIwa
 cFL5nqIiGXmOAI/JCBMYV2f+qEVj0nFMGCo4xktDipY713DwbnUmUd37EJNAgl/3/roImkxfVCr
 3eGfwljSZccB21AXbJ8i0CcgbzPL8MDAaqsDqXqEBUotWYBMAkwzdIcbzQMrK6wKxlRXCtG3M94
 SRNJoadZE2pzzfLXIoaD9rbbRz6k++rJcaYu0Y9fRtovAwJ1QMY+6AcuQ8GILmEOsSaBGhjHeuv
 v0Xy16be3QSjOvaYljLNdRm5C5wNApeNW+WDerR6XWT5NEQ4DwAdZosf6DzNgEtquQlpSe75t9p
 voFXLDGDGokXdOxjoPUI9b50sgg0EO5bhNWT69KxZc0Le
X-Received: by 2002:a05:6808:c2a1:b0:4d5:295c:a82f with SMTP id
 5614622812f47-50c57b61540mr16519749b6e.60.1792101150834; 
 Thu, 15 Oct 2026 14:52:30 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-53874e0e65bsm145114b6e.0.2026.10.15.14.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:52:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:51:47 -0600
Message-ID: <20261015215210.3426895-11-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pydantic-settings: bump to
 version 2.16.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Select python-typing-extensions, which is now an explicit runtime
dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydantic-settings/Config.in                    | 1 +
 .../python-pydantic-settings/python-pydantic-settings.hash    | 4 ++--
 package/python-pydantic-settings/python-pydantic-settings.mk  | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-settings/Config.in b/package/python-pydantic-settings/Config.in
index 76cf564f0c..a7fa64d662 100644
--- a/package/python-pydantic-settings/Config.in
+++ b/package/python-pydantic-settings/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_PYDANTIC_SETTINGS
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
 	select BR2_PACKAGE_PYTHON_DOTENV # runtime
 	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_INSPECTION # runtime
 	help
 	  Settings management using Pydantic.
diff --git a/package/python-pydantic-settings/python-pydantic-settings.hash b/package/python-pydantic-settings/python-pydantic-settings.hash
index 00e8f84957..226a923bf1 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.hash
+++ b/package/python-pydantic-settings/python-pydantic-settings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
-md5  5adc6be6e91067201caff66b05f1186b  pydantic_settings-2.15.0.tar.gz
-sha256  694b793e84f766ba76a90ebdefc01d0a9a045dab0382bee70393da93712ad117  pydantic_settings-2.15.0.tar.gz
+md5  68615b705951d9a2de8d8ea29c377580  pydantic_settings-2.16.0.tar.gz
+sha256  5b6c578049ede4db0e2ef3b4eaa4ad4069cfa9211f83fb38df899dfade50a614  pydantic_settings-2.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  LICENSE
diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
index c297fc7e79..708b1df045 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.mk
+++ b/package/python-pydantic-settings/python-pydantic-settings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_SETTINGS_VERSION = 2.15.0
+PYTHON_PYDANTIC_SETTINGS_VERSION = 2.16.0
 PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
-PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/68/ca/31c57507b13119d7d3cfa1576dad2911a4861e3be07b579395f4e9d393f9
+PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/2e/3b/a5d2294799b53b448319978cfb5bd139d5a9d45e862af91661614f14c922
 PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
 PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
