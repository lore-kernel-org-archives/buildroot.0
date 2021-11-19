Return-Path: <SRS0=y7vk=QG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9419EC4332F
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 16:57:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37C40610D0
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 16:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 37C40610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5C4F4036F;
	Fri, 19 Nov 2021 16:57:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GRAKE9Zz_8Ko; Fri, 19 Nov 2021 16:57:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC875400DA;
	Fri, 19 Nov 2021 16:57:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F3C5C1BF21A
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 16:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3F5F828EF
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 16:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B64zSDw5iADd for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 16:57:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F180C828E3
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 16:57:25 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w29so19183299wra.12
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 08:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C9wrHof1mo7idEuvmWlGBOlDhKDjgdGRfGLGFbMTkf8=;
 b=MHOsuwWIXMEb8dqSpVXymJ0WyzcueG2UcA7WB7jGQujScFdXF7nzJAYN+LlHT1NVCN
 wtOxIUYWoSqumCtRb+wi6wRAqhi54Q2/9UVqtwOwHW/5f6NMQzGFxLFOhxuoawneBH/b
 x6Ice2EwCsFYVltW/HtkjLhlpmg5JyUtjGZRGBqQ4Y4zFurBElA13TxM8+QBREhx0C7t
 HGPRu+zCkLesUvqWMQgD0+U6Ri7a28YbmSq1BTXs952JGKP8lmOCgTHndoJ85DnEThVs
 PNBESb8RKKBIAHov5EAqOfk+UukwPfd6qiwiSlAPp/rrotqSv/ct4ytzRuTM8vHZ/9qE
 zUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C9wrHof1mo7idEuvmWlGBOlDhKDjgdGRfGLGFbMTkf8=;
 b=uT2UKbQH3humsnbZeWQoZSBBTl2TE+9Grih+BDzj4eWVm7bstFgSWvtccHuvEo/fLI
 s90IdmDXeqs8w1yYYtAlZC9qji9WOhrJjLLeCLvhfEdifRJ9Y3UYlybUQfegqV697pKo
 3LBcWlKOe8tBZW4k88RqJjEcpAigeYcxlblyVLei45wNK9GrDGrN+K/FAvAkBS69tJOc
 ZFSG4XJf0/SB62Tp+zbb3dW3f1du4UYrz+WZbVlxBDAekPwAo34uAaUxN5pX8Z3h6cQT
 ETCqlHiEUuCd5/ctcJR4UeIy2D2rwOEtomkXUxkPsMClJc3yVi3VLzpahkwqTTTR2cB+
 sXSA==
X-Gm-Message-State: AOAM530TnuyjM0IubEhNpVyJPHALsMZdZTif1MmvfmOn7gXPqlww1zQY
 jP1RfNdBfo7T5tonl442F+YPxhzyZl8=
X-Google-Smtp-Source: ABdhPJyRCp3kpn0foE5EK+oON3uOsXBIdxd5oXL+okn1E70YR4FskmchTJOyfYdyv40FjaNCYb+80A==
X-Received: by 2002:a5d:460d:: with SMTP id t13mr9043601wrq.44.1637341043879; 
 Fri, 19 Nov 2021 08:57:23 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id j17sm283530wmq.41.2021.11.19.08.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:57:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Nov 2021 17:54:58 +0100
Message-Id: <20211119165458.2410686-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211119165458.2410686-1-fontaine.fabrice@gmail.com>
References: <20211119165458.2410686-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/boost: threads needs date-time
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc >= 7 raised since commit
4e267a7d3d5d350710a81ada188a1629348e4b4a because cmake assumes that
boost threads needs boost date-time:

-- Found Boost: /home/buildroot/autobuild/instance-3/output-1/host/sh4-buildroot-linux-uclibc/sysroot/usr/include (found version "1.77.0") found components: thread chrono atomic missing components: date_time

Fixes:
 - http://autobuild.buildroot.org/results/e7443e3bc955e7eddd7bed63e2728880dabb31a7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 1c405a36c3..8310294ffd 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -348,6 +348,7 @@ config BR2_PACKAGE_BOOST_THREAD
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
 	select BR2_PACKAGE_BOOST_CHRONO
+	select BR2_PACKAGE_BOOST_DATE_TIME
 	select BR2_PACKAGE_BOOST_SYSTEM
 	help
 	  Portable C++ multi-threading. C++11, C++14.
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
