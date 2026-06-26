Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B925BC43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 20:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45F1660F05;
	Fri, 26 Jun 2026 20:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id py2rCVAgVeJ7; Fri, 26 Jun 2026 20:34:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AE7E60705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782506061;
	bh=lFIvZneqvi2jIcmD2j5zJgcbSU/8vKMQpJk17e6o2wo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rRiF54XJCYeiO0xbhprlQLnzfP9zztwFMRGfEYwmx3Okuh/G8iOODsNVQz/13D1B3
	 aEdtCewkVJVXst2Cre2AVP0I5qkqyrhrKknYZdAchjhH2DuqFu2mZ/CwYOhrbsUCT7
	 yK0K0dq0R6MjsBa41XkHcdazJjYtKUvJC+YFtZxI4R36B/9IVzySUcECMxnGdwh0kU
	 3nHSXD5RoxH7DqlekDj0kvDXe8vaH/7W76pIUyCUO0U1TcFjnhtReFd+RZd2FmFHOu
	 v6ESSCg2ik2Ke/JOoZHUd0oOj2DhwVsBQaKTV/MBa9u8tn0fuIBaJgQvOCtmmWq3am
	 WvH6VWALSrsIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AE7E60705;
	Fri, 26 Jun 2026 20:34:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F17228A
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 20:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B31E81775
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 20:34:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1cc-GN4Xnpxi for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 20:34:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 887CC8174C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 887CC8174C
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 887CC8174C
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 20:34:18 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-49263703c6eso12520665e9.0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 13:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782506056; x=1783110856;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LPOT/Lt1LaSAxBmVZilEl4jOGZmOhQ0IK4OMfuXi9m4=;
 b=L1r4/oz3AGebm7HmFvX8zud9aEOQkYnhuHjYKWsgmEEgHOTzHEXavw3PevqVnQNG8y
 qlTNJmgPOgJOLqxesK918vcgzeaa0VPDKuq//33VoxpZzFhqsuSG0gg22SXQCOtSIMov
 2ynpjfe8+3zETI0hHynywi38IN2nyBnbQg0X0RnSSN95QW2WWY18na/gZD9RUby0K+CL
 Rk71pxiLAgAGgF2q8LLt6exp2kMgNybPbNwlrYrkXqgoOBPLb/2W2o+uPJ4Gtlhjtt1P
 nuOnjCV0H4c9DekZFlkDieLY8wvKalJYxCsnrPFup5ISGrZVyzj8tEPmf/csdC9AJU/e
 Clzg==
X-Gm-Message-State: AOJu0Yx2oNrrrG1sOTZ3BAQvZrPuIR5Lc3iqa3QT7lBVaGogpXt5+64z
 F5qbsRlnf+EyhTns7nwffMeoh3u4pqMS4OLDlsGBzw7DlcZ+Kttrz+vDQC6kXZbuyiB5nXncfF5
 CfLPc
X-Gm-Gg: AfdE7cnCuCxOUn4RdI8LNfAuIIUi6tg2j1w9B4Kav3xgoRckC1R8T/VD+jhLfsnjCH+
 zV9GO1WP0eYElgsoSwVXgrbjP1bghv6zv5glcm077g8wuUedQHGt81Xhe4zp55fVzHubr+5hELn
 CbqBNtBgZXOpxrA8staAciLpokm7IFNhMPlvMxQZ45UxCooWp3zuiRRxJ1oOcD/XUJI2kaMuQP+
 WwBdxX7V3iVRXFIcmHilGA/R2fddKiauBBqYmse3bztd7s2hsmQ920MJMW+bKr3d022ZwM0y4Z2
 C7Wvm13SjDfhOLhjyfBJ3mDk1Kd9NkSOfKvXtGYAB5OvMpHNomMeVD0o/belALduXH43FeCP1r9
 p4tO7NHYH2vrCHrutDzllUgWcTV4bqDiIHMG/KFK1g4faYZiZCpRoMN5yZiSxNdGUP92m5zCMLE
 yM+O5s
X-Received: by 2002:a05:600c:820f:b0:492:6f96:b60c with SMTP id
 5b1f17b1804b1-4926f96b743mr39250395e9.21.1782506056246; 
 Fri, 26 Jun 2026 13:34:16 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49270208b29sm30269655e9.10.2026.06.26.13.34.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 13:34:15 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 26 Jun 2026 22:34:15 +0200
Message-ID: <20260626203415.303763-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782506056; x=1783110856; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=LPOT/Lt1LaSAxBmVZilEl4jOGZmOhQ0IK4OMfuXi9m4=;
 b=dB+ykWv+QP01t2ZJ5dZiksnDLkGEp2Gm3pYIQxC0FAZ3n/pBKvyFz2BPd/s4JUE0VM
 X52YFpnwH0WxPL2Rj3jlw+I10cxnafYQSVUIZ22w2iaWcizh4Yg2ecMaB+eWrntJFgwc
 h7Ga6RGl47IYOUZSEIxmg/Ya049IsZfRafoI2Z2cL/of98M6EgPpRfrlMbY7kMsAwQPN
 ga+SWtJJw6UHCx/ZfI/cdEifW79hxUcadXWklbax34Bl/gTNConfhFoU4IYnWjlam59z
 Fe/2KVUmTYihqiMApiBTH1z4gfBUlyDWW8hCcDWc9i+2pN4dQobdVHFnWrCh4NbDTrAa
 Pjzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dB+ykWv+
Subject: [Buildroot] [PATCH] package/imagemagick: security bump to v7.1.2-26
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the changelog:

- https://github.com/ImageMagick/Website/blob/main/ChangeLog.md#712-24---2026-05-26
- https://github.com/ImageMagick/Website/blob/main/ChangeLog.md#712-25---2026-06-04
- https://github.com/ImageMagick/ImageMagick/compare/7.1.2-25...7.1.2-26

The bump to the v7.1.2-25 fixes the following vulnerabilities:

- CVE-2026-53465
- CVE-2026-53464
- CVE-2026-53463
- CVE-2026-53462
- CVE-2026-53461
- CVE-2026-53460

The bump to the v7.1.2-24 fixes the following vulnerabilities:

- CVE-2026-49219
- CVE-2026-49218
- CVE-2026-48994
- CVE-2026-48734
- CVE-2026-48733
- CVE-2026-48724

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index fa46fc7cde..2330507566 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f129f7d87fc21da453d032dd291b80ea13faf2497f13ef8279d97759ed7d5c46  imagemagick-7.1.2-23.tar.gz
+sha256  d63594e334e1c410f600fb9370d78d49e4dc6f315722ca4ba083e864e5c354cb  imagemagick-7.1.2-26.tar.gz
 sha256  131447ad0099069beaa32acf1700716eea294a5bdf936d8211d7026b1849e5d4  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index e08f0a803c..1cae5c83fa 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.2-23
+IMAGEMAGICK_VERSION = 7.1.2-26
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
