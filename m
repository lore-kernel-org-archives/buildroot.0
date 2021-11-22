Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC58C433F5
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 02:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E7D041BDF;
	Mon, 22 Nov 2021 02:09:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G--Z4Qoqv8p9; Mon, 22 Nov 2021 02:09:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9545B4148D;
	Mon, 22 Nov 2021 02:09:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A05D1BF83E
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 02:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A5F781865
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 02:08:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j6HUxUi91YHy for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 02:08:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D70D581842
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 02:08:20 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id l22so73162927lfg.7
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 18:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JV815GlNQvg3tWOaTVHK68/Q2RDiaVBOnbDzD12Daqc=;
 b=ioxo7CNlwqNBsJXPPQIZKK+P74WAOSpm54blPZlH70nPjqx8KjBFGo6D9EOQAzqmmo
 CPdkI8q/jPMzfaUaa44ui1lIhmdgqTVpjYiwZaI6JzSfRvruO30uZ2lbQoS+Ble9YvbB
 ZRxONdvJlzQv1g8uwDPMpnUf/V+wc7xioiZd8OoebKPmvWSYZ8fzG0JXVPMcxvhkG0zt
 BFc859cNMbHmA4UzSUCjczKWbbK2AHkK+wJ8YJYgDThvZNFlFes6vD+xumdgcys4bNKx
 dgMeREHgaZBWMcpNhp7zCyInQ5X6haq/rdhWiW0y7nfal6xQVXUka+NK3/AiaJKy7pCX
 KreQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JV815GlNQvg3tWOaTVHK68/Q2RDiaVBOnbDzD12Daqc=;
 b=TNHsQOj8wjhxMxTe+NjFxAwUWQTz7Ys9oH9opyu4eusFWpILbX8Ylc+ZXYaWM3ahRO
 bRFFJ6q1NhX2v7TNhbC7DDPLkggsLzVgqVgY90r/Dg3bU5BnWf2dYpKhNoDRk/be91BG
 GXDKlwiY0+wRQ5eDWB2t5kqQp05JXkAFVXxQ7JTzC5Si3XKKW3Z67N0hnqBIezTApFkG
 fFGEwKkfbU4ErX+0Sj2HlmKnrEJmSe8X6JrGqE8fVxldtGNQgcYBOKCBEhnk4//inkuO
 bjbJ1kt35fR8j9yVc3TGJgyT1TdCcga9CtHhQ1DfW4Rq1V35k9w/yEjfjfQIszDOSyDs
 oBgQ==
X-Gm-Message-State: AOAM532cNwnHaUfVYVCahBK/hyM0+wuc2Aq0+Ysp7ZJ4N02QyV6EW9w6
 qdKuDLJiHCNEMb/sTmPox/CxSh46ZOA=
X-Google-Smtp-Source: ABdhPJyTaKumO9qaxWb0YacI6mL1+K+Votsw6ALvcZJzRlTwIhWGqAMpr8HVnaadlglvmS8T+OwwrQ==
X-Received: by 2002:a2e:9dcf:: with SMTP id x15mr50976877ljj.432.1637546898598; 
 Sun, 21 Nov 2021 18:08:18 -0800 (PST)
Received: from localhost.localdomain ([176.10.248.197])
 by smtp.gmail.com with ESMTPSA id h19sm788120lja.71.2021.11.21.18.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 18:08:18 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 03:08:04 +0100
Message-Id: <20211122020804.535891-6-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122020804.535891-1-troglobit@gmail.com>
References: <20211122020804.535891-1-troglobit@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/5] package/inadyn: update inadyn.conf example
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 - Comment out iface setting, usually not what you want
 - Update DynDNS example, show use of multiple hostnames
 - Add FreeDNS sample config, free and stable service
 - Add link to syntax and examples

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/inadyn/inadyn.conf | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/package/inadyn/inadyn.conf b/package/inadyn/inadyn.conf
index 1b29027606..3328ee2218 100644
--- a/package/inadyn/inadyn.conf
+++ b/package/inadyn/inadyn.conf
@@ -1,11 +1,26 @@
-# Basic configuration file for inadyn
+# Example /etc/inadyn.conf
 #
-# /etc/inadyn.conf
-iface    = eth0
+# Remember to change this file to match your provider and credentials
+# Username and password can be included from another file.  For more
+# info, see https://man.troglobit.com/man5/inadyn.conf.5.html
+
+# Use IP address of interface instead of external checkip server.
+# Useful when you want to register internal IP addresses
+#iface    = eth0
+
+# IP address change check interval
 period   = 300
 
-provider default@dyndns.org {
+# Remove of change to match your Dyn account
+provider dyndns.org {
 	username    = test
 	password    = test
-	hostname    = test
+	hostname    = { "my.example.com", "other.example.org" }
+}
+
+# Remove or change to match your FreeDNS account
+provider freedns {
+     username   = lower-case-username
+     password   = case-sensitive-pwd
+     hostname   = some.example.com
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
