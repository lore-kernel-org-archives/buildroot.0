Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535DCC636C9
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 19:56:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EE7E61208
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 19:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EE7E61208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=att.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB4BE40134;
	Wed, 21 Jul 2021 19:56:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EH85qQHDL9bq; Wed, 21 Jul 2021 19:56:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D089400E1;
	Wed, 21 Jul 2021 19:56:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 037A51BF337
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 19:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E761082A28
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 19:56:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=att.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YQ4E3QmOjS6L for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 19:56:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from sonic314-24.consmr.mail.ne1.yahoo.com
 (sonic314-24.consmr.mail.ne1.yahoo.com [66.163.189.150])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66B2D82A26
 for <buildroot@busybox.net>; Wed, 21 Jul 2021 19:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024;
 t=1626897383; bh=5Em90Mf8m0+Jofp1qvIMeWiHnwFWepuJ3CxN+vzZFyc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=SONa8kEzI8p+ARTe0pZqL6ISU4j3BqKy55NnPdSxGWLLxs1l2swkXI6G7MmpFPfmglRCnwPs9QaBQ2XDPxfAL+RK2YRhRWi+HQDkuxRuJ4SpYqblbDlt5SegBim9JvSFDEhueP0Nkw7w2NjFTOg6cO75qaphWQpTh5Wc1zBgUi4=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1626897383; bh=uznoPDDNJRd4/nPTfnhqGBm2e4w4M6vRG/MSSHMYVzW=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=UohpxYW1JcOP/HL68fOayIokNiMNqZthGuGk5FXzjDanDRuG7Ud9ltP9SC5nOMbr0J7nFwe6wEmgme19UZ7QRPegq/8ubX9I6KHgMbY6GssVJGLTE2a8e2IwyOQzVFj4/BGIrP0bwU6QR1JLCja3TagYGrIWXtd+bos1UBZtlMRIigvB3jF2g5ff1FwY8n7G7F/Ij3TXKUHZcW02C4rpsNumc9vpkppqiMixfJhUy/8SS8NoBv32C0ODtpf90a2buNqCgI0YhZiciHyLLi1UJJyD0RSTptjbCl2RDzVHsUemzfN5MTBN0h3phJEP5+CFtlzxKWaSUkdlSILKdYrQgQ==
X-YMail-OSG: 3HTqNFwVM1nUELqpQB3o3fXr19JR9mR2GnTvRqP.UPrvZ8szGkj8PxCsVo9IXYG
 QyKes6bzDr51fa5FsHigEVKlXRED_._ic7uPJAXPOPiAXmSGeJnPDzr_NPCuyd3aoScuUvnte3Q9
 p2vhJmNynHP7QnotS6P4R553ENmF_BXVW212CGw40pBDX0lYZqcxtQY6LmbWAQUWhnTEXDxHDgbP
 qMnBXqPn7jMomhgYIZwk_dXfqWYnD1SMZKhhH0zUXRgWu7PH.D2BVlj.ImlOWr_X0ARUSemOjzhH
 6ir8azIB5sjPsgWlNsI8z9XtF4O8e8.AYdRjpUP.X_zhFQS8eNH.PHdZGHaj3W5T.WaFgl9zaQLB
 HkKFU9PBV2UD2cPPw5EGuxo7lXsR47vBQnzW6pQ1fVVBIWE5ScSUYb9_Dzzf5NfDKZibIl5ECUIs
 KVmPm.D52ZVtCkOyTIMulhJ2.ErYfXg5Pa_mpHBWuqcr59AAFFZlUwBYzmrYzjksT__jQ4qFsDzx
 3FidaZ9hLGcbRTBoK5xvNl_HLN3lSzyqXYQkHRU7IT6.el89..5TKT5CWFESxMmO2EMbQlTjIqGK
 Jv195OMMkq5jmI1tmGUhzIjUqHge2mcyLvznKswYGDNmpTeKP74pGd63GroZtaiyXZRVXUEvY.Ai
 wBj30JWuCJMD5kndWHXoDhnHi_q_CD1glXiL__kymKkBQE6plQfPWoPmMxvqPQ1pPzq9fM0A5e3e
 ufb3TNjyKkGjj_NiiV4QUeuIAevBFc5y3jBm0ZLTi_XFz8nCLNWuZ5AHykKB9vCXnv00cE5MQm01
 NYcNRWIIZh2Ri_f8G8bLNwt8zdekQXG7gjFg.c_uTkICyCDkCh6rNm3JmnYn.DPlyL4f2tI3K5Yg
 2tZfCOHtZPDVD9quoR2yTCQ6N_4rRfy1TyIgBKe4mBSDR7_hsF6FHfKUtw_tLg7nfnyGl1tdoNkt
 n3eAOBIukpPL4ehXFFtSHp3tVaHdoeWxOBPdl3a147csL_8BG7x2cqhwh9N46utBL_U8_JN1TCbl
 LLbjYK7YcTovwOG2VghpJ2mON6L_avHjzmE7hEJdI8OvSEUxc7UNxBpLryN10dqHK0sBX7HFXXij
 ccELNvHuCfCy7IFgiWshBaqayegxaDt2uHvsTlKpYvF08s9inPOkstjf_I8rJM3_rXuz9IvBUGwq
 nKBP6P8kHF1nJAHnnGB__ko2rTPRsF.XA.pu9Sv8eAMufSo3zF5p..TGvgKGXCXNUhi4vqvjR6Il
 4cPc7s7tlYJuA6oRqEpFbWmYwkpYdWFo6ljG2wmAkUjQysEyXNyQ0Z0iqnA31IzJnqziXm5GNbYV
 A27okleOq5BnnxZpyzCIHEmTN32ib_grH9U49ysJMuIBBiyG9dpSevc0H7eMj2Et0jwIOXJfgTJs
 39PnMZYtAt6pirOTijBt5OjLXrksjZN7LjZHbEiiyfFlfFJKdIlFiztIiN90j_54o2W4.cYbrEW1
 T9581J8PnuTq6oKsCLcT90OLGX54Ld5il.6qPI3XeZkQt09IstreF_bdj5iv1RXp5IwfnJulYjZ9
 MA1.CzA9KDzW81Pr8SblfxQmB5HbBylFc2BBNybMxZzAbzQT6sf1L.vG_bgxy386Lj4oyAU8PrJz
 qi1Bk1DqbLSpFGqE_rqeWt_cblrjx26H1zr8u9vnU6_G.UXQEpMwTn9fjCf0bn_clYqtwWuELdD.
 Mtu_aLXxhsHL6yy0qTfycOoJfvo1yAj3e2boaAcyS9CAA3bhoOWRb9UEH6JIYp4pTN7TKAD3Ij4.
 ec1QfkSuwkXCR31vZfSn6.sCiNGFpG4wyFJA6FdKH3JKsJWYJiElJ_KYobmw_eEyqY2TH5JQz_4E
 pJsSWvGlJGZ81Vv3l.mfIgpZ0uA81CSe9Q_.i7GdDIuav4.O0jiR1WnUfL.bm7Q1GWNhAfyck9hv
 J4YQFoGkPk9XBWhEX6TEPn4.xDXr1H_wfjNfQljOCIT_Bn7J2N_WbOwpp1FFamEa2K.z56DfIqIm
 QIgSFOQJ6SsrdAdcy9ZYxAYBS8sTsKg_paPg8LLSbFV62EONAsGh.a2kQBGIjQ68f31RHjHbUc7B
 eBb4iAtEQDjpy18ncCGrouiDHcSXukWv4AFx96kTnur1bO594g9TFb2DkCx2icpgvCBav_N6MuvV
 a2ZlEV0mgZGdUxPAuRH4uaeicvkPPnRglrGzycGWW0AC9tJCi068LKlGtFNkJPjWAZwidCRi6HqM
 9kf52Mj9GyGquhTu1gJO15BbuHDX.ZKU_qkHkiSICCrx__G8cfFZGcRbc6FeNFvPXfYmgfjRy0oS
 97acgYA1n_d3giGkT2ndddAL9KU52QCjkpMV9tETUY8q2zFVE1ZpOV0KxoyOQZyDAZdiM79aRX5Y
 DoiUE3WyQYo3IgJfnoYNX78q.Pw.R_2LT5kNkAgTFzRvUXF0Whc03l5HdBM3_KO8s3MSXAqcTs0K
 c.Rg722Y8aiJmRxr.X6lx_5wx75dHlN3IHqmjPYBRYD2Nb944i_tBCtfqC0g-
X-Sonic-MF: <stilor@att.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.ne1.yahoo.com with HTTP; Wed, 21 Jul 2021 19:56:23 +0000
Received: by kubenode536.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 7c1e801e287840b5698701539fb66af6; 
 Wed, 21 Jul 2021 19:46:17 +0000 (UTC)
From: Alexey Neyman <stilor@att.net>
To: buildroot@busybox.net
Date: Wed, 21 Jul 2021 12:46:04 -0700
Message-Id: <20210721194605.1552794-2-stilor@att.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210721194605.1552794-1-stilor@att.net>
References: <20210721194605.1552794-1-stilor@att.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/qemu: do not use deprecated option
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

Qemu build fails with:

--disable-git-update deprecated, use --with-git-submodules=validate
ERROR: cannot validate git submodules without .git

Use --with-git-submodules=ignore instead.

Signed-off-by: Alexey Neyman <stilor@att.net>
---
 package/qemu/qemu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index e0f722cf42..470c285f16 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -198,7 +198,7 @@ define QEMU_CONFIGURE_CMDS
 			--disable-vhost-crypto \
 			--disable-libxml2 \
 			--disable-capstone \
-			--disable-git-update \
+			--with-git-submodules=ignore \
 			--disable-opengl \
 			--disable-vhost-user-blk-server \
 			--disable-virtiofsd \
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
