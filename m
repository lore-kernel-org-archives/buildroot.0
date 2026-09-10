Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CDEC79F9F
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 18:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D153E60BCE;
	Thu, 10 Sep 2026 18:04:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HrpxOMPTlU03; Thu, 10 Sep 2026 18:04:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 620E860BCA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789063452;
	b=UDnBf4DaW0RGMHw4dN/JO+Y0Yyx3dpwpDCpc5rOKG8A1d2CNvo+IlG6qrX+YD7fMZqnt
	 qCnBJBeVmqpJu79CrxV6+GUaum/DlvGnNwksW6RK1Rb5S/cuHzs0CyD58++moH9y7HtpU
	 42H2mPXf2LgOo41vfwd7fhOnTlGUwlKRRTqUKW5tTMmNfexp1Zxj7QhFIbumN7ElgIsRt
	 Zc14GhqTOTn3OSDNFHUlpnVgsx7TW23tKgl1X59vOXw7Wxal2tZzSkcaFDMdxwyO0TZW3
	 GS6wEr5EXIzov4HppjsIxp127fE47WvgYrOQtTwhJpgbsRzSJajKDX0R4/oCwft4RRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789063452;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=DkajA/mQgZ0KfZTSRKqneth6RYOjeYjCEqzG3Jc8itg=;
	b=I/mBGVR1UBaBi4Wtg8dvnGsHII+ieECIReNdhow6KVR95sShi9dprQ7VM+MhqF1ibiFh
	 Js8x3hMB47TAxtWNwuUx+k/Toq2pe41KBOTONJNXcWugh9tyxzne58iMkFJ6B7w4wheah
	 r8/6rI7cLB/12WYmTR1AOmMimo3RXhylLxTgWmR/m2OyBKiJTAhLZLsvXiiYkwPfjin7d
	 iyCq/7iFQtKFI9tpbzQesk1JP3ixYTfIPldDDIQt/dKr3fyQwoCB8CV6Ie2akccKLux1S
	 hiIfGycIeBLN3ctVX7myotn8cjPbZTm6jxO2E7f/06J5xiUYq5Ykd0Z+KpeOGrVny+w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789063452;
	bh=DkajA/mQgZ0KfZTSRKqneth6RYOjeYjCEqzG3Jc8itg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=D0o2na4SmcmAOYGPVqrjfqPf5y2GoOQ8U4mLLl0qJQ4dTeBoGemQ0ITFW62775bZn
	 6iBLhYf8hj9sLZ7XI2s4RAAKlMhw3DmU1KWzQcDihjNtf41S6GeC0mzxP36zxVQIgw
	 0q8TGTsHZaeD7hoVekFiXayrO2w9uu0/JpYp1Nmy8gMDd9Noy1UODZdGDpoTHzOuV5
	 r0OdjUklofndpAhhVJyXelWX94lsr+qWRsHwu89BsoordCHxcgHvpGqSwb14ynbLYY
	 1ZGDypzzrsyRpYqwCBZnMxdvBbhGlk8FHG7mwPBp23wk8f+94retRTVaiKjbw/d3QE
	 AtDITBq32xiXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 620E860BCA;
	Thu, 10 Sep 2026 18:04:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C01A49D
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 18:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D15C4038B
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 18:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nStEybCWsyec for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 18:04:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0FCB840387
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.117
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789063448;
 b=knXdJemnESYCoKcsBzek6rlEQePMc6Th0TOnMga3zxHaa92V9QAb3ZllGMG5zvcizt9B
 rxNKufZVWKGBu2VQ2ws/jH10UoT6tFk8IqDbHxzDcluEMDhRu0/uyspS0UO7ZjglGbQZW
 SwwVHBiq2rWwlsoLteHifoH5lZI23IhhrtijZvhsrVU5sDLpw8cfmX3GDeQT9LWzGMIOs
 Alr0SoCJ40taRpTZgRypuOgVKBwgb88i23Cd2ueA6/0WqfNrLizhDRbkD8LUkMTL5immH
 t/8oe4wj/YCWM+P0sbHP7O90ncHReJ66eC2/2Y8KeH6Lznb/iWqCaJUwZNvyp6R62GQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789063448;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-CMAE-Envelope;
 bh=Q4P4f3FUpJoFVdaGr+Zd8S/WT93yAmQE7IXjC94mdLM=;
 b=gVwZXkrWuRlGmgucdZKag401Q5RlwmjwfEG9QbP6JkVk6U0yJzswgKrAHxvp153tdt9e
 p/iQtaX3MuTrQceR644FnqjT99nzPcK9ufKXgASET+MaMi9Rxr4guDWP5/pF97yhn+1I2
 ddGDy6SZ85W651nxc8jWXYniNk9jgAwlwwjAlz0ime/NondASho7NDdSHSNkjs3CgCjYo
 pZwi4snzVtRpXRafSp5CxZUuDSv7G1seFA26kqbJet9W+N8yWvaOLgeohM8bfW3ibzK90
 sHorxxH5hSJoHGxZM8FsOcOitsMRR56OK4UWDXgkJHiNdHgek+d35yzCsfVCeFeIvZA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=benettiengineering.com; 
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b=V8oPqgFn; 
 arc=none smtp.remote-ip=62.149.158.117
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.117;
 helo=smtpcmd03117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=V8oPqgFn
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FCB840387
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 18:04:05 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 4j7yx6EIBwNy24j7yxoFPl; Thu, 10 Sep 2026 20:04:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1789063442; bh=CWvEzx6LGvc/NbwzZxDc+ddRgfmyyqCSzQonDgsV1Ug=;
 h=From:To:Subject:Date:MIME-Version;
 b=V8oPqgFnkrenmhEq56IYh5d0cbTVtA+LebaZdARRV1aFw783O+YX7k4vRsANZrUGN
 7OeBa0yYs6s+wSmX1Yz2Iuexy9Ukz+1P1s5sEXJvJPS2alhjvBXL++fDhZoaAqfCS2
 3UhZxulgIiMpa9l293U1Jkj2n5TV7E9ilT/+UfRJ5AQh8gvCXz3O3crxUYfzVA2YnI
 ZwoZxodiNgOvIaiiRSWSYiFnvrlcJ+ZAXPMAzY1gNKC1BrYRYMtRsbnwHImXmjLoh2
 oHnzhiNLfD7SW9hlw4n5alVNlK2QanGCIiE0424GJkQetNwzfqMhOkI/cpuf8yvRuT
 PpCdhehWcvvyg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 10 Sep 2026 19:45:30 +0200
Message-ID: <20260910174530.1421838-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDasqZWlxNcxy1LgIS92MxyAZTCrW5nCePer1/C4fauYfjaWyu+rJT4Gt50gDCpC7aNmd4gXHdn0KElBCsfR+Who9B48uBSmTouSTEoSP1cVtCgJ8jOs
 OhJW4Dd3Vf6wNFNe9RBUKNaSJ39QiH920zkbLKSfjRsz33AXJfEz65nnKG4jky+nTi+Ai8OeEdjxF6fdvmGighPzMFPY7BfsO5nSx3iP2o9zA23fgwVWigA0
 XAZ+3PJ1zCHKzdiiDeE7Ok2R9s7Cn0ip5L+QhMklDrU=
Subject: [Buildroot] [PATCH] package/libfuse3: security bump to version
 3.18.3
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

Release notes:
https://github.com/libfuse/libfuse/releases/tag/fuse-3.18.3

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libfuse3/libfuse3.hash | 2 +-
 package/libfuse3/libfuse3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index 0274d179fb..ff8132fd22 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  55a97cfd8661a9b42ff0123b44af52cac49feaec36987f4d968c046f93b42e1d  libfuse3-3.18.2.tar.gz
+sha256  a26f46edc8db4e2cbf1b46d36d3e18ea208871671e56434d9ceb8f7887a690d2  libfuse3-3.18.3.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index 5492d997c3..fed8ce9b83 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.18.2
+LIBFUSE3_VERSION = 3.18.3
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
