Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE048C433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 10:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BD9E404CD;
	Sun, 23 Jan 2022 10:42:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8-X4IG4mnqR6; Sun, 23 Jan 2022 10:42:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86C9B404BF;
	Sun, 23 Jan 2022 10:42:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96D371BF47D
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 10:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EA3440873
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 10:42:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WSLBESvPTbq1 for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 10:42:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8803A40554
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 10:42:39 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 r132-20020a1c448a000000b0034e043aaac7so8279612wma.5
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 02:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U5YvuDlMeIqPh2yguUuWOekO6XBhADgyQNDxRqWz3sE=;
 b=XHkCBXU7ZmOvAlXPmh6ZerFnfO8s7T6sooF8BcSOq3AJevbpTaDpsP/aYAwRIKLvyC
 QN2bY8pR6ZLf5gNEbapVSRnfzIqRloOUniwY4wGDE4naVN26LBT0KAtgsmpXU5W03EHK
 v3/CI0JPntj80s+9YHmii9RmxoyBdJte+L6aDcN8JrQVtNa54Y7OGHuSDnMWTNxqL6VM
 yRW1kU4s4MwhLHprrCEolU7KRDP8ROY+a4W1JspX/NuUaMhEY+tldASwewJD3jbBtF1q
 ywjJAGeGRh3GnY7P8aq1QYzd2IgYghgQCb35WWn/ppvo5kv0jT33YQwtNCWmVr8yM+xX
 zMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U5YvuDlMeIqPh2yguUuWOekO6XBhADgyQNDxRqWz3sE=;
 b=bcGPEHPyjFl4vSTK6lV1jxaqUFLwRm3Z5md/CiBYmgH8RpnjZPAs5qw0vRJybkpx9O
 ZyNB+t3H3rHyPYyAOF3pwUth77Nkwbs1heISyCbuBOzF8hvqERIlg2ogDfFmP7sIBEOG
 goxMkYK2jERVbHX7Mggx01ycTO8+202mRTXNMXXETaFao0RRHCJRwTu8Rd1DP3XFJaoQ
 onViQMNlY7nMlnw59NprxwXCRaIwxhrvZXn24ZfTja8mRk+70hNB4VJ/dl/i0jpRv1JL
 x9nmDVZO1GPHAIOnU+v5yA2VmCOI7V31PYTVOEJ25In1K5a/3WBhALM8XXGk497uvVM2
 ElCQ==
X-Gm-Message-State: AOAM533G9WwfMJ68t3RqNxIrGgswz4kX4OM6NxKRWIBKFObIXf0MUsVV
 51ABK64n0+IMJZcG+P9VQ05cJNg4wCM=
X-Google-Smtp-Source: ABdhPJyosLs3fEgRJz1EpA/RE37pTSzNb7oR792yk60s+yt/fFZPkg9+HUNwDZSM7Ghspg3aUxgEZQ==
X-Received: by 2002:a1c:a592:: with SMTP id o140mr7496904wme.44.1642934557411; 
 Sun, 23 Jan 2022 02:42:37 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id h127sm18233626wmh.27.2022.01.23.02.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 02:42:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 11:40:57 +0100
Message-Id: <20220123104057.556978-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xl2tp: bump to version 1.3.17
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

https://github.com/xelerance/xl2tpd/releases/tag/v1.3.17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xl2tp/xl2tp.hash | 2 +-
 package/xl2tp/xl2tp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xl2tp/xl2tp.hash b/package/xl2tp/xl2tp.hash
index 471657f0f2..eca918bc83 100644
--- a/package/xl2tp/xl2tp.hash
+++ b/package/xl2tp/xl2tp.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  c28608b315adb25c8bf9579c1d6ab52ab47c4c43b68a5ab63c5d039196fd180f  xl2tp-1.3.16.tar.gz
+sha256  898d9b6a374c78dea5f20d80fd50fac13428ad746fefb16ff5f6bec449affe67  xl2tp-1.3.17.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index 65a78504f3..4a2bd66308 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XL2TP_VERSION = 1.3.16
+XL2TP_VERSION = 1.3.17
 XL2TP_SITE = $(call github,xelerance,xl2tpd,v$(XL2TP_VERSION))
 XL2TP_DEPENDENCIES = libpcap
 XL2TP_LICENSE = GPL-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
