Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC37C433FE
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 21:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D10C40629;
	Wed, 26 Oct 2022 21:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D10C40629
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SCPQFu9WO6Is; Wed, 26 Oct 2022 21:04:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78C894061C;
	Wed, 26 Oct 2022 21:04:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78C894061C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 795D11BF2C2
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 21:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 529B7405FB
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 21:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 529B7405FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W8kNIX1ocKbk for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 21:03:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48230405F6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48230405F6
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 21:03:54 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id bs21so12655090wrb.4
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 14:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V6NgTUJaQJfP4Lk0Trl3vjkAGqzfWxUc6spB9I+u8sY=;
 b=75NpD6J/2AJ09BcbkPxpoRO+0kMRDzYtW7r7ap7AycKk6//Tk9+fpv95p4Ztapc8z3
 iHXdSTemhOkucvNk2SkpC25EMma10tngsHMcvviUD84gce81mOWxK9ktUplOTYQ4R4xy
 N00z3cimGEyOF2zaPLFAFjYPuxTNbU1oxLhLIugEXQgdjv5anNVplU+fcnJx5GNM25Q/
 mjaglq5bhFC+TiW0fgDqfLBrTo5hq+ehccdI/yS/mdnoID+MB+K2gZUAfd66z4d19P5g
 +auJxgLgo9v17/xMzkcBrKlDJhCKnQBch0lOSJK1wZgzpWauXiK+WIHgin38cGkMXY7I
 Kbqw==
X-Gm-Message-State: ACrzQf1SRjU+qFYMdALluiAg3vQpzyidVN+TAYj2MNfDOdl+o/5UwhVn
 mcT45d4IrW5I+Ka+EBjucLgQA2QxunQ=
X-Google-Smtp-Source: AMsMyM6LxQYhkRwUIKD5BDzcJTlB3+BxPbPGyRMNV4RsADS1KuePKQmB+TUrhx3LabTVgkn2bShUGg==
X-Received: by 2002:a5d:6c6c:0:b0:22e:409c:90b3 with SMTP id
 r12-20020a5d6c6c000000b0022e409c90b3mr29148536wrz.146.1666818232081; 
 Wed, 26 Oct 2022 14:03:52 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b003a3442f1229sm2881718wmq.29.2022.10.26.14.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 14:03:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 23:03:34 +0200
Message-Id: <20221026210334.565454-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221026210334.565454-1-fontaine.fabrice@gmail.com>
References: <20221026210334.565454-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V6NgTUJaQJfP4Lk0Trl3vjkAGqzfWxUc6spB9I+u8sY=;
 b=Yc5vF9u1NbX1pPjSn2MUJh1/RdVEs7ZdGPnOdGOTC+LbLaEVkJBxptp+kwrIppEMTS
 n3w/XNT7tzZ213AOA5zNTtWpu9R6x6OYeEy6GkBOzLZjuPE8HCWLhl67SEruaSzw8wNB
 EgeI+W8DHCdW/lqXxjHXlWbww9ekGYPj1wHzB+323/GbjNGswRqCOnfCENHybP86xYI4
 vgHPcYA3EjDS4xjiH0BzBKXNQGLRbm4O/SGdgeMcdVAxVMzQCewUAZIXqfaa7DZvKBUu
 FflBy4tfmQwfBzbq2P7xQ03q7Nf9o22/awK+HhxHau2rZIqsksGDeY01ui10IXES5g45
 FVXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Yc5vF9u1
Subject: [Buildroot] [PATCH 2/2] package/shapelib: fix CVE-2022-0699
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A double-free condition exists in contrib/shpsort.c of shapelib 1.5.0
and older releases. This issue may allow an attacker to cause a denial
of service or have other unspecified impact via control over malloc.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...Remove-double-free-in-contrib-shpsrt.patch | 26 +++++++++++++++++++
 package/shapelib/shapelib.mk                  |  3 +++
 2 files changed, 29 insertions(+)
 create mode 100644 package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch

diff --git a/package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch b/package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch
new file mode 100644
index 0000000000..a565874b8c
--- /dev/null
+++ b/package/shapelib/0001-Remove-double-free-in-contrib-shpsrt.patch
@@ -0,0 +1,26 @@
+From c75b9281a5b9452d92e1682bdfe6019a13ed819f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Albin=20Eldst=C3=A5l-Ahrens?= <laeder.keps@gmail.com>
+Date: Mon, 3 Jan 2022 12:34:41 +0100
+Subject: [PATCH] Remove double free() in contrib/shpsrt, issue #39
+
+This fixes issue #39
+
+[Retrieved from:
+https://github.com/OSGeo/shapelib/commit/c75b9281a5b9452d92e1682bdfe6019a13ed819f]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ contrib/shpsort.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/contrib/shpsort.c b/contrib/shpsort.c
+index e21e9e0..920cd8c 100644
+--- a/contrib/shpsort.c
++++ b/contrib/shpsort.c
+@@ -113,7 +113,6 @@ static char ** split(const char *arg, const char *delim) {
+ 	free(result[--i]);
+       }
+       free(result);
+-      free(copy);
+       return NULL;
+     }
+     result = tmp;
diff --git a/package/shapelib/shapelib.mk b/package/shapelib/shapelib.mk
index 52f9584e19..37d2d9ae64 100644
--- a/package/shapelib/shapelib.mk
+++ b/package/shapelib/shapelib.mk
@@ -11,4 +11,7 @@ SHAPELIB_LICENSE_FILES = web/license.html COPYING
 SHAPELIB_CPE_ID_VENDOR = osgeo
 SHAPELIB_INSTALL_STAGING = YES
 
+# 0001-Remove-double-free-in-contrib-shpsrt.patch
+SHAPELIB_IGNORE_CVES += CVE-2022-0699
+
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
