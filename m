Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBE8C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 22:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C88A4025F;
	Tue, 25 Oct 2022 22:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C88A4025F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6m6CKx9dkLAt; Tue, 25 Oct 2022 22:36:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E107040258;
	Tue, 25 Oct 2022 22:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E107040258
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4F4D31BF5DD
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 22:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 288A940258
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 22:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 288A940258
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rzYUvbRArYMb for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 22:36:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E58CD40257
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E58CD40257
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 22:36:42 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id 7so4828381ilg.11
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 15:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=upfCbKsCidj2utxiod5VJbUPkQwgv2yiDxaSINqO4I4=;
 b=gaZZA2aU26t/Wo788PX2f9C9fve8bba+Q3wUgBsD+qRwZFShsYamEkt6F34j+SWU1M
 leZpIzUVtA//WEnAwRtsXGjYOo3acb1UQHvRt/0hsea87pKGJCIYtOoZL1fk3UBTGaW6
 MfBSiup3keyb1CReSSJmlOsnRZCf6tep5l2kImPr9/JTV1fq53F16CLAm0/XCHHLp6cD
 SmDbJwDPgTtwQ+FQneh3Ls0+9F6+oISqarAQo6QaBwxp/ZO08tzDhLQPy/PEDCS8tR9I
 K/PdWQj76pDMJ7WxgO/o94fX2IZkpV0LDvPg7EwaHWoMHX3U0EvBn4Lk7F/5qd/+hwLX
 /ZGg==
X-Gm-Message-State: ACrzQf3MqFP/+7lIJttFny0QKY+9i5ap3THmBHA2aw9mH//fSVU5G6tr
 Hi4MZzeJP/G4TbLAZEvdUT+53amH5El2Ag==
X-Google-Smtp-Source: AMsMyM5rAKdmGPg/nZWnOOtHcx2gFtVy7wqpU75V5vlJbwhjD0p7SxdQckHU9OgNgxFPqXB9Rwjgzg==
X-Received: by 2002:a05:6e02:1785:b0:2fa:2428:a37b with SMTP id
 y5-20020a056e02178500b002fa2428a37bmr23324208ilu.312.1666737401610; 
 Tue, 25 Oct 2022 15:36:41 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 e7-20020a0566380cc700b00374fbd37c72sm1354731jak.147.2022.10.25.15.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 15:36:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 16:36:39 -0600
Message-Id: <20221025223639.550839-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=upfCbKsCidj2utxiod5VJbUPkQwgv2yiDxaSINqO4I4=;
 b=qrVHEAeu6BL8bX3S7oJOS6D1X/q0eIF2muWR5v3O6jUijWfDdI0E5Isv/HKOhAYyts
 iAEPubsmxnMMXEjmt1c9cq1vRFSxzZwjaonFIGsCLvPx80fpOWjfkQxhUCwDF3gA+AUY
 pCTfzq0SotfnegF1DwhnuSyO7Ra9W6nhTt7B748eUE6yZD46SfaQayDz4LyQZ6U+CCZ4
 NAInfQn1uB5yd8JE9xDGeRVTdQqYoSyOoNvoDv9KsiABN2CHOc/d3YTQB1tCKwAkOdG3
 yOlyl2g2uNjy0E2wcT+3ipPOXzIm0yDGmUFI1NpGnVF2csHdKVp4Tcdd7DtJKeiLELJV
 yJAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qrVHEAeu
Subject: [Buildroot] [PATCH 1/1] package/python-bottle: bump to version
 0.12.23
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bottle/python-bottle.hash | 4 ++--
 package/python-bottle/python-bottle.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bottle/python-bottle.hash b/package/python-bottle/python-bottle.hash
index b1cc2aac20..58bc52e3cb 100644
--- a/package/python-bottle/python-bottle.hash
+++ b/package/python-bottle/python-bottle.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bottle/json
-md5  4934ad7347eef30db669ccd05283a5e0  bottle-0.12.21.tar.gz
-sha256  787c61b6cc02b9c229bf2663011fac53dd8fc197f7f8ad2eeede29d888d7887e  bottle-0.12.21.tar.gz
+md5  d07df795cd4baa596ee803e964ba77fd  bottle-0.12.23.tar.gz
+sha256  683de3aa399fb26e87b274dbcf70b1a651385d459131716387abdc3792e04167  bottle-0.12.23.tar.gz
 # Locally computed sha256 checksums
 sha256  d0e7211f1c3c1a1c56f39d18bcb07f27f480c8a9552617756dda3a335933b8a6  LICENSE
diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
index ffea59f38f..e1691972c3 100644
--- a/package/python-bottle/python-bottle.mk
+++ b/package/python-bottle/python-bottle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTTLE_VERSION = 0.12.21
+PYTHON_BOTTLE_VERSION = 0.12.23
 PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
-PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/95/e3/5749d7657b6fb38d65afb3c0b345514a783de7a9feb4fab594fa0bacc2a0
+PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/7c/58/75f3765b0a3f86ef0b6e0b23d0503920936752ca6e0fc27efce7403b01bd
 PYTHON_BOTTLE_LICENSE = MIT
 PYTHON_BOTTLE_LICENSE_FILES = LICENSE
 PYTHON_BOTTLE_CPE_ID_VENDOR = bottlepy
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
