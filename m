Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A16DC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 15:49:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C1E960F35
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 15:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C1E960F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1E1040374;
	Sun, 25 Jul 2021 15:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ofsOhcUBqahs; Sun, 25 Jul 2021 15:49:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C761340369;
	Sun, 25 Jul 2021 15:49:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C0951BF41F
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 15:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18A0B6068D
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 15:49:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ADWbI6-21sEp for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 15:49:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 691EA60625
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 15:49:48 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id p5so2834554wro.7
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 08:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bX23i7Vb7cwlR42ADZreT5okLdGMJrZmJU7XeUuf8Tc=;
 b=pYO74FAkNMGaVXiHD9hTLzD87Jy35Wcm1fp3iaDi76s17pykR57GMih+YK+jH+CVC/
 8OdnngZY4QOEmyihFrxZ64FkW9Ss6c2nBpBVPLV9/Aeydbot5HodCHBglGicuGpY6T2W
 WCnby1JtcgdMUW9hsp/gFlaYX78h48BH4mWRScXjrJJ/8qb86THpMKw8ZguOoaMwx6Wf
 xb2pMYXQcNPsyvVILAvrs14BnOnHR+L3kKYUpM0ZTD94s1kkubSH7ssGdBzF1c0fXvg1
 tAPoafnQloz8zF0AEov6TUHmDfBS7Sh7Z9uA212zAv4qAV5qp301G2xm4E65HBYtUwCR
 HNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bX23i7Vb7cwlR42ADZreT5okLdGMJrZmJU7XeUuf8Tc=;
 b=CKooh1Dnghn7pEG7kNjyg5vWUPP02mIkn+MYO2SnezGbHmW0lUucMGSIcz9ofDoQHO
 ZWc5es6+nYg8rZawzoT63xFZFlaCo/5YblJL0LLdo1+1L8WrzoCurFVt/YH8OxDFYmdp
 oh5rjd8sRUI70G1E+drGr+r4qN/jPSkWz36EymEaUojuDQ/n2ztwUBFxq6DH+Q96N//2
 IR6jMvHS55eAyNm6YJvVC5OBN92uVDXoHB3PBU/P0685LH+95ek8LsYzLqO+bo0HMZco
 7t0zglncAqureKITJ07vPQJWV0k/hPO6U4xLYyrXGIwLL8RfDwyUn0A2Rsk6wsjnYFiw
 lYPQ==
X-Gm-Message-State: AOAM530ahgVb1MZQ2g14WQfbOWD6SPSQYnfmxHjDn7japsP0Sw0NG4/G
 VpFDhze7g8fW0R6BOh5Tt79h52sSb4Qs1A==
X-Google-Smtp-Source: ABdhPJzPwPVFrvR1ESH6YOW1xEb2dJp0XQ7JYeZnXpQwqfJkwkioBaXQR64OG+86GJ0dNT08ODCl8Q==
X-Received: by 2002:adf:facf:: with SMTP id a15mr14898947wrs.39.1627228186398; 
 Sun, 25 Jul 2021 08:49:46 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id n17sm7728868wmo.18.2021.07.25.08.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 08:49:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 17:49:41 +0200
Message-Id: <20210725154941.903468-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/sudo: add SELinux refpolicy module
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SELinux support for sudo is added by the admin/sudo refpolicy module.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sudo/sudo.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 57c2292506..df09161957 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -12,6 +12,7 @@ SUDO_LICENSE = ISC, BSD-3-Clause
 SUDO_LICENSE_FILES = doc/LICENSE
 SUDO_CPE_ID_VERSION = $(SUDO_VERSION_MAJOR)
 SUDO_CPE_ID_UPDATE = $(SUDO_VERSION_MINOR)
+SUDO_SELINUX_MODULES = sudo
 # This is to avoid sudo's make install from chown()ing files which fails
 SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install
 SUDO_CONF_OPTS = \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
