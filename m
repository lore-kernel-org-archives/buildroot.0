Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EB1C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 16:38:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C255061074
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 16:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C255061074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8DFCC4017C;
	Mon, 27 Sep 2021 16:38:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vgPQUsIXAG50; Mon, 27 Sep 2021 16:38:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBEE840247;
	Mon, 27 Sep 2021 16:37:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B66E51BF955
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 16:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9EC81406BC
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 16:37:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N54TXJfoJee7 for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 16:37:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9716406B2
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 16:37:56 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id x20so8353602wrg.10
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 09:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZYzZX+eG0JT/pmv6t8z8OItcbcLKNIEsjFRugRaciWA=;
 b=BdcxqkmtlhihwYacOnOg1lQYAb/s3a+Td3w7FrSZJQWn5eG4tZAfC8wBPtmyHdLSeJ
 3UPk7w1JjutsdXANQynF577ZHp5j1wYAO79b2aDy49t9j+wgwJqKtwE/h70fKLt3ROHl
 u+sAMngCa+3XVkI1NCa6paLV36v7aBBxswtiiGuEwRRqo78jkzopROVtU69RWTaHXBGX
 s2pcNg85P0/JycZOqX77eNcrMWmGV0e4O15AjPM8gYlzELFXbQogDy/vaERj1qHpXmlR
 +lhTncNeaM7+rK7tifqoQvPd3f83yonWMLtTWkmfDS8+1uZDlYY69eC9x1t2SXr+FTEn
 79Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZYzZX+eG0JT/pmv6t8z8OItcbcLKNIEsjFRugRaciWA=;
 b=oVwQYL8RcCLy9WIdWMsS6ZRCan+KxbQJn3Mi9qE1h5Lj9EFim+Jrfv4PRaOHxgfnIQ
 0/WlUXRr8PdpHDBgN82tkUUTgAVZQKVC75iHbYA8dQ0pKRg9ZDvjjYAHNsxZFf45Zl6Y
 Jh9Niu5mPwpAM0l62m4o9TF8SbrHXzbZVQltw3RyGVuTqMEqqGnr/Y0UvBA+eoK3c71s
 xOhy189x21aQnEvMI88lx0I8C2Ka5RZSh6t6T2/rUMmGt+zvbDBx7/3RmVhJMP9lVwdJ
 6+4OQdvkqctEiuql8f6NC8ccLVEhMR7NitJ/B3pYiVuIMKmgC6SM8zRVSZuW1zr9szBQ
 l9lQ==
X-Gm-Message-State: AOAM531p/XOXsCyyfa0Rjs9GiCbnxJyXpTnAuQZ3dWHPzgImgq6X7oAV
 jfOsQ/p93N8z3zICEeAds9IAjrGXRso=
X-Google-Smtp-Source: ABdhPJy2hyxAbbcMIyz/Pvmf7Ak+3ie3TdErkdghs9n2lPI7MS0LBAowCWceB1CmLJ2NsIhg06cAEw==
X-Received: by 2002:a05:6000:1090:: with SMTP id
 y16mr961824wrw.208.1632760674580; 
 Mon, 27 Sep 2021 09:37:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id w18sm1815048wrt.79.2021.09.27.09.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 09:37:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 18:37:27 +0200
Message-Id: <20210927163727.1472686-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/wget: bump to version 1.21.2
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://lists.gnu.org/archive/html/bug-wget/2021-09/msg00005.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Arnout Vandecappelle):
 - Fix tarball hash

 package/wget/wget.hash | 4 ++--
 package/wget/wget.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/wget/wget.hash b/package/wget/wget.hash
index 11071566aa..7f89bedb88 100644
--- a/package/wget/wget.hash
+++ b/package/wget/wget.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/wget/wget-1.21.tar.lz.sig
+# https://ftp.gnu.org/gnu/wget/wget-1.21.2.tar.lz.sig
 # with key 6B98F637D879C5236E277C5C64FF90AAE8C70AF9
-sha256  db9bbe5347e6faa06fc78805eeb808b268979455ead9003a608569c9d4fc90ad  wget-1.21.1.tar.lz
+sha256  1727a330a86acacb3e57615ce268f5f29978bf7adec4abe6a30d370207bc91b3  wget-1.21.2.tar.lz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index ae036478b8..f30fa39917 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WGET_VERSION = 1.21.1
+WGET_VERSION = 1.21.2
 WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
 WGET_DEPENDENCIES = host-pkgconf
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
