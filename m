Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3221BC4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 11:38:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6E6C60F3A
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 11:38:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6E6C60F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DE6940456;
	Sat, 31 Jul 2021 11:38:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yjuvuNaVX8ko; Sat, 31 Jul 2021 11:38:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBFF440447;
	Sat, 31 Jul 2021 11:38:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 236951BF846
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 11:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EC108354D
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 11:38:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K9J3p6AWM2Cr for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 11:38:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F156D8280E
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 11:38:48 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id j2so14835754wrx.9
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 04:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a/0AUE8CZtIIOpU9vox1u/yKDu26A/+x7oa0gLuJfio=;
 b=Q6CCPg5iTpebifXbRIYgYFe3T4oedzgwfcGX0UJ21spwPbrknACYAeP3mNIjKA1uMR
 oNacXqcY5cIcMbOQBCJkaO69TuMoRGylzevhxOhnNFmxPQ2hSoHiET8hXnz4jnipq/cU
 auMztcAQMOvwOJ9y30wo1cH6sbpb3eDh/lawCX1WB+dgDLV9dUgIo6gFULZCW9Me/YE4
 5VJ+2XzmKLhIZnOlQxXxfxSJVRJ/NWig3LqFv4xGlqOEqeNMlP9hbje8m7+cSTh/qUQs
 YRkkfr+O+FIOPMEd72G/IsczYsc8ZpNrSpnDZHxIa892iIvwVxyvATuCiOssqly3aGqC
 VjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a/0AUE8CZtIIOpU9vox1u/yKDu26A/+x7oa0gLuJfio=;
 b=XpUDWcm06WvJSTAipEpaG6B+w0C/1KOyY5S8KtwvwNyTgt6V44hqdDIKkCJg284tj0
 bdds9vB+rNRL/wskCB5LWu/PiK3NBCFGfFhAFlWTx4KpxBkDB+OFwZIR65wtedK37Ua6
 Rqhw6xoJAsurUKbElNR00Fc3EXMEoG9HuMyMWWaFzo7uI1NpzEab7t1bZyTltieZL1FZ
 7uj5vVPb6wTDrL1Ydb+ZNT2YpfEvyyXrayycpLuY24XL6FfKXEHFQySvG2qbNJO2mxdR
 EhKS1AIVkQmpA82hLzqCtNb/PogbxRW+FLTjfTY/IGDQicQCgFGrU8gz6zsSVDPzLVck
 6uGw==
X-Gm-Message-State: AOAM5328LGBAVbh/skCo2TLBWXgPyraEOb+sMiHmyxXLoOePvGcI3Z1R
 R6LNDIOCdbrukXzHQohGZAGkl3l1XvFf9w==
X-Google-Smtp-Source: ABdhPJz79ELeMgcnHNwj0ehwzeqIpTOHWRZxP4XmwbcwVj5Xh5s2gK5HKTdv6RpdTNt5dib/6k8ccQ==
X-Received: by 2002:adf:f64b:: with SMTP id x11mr7876818wrp.155.1627731526773; 
 Sat, 31 Jul 2021 04:38:46 -0700 (PDT)
Received: from kali.home (pop.92-184-116-140.mobile.abo.orange.fr.
 [92.184.116.140])
 by smtp.gmail.com with ESMTPSA id 9sm4448969wmf.34.2021.07.31.04.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 04:38:46 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 13:38:39 +0200
Message-Id: <20210731113839.734186-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/refpolicy: fix build with ifplugd
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fix build failure raised since commit
499bf5319bf66ecd28d1b85c39ed7ffdeb5bf296

Fixes:
 - http://autobuild.buildroot.org/results/1e27f5b193d40dfb7c73fbe15d1bef91cb92c27d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ervices-ifplugd.te-make-netutils-opt.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/refpolicy/0003-policy-modules-services-ifplugd.te-make-netutils-opt.patch

diff --git a/package/refpolicy/0003-policy-modules-services-ifplugd.te-make-netutils-opt.patch b/package/refpolicy/0003-policy-modules-services-ifplugd.te-make-netutils-opt.patch
new file mode 100644
index 0000000000..4001f7fe96
--- /dev/null
+++ b/package/refpolicy/0003-policy-modules-services-ifplugd.te-make-netutils-opt.patch
@@ -0,0 +1,48 @@
+From 6dcfb6715de75677165221ee5bd8d4db6e4a01a7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 31 Jul 2021 10:58:42 +0200
+Subject: [PATCH 2/2] policy/modules/services/ifplugd.te: make netutils
+ optional
+
+Make netutils optional to avoid the following build failure:
+
+ Compiling targeted policy.30
+ env LD_LIBRARY_PATH="/tmp/instance-3/output-1/host/lib:/tmp/instance-3/output-1/host/usr/lib" /tmp/instance-3/output-1/host/usr/bin/checkpolicy -c 30 -U deny -S -O -E policy.conf -o policy.30
+ policy/modules/services/ifplugd.te:62:ERROR 'type netutils_exec_t is not within scope' at token ';' on line 73694:
+ #line 62
+ 	allow ifplugd_t netutils_exec_t:file { getattr open map read execute ioctl };
+ checkpolicy:  error(s) encountered while parsing configuration
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1e27f5b193d40dfb7c73fbe15d1bef91cb92c27d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ policy/modules/services/ifplugd.te | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/policy/modules/services/ifplugd.te b/policy/modules/services/ifplugd.te
+index f49b147f7..550eecca4 100644
+--- a/policy/modules/services/ifplugd.te
++++ b/policy/modules/services/ifplugd.te
+@@ -59,8 +59,6 @@ logging_send_syslog_msg(ifplugd_t)
+ 
+ miscfiles_read_localization(ifplugd_t)
+ 
+-netutils_domtrans(ifplugd_t)
+-
+ sysnet_domtrans_ifconfig(ifplugd_t)
+ sysnet_domtrans_dhcpc(ifplugd_t)
+ sysnet_delete_dhcpc_runtime_files(ifplugd_t)
+@@ -70,3 +68,7 @@ sysnet_signal_dhcpc(ifplugd_t)
+ optional_policy(`
+ 	consoletype_exec(ifplugd_t)
+ ')
++
++optional_policy(`
++	netutils_domtrans(ifplugd_t)
++')
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
