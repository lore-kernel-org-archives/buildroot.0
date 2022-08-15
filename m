Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A08C25B0E
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 20:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28ED54032A;
	Mon, 15 Aug 2022 20:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28ED54032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xVRH21Ffme3Y; Mon, 15 Aug 2022 20:50:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B577440332;
	Mon, 15 Aug 2022 20:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B577440332
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 49BAE1BF33F
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24C3560BA9
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 20:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24C3560BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ti-_FSLC3lxp for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 20:50:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26A6C60B34
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26A6C60B34
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 20:50:20 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so2793209wmb.4
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 13:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=gX7jZ7aZr4XfjbtbHcKix5gesRmmoc8CMvYBXYomfek=;
 b=hx9x4VZ5Lj3ZtuOz3xGdOXMBhgKddJyZdYfv2bdRgsnLL1i2fwtk6fROztGmAdmnGN
 qh47qo24JT3J5U3gpNlW6ZuwXCHOKRaYI61alej74vIe7jNMI8dXVtjrr2dvbjlmIyo4
 INMO/OPjbwDjHaVxTXhJUCrGTyWnldMk7DoCWXT9DxDDNmdL4lBDQVC+1uvoQXrk920e
 YYzXEqVfKLS3neT06quDxjCjKK+wFtOeB4y2U5jYSOnuwVGKg2/dsbdP0XxWrCJ/8hZi
 pEgAldNv/BAh+k7A7n0jgxY/vg0nvtFix9PDtVlpWUfStOKjnIK5yBcKL1f5aRDodatO
 ffMA==
X-Gm-Message-State: ACgBeo2x7medcmipHlRAmq2JDPqh9XGEaAsRes8ND3PWnU9V+WyEu2tu
 lcRxsIIsyFE5q9XdQLf1MNQtj1km7zg=
X-Google-Smtp-Source: AA6agR6qxz2hiLX+NdkOTxOy6IYR+XzRDCE3mQWe2Z4vXIc10JqobDJUug6ncEaGwcBKRGYkRf0LiQ==
X-Received: by 2002:a05:600c:3ba0:b0:3a5:b73a:8773 with SMTP id
 n32-20020a05600c3ba000b003a5b73a8773mr15430501wms.64.1660596618107; 
 Mon, 15 Aug 2022 13:50:18 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b0083b0e7aadc437e2f.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:83b0:e7aa:dc43:7e2f])
 by smtp.gmail.com with ESMTPSA id
 n37-20020a05600c3ba500b003a38606385esm267205wms.3.2022.08.15.13.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 13:50:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 22:50:11 +0200
Message-Id: <20220815205011.13423-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=gX7jZ7aZr4XfjbtbHcKix5gesRmmoc8CMvYBXYomfek=;
 b=WlddmCud2SBONNAFwwnBHLIlYI6y5XQJqhw9ADGndRkXTUsf41IGQ2roC8fjBZJDmq
 veUl0XYu2eJXN7lMhokmXEWFbgNKVRpkMH281eeDMLn9mVwuIFEwNqJbOU1Wbb1rzuFj
 KgJFIuiLsyaBatqgg+MzqQUNcv5qLNRl+ElWO68Nbrk9VbKPrYkMtzKfpm/IQwhnHvyQ
 f3HarN+3VqMULh5XeCwleoNFhT6fW1kufoy5zbK34FCoFkIceRHtq7i3nwMy133tq4cG
 566tZ5T+j4NVfIT2+I/SwE7YMxMTShAMkTtHCPFYNSZGMY4sSJW/NwQZ4cUL5k1ReGWv
 Cv8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WlddmCud
Subject: [Buildroot] [PATCH 1/1] support/dependencies: check for find and
 xargs
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

Commit 7652817c93a02715e0d334d70118a0d8b6917ca6 updated the
documentation but forgot to update support/dependencies

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 support/dependencies/dependencies.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index d69d97afaa..2b678ae8c4 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -163,7 +163,7 @@ fi
 
 # Check that a few mandatory programs are installed
 missing_progs="no"
-for prog in perl tar wget cpio unzip rsync bc cmp ${DL_TOOLS} ; do
+for prog in perl tar wget cpio unzip rsync bc cmp find xargs ${DL_TOOLS} ; do
 	if ! which $prog > /dev/null ; then
 		echo "You must install '$prog' on your build machine";
 		missing_progs="yes"
@@ -177,6 +177,10 @@ for prog in perl tar wget cpio unzip rsync bc cmp ${DL_TOOLS} ; do
 			echo "  bzcat is usually part of the bzip2 package in your distribution"
 		elif test $prog = "cmp" ; then
 			echo "  cmp is usually part of the diffutils package in your distribution"
+		elif test $prog = "find" ; then
+			echo "  find is usually part of the findutils package in your distribution"
+		elif test $prog = "xargs" ; then
+			echo "  xargs is usually part of the findutils package in your distribution"
 		fi
 	fi
 done
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
