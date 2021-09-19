Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F9BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:13:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B840661074
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 12:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B840661074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D6E68402E;
	Sun, 19 Sep 2021 12:13:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LsWfPay8_Vpl; Sun, 19 Sep 2021 12:13:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD79F8401B;
	Sun, 19 Sep 2021 12:13:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97DAF1BF2F3
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 941528401B
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 12:13:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 88kDpLDqodPl for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 12:13:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABE9684011
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 12:13:11 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d6so23465370wrc.11
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 05:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TSkWg1/cpA6yO1MkWSwE182ydAbT1gYFOvy2R7v41rA=;
 b=iorhr5ZkzL//EGKXzF/7M89eHum0UrBahlbH6MTdYxrcHGmYEqGfQl4Rky8BRAfSfu
 jVPLizvitr/52WHObTjFTcErUwrxjTXDEWX1dOg/iL5iPjq+I35MT96ag03QY3wYfaCU
 Lz2B16BceuAceq+tGGGaPpvDCdkFIftLAp7Qnhn3AJx4lSbYWfel9OdS0mCvrsifn6Ya
 ai3RpLVlDnMYt0ReTvzr5+Zb5ZI4NnfUUHVoVt1ybNsByzxPztSRN+hPTOm6mg5rgl91
 3YVXXpdKiGN0XT+ecWxWt8NerALfRMb9cVhI/amaVD1Sll2qUm90ELP7+fgjSQtURYjF
 C3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TSkWg1/cpA6yO1MkWSwE182ydAbT1gYFOvy2R7v41rA=;
 b=M9J43R1fNE7okPcT+8Jqco3998A5a3EzlrUFZaJ1dKw09NDipqGnT8YP4PAx3v9EKN
 YQ1Sv8d3xyhpgYtaDdW+8ybg6avTeBhGzGbzudlatMuXGTzFssQTRM95ViQMuff3Jawy
 gPN5VjsS7vk4kvM8wlaLX1+vCo4f7ms8vTRDRckDjyYJwIH5xjoCh251U3uO12bnKhG1
 +6+piJxYTeWfldmzefu4TisMCRuTO6crQuCSB9qPMLguR043HNuvm3wCLlq42i9R3IW5
 wvzQ501zzqpkd/xZW8ywTcs1IkHTPqmRqqBcv6yB0DyH45lochqelnHHnUMCab79iErZ
 SePw==
X-Gm-Message-State: AOAM530rp5+mz2sYKIvs7lS2l2KW8ZjwgfhA/+XWoZNnWw3hmy7XlbM/
 6JBAxEt0TCeYRMeDdNukhgDKcvrov2I=
X-Google-Smtp-Source: ABdhPJw80XzjDGrZ+bf+XPEhybn+x4Uw6fc2JeIoe+zlW6DmIk2lgkPaVhHSTZTE2Z2Y2OLIizUiYA==
X-Received: by 2002:adf:e44f:: with SMTP id t15mr23011823wrm.394.1632053589505; 
 Sun, 19 Sep 2021 05:13:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id z13sm14799397wrs.90.2021.09.19.05.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 05:13:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 14:11:40 +0200
Message-Id: <20210919121140.2323338-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gstd: needs gst-debug
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

gstd needs gst-debug since its addition in commit
02ea01ea22e94ef353a638bf16f62f6e3ed1208e:

/home/giuliobenetti/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-gnu/10.2.0/../../../../riscv64-buildroot-linux-gnu/bin/ld: gstd/libgstd-core.so.0.13.0.p/gstd_pipeline.c.o: in function `gstd_pipeline_get_property':
gstd_pipeline.c:(.text+0x5d8): undefined reference to `gst_debug_bin_to_dot_data'

Fixes:
 - http://autobuild.buildroot.org/results/2f4de1b229df47d9bfd5a2576fd59da2ad45aeb6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gstreamer1/gstd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gstreamer1/gstd/Config.in b/package/gstreamer1/gstd/Config.in
index 14cda7c45f..f36d25f11f 100644
--- a/package/gstreamer1/gstd/Config.in
+++ b/package/gstreamer1/gstd/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GSTD
 	depends on BR2_USE_WCHAR # libglib2 -> gettext, libsoup
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2, libsoup
 	depends on BR2_USE_MMU # libdaemon, libglib2
+	select BR2_PACKAGE_GSTREAMER1_GST_DEBUG # gst_debug_bin_to_dot_data
 	select BR2_PACKAGE_JANSSON
 	select BR2_PACKAGE_JSON_GLIB
 	select BR2_PACKAGE_LIBDAEMON
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
