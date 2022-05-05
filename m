Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10F9BC433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 10:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A56E760FEB;
	Thu,  5 May 2022 10:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8-tm_WbHU0mH; Thu,  5 May 2022 10:10:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C004960AA0;
	Thu,  5 May 2022 10:10:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C515D1BF2B7
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 10:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B27304195F
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 10:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4_9V3KzMvLjY for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 10:10:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 898B041958
 for <buildroot@buildroot.org>; Thu,  5 May 2022 10:10:10 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id o69so3763531pjo.3
 for <buildroot@buildroot.org>; Thu, 05 May 2022 03:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5zKd29TJi6JJmA04q/X+RIJyxx9CY+SvWKYEh0Pndug=;
 b=W+PMouCCnCuTInGxh4DYkCwEy84f4KsWkOYw7dsBwQ/Yf79LPbYwn0gMPjIGo/HdnF
 Uep+o5WfeZgi02lVuQi+cMLRdHMPvSsmdfs1+BqlblkVLe+k77ejEF0G6ajdMtwVGE8a
 wPqNZEzj2IY9+z4rrVNHK3S06aGAAHMF+EFYTO/6AQpwK3hDYqVcwHNcwN8c2vro2GsI
 5fbGoGmr52EAAUlIhusBolb3B69D2flZNIXiOOhEFJPrJbJumYGvBiwB8osdGsZjCrWu
 DcU33Mxe94Gi6QKgZqiwpdzxw0m4owA8XYXp9XJZanyT85Fv8iLWGzTFP3DYg4ZNlM20
 A8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=5zKd29TJi6JJmA04q/X+RIJyxx9CY+SvWKYEh0Pndug=;
 b=8IAEGnDAe8gi+cenPsfkIIcGukuRY15+Dl/UUXRMPDZVNEMKq7U5l041mVe7ssevKG
 Dk8RY2jXHaOrfX9JNpG+Vn5tc31A9kjEHapbBf8urwNHILyGZAVMyi7JQIf7NcFBJLDn
 UoZBIeQ27L33cP6ziXY8XPFARr2HGNR7u7sYYxlv3U7U65xf0nlebKlexm/1kBCrQouD
 pTVDaYYb0+crK7z3VQzFu+HFP4/EbsCQ8WaRHyFGr40S+FwcYKFHCVWH0iPTnudNyyiT
 FL7yNiJbx0zrwOEyocnME/aj711q3W9ESjtw8hIIqlLLq5493CYI6lrbiZpNH+FRAwUY
 /+iw==
X-Gm-Message-State: AOAM5312TVCX5T4MoQ3tVNNH/697T+oPji4hnnKjlaGtbxyL9GyffKKz
 eQo2IKFsZ16hQHDONvsxWP0PgokNl9s=
X-Google-Smtp-Source: ABdhPJxqJ6IUhCQ8qPcXkihXtqQxfu47ZlkVBG2UQrNWdXMrUBPmCnXG9C/9TLKOK95Yk7VQeFSRXA==
X-Received: by 2002:a17:902:bb8d:b0:156:51a1:3f5a with SMTP id
 m13-20020a170902bb8d00b0015651a13f5amr26646080pls.65.1651745408909; 
 Thu, 05 May 2022 03:10:08 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a056a000d6400b0051008603b66sm944146pfv.219.2022.05.05.03.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 03:10:07 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Thu,  5 May 2022 19:39:56 +0930
Message-Id: <20220505100956.155737-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gcc: Disable uclibc for powerpc64 and
 powerpc64le
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

uClibc-ng does not (and has never) supported the 64 bit powerpc
architecture.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
I'm a bit confused as to why uclibc was ever an option. Perhaps I missed
something! I did a search of the mailing list archive and the best I
found was this post from Thomas:

 https://lore.kernel.org/buildroot/20160817193721.0cc1466d@free-electrons.com/

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/gcc/Config.in.host | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index a1fe192d3a24..3364860ec7a4 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -31,6 +31,8 @@ config BR2_GCC_VERSION_9_X
 	# upstream gcc. C-SKY gcc upstream support not tested
 	# with upstream binutils and glibc.
 	depends on !BR2_csky
+	# 64 bit powerpc is not supported by uclibc
+	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && (BR2_powerpc64 || BR2_powerpc64le))
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
 
 config BR2_GCC_VERSION_10_X
@@ -43,6 +45,8 @@ config BR2_GCC_VERSION_10_X
 	# upstream gcc. C-SKY gcc upstream support not tested
 	# with upstream binutils and glibc.
 	depends on !BR2_csky
+	# 64 bit powerpc is not supported by uclibc
+	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && (BR2_powerpc64 || BR2_powerpc64le))
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 
 config BR2_GCC_VERSION_11_X
@@ -54,6 +58,8 @@ config BR2_GCC_VERSION_11_X
 	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
 	depends on !BR2_sparc
+	# 64 bit powerpc is not supported by uclibc
+	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && (BR2_powerpc64 || BR2_powerpc64le))
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 
 endchoice
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
