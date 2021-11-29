Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DD3C433EF
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 22:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2082781970;
	Mon, 29 Nov 2021 22:35:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OL1vT--MBH76; Mon, 29 Nov 2021 22:35:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 852C6818A2;
	Mon, 29 Nov 2021 22:35:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CCE1F1BF384
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA33A60A4E
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:35:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CKbWS6Zf8f81 for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 22:35:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2874C60692
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 22:35:27 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id s13so40129465wrb.3
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 14:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2tf4DlpzLjxn8ftZijXNZz4Aut3LtrIeGjlzjuA2Ujs=;
 b=OiqkMjN9owcEfRE8+OqANQKEEkoConVr9wZyHW5YTVuf5rnXxPoRsTvhR95QkJc6Zv
 ikKhl3KvY2xUiB/cJiegItDaO77rUF7p4KoDTaUkKLlJJIh4BpaE0nFJX2NKsvObMO7v
 HiUszin47b9gc+75XsT5sN7eijs/ehZeBrGolgU2CHZvBtPdmx3yXPHUPDsMpcB6r8ZD
 zYjobaC9sLWABMXDECgM23mvYXfqkcL/DSjUyS1zHIFi3XwAiq/FWbs2Y4MSNHIXnMWV
 OFVaj46aGPM7pgH9GJ9c45qj0bIrxs90H13KnNlFdsCtJxuPsjjxVlIjsKfrNpfDMWpq
 islg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2tf4DlpzLjxn8ftZijXNZz4Aut3LtrIeGjlzjuA2Ujs=;
 b=xou3rp1hD2Stc0oX9yMxIZkzhW4MZFnOQTJuF1ubyhP/gu7eQjvPf3qVOiSSj4I1VC
 /4rQSyB469wpC+DAv7vqtOf9R7cy2IbCrI6dWOXwMuQYDVM3o2EiFhQJ+OpztdLTF0p7
 yQ9iHFWF1BgsRIvPqCFuxqjb1dlywfHChldWE34yXlukpE4iDcfTZhvtHcf9zPjzOWnT
 g5JQqvh6XXHBMjHKYupsM3YKnUHUpsH4VlQ+rqg7Ml+KuAMle7YRlVXGxbaJ0pdtO2FG
 c6rr/BUUrPPJMR2M9AtaXpo4vZXycHQ2bspmxcRqeUJEnkEazqOX7CplJyMMHaOM4Zsr
 X/ag==
X-Gm-Message-State: AOAM531CYUlWuLUE0PsBxiGYHz9ScoEkrzIiA/lZf+JLkiKpfmxO4zop
 SXf2PABYCPXiCCIwnjDkbZ7peMuaY7w=
X-Google-Smtp-Source: ABdhPJw+NmPdFP13IvDAGZeebpS57U7NIEhs74CfFtNl5yKzJK3xvlrF0IoqEFahuolEDKQk9OOlMQ==
X-Received: by 2002:a05:6000:2c7:: with SMTP id
 o7mr37512747wry.62.1638225325321; 
 Mon, 29 Nov 2021 14:35:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id f19sm645508wmq.34.2021.11.29.14.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:35:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 23:32:49 +0100
Message-Id: <20211129223249.2186293-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/expect: drop spurious space
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

Drop spurious space added by commit
744e91878af86b3d0ee350fa7cffafad2914f3fe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/expect/expect.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/expect/expect.mk b/package/expect/expect.mk
index 37b4ce7065..44bf74af46 100644
--- a/package/expect/expect.mk
+++ b/package/expect/expect.mk
@@ -16,6 +16,6 @@ EXPECT_DEPENDENCIES = tcl
 EXPECT_CONF_OPTS = --with-tcl=$(BUILD_DIR)/tcl-$(TCL_VERSION)/unix
 
 # Since we don't want examples installed
-EXPECT_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR)  install-binaries
+EXPECT_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-binaries
 
 $(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
