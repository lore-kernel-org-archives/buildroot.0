Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459B8CA5FC5
	for <buildroot@archiver.kernel.org>; Wed, 30 Sep 2026 16:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DECCC80FAB;
	Wed, 30 Sep 2026 16:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Erv2IoG1M6Jr; Wed, 30 Sep 2026 16:57:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7954480FAE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790787470;
	b=F139bBNiK0H2/Er2JAMC42QfjVYtY5KEyE6KhQ6N3ERJPxgmlIQBqGhWYXhmmKjPLGKB
	 OocRGKehPrW3od6Mj+f+/AYFEJUhQZsYjaBGDbYELmUG1Sj9zWxVuFLD2P+Au3apathCp
	 OTaHxWNbZV65PgNW5/aSEfYP+a0A4UaRUWaM6xg3+erjdcZLedP7jCph4zDQ2Vns4hmcY
	 8ZG/CKneTUmE94ZGj9LjEKi7t+AWyJUgLN/rz6XbfnK39Xto8n2d89jVBvBhLnPrOliLD
	 MNUH74fFFCIsErTuZoFnoUnylpNW/3qBkSbsoPflrd96X+Rrdw3TkjBqgcLu3RWQNqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790787470;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=j/MgjOV9pMeBSmk92aMXlC5a2WaQPtX6NTyw/i2ItVM=;
	b=Va0VWbORIy5zxj0XSlzCWXx9KRtGt5U841isw1oE1orZtTyNsJzlSBUUKTYPJsMvjUdF
	 G3zxD0sS/wdSbA1YfsELn2EOGU8oLaPzQIhgVRcvEnRE+51irq3t6bKOQ8cPmOQmDrDCG
	 v/zrySdqvtsUawcVojFCS2+ytP6x7Zg+SnnwZnP+olwfL7u3tLMgcTtLE0cRAoGwUKYTn
	 N6Nan+hMFDVwq+PC2D0Gr6osJHbILyZH+iyOyQlzhIP9ubncITygFfyjKfTxrr1I45XsY
	 QRJ5RgnDWvNNiwvdV2dVnbcYtEA2i0GNxokSE9jPIri6fJPUDL1uRcjNGSlvXIYWPtA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=XEFakLm3;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790787470;
	bh=j/MgjOV9pMeBSmk92aMXlC5a2WaQPtX6NTyw/i2ItVM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SF+Q7N7S7ITSFTdtd0U93h4rLuJ+gaDMTX2d4+dOdBMJCHASQmpGdTvt1N22yYNH8
	 kgC3dAt+NixDORqEGxGOZasNYWzG+vlEjRhhe1dIyEIbMK3xO1HHAccwlqzR/DIhOd
	 uQApJS3WPvCAAD5UM2TtgDho5quPSyaB0vCo8iGVzEU+DNpwnXHfCsHu/zCFzneav1
	 N5/2AwBzZPsRL+7bDm0r5LzA8arXvl0aDoNcD0rhBEc6cDQWr2kUap30REEynxIUiA
	 m90u/JHnbdj06ybatEuSelVuGVbJ6nuKFfdgS1FWQACJX11rGjTT642Cqne9xQixgV
	 jJBOTaYLNBz3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7954480FAE;
	Wed, 30 Sep 2026 16:57:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC5663AC
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 16:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 915FF80FAE
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 16:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uqz_hBBka5mx for <buildroot@buildroot.org>;
 Wed, 30 Sep 2026 16:57:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 578CA80FAB
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790787467;
 b=QOrxdeilUvtVGGJJIYrWsMsBPN0VlpojqKlfsUOc2T/p5ldbkcfxYsHspb5GxkLL2pJs
 u3oP1bBcVO/3l+0GS4OPAT10outnPCik1SXzbYy6G09CYJraiStWUAbWay8LLHkiR61WI
 UuBrKhX32PMcvuczKSl24olbN/Jyvy7Fcjxm8tT+cRsTsN8XmExU0CFyGRthHHPCksaKL
 +Xu0DQbN02Bc61T3wJ1IhdthXF9n5e+PKEZ/QOoZsevAw2EvczOUtuKWm2QW9OaBAV3OY
 8Vh2cIeHxugBK+x9EH9R4C2EXReqVIaafBP9KdxlIJUzmZ8xFKoDnrz80HnHfl0FMvQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790787467;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=tD2l4t2DHdU/29pgrGxnotil2Ti4SvxCAFXg62Bx0oE=;
 b=nldLcfQ7Kb7ixmW7Dl/s/gQrApFRtFxgthDC2lqtjo0df1zBqOvXsRKtJKkDIDrTMy8c
 XxsWes7P5GmYuHGRNKc0/+yPcS9cDor66tvq8D2d2zvnCq/nc0Bzj3DCNO2zEsQhQNdnB
 Nsg2SYwYOzv2ZZJs1mmun5VklCH3Mz1iUx4dUUWXHDo+67Zk+obYEPAt60dGPphay0SQH
 zX6gmR/7GP1fGD1QK3rIWr1tCCQSiHECQlUyrNf33bwegUY1t7Po6eEuo5nC74WvNtFZJ
 tSy9XWM96h7dlCNIy6z9zQMjS5aEUxcKuPkFdla/tPu6IHowV4jqZhqY3vRZ+Wk15GQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=XEFakLm3; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=XEFakLm3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 578CA80FAB
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 16:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790787462;
 bh=tD2l4t2DHdU/29pgrGxnotil2Ti4SvxCAFXg62Bx0oE=;
 h=From:To:Cc:Subject:Date:From;
 b=XEFakLm3smWZeaNzn+Fn0Twi5hU8t8OxNQ86qP+6SWKRDt5r8zfYTEkyat/pzix+r
 tX/aRT1tH3+OzwpyFLDeJM7YL4DM7rjte+SPqa6cTdA/X9mxP4Ehgimiq63minWKYh
 p3jKlMF5sOOFOBHo/0mOw03TAm2Ecag0KGLrw7LOuSvyuXSeFBd7SZGRkK6SVfmudb
 wYCh0ukrhZEvIc2TbUf1kLJtKKopFleDhpR4cAxPhQeOxoeGfohISOzKTprzDyefdJ
 vXZZk1zk4Ul6/2mqpXwMlFdI6M2hM+DPEWXUfI27VG949HwKXxDFaHNu2tOiUIKmLk
 d4SLVPyJi2unw==
X-KAS-Sym: v3:f51bdf72230551df:tJQ1O48FOw5Q4PP3sDF8K92WihV+r2vb7KcsagSjN38zL
 ZHAf4UwvQ/nsJ/QTRM9F56Nrav/xcS9JNkJWX/Z0SkWBGfXsaYQWPjwbth/4d/q45YQ9CjI9XiZ
 ng5lPcMUKG+bpx3ldx98AJoLz/TO4Ck4nlXq5Yc0nNwRLQdzrdpZTpclMXIAsmW1c93ywZHsSWb
 gPG/ik3l1u1itaPNMkkfBdqOAjfhyv9M5Y8gdHSAjGU3YQcNWgDPgKCddHQftFp1bwpXUo5KnQp
 e4aDjoYKa3I0kzJZKj9nKhNBUXhD/q7xszkAYtGc0Zhwp77qN1FfNWoLC2BPn2JzgEv0b3FQ==:
 GZfOkwLwqbqMzg7uvGj9dFDWEq+zCSMl0dYmvedtziJy1ik7phtPt2VYUH77M2aRbru1RGUy8Ul
 WVF9fv5xgQ2A7IOgkXBTyCtnz2NqwhxL9iuhhFb+D4bwRcNfMVkqKDQKEStjphgnZobmuUzkW0w
 ZHaaalC6Vp9L0bjdX4H0DNecE+1Ah5GFNuOU9qx+yqKasoM/UTHCIB7OsEkF6SpQD0ctY0SnBxu
 bm2+mCinwwnucvjCQG6S0MCapki9RBoK3Z1mIjm1L+7PDrZcRgx1ETjVBWKjL8Q9W/Ds7TUDuEz
 V+ThTmVDisRH69Z3YfxJpt8Ec+xp2JlPluYCtXx8PujCh1G6JjKC1FIAHKis2Et82EYF+wsaRir
 JdSkInNpTROh7sgd4Y5aMMUPranP+bOXeahQHJbHYs7die20UtYaScqhQIFdPK2HN6raxuiDxpD
 xB/ikkwJ0EOPbdF9d7ACRCEritqskDuZ4NtNHyiABduMp1wTa5rVMi5tlUu+nuTiBHDy1w6tZS/
 KOyhtyn2GkMAy4X/UClL2/PxSg7p9TFPsouszT2Gay50EsEsBSlwJXkj3WGoGu6wR93Y3EsHfnW
 JN81NjVHG/qivZ5iPc2euPReBSidLCqkQeQYMHe0uxqfwFcDHuTZYW89gPJDkw==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 33E30A4C4FD0;
 Wed, 30 Sep 2026 18:57:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43236)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBxcj-000000003qO-28sD;
 Wed, 30 Sep 2026 16:57:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2026 18:57:41 +0200
Message-ID: <20260930165741.592638-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump version to 2.44-55-gc90398e00
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

Fixes CVE-2026-89092:
https://gitlab.com/gnutools/glibc/-/commit/c90398e00571476711792baacb6d92bd2a7b6891

Also fix typo in comment.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 7 +++++--
 package/localedef/localedef.mk | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index b32fdada8d..439fe1f140 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  d55ac4dbe32f36310d7a4b9a38d3796666fe323581825cc530f2000a2209947a  glibc-2.44-48-g1f5026241027260e9280039698bca031484c82ad-git4.tar.gz
+sha256  2ba6ee9ed5177a792fcce4da13225800f0cb3a2413a459e7864b8843eb5cb790  glibc-2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 6e306c7f2c..a838ac1a81 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.44-48-g1f5026241027260e9280039698bca031484c82ad
+GLIBC_VERSION = 2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -40,9 +40,12 @@ GLIBC_IGNORE_CVES += CVE-2026-80489
 # Fixed by 2.44-39-g0b4e41fc51e6aba6216a908961b49b0622b47fa0
 GLIBC_IGNORE_CVES += CVE-2026-18374
 
-# Fixes by 2.44-48-g1f5026241027260e9280039698bca031484c82ad
+# Fixed by 2.44-48-g1f5026241027260e9280039698bca031484c82ad
 GLIBC_IGNORE_CVES += CVE-2026-8674
 
+# Fixed by 2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891
+GLIBC_IGNORE_CVES += CVE-2026-89092
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index f20a05aead..e4bfce1a3a 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE, and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.44-48-g1f5026241027260e9280039698bca031484c82ad
+LOCALEDEF_VERSION = 2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
