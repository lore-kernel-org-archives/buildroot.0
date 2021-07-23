Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9101C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 16:08:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CA0E60EBD
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 16:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CA0E60EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3881E83B0E;
	Fri, 23 Jul 2021 16:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4TtQHg60r0Ga; Fri, 23 Jul 2021 16:08:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DE2283B0C;
	Fri, 23 Jul 2021 16:08:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4629F1BF299
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 16:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3505840672
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 16:08:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TK3WCyAK0zhT for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 16:08:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EFE140647
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 16:08:35 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 o3-20020a05600c5103b029024c0f9e1a5fso3568436wms.4
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 09:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NwNrc+gjSSVIn4qossdpxsvKSqsEj5B1zmHFOTPqlKY=;
 b=ki8vT0klCQKNJoJDVQwxMqWIQ5BugzTd8iXQRI9INVi3LZIoJNQF+ZUsfpPsKK5AIu
 U+oyKkE0DiQ2bTEpFE2e2TA9djA6O6H7B45E1uBMxdlMoeYPN3ZQwzIXBYYovSQZ8hSl
 QnmTIsv/ALhIqib9ZA9k8SV4b92VmYj7onnOhnY6q/YAwnjwI+Olk15jzSqvOxLvwKYH
 cYp3w1jgSp4FkUt21bw1s5hn0Eo7WmZ0SUOEzghyVykeLdKP1Ygi6EeXpfAVy0+rm4KN
 pjZFuX5WmijSmClAIbL0tf6NsMlhYOC7DYhpooTvUF4LXPVO2iOUvMDwD408SBwc7xjd
 zPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NwNrc+gjSSVIn4qossdpxsvKSqsEj5B1zmHFOTPqlKY=;
 b=GFpfpDHEI2wfZDA6D5fAtjrmRaYV0DdpUEfm8gQA9CJkQ3xqtfaMboPXHnMgQ0z4P/
 YLWsZqrOEEQHIFSO3cpw53aig2es2Z5Z1aCTIKIXecSc1LMC6F1pCYXiAwrAdDl9T8X7
 OPElhIvRIiD/P1o6Yp6fXYSPiB7v2cHWTU4smT7MtCgYESF0awoMVik8qImAG/VBxaH7
 TnEOMhqUNB60Ycfp2ytl9n2BM6T3u3mUW7BIn/ddwnBi/3oOeoEvpZzAvnBKcWnUW/t0
 nNUDhfXubqH/62TtAVBvhoEo2WfnrEjXdmynoQ/00CHNZjsmtLcavucx0DqTixaQE2c8
 7FdA==
X-Gm-Message-State: AOAM531MUiJ60ID+zRI05W+4W3GckAMnKDKoa57ByzDJYjnzOLUiXtzN
 y9EFixyORI1PLeMmGIVy1t/8lxfCRFJG4Q==
X-Google-Smtp-Source: ABdhPJwIEARqkFgUv2jPazGE7sgiY/v0A7iYy7rjq4Zu3p0xJdb2JMKfx+owjTiMVywpMeHNhAKlWQ==
X-Received: by 2002:a1c:6a06:: with SMTP id f6mr12834355wmc.38.1627056514011; 
 Fri, 23 Jul 2021 09:08:34 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id f130sm34122302wmf.23.2021.07.23.09.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:08:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Jul 2021 18:08:06 +0200
Message-Id: <20210723160806.212502-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/proxychains-ng: fix build with
 xtensa
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix build failure with xtensa raised since bump to version 4.14 in
commit 35953d1e61aa8581be09c9dca39365955b10590e

Fixes:
 - http://autobuild.buildroot.org/results/9320d9b2c69882e23bbe7b30057eb8bee0c9d2e5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...configure-fix-check_link_silent-test.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/proxychains-ng/0001-configure-fix-check_link_silent-test.patch

diff --git a/package/proxychains-ng/0001-configure-fix-check_link_silent-test.patch b/package/proxychains-ng/0001-configure-fix-check_link_silent-test.patch
new file mode 100644
index 0000000000..aadfef9cd9
--- /dev/null
+++ b/package/proxychains-ng/0001-configure-fix-check_link_silent-test.patch
@@ -0,0 +1,41 @@
+From 4a557f242a76c6a2a3134acf1d3279818f8ab371 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 23 Jul 2021 09:50:36 +0200
+Subject: [PATCH] configure: fix check_link_silent test
+
+Replace -o /dev/null by -o "$tmpc".out when testing with
+check_link_silent otherwise test will fail with some bugged binutils
+(https://sourceware.org/bugzilla/show_bug.cgi?id=19526) since version
+4.13 and
+https://github.com/rofl0r/proxychains-ng/commit/35a674bdbc294730429a1007c9e7ce01e65b49b5:
+
+checking what's the option to use in linker to set library name ...
+cannot find an option to set library name
+package/pkg-generic.mk:249: recipe for target '/home/buildroot/autobuild/instance-2/output-1/build/proxychains-ng-4.14/.stamp_configured' failed
+
+Fixes:
+ - http://autobuild.buildroot.org/results/9320d9b2c69882e23bbe7b30057eb8bee0c9d2e5
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/rofl0r/proxychains-ng/pull/387]
+---
+ configure | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 8b21b97..cfe19e7 100755
+--- a/configure
++++ b/configure
+@@ -49,7 +49,8 @@ check_compile_run() {
+ 
+ check_link_silent() {
+ 	printf "$2" > "$tmpc"
+-	$CC $OUR_CPPFLAGS $CPPFLAGS $1 $CFLAGS "$tmpc" -o /dev/null >/dev/null 2>&1
++	$CC $OUR_CPPFLAGS $CPPFLAGS $1 $CFLAGS "$tmpc" -o "$tmpc".out  >/dev/null 2>&1
++	rm -f "$tmpc".out
+ }
+ 
+ check_link() {
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
