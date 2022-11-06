Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A6FC433FE
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 14:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8526540162;
	Sun,  6 Nov 2022 14:26:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8526540162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T1dyrQppviCF; Sun,  6 Nov 2022 14:26:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A74F4013E;
	Sun,  6 Nov 2022 14:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A74F4013E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0823E1BF59F
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 14:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5F8940510
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 14:26:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5F8940510
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pdc1La3cQS0S for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 14:26:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEFF54050F
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CEFF54050F
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 14:26:40 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so8153176wmb.2
 for <buildroot@buildroot.org>; Sun, 06 Nov 2022 06:26:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7qjvzv8vhFYYpzbfdc4RzYIXK7mvQX2vtifl/D/4K+c=;
 b=5AuRAB+IszFu7Nx/aKsr4F/qAZKfnZMiyD+7PE7xXmRsoNrUtYbnpnLA73leMkkE2z
 blGxiXmoIj/JmVnrD4PTTiUjgIcYUBTf5swqAhieU+m8Br7NexNIKKMujQkP75UTltPG
 pl/G/7jgFMQ/+zhy2P9y/jbfNwxeHgCdqN9vSoMKIP/rljyk/5jwvP7kvUDMJQJ6ckAY
 Cnp+MrcVWerHoMa4utsUSIAviDPe42bBrEAykFliisjn1eHfGV+t5rlfuMHsdwQdNpTd
 IEiZ3olNED7KLNByDO2bxlhrdPXOiML3/gIMPSs/Ay4d3NtRFsREFh7AGel8nn5M1bAZ
 T1zg==
X-Gm-Message-State: ACrzQf1Nz0fNKWPH8fDC6S7/MXzRCgd7YaOMRg4Al3xAUCLWg9UWQHwf
 ua1kULqd9EWRjGgFLa2VtF1hf6OM20c=
X-Google-Smtp-Source: AMsMyM6KNWrM9FuQw6RlXCoxswqV9z143XSPdJ7zoDwz7nJoHPatInvreSAL+0Pk2VvT1J7ZYr5fbQ==
X-Received: by 2002:a05:600c:3487:b0:3cf:82bc:ec2b with SMTP id
 a7-20020a05600c348700b003cf82bcec2bmr19040383wmq.83.1667744798477; 
 Sun, 06 Nov 2022 06:26:38 -0800 (PST)
Received: from gleb-linux..
 (cpc76906-dals22-2-0-cust400.20-2.cable.virginm.net. [81.106.81.145])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a05600c4f4300b003b47b80cec3sm9407509wmq.42.2022.11.06.06.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 06:26:37 -0800 (PST)
From: Gleb Mazovetskiy <glex.spb@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Nov 2022 14:26:34 +0000
Message-Id: <20221106142634.875639-1-glex.spb@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7qjvzv8vhFYYpzbfdc4RzYIXK7mvQX2vtifl/D/4K+c=;
 b=bBrk7XQFdOV3l4ksCQVZR3IM0j9fmproEDhJx3fv+ZGDcItr+nrtOzr/o2RBtKwldd
 6ZWWuL53d57j/uZnxwvLPUh87nzxjaY0rOWjwom04X1AY+rDB1RwoXigTFIGtetJPYfY
 I781movNiUpjeoPE9PmmNcKvDRB/0zavjDahmJYLfHLX+5Qyad7XMcCz4n1SZgOGWJhd
 M/0cFlC3GSTHpMCLQuoZeUeDyXY/Jo4GV+H/3Mqi9LibmkWxikFz57j95B7gNcnahtlX
 vK4G0W22thAkGoXPat+qMfz+T0onJlXgTCMeyteelrysVCg+eRGeNy4jOlvCYtMDgamk
 zapw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bBrk7XQF
Subject: [Buildroot] [PATCH 1/1] Makefile: unexport PERL_MM_OPT
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
Cc: Gleb Mazovetskiy <glex.spb@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Compilation of Perl-related packages fails if `PERL_MM_OPT` is defined.

We previously issued an error in this case.
Instead, simply `unexport` the variable.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 Makefile                             | 3 +++
 support/dependencies/dependencies.sh | 9 ---------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 7c1c07a2e4..71b622474f 100644
--- a/Makefile
+++ b/Makefile
@@ -396,6 +396,9 @@ unexport DESTDIR
 # Causes breakage with packages that needs host-ruby
 unexport RUBYOPT
 
+# Compilation of perl-related packages will fail otherwise
+unexport PERL_MM_OPT
+
 include package/pkg-utils.mk
 include package/doc-asciidoc.mk
 
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 2b678ae8c4..4b5012b807 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -46,15 +46,6 @@ case ":${PATH:-unset}:" in
 	;;
 esac
 
-if test -n "$PERL_MM_OPT" ; then
-	echo
-	echo "You have PERL_MM_OPT defined because Perl local::lib"
-	echo "is installed on your system. Please unset this variable"
-	echo "before starting Buildroot, otherwise the compilation of"
-	echo "Perl related packages will fail"
-	exit 1
-fi
-
 check_prog_host()
 {
 	prog="$1"
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
