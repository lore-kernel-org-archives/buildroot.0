Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6B5C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:24:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBE756101C
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 17:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBE756101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D4DF401E9;
	Sat,  7 Aug 2021 17:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VaPI5tC26AuL; Sat,  7 Aug 2021 17:24:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF4CC40168;
	Sat,  7 Aug 2021 17:24:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EADF21BF39E
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA4CD83934
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 17:24:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 60oGaIi2kh9v for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 17:24:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0C447838E6
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 17:24:06 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id c16so15398262wrp.13
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 10:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZLfD/kphbqA1lvhGVYtxlCiy0ZS0Sh7dVf7d0q+bz6A=;
 b=Gds4iSrty3zfXSzQjzA8Pm5iOVAdj5T5jASdDFPbyL1MrLlXdT8LmY7TpBF8grdg0b
 gpE+f1cVy5PgCbAsPTljzvASdU+eUwM0cURm9g2cWR/O4scqLAFO//4+LqrdZJ1ZxksC
 LygufZRaigmgtwEIT0mRCwOV10Q8+x61ahXNCrtg0j/5d/IFxEAMlyt0iT8ULJFMP1vh
 jArmQXPFb0LcZ4yto1pLKkHMOJbiQbaMp63CA/goYzvgb1PKm5go6S7CroSU3cmyhBJA
 B3o3m/roI7iFw3HM+mOivAcURDgOReGyorxuaf2PF7otv12O4t/35xQzZeu1SeP2116F
 xwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZLfD/kphbqA1lvhGVYtxlCiy0ZS0Sh7dVf7d0q+bz6A=;
 b=gSkUSXlBCqugiMzzG1pjZ44D1knJFycXXMGl0i+pgB0yYtyt8mSgIBEhufYQTRG44I
 5a5OM94GnAtWn7g8G94JA1VU7KUAdtWO3ZDUESrL+gQy/Dkm5bczq70l8fzsr2tDjvrX
 2MvRlY1xTdbCAToo/8xBeWTHnUhqP0ShOhM03GkhTPiV66bOId1EQt/9/7dJftL/6t40
 X6S0Fr8qr6Mltnq/Hhh+3JGfEspEI0pjrxgWaQnmcpdxd9HiKitlmnxlFmolQ4T9tbhH
 wVxQMdF9GNYa0zfm6LXAvvRbEIWSLGMIoTrkzaJ7JUxmE4hZCR5rctRIjCaqkNdtyJgY
 GWYg==
X-Gm-Message-State: AOAM532k+0HNaJRH69XjOdIZoTXx1z1EVFe/ZeXNfXGlnx5TTrJVTJBL
 qA0hKpejxM64F00aTd5B/HOfSQhjqWKElA==
X-Google-Smtp-Source: ABdhPJxOw6YKCFHPTRMvD0GgiaKVny4iy6yV1281ecpB7Lc3dWYIhBupriXV2dagNdtbuxak7WcWuA==
X-Received: by 2002:adf:e3d2:: with SMTP id k18mr16469628wrm.212.1628357045078; 
 Sat, 07 Aug 2021 10:24:05 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id l33sm14369775wms.12.2021.08.07.10.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 10:24:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Aug 2021 19:23:59 +0200
Message-Id: <20210807172359.974226-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libvirt: disable stack-protector
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Set warning_level to 1 instead of the default value of 2 to disable
stack-protector and avoid the following build failure since the addition
of the package in commit ccfc90e1010e42e6529afae3a5ea8bf7226dabc1:

/tmp/instance-5/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: tests/commandhelper.p/commandhelper.c.o: in function `printInput':
commandhelper.c:(.text+0xad): undefined reference to `__stack_chk_guard'

Fixes:
 - http://autobuild.buildroot.org/results/a2657eb18b579752c8217ab356adcb52931f6785

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/libvirt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index a0fd5af951..198e64d24c 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -51,6 +51,7 @@ LIBVIRT_CONF_OPTS = \
 	-Dsysctl_config=enabled \
 	-Dtest_coverage=false \
 	-Dudev=enabled \
+	-Dwarning_level=1 \
 	-Dwireshark_dissector=disabled
 
 ifeq ($(BR2_PACKAGE_ATTR),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
