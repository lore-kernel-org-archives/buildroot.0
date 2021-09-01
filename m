Return-Path: <SRS0=5uHv=NX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5649BC432BE
	for <buildroot@archiver.kernel.org>; Wed,  1 Sep 2021 14:10:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F71060525
	for <buildroot@archiver.kernel.org>; Wed,  1 Sep 2021 14:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F71060525
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C686540728;
	Wed,  1 Sep 2021 14:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kFfreg_Cz9Np; Wed,  1 Sep 2021 14:10:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7F6E424FE;
	Wed,  1 Sep 2021 14:10:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A11941BF280
 for <buildroot@lists.busybox.net>; Wed,  1 Sep 2021 14:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9050D80DFF
 for <buildroot@lists.busybox.net>; Wed,  1 Sep 2021 14:10:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SxUsuZl8fpmm for <buildroot@lists.busybox.net>;
 Wed,  1 Sep 2021 14:10:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B3C580DF8
 for <buildroot@busybox.net>; Wed,  1 Sep 2021 14:10:43 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 j14-20020a1c230e000000b002e748b9a48bso3898229wmj.0
 for <buildroot@busybox.net>; Wed, 01 Sep 2021 07:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4s5oduJ3crQ+JcmmsZUuajSH412TRcfzQW86P+x/Bt0=;
 b=aJNaDzOV9OJuHtzyhxU6VRel9pmMiXuBtiCz4kB9Z736Dd1zIfGBIJbUmAEBKUY6t4
 PbWLBXDEUs1390inL744d0SEv3lWiu5Z+ZypGX0mEaOcOwRt9pz7JFy2JU3PKI2+2wz1
 hu7EhILslg18ZRiwfZ+SUQS8ECqVkNhUn7k6SIGKTU5N8ByMTopRcs0Fdu4YpRGx39q0
 fpfOUl2/pho37M1W4jP8cI8ZsSTbtq99K8IG6j71orCKOj7TA7NqbhOflXdpNyN99wRV
 fUq33F/pPOfIxGzZOnZjMc9ybPaRhbDceOibmzF3nv1GrJ07xOOagjC9/DZXgT2NJJ45
 gQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4s5oduJ3crQ+JcmmsZUuajSH412TRcfzQW86P+x/Bt0=;
 b=IkytmlIw7MSocoMzVShXKcJ0GUJ9/jglsFuhMabOIp6Etm741yGoh9no2kj43wz1Oz
 lkT1IJw4+tGflU1jVaB58a+EKPyULoORaIPXDON//9scfZHCQ4LUUFQV5HXkwFNEKuHr
 UJdzXdU2RB27Kz6hnph4jxVu2RncH1eNqdn9mrxNt59gOLpt9jsJJI6lVb01FYWjF+px
 6Rx6/vbePjJfL9Frujif4UYlneRXNybbwbQSlP/5lVcaVrq0RqDN1LszjelalZYcW7Ey
 nM+RDEluo+DDOZ7ReABIpQWxK76QUlhHaxyzamxTcmDFsblXYEEZw6COPy4RHuWSCSjU
 rKYA==
X-Gm-Message-State: AOAM533zhF9YrmqWKw3yidtmfUE1iHgVdoR8SzbNGNQ9WNZlPzYUEL2b
 LSGWZVmr9t+9SyF1nxtvkM3PTtCVD7A=
X-Google-Smtp-Source: ABdhPJy4ve+cHTx1aTOa4sg5jp+v4c/zzsZac2U9+zaLcZskbVjrbWiGBOhwbhB3qh6ezIfguhegvQ==
X-Received: by 2002:a1c:3954:: with SMTP id g81mr9858238wma.125.1630505441929; 
 Wed, 01 Sep 2021 07:10:41 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id r25sm22654785wra.12.2021.09.01.07.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 07:10:41 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  1 Sep 2021 16:10:29 +0200
Message-Id: <20210901141029.892409-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] support/scripts/pkg-stats: prefers stable
 version from release-monitoring.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

for example with libpng: 1.6.37 instead of 1.7.0beta89

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 support/scripts/pkg-stats | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index cc91d1316..249cc6afe 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -485,6 +485,7 @@ async def check_package_get_latest_version_by_distro(session, pkg, retry=True):
 
             data = await resp.json()
             version = data['version'] if 'version' in data else None
+            version = data['stable_versions'][0] if 'stable_versions' in data else version
             check_package_latest_version_set_status(pkg,
                                                     RM_API_STATUS_FOUND_BY_DISTRO,
                                                     version,
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
