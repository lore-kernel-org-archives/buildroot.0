Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED59C4332F
	for <buildroot@archiver.kernel.org>; Tue, 12 Dec 2023 21:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 818DA81E04;
	Tue, 12 Dec 2023 21:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 818DA81E04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TZhbFr334Ecp; Tue, 12 Dec 2023 21:00:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C123282AF8;
	Tue, 12 Dec 2023 21:00:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C123282AF8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2EE641BF271
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 21:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14DB541AEF
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 21:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14DB541AEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A4unShaqRtmw for <buildroot@lists.busybox.net>;
 Tue, 12 Dec 2023 20:59:59 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2832641AEC
 for <buildroot@buildroot.org>; Tue, 12 Dec 2023 20:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2832641AEC
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-333630e9e43so6088913f8f.2
 for <buildroot@buildroot.org>; Tue, 12 Dec 2023 12:59:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702414796; x=1703019596;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qYobueY/+GKn2vs7uKame9RrhKpNWQ8mozAO7NEU3A8=;
 b=SuXP+Rh0CgkPEjjsJr30X0oEu6PuZaxw1gVCzRlIQ+1CyYDs48JCg5eb/thkILmfh5
 6v3rMAZGLl2qVIws0ZngZX8rPoqUqTl2TPMM1iI+aHZHQGPxldtJKDHm/td0TpYBe5zj
 XsHACN/06LnvB1SKbAQFi3yGH3l4B+8RfL0qk5j4ZxDI2guFBVV8xVjBiarVnZiiP8XM
 Do6RuEi0+mBzTcaZca/sdtHJaHcZkpUSYW/4D/iTREKlD+akmgvi6y8QNTyczENsOsMM
 94CGdoZDgIyoc1y9cHkhzbrZnHeIOSDt+agwh/j0rwNSlOKRFtZ6X9E7tnY7Ac+UYBq8
 kjqA==
X-Gm-Message-State: AOJu0YwxoXJabVBymlt4tu0kVxL/vYS7uKYBrA+eb7eCO0jTbKvq420O
 y7Bp5uoHd2fXkhM14ghdzwFt8h4zK8s=
X-Google-Smtp-Source: AGHT+IEIPuZirbX+vMnoN+IjuS0Cvty/fABcS6CK5q8ZHytH5U4h5buO8CzGPGb2BFLqfdpbxAK+jA==
X-Received: by 2002:a5d:595b:0:b0:333:2fd2:3bf1 with SMTP id
 e27-20020a5d595b000000b003332fd23bf1mr2386007wri.170.1702414796042; 
 Tue, 12 Dec 2023 12:59:56 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 c4-20020adffb44000000b003362d0eefd3sm2183268wrs.20.2023.12.12.12.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 12:59:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Dec 2023 21:59:51 +0100
Message-ID: <20231212205951.280961-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702414796; x=1703019596; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qYobueY/+GKn2vs7uKame9RrhKpNWQ8mozAO7NEU3A8=;
 b=Py4vrusuPbYdteAs8C0vzgi58B9bwHTCUFkrzqWURjb1ICog9MiFWri6utz4GXLJxQ
 JtrOJ+xnKtqF0dEQhMFyh+OF52FCJmXiouZozSypQVRZxJpnM8wJTE0g5ABO08kXcR51
 MmLqROnparCsvmXNNuYzAiuATpbN4kpHrc273HgtJzyIFR4fzljcifzlB9eQmjBo8lJm
 vra0iFnHKDr6TmAjIV6y3LT/0dgM0lcD7EN0EJ/ODck78O9KoiKPaFnw6QyAgpvPpjcl
 3+70cDAcQPsfeL6FDNn4Xr+n2aeEn3mHSx5kYWlQCfzegLZcYamNeONh1GagphQWOox+
 zGtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Py4vrusu
Subject: [Buildroot] [PATCH v2,1/1] package/libldns: fix libressl build
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of libressl to version
3.8.2 in commit 21eca49ed5110872407b76ab9337d2877c4cda24:

./keys.c:167:35: error: 'ENGINE_METHOD_ALL' undeclared (first use in this function)
  167 |         if(!ENGINE_set_default(e, ENGINE_METHOD_ALL)) {
      |                                   ^~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/37cc05b78a7004caa1b45d896121f059a4f8ca00

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Disable gost without engines instead of patching code

 package/libldns/libldns.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/libldns/libldns.mk b/package/libldns/libldns.mk
index 06564e3d9f..d6af6a2b97 100644
--- a/package/libldns/libldns.mk
+++ b/package/libldns/libldns.mk
@@ -17,7 +17,6 @@ LIBLDNS_CONF_OPTS = \
 	--with-ssl=$(STAGING_DIR)/usr \
 	--enable-dane \
 	--enable-ecdsa \
-	--enable-gost \
 	--enable-sha2 \
 	--without-examples \
 	--without-p5-dns-ldns \
@@ -30,6 +29,12 @@ else
 LIBLDNS_CONF_OPTS += --disable-dane-verify
 endif
 
+ifeq ($(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
+LIBLDNS_CONF_OPTS += --enable-gost
+else
+LIBLDNS_CONF_OPTS += --disable-gost
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBLDNS_DEPENDENCIES += host-pkgconf
 # missing -lz breaks configure, add it using pkgconf
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
