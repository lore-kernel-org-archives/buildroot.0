Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D611BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 20:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F1B34062F;
	Sun, 12 Dec 2021 20:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lYhMzTrRI0S6; Sun, 12 Dec 2021 20:35:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 914DB40192;
	Sun, 12 Dec 2021 20:35:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4156A1BF41A
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 20:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3966A85A0D
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 20:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qjQyMyH9pQKO for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 20:35:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98C6985A09
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 20:35:42 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id o13so23849258wrs.12
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=33ytuk3Jw8Ui6YkJcEtT+4SsbHTHcS2Yv+ZINQDLyEg=;
 b=fKsVBUeqcaK1/PkI5mMctTrxJp9Y+C9kfPXlaj9HjktQkMGOQf4OOW1/lpwpwqQ3DL
 kiFjDXNxzlleo59X5MQ1Rym4Pt+I4mm33gLIV0hlDAxVKXFow50iJeiqAJlM7NNjpFnS
 uu47VT0hGMmC3RV1yDYmIF4zfPtKuDud/gRk+pfoZfHiNDvHUhLig859OJ136Rizt/+t
 Ue8b4Q42NwKsEwHtGw71eIYrkFRFkMmKj/Jb1v2hYc+SLMrIYEhUfDDuDZ+sTO4AonNM
 coVOgC0WVGfJzPTquwYAqB9BwfhU34uPAp6wQjc9TGVbBfx3uJ4TQwbSjWZYpIbh3M8Z
 H7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=33ytuk3Jw8Ui6YkJcEtT+4SsbHTHcS2Yv+ZINQDLyEg=;
 b=489KZFDBJH2Wsx9h5Tq147Aqozak1ZC6jLi5UytwxNvFcx/2xVnwDHIKQ+M7TQEg7r
 Y2l5/SzhbRIKheW3jxrdSJ01srIvNYrbXWXSeBzbacJGxKq7EkyDcdMaBNERMb0h+Zuv
 Gk9fu4rgV1HIn5s/NakCJks9tR3EN3HQEKDu+BBIExEe4Q7TH5HyMEvahQxxRbNe4axP
 sFC8QgQMpQdiTx+wNmgXr2h5L0aG47RQEl68eSG3HVjwFM/md57AyRRHEwVYs41Oi++7
 4xP2qqtRtlejojC2hHoqwAlnSYHwxg3zqSqHrJOS/Jx9t+GX72API7CEC+FMfrhI/XjC
 24dA==
X-Gm-Message-State: AOAM533kGWpl01jtKh/jCOh4qxULQONPLNY0fGapDv9iITns/S6Ahr9N
 12B+4As11msRMMUAAwK43ByJic+me6qL7A==
X-Google-Smtp-Source: ABdhPJwSgVFBnDRG5zypZt2lPC5Y+adWcELmgB5xLmm8xfjfe/iG6EdO4ErCz7vWG3HymWoUu8EI+g==
X-Received: by 2002:a05:6000:10cb:: with SMTP id
 b11mr27410122wrx.23.1639341340552; 
 Sun, 12 Dec 2021 12:35:40 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id c12sm6493227wrr.108.2021.12.12.12.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 12:35:40 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 21:35:27 +0100
Message-Id: <20211212203527.944692-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gnupg2: add SELinux module
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

Support for gnupg2 is added by the apps/gpg module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnupg2/gnupg2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 32c22b8257..906b79e0ab 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -11,6 +11,7 @@ GNUPG2_LICENSE = GPL-3.0+
 GNUPG2_LICENSE_FILES = COPYING
 GNUPG2_CPE_ID_VENDOR = gnupg
 GNUPG2_CPE_ID_PRODUCT = gnupg
+GNUPG2_SELINUX_MODULES = gpg
 GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba libnpth \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) host-pkgconf
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
