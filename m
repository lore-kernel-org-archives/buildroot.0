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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20684C636C9
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 19:56:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB9DD61208
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 19:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB9DD61208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=att.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A61CA402D4;
	Wed, 21 Jul 2021 19:56:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IF1-93jsChQt; Wed, 21 Jul 2021 19:56:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C71AB402C2;
	Wed, 21 Jul 2021 19:56:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D00701BF337
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 19:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD25182A2D
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 19:56:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=att.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KKho2H_40KJP for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 19:56:29 +0000 (UTC)
X-Greylist: delayed 00:10:06 by SQLgrey-1.8.0
Received: from sonic312-27.consmr.mail.ne1.yahoo.com
 (sonic312-27.consmr.mail.ne1.yahoo.com [66.163.191.208])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2F8C82A28
 for <buildroot@busybox.net>; Wed, 21 Jul 2021 19:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024;
 t=1626897389; bh=bxbM1ghFwDTRt7YPBcIBgPBK9Xx0DRJv9uuJFZebdz0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=OPB124yzC6rJ7GMeg31qqqjXe5PRxAM78lFaOMGl2/0NkO0vNHucxW0gTvY1zOPlCjBW69o8ot7G7InueqBxWAb8i00XVb5t0t8kBpPwKarsu/AaXL2YZeyF7PxUNNsl93iFXqBi97SaMyzJXYHFtWJlk/yKZqUUyMFCNdogo5k=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1626897389; bh=IR/4QLu5ynJ8RI1ryx+P5pshwnAGAzXrOSAfKZVrXNb=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=bw/kd8gmL4ReU/TKCIA0rfx7Sh7IbYQJtWHy047yQ6SseJpJNQSiFUMEIo1JCpnfMAK5KPPAF1FUUVkzxuE/nFBFJrkoaF5sB0+0sbuIyJ6Y4+0KxSNMBkF5KNKht95wNkR85K66PdXH+w8dZ9OWHxLyfDLZU6XzFVCYXoIDVRiiFRN9kgUwvsG2hhSEiQnw9NwivcmIQCsU/7PvCDQ2yD8xuzz+xBH6j+IrXa7CkntROEyTIWn0GiIZtJcLyKAHCc5g/BUxc5tzOklYMgWoAZ5jgZjKeD+cRVFNVsXO+d5thpGtiYiJi81EWOVIkkf2hLyMudT3rtJ/ypNmZNe5LA==
X-YMail-OSG: okUqTSkVM1lleDsg1ra93zXztFr44IiDPe.JUXF9xqptZn_IeXGtG2TaK7f8g_T
 kOQaZBOkG7NHhbUP0b9A.ANO56S1sX7ATJmg38n3c3kr16qKv9ec2.nQeGekd9yIQYZSyg2GCCXw
 B3RJ6IJ8mbaM.BjPivejJyXDDeZdWytdG4OzDIEZYikYUstAaT_Qy_UyFRtfYhrvLzd.kIhXoAie
 FFbrcf_zsN9Kg9vRInejUVRTOPPSzVHDla4TkTNnZz2EpvWGKtztUhN3FbwbUlvrPpNbaRf3EHpX
 OIHTDROt9_lhYOI9ekGxyK0aGsLSyxz8n3CrCPuyOxsq0Tskc_RXcfbqV0et1eF_v99SktLZnnzz
 P3XG1WeHAhCUw_vMiNW2yZ9BJfSpsz2owEtuVgumWybUadz9eABudOKHXccopfI2yV5n0s0OczLd
 GstId7Nr8pqWWe5mjIvBwrwwg2r.T3kkNYIcbCU54ALG6Ij3YHs3LR4m34lZSkPCmWPSna_orstd
 7Um.9Xg0tn2QwbTrBpA093_1hOkMBuKwHSYze4PoGIeAZ6eptoGTnFQiwCNQHYRGzKRVPIX03sNv
 mz4VRse1HXCz4AzMhBbGP1R3bAD_rfLDCJqBfQ6.jFYxGEOJ3L84iuZvCqkRVWgTts_w37SXSNs0
 u_zLfXgBRE5knBIfoDf_yo48S8KYHYGiy81mUjo5rt4gsm4BVkF49BBJKIAjwe.8r6dCCFJV4bdM
 N9xxibLw7zvMa8AZjys_EoJn97iSTqa.DDiHM5f5EykdkqhWKuLCn5QAezaw9UoxK31eggxftWd_
 ptNB03Xzsiwr67fsTE8OnMZPzrfe16HLV3jzyMUHkWCoBSewYdwLAxPWCnyMiRnlsPxEtyFD8gRz
 p3RzVu2ZdrTNdYlrHJoBc53EyY7FFOrNdG7Cb2p6hLBqBEwSxb12zN8nh3OCHUgaOocPGEcguWS4
 1JRpst7hxCTaCEAHhoTtoQEMlwq4IE0NonYctucx0zmCirViP_gctk82GSgIPDVu2h2ab0qhBrAY
 UjfPnRLS7S4lBTHjSym7g06YwBTZZlbbMgg9vl_TfUurBbyrgir35KiDXeWGL_BpaT2BH_mxeGMH
 6d1seJubvrlki.4I11RQ6BbkPGJlYH.yWBkF9SbP6G3u4mnsJjuLLk4p8qV5WDtDXG9.1mfBS6PB
 hfgqn0Al10eJVu8Cmk.wcuWMCb4tBwnrRPGCjDpflpRfhtCjblNzeIoHpH8KsjfjQx9z27QVO5rK
 RJzdFy3L0X6u9URB4qnFcyuakR5sn3FxCgsSVs5U92Umx3v2sCmeWEQkF56ycpv_iWAMJsLUKpM_
 KiCknaHbCJtYxcHKyTngVZP2hsqgJ02mON6i7DcdCpNSlIWjGE4hIXzal52veeTgAmG_YfZZRVhE
 TwlOa5MOdlhej3F6ftlipM1_5XtXalOBf1qXtuWep23QsJmGo.Xzdd21m5aYrTyxQqYTZBYbiSZL
 x4nUwqoIa__SMa4_qZNmkjiabbMGJ.EyN06LxJ53Of2SQW8WyqSfJCqLJ81lcJuMDOhrj2Icywrt
 4vP8rR82Icz9NvlolmZ6VKr5XP.pBn983l8FAruD4PLuOjPYyMHQ3VkuEop_jjbkln.PA_YBCbyh
 H1v55gZDSOwNEh_lFA.YidyMlDPw4hR9GXO2dESzbdWC56DJNsz2L7ru7mDCLDrJSq4inbjEyErr
 OTPXrW_RuWJOBN8jLU3bXHbQL3mxxD5fSTJ4iZLE9ijgz9pr5a3ozJJ3SsYgumDKn5cCTueDOOIo
 FWA2FpPwJm8j.uHd0EeMJ5PEEbXVm2kVCr7aJozE7biAZmupNYGu.byp0.aeyOjbrjXGVBDku1cV
 wQFWqgfnnz2xxYgbTyY_d66H8poc56kHCnd85h1VZsaISkw7MYAu6bvfbPkIjeiuywuVxrwdHa3A
 xDI5VEcmX9CivT2uvI6uX8aTosYSLqyPQaYNyysxG.IwecHxG6xVO.55_rFatwHcxQx6ZZuvn7Cu
 MFEnj0Xm72uMGadPsDS.9RfiziITvm9J4GWTB3delRJnFzxVyxcwgb67BMYgUvqtwAHvIX_D8lh9
 qOSPlWN3q4mJZcc_lzS9tqARdjI8sTmJsF706dZTk6VCtSmr4iNtIG4T3n1Qbf5Yl.am_9VFLgqh
 f5c37_OlnnHSgeoLT5_LLYNG1V37lZJb7BGkCf6zngMo4YikMo054fEYjegywLX8KEJAbZN6RCd3
 Bl49hf8wqV6tHRKTZTjMg.qnC_qF5TxZ2DEsXzQ_lRw5Yn1Jsob.PpUhBC0NkAOtsBGNI2zs0l3r
 bQhtM0tkper1TBSD_wKhVUKR3gzODSCVCnGSVbqDjUoo05dD0X4NomjYR.d4G4ioOJMm4c2ZEK3g
 0lq7269XgAX9Dwkk6TlyRVBrvI3z9tJNVZ7CXYo81S67.gmxJsCFC9zqFTWgWPTjDjWA11g5YQLf
 ButY4aGSvgZrQklN0g.sFpBYKqZZQA0pCLm9o1koROvY6A.93lB1vyG3JaA--
X-Sonic-MF: <stilor@att.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.ne1.yahoo.com with HTTP; Wed, 21 Jul 2021 19:56:29 +0000
Received: by kubenode536.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 7c1e801e287840b5698701539fb66af6; 
 Wed, 21 Jul 2021 19:46:21 +0000 (UTC)
From: Alexey Neyman <stilor@att.net>
To: buildroot@busybox.net
Date: Wed, 21 Jul 2021 12:46:05 -0700
Message-Id: <20210721194605.1552794-3-stilor@att.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210721194605.1552794-1-stilor@att.net>
References: <20210721194605.1552794-1-stilor@att.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/qemu: filter out long make options
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

Since qemu started using ninja, they have the following fragment in the
Makefile:

MAKE.n = $(findstring n,$(firstword $(MAKEFLAGS)))
NINJAFLAGS = ... $(if $(MAKE.n), -n) ...

Buildroot's generated makefile in the O= directory invokes make in the
base buildroot with --no-print-directory. However, make's placement of
the --no-print-directory in MAKEFLAGS varies between the versions of
the host make; make 4.3 places that at the end while make 3.82 places
it at the beginning. As a result, if building on a system with an older
host make, qemu's makefile invokes `ninja -n` which does not generate
any outputs.

To reproduce, on a CentOS 7 machine or docker image:
  mkdir /tmp/br-build && cd /tmp/br-build
  make -C ~/buildroot pc_x86_64_bios_defconfig O=`pwd`
  make menuconfig # Switch to glibc, enable "QEMU" and "QEMU tools"
  make all # Build succeeds
  find target -name qemu-img # No binary has been built

Signed-off-by: Alexey Neyman <stilor@att.net>
---
 package/qemu/qemu.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 470c285f16..ee3e7c3676 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -206,14 +206,15 @@ define QEMU_CONFIGURE_CMDS
 			$(QEMU_OPTS)
 endef
 
+# QEMU Makefile incorrectly interprets long options to make
 define QEMU_BUILD_CMDS
 	unset TARGET_DIR; \
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+	MAKEFLAGS="$(filter-out --%,$(MAKEFLAGS))" $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define QEMU_INSTALL_TARGET_CMDS
 	unset TARGET_DIR; \
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(QEMU_MAKE_ENV) DESTDIR=$(TARGET_DIR) install
+	MAKEFLAGS="$(filter-out --%,$(MAKEFLAGS))" $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(QEMU_MAKE_ENV) DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
-- 
2.27.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
