Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D66C636C9
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 19:56:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0C6E6120C
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 19:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0C6E6120C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=att.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B535608B2;
	Wed, 21 Jul 2021 19:56:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UBJMxPmhwGrM; Wed, 21 Jul 2021 19:56:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7F1C607F9;
	Wed, 21 Jul 2021 19:56:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FE631BF337
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 19:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E71B82A28
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 19:56:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=att.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D3XkhUnZH-FN for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 19:56:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from sonic314-24.consmr.mail.ne1.yahoo.com
 (sonic314-24.consmr.mail.ne1.yahoo.com [66.163.189.150])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 715D882A26
 for <buildroot@busybox.net>; Wed, 21 Jul 2021 19:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024;
 t=1626897373; bh=Rvs3l8+0gBqL6DmN+QgJozDi4v/tauSBAswRXTfof7w=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=cjGVRQEQHBlsE0ksj6ibKnE2ZQIqoWlB0yGk30jayyt7mdtW62ujbLXX5v3IcsJ/aog5y/Y/+dWksVBGid3vU429AvTEeLSAG5i6oyclNbKjHCFHbZeQmFzNhpOGOM1H8Q6UKmea+9cX80RRlT5dN9GSyBFzTvJHw+HGo5mYqEc=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1626897373; bh=BqyHn8+x35j8tyH4asj2MvsC5WWC2MdU6McNV0OmZYf=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=OMP5X4oehvguXUIdLnxp2NUWPr689QL8O4oP7rpWeDI4v9ToG6JxbOLUKVBzPLsnXopwETRH0ZzTza/P+cMhIL5Ckt7+dM2cm8asH7tkjbUq4/UiGSlItKpj/bnPp8QKiGUKrXMHbjQODJ2AETSgRLdWoNn0d3Se1bon/ZvlMh6+2N7ZX0Th+BowITnQbly/iBb4zson0Ox7+qvvXu3Hc3Qi4yEQdl+k547SNEj8j+yw0lEkMm07L35CcH/aiPW0HAdya33Za/CCFH4p7hSK7Q/7GVUhBu1+8cpkkMtjF+ZtiWTmhXCR+QCJUmpJA5JB1HnWDmC/mi4AG/ZwnxfDuA==
X-YMail-OSG: f6ZVzqcVM1ml2A7dUDOvibTsZRdB2wHw5u1GZg3rIXRzz0ZM93_JE11dHlV46tf
 skJs7ymtRntjDyswnMiZHrJEEP2HHhMxVHEid1C5eN8Y2FeNQVLoaZZMJnDU79UKYfx2l1M9GhlL
 h5iqkMP6O.aB1N4YrsULg_rAlKau5jteiELYoK5gLhClI52DSrmslwwm9JSdZPmtlWfcfVbKo0Nr
 X2mYnpNSwyYFN_ucq_6lXwg2wsjZTo.RDhXUcvTmj.SlPnJWjS6tGJbF69nqBYbUvMAJtS9MhZzK
 VOUx4EXIHGiEO8exZV6XgUPXajVLzeYARqg0GSNdoApe36mTanmik8Xku2fVY_bea3OR8TS9mnpt
 C5nUenqfVOMQnCbrq55963pMHEkRBmc4TWZ4v13gwdBNMgw9YVWxz2GvFl_b0VGcSHeP6PpMn2ny
 BOwkvfpnjHl3UWTTTqBRKu9GPoMHeVvJp5GS8sT8LeQU7065kutyr0k0p6cRaCTtx7FFLq.ojNwx
 aDpUxp_msuHh33_FoMmFlgZaWNAt2IpR9n47kXOJNz1E1lCyHL.mgqrsdIMEIv4lPUNps3T5m01F
 s7XO0qSCeNjJspQoQ.CJGryt6zT8aQIjySIy9aEQDi4XfvWLNRk4_csIr6Mb35Fd0drU4feLhsMm
 nbgw9dJ0s3q3SO4CFeqcoURGeQvIVYYMW.LtFB8Bixt1eK._Flw5o2LeAmlD3DzgyGSNdOQvh2sH
 BeZu0g6z_7tLqTI8MnZGxCcS3eSnqSVcF0FOuxxMgHPnbULB994_0yfcrmDH3w.z6VlZ2sWyvA0m
 I0OgoU8ZFnClTcwk6NgP2Hofwoob52BgQGY__jBwFeRGXpPPcQTx96UNxahK8h1MBY8bX2I78b.K
 3b6DsAOnMKFWwddDd6kMPctgW2_UlWh9pxByhEQV8Ar6ATGmSObh7rrP79EwmPpahyR1g9z9SPGm
 WqtpJeBt_oBlOP4ZL8Vv0CNy4obW7giyuL4oUYO_loCOEAM05bDEtBzlTZqe9LhJDHXGJjTHed1g
 ZewacRqsFQMa.RG0hjYhfqcDmUN8yVn.9dZkup5tlk.vM3BbiWhty83OV.LGPmXdUOA_HaGXysjd
 Dpqw60KXd5B.zaEV0pMvQbHxmPP09BU9Uj9Te0tSFGqrUJtHxCWpHnevZLz0E36O21cJ8doAnwGx
 pLUzhrLqAUgCEDMd7BGl5bfr46SgFjm4Ooip9tTcluYfR4FbcHGhu.VOgJBhtlNFT3thRcexiPxK
 vG9oWpUYmVETh53qV138tiIknXuCvRboiY1Y7RoX7OfPLbeD3PjKZ1sPqa.YQLcDLlAUNjPFeuF7
 BozyIHPfoPGge2yx6Lmc_BueW.CfV93VlPPbHs0FacZ.7dkrAPvjLIJKGd2s1GP0Xm3nZ285JNMz
 d60NBWDPmBVpBngEE1yM4IM4P.te6F88YANU_3NYVIyJqrhCH3HqaK6oXLp5mo_neaCKqUsy30e7
 YEXVWYscvHnSccBvN_KT3e31kH8eZVZ2jbpVtgtNMUmog4PM8VL11Sm0H42q.GXTc0DIMxucgdGS
 i2KBcEyUWmW60IQd97bBedhGJDluYejJbKiNRFelUANhwdOZAYwMxFk5Irx9TYjoDU1A2Is_EWhw
 A1G2RLMzWE72AcCav3VGXT4oItBDaF7fJ4qvuS7nhl13DeL072yjKs99dBKQTFebh80dNM.u1sWX
 1OntcQcgGKx_nmLWYMmKXPIGILdja08yOWoHdPEBtjCaVa1PWGh0eZuOXGF4g1QZRsLg.cuRJeND
 VTSsgkVxT.yK6.pPh.8MoopynYYw2sPmZK6dqL.elZ0_kYq_bblQaL_T3KyCvNBW0QaAPrPNFkWm
 z5YpxkhWPIpL.DFrxpCoXvYelebVMTkHouXm4b0r0Sws_Jai42k.HMp2abUlW.2eh3NdUvbpb50B
 NK9uPLRn_vcJwuRtscWFF728oZB7AzlRzMQ1m9EfDrHk5cAsxAt1DOEmdp0Fdl7hibjI_5k.bZ_2
 DXLNdv6d8PeLMiIkwJxam3cKCoKRn7hzE62ANXxp3NLeP.w3ne7m81iWYO8eIA0Rejqbi0xGLI8e
 15YrQso9MbdjDYvOq8ayDvfNnngU9SnNEhnZ.HpU2cIp18FFQYkxwRfP2t6COYDSk5vVFNB61i5g
 BhPxJQOYbVmJNTs0CQy5IykdvNT5KuS9UHW6.A3CBNtKCoeMKE7DRm7iDdSE1jF4G_QTqPRr5KXq
 cL2maPVPFtW6zBAfEawQwL2P0SUrlnru2u9ovG851Tiy10rt0YBiqjdJWFhWA2PxquUXkBovILsx
 VZRmKeQOpUVgBxxixzJ6.Kvgx0WFjhWqff.TAC0owqVcLPcS_yr98xo3Ygvj3_TRUpawJn9oFkTu
 J74BXOoZJ0nmahvzbE3VUV4XRaikj634BMOxzu1zOyHxgFu4JTdKT8bejiFEy4HMRXNkbkNHvJ5N
 9n9rz_6zpP0lAgI8CMwKs33jG
X-Sonic-MF: <stilor@att.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.ne1.yahoo.com with HTTP; Wed, 21 Jul 2021 19:56:13 +0000
Received: by kubenode536.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 7c1e801e287840b5698701539fb66af6; 
 Wed, 21 Jul 2021 19:46:08 +0000 (UTC)
From: Alexey Neyman <stilor@att.net>
To: buildroot@busybox.net
Date: Wed, 21 Jul 2021 12:46:03 -0700
Message-Id: <20210721194605.1552794-1-stilor@att.net>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
References: <20210721194605.1552794-1-stilor.ref@att.net>
Subject: [Buildroot] [PATCH 0/2] Fix qemu package build
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
Cc: Alexey Neyman <stilor@att.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Patch ping; no response received to patches submitted 5 days ago.

First, there is a problem that is currently reported by buildroot's
autobuilder: the --disable-git-update option is now deprecated and is
interpreted as --with-git-submodules=validate, which can only work in a
git clone. The correct replacement is --with-git-submodules=ignore.

With that fixed, package/qemu build succeeds. However, on hosts using
make 3.82 (e.g CentOS 7), despite reporting build success, it fails to
actually build or install any target binaries. The problem is that
Qemu's makefile incorrectly interprets the --no-print-directory passed
by buildroot as the -n option to make and injects -n (--just-print) into
its ninja build.

Alexey Neyman (2):
  qemu: do not use deprecated option
  qemu: filter out long make options

 package/qemu/qemu.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
