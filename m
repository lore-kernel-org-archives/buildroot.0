Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0F0C636D4
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 20:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4738B81445;
	Mon, 13 Feb 2023 20:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4738B81445
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7sbtrZKoWeIx; Mon, 13 Feb 2023 20:06:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84A9B8142E;
	Mon, 13 Feb 2023 20:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84A9B8142E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00A781BF37F
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 20:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEC5B8142E
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 20:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEC5B8142E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c8h_gTCJYoTC for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 20:06:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66C5F81313
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66C5F81313
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 20:06:07 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso12096806wmp.3
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 12:06:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wxYSZX/OrO2Qhd7k7zxUOAB8drOoCSh/rGz1RC4OXGQ=;
 b=YBG71+r9fBYacbs6Ooup+b+/Cmz8BSp+G/0Oc+Xkxkx+i2qcHvMys9faRZMOfE/LaK
 ityGSxAUyJ4OGvdQYXulKro88DCY72TbrVAId+mL6STH40vKt47k6JJJrAfp5VsDoHyr
 bplAijUrTNIaoesBllB9gNdvEIPoPjFzkoo+5f7RlSNmTGrZrY7uncQ+L8eb7jkGUEEw
 3dXx31mKAYKlytyEhTt6ImFO8nc9OToiEQq/81aHbSOK9HsaffC0AviNajc/Y8SGU9IB
 zpYZKrt8e7LffmXHJ9LHPniHT75RHdumO25JXUN54mBpJgnKLeROzjIJEsDx4R0eTPm5
 8vGg==
X-Gm-Message-State: AO0yUKWyd6x3INi78n/cFBfrg49tjzB8B13zFFkBdmP+sjZaQ3a975jm
 ILs+6nAvSCJY0OmJ6u1vY2StYvd+87Y=
X-Google-Smtp-Source: AK7set84dBNOCgh70YyOlGluYHgmkqlkEBpsQvfmTrRK6xVdyhlmkwSX0ShnecE3YeBLsQk1efXhlw==
X-Received: by 2002:a05:600c:3411:b0:3dc:545f:e9ce with SMTP id
 y17-20020a05600c341100b003dc545fe9cemr21558867wmp.24.1676318765605; 
 Mon, 13 Feb 2023 12:06:05 -0800 (PST)
Received: from localhost.localdomain (1-1-22-171.ftth.cust.kwaoo.net.
 [171.22.1.1]) by smtp.gmail.com with ESMTPSA id
 b18-20020a05600c4e1200b003e00c453447sm18337095wmq.48.2023.02.13.12.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 12:06:04 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 13 Feb 2023 21:06:04 +0100
Message-Id: <20230213200604.2539630-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=wxYSZX/OrO2Qhd7k7zxUOAB8drOoCSh/rGz1RC4OXGQ=;
 b=qjXUn0H9GRK73QSlT94JlHB9Jwe7vJtPg4PdGziNiIaCcGsx8VigDW1WcDLBCwcb7P
 nqwvgNgD1O8iUxnNtPG3us0msCXf/VAMPg2fTJdq4RKrOYQju0JOYezL8+RPyUIWYyUJ
 3W+jrdbrbiW6a1VNvjMyY6H95setv2yNRizsA+YQpBO1avrpCSdz873+YThCBkm2tTU6
 F/UWIDeOjEIfGLIZ11Zibw8B6Dg/KSslbJHjjBkts/+4gcKkxIJSTQBbgQgDUwdqLUzx
 d/v4fUxHOt/rjJdH+0FrwCAbrofsc5IodUMaB/Lf8grObatNtsxduS6/1UjNMLAz6VJM
 5ihg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qjXUn0H9
Subject: [Buildroot] [PATCH] package/flannel: use the github helper
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
Cc: Geoff Levand <geoff@infradead.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, flannel uses an ad-hoc github URL and a version-only tarball
name, even though we already had the github helper (introduced in 2013)
when flannel was introduced (in 2016).

Switch to the github helper, which allows us to get a properly named
tarball.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Geoff Levand <geoff@infradead.org>
---
 package/flannel/flannel.hash | 2 +-
 package/flannel/flannel.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/flannel/flannel.hash b/package/flannel/flannel.hash
index 6a0223a20f..bafc453097 100644
--- a/package/flannel/flannel.hash
+++ b/package/flannel/flannel.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e17164db3b158d13ce5e40bb7b233790cb186762d929fa4f626baf586d4d63ca  v0.14.0.tar.gz
+sha256  e17164db3b158d13ce5e40bb7b233790cb186762d929fa4f626baf586d4d63ca  flannel-0.14.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
index 231cf90dfd..b4e2b2f777 100644
--- a/package/flannel/flannel.mk
+++ b/package/flannel/flannel.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 FLANNEL_VERSION = 0.14.0
-FLANNEL_SITE = https://github.com/flannel-io/flannel/archive
-FLANNEL_SOURCE = v$(FLANNEL_VERSION).tar.gz
+FLANNEL_SITE = $(call github,flannel-io,flannel,v$(FLANNEL_VERSION))
 
 FLANNEL_LICENSE = Apache-2.0
 FLANNEL_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
