Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE2BC4321E
	for <buildroot@archiver.kernel.org>; Fri,  2 Dec 2022 14:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E911341BBC;
	Fri,  2 Dec 2022 14:02:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E911341BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mbJb5K8O_-ml; Fri,  2 Dec 2022 14:02:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFA9141BAD;
	Fri,  2 Dec 2022 14:02:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFA9141BAD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A67651BF293
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 14:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81D5960FCE
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 14:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81D5960FCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vrUOpPd8Vesw for <buildroot@lists.busybox.net>;
 Fri,  2 Dec 2022 14:02:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2E8060F29
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2E8060F29
 for <buildroot@buildroot.org>; Fri,  2 Dec 2022 14:02:09 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id w23so4685132ply.12
 for <buildroot@buildroot.org>; Fri, 02 Dec 2022 06:02:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=c6SiSt180fOD6l9qKfskeYpJxgqyncifxkAN/zHF4FE=;
 b=qHAbn15K9u1u33bdehhAQ4UJJNpZW3EN2dxJN2s3O5ymUsfx7wAjjnjBTGYo/xy6nP
 xUAKETApG6Y8KKpt0o5/ew7RXEfm8R2SasEQ8jMKKPIqIEdGgX7eNiyvIP4T/7HSXUrK
 9ikoySBwWgE80BZO/tY8QyrnW1k8CjzYWLCYcygbq1v178jzwhed+anUTxQPfmjhaCXR
 T+VUsRDYt5mwksDeCuJZDORo/zai+8n7exDSAov0tyvKrV0oyrTCKB0vlrs2BEreAb/t
 h8vY6P1GZ4DcYN5HDHn2EyT3CLCBLGwGjJL7gAhWGyjVs1aYHjMOIvq+kYNiKZkqE3Ud
 4Qig==
X-Gm-Message-State: ANoB5pkX3rpmOKQhALvJRxOYVcDuEAgheV33UmMIXz7Rl/FIyendWLnT
 kfwbwDYA5XakGgekHHm5oNLr/7b8M3w=
X-Google-Smtp-Source: AA0mqf4uOJVsXZ72vRFlJiHSH4hJIssRBj5QwTTGhsMg4tXwDojA6FI34Xea3KcExDuvw9QGTY0dzA==
X-Received: by 2002:a17:902:b20c:b0:189:1318:714 with SMTP id
 t12-20020a170902b20c00b0018913180714mr64562566plr.122.1669989728862; 
 Fri, 02 Dec 2022 06:02:08 -0800 (PST)
Received: from [192.168.43.80] (subs03-180-214-233-19.three.co.id.
 [180.214.233.19]) by smtp.gmail.com with ESMTPSA id
 z20-20020aa79f94000000b0056be4dbd4besm5145805pfr.111.2022.12.02.06.02.07
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 06:02:08 -0800 (PST)
Message-ID: <38529777-79a9-dfb5-ec42-b7c37e617281@gmail.com>
Date: Fri, 2 Dec 2022 21:02:06 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Buildroot Mailman <buildroot@buildroot.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c6SiSt180fOD6l9qKfskeYpJxgqyncifxkAN/zHF4FE=;
 b=ocNLNkXpLa4I+M+ThONVqHy9SXG7+RmJYclM1kx3Ez9Yd3tsIyV8zYwg0LLC1jjcKT
 gaIPT2o931XJ/82D64479e9+jt5kqoV5muq2qrY3teBhPfFXOjE+olyf1zsLW94vxtbH
 HLscCUkHoOy5lITHvukn5SM3roQJ2Hu8ebuQlS7hKOwims1fpmkcQAkNfhfKKun6RSW7
 vFA0hF5+RvYIfqBHd1H7cxDY2HCSAzPKtLqNWO22zIZIO6OGbRIwrpkflvD1+KeFdb6j
 bKfRXAv8WFGCNMiuLKEIuDxwVPjoZFiGctOHQm/ziKCMg2YEGA2+bp5y7rW4aWU0Ar2/
 tDHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ocNLNkXp
Subject: [Buildroot] <PACKAGE>_SOURCE with <PACKAGE>_SITE_METHOD = git can
 result to tar.gz with mismatched file extension
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

Hello,

I noticed odd behavior when <PACKAGE>_SOURCE is set whereas <PACKAGE>
is downloaded via git (<PACKAGE>_SITE_METHOD = git).

For example, I'm trying to bump Git package to commit
c000d916380bb59db69c78546928eadd076b9c7d (v2.39.0-rc0). On the makefile
(package/git/git.mk), I bumped by:

---- >8 ----
diff --git a/package/git/git.mk b/package/git/git.mk
index dc587170e8..1990bf8e67 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.31.4
+GIT_VERSION = c000d916380bb59db69c78546928eadd076b9c7d
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
-GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
+GIT_SITE = file:///home/bagas/repo/git-scm
+GIT_SITE_METHOD = git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
 GIT_LICENSE_FILES = COPYING LGPL-2.1
 GIT_CPE_ID_VENDOR = git-scm

(note: I fetch from my local Git project repository, hence file:// URI).

When I fetch the sources (make source), the generated tarball is actually
.tar.gz with $(GIT_VERSION) as the filename. This causes extracting the
tarball to fail. In this case, the tarball is decompressed first with
xzcat, and it complains due to unrecognized compressed format (gzip
instead of xz).

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
