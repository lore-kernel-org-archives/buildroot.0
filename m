Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F86C433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 21:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CF4241499;
	Thu, 13 Jan 2022 21:17:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U6pyehj2D7J6; Thu, 13 Jan 2022 21:17:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF87641061;
	Thu, 13 Jan 2022 21:17:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E58821BF487
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D36C084CC8
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:17:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=carnegierobotics.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ej6xkUtgfG1g for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 21:17:52 +0000 (UTC)
X-Greylist: delayed 00:06:34 by SQLgrey-1.8.0
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6CE684CC7
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 21:17:51 +0000 (UTC)
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by 003.mia.mailroute.net (Postfix) with ESMTPS id 4JZcYP2d0gz25hNf
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 21:11:21 +0000 (UTC)
Received: from localhost (004.mia.mailroute.net [127.0.0.1])
 by 004.mia.mailroute.net (Postfix) with ESMTP id 4JZcYJ1F1WzHpSm;
 Thu, 13 Jan 2022 21:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 carnegierobotics.com; h=mime-version:content-transfer-encoding
 :content-type:content-type:content-language:accept-language
 :in-reply-to:references:message-id:date:date:subject:subject
 :from:from:received:received:received:received; s=mr01; t=
 1642108272; x=1644700273; bh=tWw+Wyq49wfcAEo/h8TJI3iQpZ0HyuEWRkz
 VBwiHorA=; b=PeSSJJnoZ57lyntVupG6hBMAk8IeVJCYfXAcL2Ads8qkCjeOcFB
 +KLphlC/tgfUEM/M2HWAZcO+5zz8n/ZK7xOq5ywyXGyjVF5nqrK9Liy7Po12vwap
 ILPrNKt+KtjnJZU8x7WyYAXE5sYKq132HfB0CujMOYwdQ/0aWuC2Q91+CwPmkzIH
 qDTKQq9VFtCQlh8KNjZTacQUmK3pgBUpRI3RYOBFdPXs1Isa+Bbm3xy14RiuTdS9
 NFgQlWG9f1RQkmnqKxYM87bEqf2NUR01KkvvOsmczTFLYISdO1G4OWReU4b3xE0L
 sS5cF+QU9lMT1lWXrpquogRCwgNp0ZGp5XQ==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([199.89.3.7])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10026)
 with LMTP id jfsON4IVEJIZ; Thu, 13 Jan 2022 21:11:12 +0000 (UTC)
Received: from mail.carnegierobotics.com (unknown [72.22.26.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 004.mia.mailroute.net (Postfix) with ESMTPS id 4JZcYD2qMJzHpPq;
 Thu, 13 Jan 2022 21:11:10 +0000 (UTC)
Received: from CRL-PGH-EX19-1.crl.local (10.1.7.176) by
 CRL-PGH-EX19-1.crl.local (10.1.7.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Thu, 13 Jan 2022 16:11:08 -0500
Received: from CRL-PGH-EX19-1.crl.local ([fe80::895e:aa1a:c80e:9f5c]) by
 CRL-PGH-EX19-1.crl.local ([fe80::895e:aa1a:c80e:9f5c%7]) with mapi id
 15.02.0858.015; Thu, 13 Jan 2022 16:11:08 -0500
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Thread-Topic: [Buildroot] [PATCH 1/1] package/lvm2: LC_ALL set to "C" locale
 before generating cmds
Thread-Index: AQHYCKWTYn5GCxU4e0qVwklrtu3mtqxhrFMA//++vU0=
Date: Thu, 13 Jan 2022 21:11:08 +0000
Message-ID: <397aae451e2840bdad25aecda53d1185@carnegierobotics.com>
References: <03d134dec448470eb60d56a0c8a6ceb5@carnegierobotics.com>,
 <20220113203646.1b921877@windsurf>
In-Reply-To: <20220113203646.1b921877@windsurf>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.93]
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/lvm2: LC_ALL set to "C" locale
 before generating cmds
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
From: Jeremy Lyda via buildroot <buildroot@buildroot.org>
Reply-To: Jeremy Lyda <jlyda@carnegierobotics.com>
Cc: Jeremy Lyda <jlyda@carnegierobotics.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Hello Thomas,

> Thanks a lot for your patch. Did you submit this patch to the upstream
> lvm2 project?

I have not yet gotten around to it, but I do intend on submitting it, yes.

> Also, could you send the patch with "git send-email", so that it
> appears inline, and not as an attached file?

I am struggling to get `git send-email` to cooperate with our mail server, but
I will attach an inline copy of the patch below:

From 8527acf5177dd17c0ffafcd1b331b25a51d7a705 Mon Sep 17 00:00:00 2001
From: Jeremy Lyda <jlyda@carnegierobotics.com>
Date: Thu, 13 Jan 2022 12:14:01 -0500
Subject: [PATCH 1/1] package/lvm2: LC_ALL set to "C" locale before generating
 cmds

Signed-off-by: Jeremy Lyda <jlyda@carnegierobotics.com>
---
 ...t-to-C-locale-before-generating-cmds.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/lvm2/0001-LC_ALL-set-to-C-locale-before-generating-cmds.patch

diff --git a/package/lvm2/0001-LC_ALL-set-to-C-locale-before-generating-cmds.patch b/package/lvm2/0001-LC_ALL-set-to-C-locale-before-generating-cmds.patch
new file mode 100644
index 0000000000..d9c31cc3f1
--- /dev/null
+++ b/package/lvm2/0001-LC_ALL-set-to-C-locale-before-generating-cmds.patch
@@ -0,0 +1,35 @@
+From 8742a873dc3a89095760152db62b827ddba8ca24 Mon Sep 17 00:00:00 2001
+From: Jeremy Lyda <jlyda@carnegierobotics.com>
+Date: Thu, 13 Jan 2022 12:00:54 -0500
+Subject: [PATCH 1/1] LC_ALL set to "C" locale before generating cmds
+
+An assumption is made prior to generating the cmds.h header file that the
+LC_COLLATE locale setting is set to "C" -- this is not always the case. If the
+locale is set for example to "en_US.UTF8" then it will alter the way that
+underscores compare to letters and numbers such that underscores will be sorted
+after letters and numbers. LVM in our experience does not gracefully handle
+this erroneous sorting and results in a segmentation fault at some point in
+program execution. Setting LC_ALL to the "C" locale (specifically LC_COLLATE)
+ensures a correct, consistent command environment across various systems.
+
+Signed-off-by: Jeremy Lyda <jlyda@carnegierobotics.com>
+---
+ tools/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/Makefile.in b/tools/Makefile.in
+index ec546ca63..c8530915c 100644
+--- a/tools/Makefile.in
++++ b/tools/Makefile.in
+@@ -181,7 +181,7 @@ cmds.h: $(srcdir)/command-lines.in Makefile
+ 	( cat $(srcdir)/license.inc && \
+ 	  echo "/* Do not edit. This file is generated by the Makefile. */" && \
+ 	  echo "cmd(CMD_NONE, none)" && \
+-	  $(GREP) '^ID:' $(srcdir)/command-lines.in | LANG=C $(SORT) -u | $(AWK) '{print "cmd(" $$2 "_CMD, " $$2 ")"}' && \
++	  $(GREP) '^ID:' $(srcdir)/command-lines.in | LANG=C LC_ALL=C $(SORT) -u | $(AWK) '{print "cmd(" $$2 "_CMD, " $$2 ")"}' && \
+ 	  echo "cmd(CMD_COUNT, count)" \
+ 	) > $@
+ 
+-- 
+2.25.1
+
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
