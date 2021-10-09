Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C23DC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:57:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EF4860F9D
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2EF4860F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB4FA8343E;
	Sat,  9 Oct 2021 20:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mOn1dCQTn4IZ; Sat,  9 Oct 2021 20:57:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4515883419;
	Sat,  9 Oct 2021 20:57:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0E2A1BF5A6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B105E827DE
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LxgFSRoxTqCm for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:55:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF0A9824D4
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:55:35 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 nn3-20020a17090b38c300b001a03bb6c4ebso7929296pjb.1
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 13:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b2U8d86TLRwuLtW5qCss/pjjsDlGOsSI7hcAff/5nE4=;
 b=HAJ/W4JXxxdovBOp/7fVgrPh0q5HQ80JxXfkKYxtnbibvUNODJ19CuRjOF/49bkKXB
 aFiBQi0MBGf1kaU3tnp9gf1PHsws0X3h9JNTcveJicg2HY0nfe9z0h8ZiqeGeXYFK/uM
 gKh6/ahjXPPXTadArOQKkIvYyNxvPR2wk1gj75MgavW8bwdtMcN262702NZg0Dct63F/
 pjgnZno03D4wDEFZVXJSyrpNGqkN4J0BpqJiQ816KXt45FTBIkLEN2a8Jua9Ts/0IkFS
 jIcAu136UaCNO0CczQfk7jl1FYIHulRWWbMR7EPiZNtOkPz7KayLbc4kdLYStGyRaqY4
 XxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b2U8d86TLRwuLtW5qCss/pjjsDlGOsSI7hcAff/5nE4=;
 b=3q5j4EjPnntqVB5laebri3srVeZ88FseXtwuA8uQqfL5OrMeYdPmKoqVu6jENL/qXY
 ZcKO8HCDj/1gKy5L/e2LcE76I1FNdB8naG3IjZtOCkwXFdNuvamLZdINjspD4Pn+HZEH
 uGeVC4kaOMTozXQuSOLwa73CV+ISSFtqvkq3fuOT0OHoiI05n0nvUusjZoxVjOPC7Fs0
 W4lZEC+iozaNtgo1i9V50fl4ZzHmmzqSk+0hWw2vcya5UZR8ZULd5ihoI3uSqdzXQaB7
 esAZM0760reX8v+f6k3pTMqtXNaraFAEUH0AK/3a9GajedbaKQ4J0RQ58aYNyR1rHGR9
 ex8Q==
X-Gm-Message-State: AOAM530isVVHANOAmi3p0nTJRKoWeZhznFBI5k2IByxnKJegAYTm7+Bn
 LbEg86xCcCMclBq4PKMchaueZ+gipKGItw==
X-Google-Smtp-Source: ABdhPJxZWpp7dByznEjlCd6PFHI5larrsHyAj/PaN3+7eV6sQPiz3MB7p+5B4CUuB2z6QhYh85Y66g==
X-Received: by 2002:a17:90a:1a0a:: with SMTP id
 10mr19881527pjk.85.1633812935289; 
 Sat, 09 Oct 2021 13:55:35 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id qe17sm3125765pjb.39.2021.10.09.13.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 13:55:35 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 13:55:11 -0700
Message-Id: <20211009205523.3137859-9-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211009205523.3137859-1-aduskett@gmail.com>
References: <20211009205523.3137859-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 08/20] package/python-lmdb: bump to version 1.2.1
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/python-lmdb/python-lmdb.hash | 4 ++--
 package/python-lmdb/python-lmdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
index cb28536d3f..e7b8ae3455 100644
--- a/package/python-lmdb/python-lmdb.hash
+++ b/package/python-lmdb/python-lmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lmdb/json
-md5	507049767b995c3c6a93b3bd97567c71  lmdb-0.99.tar.gz
-sha256	f9eb844aaaacc8a4bc175e1c1f8a8fb538c330e378fd9eb40e8708d4dca7dc89  lmdb-0.99.tar.gz
+md5  b8f4a2cd1748e8a5f5e352d1cb3d4350  lmdb-1.2.1.tar.gz
+sha256  5f76a90ebd08922acca11948779b5055f7a262687178e9e94f4e804b9f8465bc  lmdb-1.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256	310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index bf98ba19c8..33c48cc8c7 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LMDB_VERSION = 0.99
+PYTHON_LMDB_VERSION = 1.2.1
 PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
-PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/3b/66/aa6f3a3e338a3ca263575ce6f722c2fdcd21039a03b55c722e0ae0b216db
+PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/2f/df/3aea5279753cb8ab0c96dec43106e24f388d4179d5224f6d3e652016c095
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
 PYTHON_LMDB_SETUP_TYPE = setuptools
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
