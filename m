Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7CBC433FE
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 16:27:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E67D603E9
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 16:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E67D603E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7D1A40476;
	Tue, 26 Oct 2021 16:27:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id chymmOvo9enK; Tue, 26 Oct 2021 16:27:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4970E404E0;
	Tue, 26 Oct 2021 16:27:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E870C1BF5DA
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 16:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4CEB608F2
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 16:27:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jOYZX_Nomv3n for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 16:27:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED9B0608C6
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 16:27:29 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 136-20020a1c008e000000b0032ccae3b331so2126073wma.0
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 09:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hnZmCiI68bEmCC/uMTiLDuDYWsmmJ9aLU72nGuySCbk=;
 b=PYFgIYkyGMtLM9+vd5XaH/bot2POdz6YNgFnxZk47WeD4dDoVdUIP7YD+QTqydpEUF
 uHSCOQ541yRB/8Laz99EZcUPNH/BBsTNQZshdpkHcdiWL9VosYwbpwpbWuLIDLaaiYGF
 0NmALn7aZsKD42mp7zJ9e//oQw5484nq4VAFZa6RhBMGMC0BI6Vb8N+Y7bOcxN1KIiC2
 1A3nuq0qkyPG8YtinM+Py9zFrP87ytJbmKBBb+kzaEXM2x73/P60puRY/m5jLLRMBhf3
 CHI9CSQ1Djavdtv0/XcO9c13Pcb/dCegpoKDHX5JW2AUK2Nw/YnZB95PkhW2Hw5KPur3
 WvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hnZmCiI68bEmCC/uMTiLDuDYWsmmJ9aLU72nGuySCbk=;
 b=bbD48KucL2a7SGB7aBYY+uRGFByHoCRE0EHzE/bzQF/dEnAu/+zvG5OBNKiHguLMI3
 14aW+3kw5W5+3qzRhttdwCTmWjHyC5TrVaqDfwERwcXE6Fvn8XmEiQ/tDy3fgL2WVy5u
 punRPbQDtwNQ//aJop8POmjw3CLLiWMq4I+2BEydLD1mNC6npRFxjM1jFb75lHFBc7bH
 UBhKbkTFaz0C/+7rswe4Gcf4bDskX6ay3WCbWRxdhrv29v3qklHqroZ88g8IOLW5vvae
 50y2hmJETHUITbi949/wlhs4CcbmLlSDn5InSLEo6vL/ZS9lF8CZUm3dL/EFYOHR75Oe
 a/sA==
X-Gm-Message-State: AOAM532aDZt5V6R9bZO0Ra92wf9UBujOgrOADD6owNi5JVEclQg4ji0/
 oPG+/PAvGyNhbsavsJmYkS4OGpXCHPI=
X-Google-Smtp-Source: ABdhPJzFqWyfor73Xrt1vpnrfWuOFqSyTkXa8FvMpgokGm2ThMU8yevVI7mnqXKOTXAT0GC/lI6tbg==
X-Received: by 2002:a05:600c:1909:: with SMTP id
 j9mr28472324wmq.138.1635265647716; 
 Tue, 26 Oct 2021 09:27:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id j10sm5174011wrx.94.2021.10.26.09.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 09:27:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 18:25:51 +0200
Message-Id: <20211026162551.3825804-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tinyssh: bump to version 20210601
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
Cc: Vadim Kochan <vadim4j@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/janmojzis/tinyssh/compare/7e2b4025bf3a2dae4c6617e3eb39df4bcde37454...20210601

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tinyssh/tinyssh.hash | 2 +-
 package/tinyssh/tinyssh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tinyssh/tinyssh.hash b/package/tinyssh/tinyssh.hash
index 99ee4afaff..30b5d13419 100644
--- a/package/tinyssh/tinyssh.hash
+++ b/package/tinyssh/tinyssh.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  65a7dc785861a09399419a1e7c42cddf66f32dc233a33277327b11f1bd8a772c  tinyssh-7e2b4025bf3a2dae4c6617e3eb39df4bcde37454.tar.gz
+sha256  2a051437878998c7782d9d38ef13e5e7a76435ae6b9c3e9ec492c3a567bd6314  tinyssh-20210601.tar.gz
 sha256  b5dc19477e29f4111e1c16cd89ec0782f5a07b1a30e3bdb7c155425b81b12c46  LICENCE
diff --git a/package/tinyssh/tinyssh.mk b/package/tinyssh/tinyssh.mk
index 6f22be6c52..05716bcfe1 100644
--- a/package/tinyssh/tinyssh.mk
+++ b/package/tinyssh/tinyssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYSSH_VERSION = 7e2b4025bf3a2dae4c6617e3eb39df4bcde37454
+TINYSSH_VERSION = 20210601
 TINYSSH_SITE = $(call github,janmojzis,tinyssh,$(TINYSSH_VERSION))
 TINYSSH_LICENSE = Public Domain, CC0-1.0
 TINYSSH_LICENSE_FILES = LICENCE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
