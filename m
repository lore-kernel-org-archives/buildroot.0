Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79CEC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 18:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DC3540250;
	Tue,  9 Aug 2022 18:45:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DC3540250
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kPHvUrXMlhpE; Tue,  9 Aug 2022 18:45:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DD8840189;
	Tue,  9 Aug 2022 18:45:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DD8840189
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EC131BF46A
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 18:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19D58813B3
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 18:45:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19D58813B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XpHf6Z7IFOu6 for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 18:45:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFEB9813AF
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFEB9813AF
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 18:45:13 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id v3so15356643wrp.0
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 11:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=QyJR8vut1KFwaO/gyosPPYd+tEQByqMg6dKV/8w9s/Q=;
 b=Ki9DoSRsUHDi9A4Ihb8XUdKS5RwtzGyb7BROXR9SjN540BMQioFt+mQVdpQSzy6QDi
 dtsCUCtOwpqz0W7xjbRNafEc7E45KFH3ZJIPxXzAgYhuKqMlZhRBf4zSR4u9LFTiBAb3
 4XhyGrxpv8GONEXeqth4jlaPxIQx9Dl+Lt/5jy9K/zh8BEI/Vf2P8aO8/1agDVmIqG83
 +YX5DvcFTjl8vP1JxHgEpQDTQ8vPptJ13YxZoUQEN2awaW7BITV5I6PKaooDlwRBDwm0
 9zBzm58R2ro+u1juhfYNQ2X1dd7uebta7kd1fDRcW63kmCZn3C0Qa0XQTXJ38EKkzb6f
 1QTg==
X-Gm-Message-State: ACgBeo2tIjy53+DVE4beckYnXBPXXv/CjSEws2/WVT1JQKW//7yrXzd4
 5hH5SMldVSWusF8wt5kM4zQro6kZXFY=
X-Google-Smtp-Source: AA6agR5Nb5SH5cjC3TBECdw77fI/4ZSIyFmB3Dzi5aYVjgDn46mMi59GA6MIPKVoOKpyOhrdESaU5Q==
X-Received: by 2002:adf:d090:0:b0:220:7188:ac8b with SMTP id
 y16-20020adfd090000000b002207188ac8bmr15059769wrh.389.1660070711683; 
 Tue, 09 Aug 2022 11:45:11 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 q66-20020a1c4345000000b003a545fe9db4sm5331080wma.23.2022.08.09.11.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 11:45:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 20:44:27 +0200
Message-Id: <20220809184427.2469515-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=QyJR8vut1KFwaO/gyosPPYd+tEQByqMg6dKV/8w9s/Q=;
 b=Tg1rlJL8WF8jwo3HM98EVukL6E/QPLHYcNTZFMuuuV5WTiC3pf780ZzedY9n4Op+hu
 QgX/YH1jxAvsBdzTPExvIKZbXefrjPKLHyamBt3BIBQhcaOLYFkhbWb8lBB9ptgmzgFC
 x+V5zF7CcvcTSCT4PNTfgB3/kZo0lkspgvVtBD/VwU8pMyQ+1GlONAfvaTgL5p/M5RKd
 xIJVBcgpZWKJapTLC77b2Mbx+RLJKc3QJ+B0w3yg0sY/agkxJqXK10exCAl+EpNyz2++
 LnKaC8pnw/SR9xFo5eQDxEa4oFB1N91MEEssDlA0qLZnbIEoZ+SRlZXyWyKndwI+i/sf
 PTBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Tg1rlJL8
Subject: [Buildroot] [PATCH 1/1] package/snort: fix sparc build with
 BR2_OPTIMIZE_FAST
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following sparc build failure with BR2_OPTIMIZE_FAST raised
since bump to version 2.9.19 in commit
65ed981ce0135379b7faeb69519f4e3e666c0717:

cc1: error: argument to '-O' should be a non-negative integer, 'g', 's' or 'fast'

Fixes:
 - http://autobuild.buildroot.org/results/e1a330e1a899fcdf4900e9156d62c90813321e30

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/snort/0008-Fix-NO-OPTIMIZE.patch | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/snort/0008-Fix-NO-OPTIMIZE.patch

diff --git a/package/snort/0008-Fix-NO-OPTIMIZE.patch b/package/snort/0008-Fix-NO-OPTIMIZE.patch
new file mode 100644
index 0000000000..936973fdd6
--- /dev/null
+++ b/package/snort/0008-Fix-NO-OPTIMIZE.patch
@@ -0,0 +1,24 @@
+Fix NO_OPTIMIZE
+
+Fix the following build failure when NO_OPTIMIZE is enabled (e.g. on
+sparc) and -Ofast:
+
+cc1: error: argument to '-O' should be a non-negative integer, 'g', 's' or 'fast'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e1a330e1a899fcdf4900e9156d62c90813321e30
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -Nura snort-2.9.19.orig/configure.in snort-2.9.19/configure.in
+--- snort-2.9.19.orig/configure.in	2022-08-09 20:21:00.236777320 +0200
++++ snort-2.9.19/configure.in	2022-08-09 20:29:02.260993315 +0200
+@@ -1694,7 +1694,7 @@
+ 
+ # Set to no optimization regardless of what user or autostuff set
+ if test "x$NO_OPTIMIZE" = "xyes"; then
+-    CFLAGS=`echo $CFLAGS | sed -e "s/-O./-O0/"`
++    CFLAGS=`echo $CFLAGS | sed -e "s/-O[0-9a-z]*/-O0/"`
+ 
+     # in case user override doesn't include -O
+     if echo $CFLAGS | grep -qve -O0 ; then
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
