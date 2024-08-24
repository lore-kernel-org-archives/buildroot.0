Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DADDC52D6F
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 16:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A56F3402E7;
	Sat, 24 Aug 2024 16:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYF-xYlbCP3h; Sat, 24 Aug 2024 16:43:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BDE34033D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BDE34033D;
	Sat, 24 Aug 2024 16:43:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A0EB31BF5DF
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 16:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8ECBC81499
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 16:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTiJQQgNIgVt for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 16:43:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=mattianarducci1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A2E7481241
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2E7481241
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2E7481241
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 16:43:30 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5334c4d6829so4014855e87.2
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 09:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724517808; x=1725122608;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EmiWzaF+/e1R0Ml3acIGKwuglcsm6G7NWTmFSReqpb8=;
 b=TPgscqq++R8HQDpMHDCCrymxdJjWzJiI0oUIt9dgRwlnF40cTkv9trl1TCr9wLD6Cd
 SHBJP2yz0037uereBv2Iq3yQejZDJkQ3VpZEqJfcwLNxEggU7ZSfY9oyJ+bZJNxveTXL
 H/0/R05+41FQIVQdp6X60yUgQpaTzhlFa74qymVpwCKoDmPXsQYMgXIifuCSyH9MAYpm
 Y+lfYnEcAS+WAr2M2RgjNssOdJhWbg5F9HzXw5eb51X+dUR0IqzHb9H7dKtWR79At8SZ
 s8mM5OHHthWpfiCkUFdcWEr5NdOAfp7cCq1bfn0/F2sM5U1SwrYbKC6e1C0zgYy2J7Pk
 tDFQ==
X-Gm-Message-State: AOJu0Yw0CAzZyeUNWlTlfrLRVP0Q3lxbiOcpmryGIxKlbbo0d++MCDt1
 IyFWobEl340TpBAYYh9/bFSmalqPONB0hEx20qNpgQwfZktF88lnBDIHHg==
X-Google-Smtp-Source: AGHT+IEspM41wcJv3aMDVQMy5/7QKl2aSGYfT+Q6B+DbWMSbjuqKgKG0GNZZ56DhL9rKCbUfiwHh4g==
X-Received: by 2002:a05:6512:ac4:b0:533:43bf:565d with SMTP id
 2adb3069b0e04-53438785332mr3298518e87.27.1724517807774; 
 Sat, 24 Aug 2024 09:43:27 -0700 (PDT)
Received: from localhost ([212.38.43.101]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5334ea8926fsm908910e87.280.2024.08.24.09.43.27
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Aug 2024 09:43:27 -0700 (PDT)
From: Mattia Narducci <mattianarducci1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Aug 2024 18:43:26 +0200
Message-ID: <4243551.mvXUDI8C0e@localhost>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724517808; x=1725122608; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=EmiWzaF+/e1R0Ml3acIGKwuglcsm6G7NWTmFSReqpb8=;
 b=fekcLY+SvOZKPu3lNYorYlKiKcEvNrtcWt4ei1bikYAfT4Uxl6jWGcUks9Fs6EvlPr
 ePY1eCuYvH3E89yL0wXUg2YFU8HNvdsPo/Dc+65rELJL2/KbTowDJwlCErjOHeol34eh
 qucFvyqTqP8xwZF/REf16gRjsfAYZn9FHkgCrLqMFkzD8AoNf+Of72Zt11HCtJqVgGiN
 1Qm173iq0nJycojDQiHki5GQ/smxX4zZMAn37Dni7eFptFe+zsl7psktBkwtxRQbXqXI
 TGOWaeCglkqITp6JDew3iIRHTfsWgMt6FkAKxqyd4Ns8AYmFlRqIyk4QVz+XM9iRZALU
 DYzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fekcLY+S
Subject: [Buildroot] [PATCH 1/1] package/proftpd: fix group name preventing
 server from starting
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace the group name 'nogroup' with 'nobody' in the default ProFTPD
configuration file. This fixes the following error when starting the
server:

  proftpd[110]: fatal: Group: Unknown group 'nogroup' on line 30 of '/etc/proftpd.conf'

Fixes: 0d887cc2b4 ("system: replace nogroup with nobody")
Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
---
 package/proftpd/proftpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index cd7d232672..72a0fe9354 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -130,6 +130,7 @@ endif
 define PROFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/proftpd $(TARGET_DIR)/usr/sbin/proftpd
 	$(INSTALL) -m 0644 -D $(@D)/sample-configurations/basic.conf $(TARGET_DIR)/etc/proftpd.conf
+	$(SED) 's/^\(Group\s\+\)nogroup/\1nobody/' $(TARGET_DIR)/etc/proftpd.conf
 	$(PROFTPD_INSTALL_FTPQUOTA)
 	$(PROFTPD_INSTALL_FTPASSWD)
 endef
-- 
2.45.2


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
