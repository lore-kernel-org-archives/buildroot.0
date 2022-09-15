Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB49FECAAA1
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 18:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BCC9419B3;
	Thu, 15 Sep 2022 18:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BCC9419B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DfJ9eMrt4mND; Thu, 15 Sep 2022 18:29:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43E5E419A1;
	Thu, 15 Sep 2022 18:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43E5E419A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 490561BF5AA
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 18:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 300B3419A1
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 18:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 300B3419A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gs8zYGUbPa3i for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 18:28:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 069F7419A0
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 069F7419A0
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 18:28:55 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id jm11so19128539plb.13
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 11:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=HnH4TgFLok5lYgjRv5EwhApSus+Y7gwANFll2xSYUZw=;
 b=XEd0BNASyEzLRSCPHgfRW0f8XjTpkHzbGjZK3hE6YSTZtCX7IRWt5fKRqxa3dwN8cb
 4GRQsjkP1Vf6HHa5HLBK531Ny/eNfPoLn1XnAnxpd5OGz0uibFOrrjMpCaPIOmwkTeMu
 k2H1GRioaocVjZpzmzdU0e7ladswGSf9hbOTRMeepcJ0al8XB9RQ7qalw/ikzVzUAZEz
 Ea5oauwViwbDFZFpi6LtY0wCDxXdLFkjyl0Im249zzS46ZkBIummKKKmXVyq9woCpfwx
 6CtkdkPfMLb/O8AihdUZ/cnKllHj4z8d8d6C2OT6/dP+RXeQt249npZikVeA0jqMMANu
 CQZg==
X-Gm-Message-State: ACrzQf0EAH8XH0VvX2mE8lhPtLBHFjlAJSwcli7wN9CLziB9ki/pinYF
 dbJAP0j63Gj+y9QcYCTRznIabmZt7Z6mtQ==
X-Google-Smtp-Source: AA6agR57DXDqcgkP3NBApGTrQv3ZdQGUePIwZIodlOKQcjNYSVV4sRjOuq5uCD9PLRQVENf2eOBmcw==
X-Received: by 2002:a17:90b:3808:b0:202:c5ba:d71b with SMTP id
 mq8-20020a17090b380800b00202c5bad71bmr11876770pjb.18.1663266534859; 
 Thu, 15 Sep 2022 11:28:54 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 5-20020a17090a098500b001fdbb2e38acsm2008304pjo.5.2022.09.15.11.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 11:28:54 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 11:28:51 -0700
Message-Id: <20220915182851.448169-1-christian@paral.in>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/runc: bump to version 1.1.4
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is the fourth patch release in the 1.1.z series of runc, primarily fixing a
regression introduced in 1.1.3 related to device rules, as well as other bugs.

 - Fix mounting via wrong proc fd. When the user and mount namespaces are used,
 and the bind mount is followed by the cgroup mount in the spec, the cgroup was
 mounted using the bind mount's mount fd.
 - Switch kill() in libcontainer/nsenter to sane_kill().
 - Fix "permission denied" error from runc run on noexec fs.
 - Fix failed exec after systemctl daemon-reload. Due to a regression in v1.1.3,
 the DeviceAllow=char-pts rwm rule was no longer added and was causing an error
 open /dev/pts/0: operation not permitted: unknown when systemd was reloaded.

https://github.com/opencontainers/runc/releases/tag/v1.1.4

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index d94a0c20ca..6c8fddd397 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fc1c70e095d662e38a5889bc6de41857762ce022caaf8be2852663198c533a63  runc-1.1.3.tar.gz
+sha256  4f02077432642eebd768fc857318ae7929290b3a3511eb1be338005e360cfa34  runc-1.1.4.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index aef52de618..b60f1da2e7 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.1.3
+RUNC_VERSION = 1.1.4
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
