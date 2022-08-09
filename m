Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAA1C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 08:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78A704024B;
	Tue,  9 Aug 2022 08:34:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78A704024B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xN-saVwZphic; Tue,  9 Aug 2022 08:34:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C7FA4019B;
	Tue,  9 Aug 2022 08:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C7FA4019B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CF541BF5F5
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 08:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA65E409B1
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 08:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA65E409B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eKxwUfs-gR59 for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 08:34:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96903409AD
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96903409AD
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 08:34:38 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id z17so13493759wrq.4
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 01:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=MooRttlAjPPISjd0PtPATYxPR4sUJbpRsRvvkNZ2Rt8=;
 b=PHMf9GBC7Z6+Qh1F5X8k+zb6dUXoM6oYvvGfv5KHB8NQ7Fx2EPMToHyAvo1Tr4Bb9i
 ihODCQj3fzO2ovmmcbpNhppnPF5EPatm83Ao0lRsHa30Z+shmzCi2bW++KQQchUEHPUn
 PsG621QE88Hwws1qT1kkwtYp7Liy8z9Kj5CKh3BA2bu2FdlONOscHJBAEE0pBJzs4HhG
 q5g7bLUF82AxEGCrYOq112GYFeRHodZ7A2u8NDl1KXDP9HtXJ8dqxss/Qde5ss2wE6m+
 WXip73kMVXeqCqWl3jUwssscl4G5Oa/n3Zh31CSf2Pfv2uVEq0lmkWu9Zen964HFzN/G
 TJqA==
X-Gm-Message-State: ACgBeo2WzYDwllh21HsvP8raTXACPrcmt+EnsSdGP1ukYBy1uNy41ldO
 TdQcnkWEpxxI1Ws+wlQUXxrTybBLXhM=
X-Google-Smtp-Source: AA6agR4SCz19bewtHswRPCQUl/rkORBYkaHs6U/oclFdId4YRodKl4zVWPQoCdAjm5KLLEC7+Xyzyw==
X-Received: by 2002:a5d:688c:0:b0:21f:160d:8859 with SMTP id
 h12-20020a5d688c000000b0021f160d8859mr14003543wru.711.1660034076484; 
 Tue, 09 Aug 2022 01:34:36 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c510200b003a55e5d0d54sm1561857wms.36.2022.08.09.01.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 01:34:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 10:33:25 +0200
Message-Id: <20220809083325.1906594-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220809083325.1906594-1-fontaine.fabrice@gmail.com>
References: <20220809083325.1906594-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=MooRttlAjPPISjd0PtPATYxPR4sUJbpRsRvvkNZ2Rt8=;
 b=JvjCKI/F4bVYgmarHD4EtTWzS57vAa6TKCTWlloM19tocJnT68Ck3H8zoPjlxPW1uD
 ybaIRpcWyzt7DSPUvDhE0jmBMerbWiRgHAVsqvR0zcW3p+pNun4m21NsvnR822DOObm1
 SiAy7sW2aSq8RCgLocdNBgpwKetj6uy1BCKVWfROgcmVQvnfLTmo1K+czg3CFmJFiNLC
 gFss1WA8s46+64MJQhU+83e3prvLQKmVbpWPsQR0bBelgUXuL1V3iO9pQbplJOU8hFHI
 BJMS+cJM2yiitKq192964jImVYx2LemFBILYxP2gZfaQRR2t9e4jtcPrsAhvILHu53YI
 lFGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JvjCKI/F
Subject: [Buildroot] [PATCH 2/2] package/refpolicy: set default values for
 custom repo
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set default values for custom repo to make sure that a random
configuration with an empty repo location or version for refpolicy
doesn't fail.

Fixes:
 - http://autobuild.buildroot.org/results/98da07a1f9b88e2e8a028a55c8cf76c6ebc28304

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/refpolicy/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 0e72b895df..223f0f5a08 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -56,9 +56,11 @@ if BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
 
 config BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL
 	string "URL of custom repository"
+	default "https://github.com/SELinuxProject/refpolicy"
 
 config BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_VERSION
 	string "Custom repository version"
+	default "RELEASE_2_20220106"
 	help
 	  Revision to use in the typical format used by Git.
 	  E.g. a sha id, tag, branch...
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
