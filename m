Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3320C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 22:35:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A695461075
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 22:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A695461075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F2D46079F;
	Sun,  1 Aug 2021 22:35:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a2HIMYSq0eBE; Sun,  1 Aug 2021 22:35:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1D5F60749;
	Sun,  1 Aug 2021 22:35:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 92F4C1BF846
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 22:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81A3840471
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 22:35:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z1uiVwaQ2M7o for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 22:35:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80AEC403EC
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 22:35:20 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id l18so19167500wrv.5
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 15:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eXDTbU5Y/VtEH0B6JoydgyQR6vu/EFlTPDZvXLoai8Y=;
 b=i5vjvlZ7O86Rk1I6FSBJKvOoAfSn2lnn778KcI95F9AdZT5YYKQ5u20A6FwcSrnQgP
 NPVMD31+BN/ydISvYvI3GE81gClWeaFOZ5Ggo1NrfbbBWyJqnnY7dHAdQVu8992WOHAx
 4kBmts4VInsjT6hQupwWjE0pXKJIB4Ty0LFWcrUJOx0DFqbKfUyF1B9/dT4Uzoe4+Pfe
 iAeKZ001FgiyTXM87UfuY6NfZj49mWM67BYtIcm9/GfDGqzK5GrXMyekQu6i5VspKfXu
 QLB6MSPioiSCkH1wl+4vEF40kRiqT0GxWvknw300SRQq3+ir+rQcewMqqdrnMYRqCluy
 hMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eXDTbU5Y/VtEH0B6JoydgyQR6vu/EFlTPDZvXLoai8Y=;
 b=BfdrEbwsH2nhOHMm0m7fXDA9CrZgg3hhAIUADsYjQpFKWymG/FZH+Pyoxvw5kcsbYr
 9kjltsIY/d+K54jybzaY3mnJduEP/amlV/o4DA8rZCw2KaTPrHbDOVa4BgZjv+bGuJJ0
 +YqBo83qhU+YabRdFDPb6z6FhOqJoGUa0VdDz1cIHtfyGE5OopajqGIMxvyCdI0yxgyN
 Dv1etI9EVc8G2RCXNAf17cqh4SBq9NbPfXP58fufPaxiyrRiwWbTuOXPPXraTpIlAorU
 PAFlV4C4/dtoPj0DhAG80PcbdpEL2qJPfnKrqQXT+SrbW+9OdVLgxoqCuJ4Ba9F3Y/hT
 6xOQ==
X-Gm-Message-State: AOAM532Ygr+gBPZdTh+AVBVEnG/IQyc+2Kxjh3RjbKNJvqlsL0Ha7PeD
 6ylXw8zX3PpYbozXfjdJAImoWxU+zC2WLQ==
X-Google-Smtp-Source: ABdhPJwLBwRjtS9gdr7EPvs6N25nqv3oKljzAlbXO+DmLRF9UH3HdgfazLBbExXbaJwS2hq+FDc8iA==
X-Received: by 2002:adf:f908:: with SMTP id b8mr14714009wrr.302.1627857318331; 
 Sun, 01 Aug 2021 15:35:18 -0700 (PDT)
Received: from kali.home (pop.92-184-106-87.mobile.abo.orange.fr.
 [92.184.106.87])
 by smtp.gmail.com with ESMTPSA id n4sm8138252wmq.1.2021.08.01.15.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 15:35:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Aug 2021 00:35:09 +0200
Message-Id: <20210801223509.1360022-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fluxbox: fix build with gcc 11
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

Fix the following build failure with gcc 11:

util/fluxbox-remote.cc: In function 'int main(int, char**)':
util/fluxbox-remote.cc:76:32: error: ordered comparison of pointer with integer zero ('unsigned char*' and 'int')
   76 |             && text_prop.value > 0
      |                ~~~~~~~~~~~~~~~~^~~

Fixes:
 - http://autobuild.buildroot.org/results/6e718bb662aa4961ea264eb81e4b7e7b20485e30

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fluxbox/0001-fixes-bug-1138.patch | 25 +++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/fluxbox/0001-fixes-bug-1138.patch

diff --git a/package/fluxbox/0001-fixes-bug-1138.patch b/package/fluxbox/0001-fixes-bug-1138.patch
new file mode 100644
index 0000000000..9c02e93350
--- /dev/null
+++ b/package/fluxbox/0001-fixes-bug-1138.patch
@@ -0,0 +1,25 @@
+From 22866c4d30f5b289c429c5ca88d800200db4fc4f Mon Sep 17 00:00:00 2001
+From: John Sennesael <john@aminking.com>
+Date: Mon, 2 Nov 2015 15:14:32 -0600
+Subject: [PATCH] fixes bug #1138
+
+[Retrieved from:
+https://github.com/fluxbox/fluxbox/commit/22866c4d30f5b289c429c5ca88d800200db4fc4f]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ util/fluxbox-remote.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/util/fluxbox-remote.cc b/util/fluxbox-remote.cc
+index 59852e6a..504015b5 100644
+--- a/util/fluxbox-remote.cc
++++ b/util/fluxbox-remote.cc
+@@ -73,7 +73,7 @@ int main(int argc, char **argv) {
+     if (strcmp(cmd, "result") == 0) {
+         XTextProperty text_prop;
+         if (XGetTextProperty(disp, root, &text_prop, atom_result) != 0
+-            && text_prop.value > 0
++            && text_prop.value != 0
+             && text_prop.nitems > 0) {
+ 
+             printf("%s", text_prop.value);
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
