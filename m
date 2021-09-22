Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0DDC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 22:22:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B53A561100
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 22:22:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B53A561100
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56CAD83FF1;
	Wed, 22 Sep 2021 22:22:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lPaxIQSq7Hov; Wed, 22 Sep 2021 22:22:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86DEF83FFD;
	Wed, 22 Sep 2021 22:22:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C1111BF3AD
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 22:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57B73403C9
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 22:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0jVUw6Wd_kNB for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 22:22:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4383440397
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 22:22:37 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q11so11269170wrr.9
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 15:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SLhDfJ4+bdcAizvkVvBktKYIRmJhD89YZk9XdlpMr1o=;
 b=KswKaEd0rAyUGyuKkkpEwX5tONbHxLrcV3rZCcJpOCpFWkWTf/COofI/U5FJy9I4F0
 wlDyQCKpz3l2pfDMQBpEIuHV288XAAVJMh+T7MOloynk5bbo4GZChoMz0R+Cl/xJF4bl
 5azCI4qDoVVdHh1pOAK0AW67QtNdPRPIw8fiuRN8l4yaa8Jx4BeEmDQukDZL+zWqhrn5
 XG+WNtzf4l8EReCFfcJ4H1sm6JkSWhFooVatftmBM1zFW+P57djsSlW59WYSXm17RotH
 Ak1JSIPZIEqK27lgflIsakq5PgbhuR6sw7gHcfg9pDroGJk8eqRgWXjpK2K6uLgeNn80
 zu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SLhDfJ4+bdcAizvkVvBktKYIRmJhD89YZk9XdlpMr1o=;
 b=BvoclDaHLSdykvMVcqZYIWLtgmz19TpOjWtb/C7d4Dqp0KDyq7qcd17rd5TFVPDP/m
 vZPiOjJ2jSBeeeqffSTDdzWSYgYYMXWKf7+7oyZDyzqsQcBde9Aqu8iur4mlz5CIeuoQ
 1tbGXuhqfo8KtvTL77QcOB2Fu1kbCHpceDvhrjnofcjcQ/b4zSWqynt5sv4GXcjOJ8HX
 bAqalc5NZrZIG+zElZSIUkbYUp88I1dbSKDvQZZaSmWaeYRE+YYF5paSQyCKBoQpjQzF
 3MqhY2lFLeUQBBMxa/gWIbbHi0sa8ER5y1c7haIEkY19rreGX9xNt4I4AptAph4Gtotk
 QjzQ==
X-Gm-Message-State: AOAM532XWbAt9qNMtK0VBoq2YATKxBy727jclmWvsFMg7pC+QU6eZa5X
 CtCbJGVb0+7UGcv6MhWedEhP46msheo=
X-Google-Smtp-Source: ABdhPJyVrPDkTIkk+BeE1RC1Eo0Vwssqr7gKYZy5glKxR3NV/VmRKBPQWAsmmFw5vvHSM1326bXdpQ==
X-Received: by 2002:a1c:4d01:: with SMTP id o1mr1251635wmh.61.1632349355262;
 Wed, 22 Sep 2021 15:22:35 -0700 (PDT)
Received: from kali.home (pop.92-184-100-47.mobile.abo.orange.fr.
 [92.184.100.47])
 by smtp.gmail.com with ESMTPSA id a202sm7617071wmd.15.2021.09.22.15.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 15:22:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 00:22:10 +0200
Message-Id: <20210922222210.1326663-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/refpolicy: fix build with wireguard
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fix the following build failure with wireguard raised since bump to
version 2.20210908 in commit 78e0af476228ffacc83b4840d401a75eb5b625ff:

 Compiling targeted policy.33
 env LD_LIBRARY_PATH="/tmp/instance-0/output-1/host/lib:/tmp/instance-0/output-1/host/usr/lib" /tmp/instance-0/output-1/host/usr/bin/checkpolicy -c 33 -U deny -S -O -E policy.conf -o policy.33
 policy/modules/services/wireguard.te:66:ERROR 'type iptables_exec_t is not within scope' at token ';' on line 591892:
 #line 66
	allow wireguard_t iptables_exec_t:file { getattr open map read execute ioctl };
 checkpolicy:  error(s) encountered while parsing configuration
 make[1]: *** [Rules.monolithic:79: policy.33] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/a4223accc6adb70b06fd4e74ca4f28484446b6fa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ervices-wireguard.te-make-iptables-o.patch | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 package/refpolicy/0002-policy-modules-services-wireguard.te-make-iptables-o.patch

diff --git a/package/refpolicy/0002-policy-modules-services-wireguard.te-make-iptables-o.patch b/package/refpolicy/0002-policy-modules-services-wireguard.te-make-iptables-o.patch
new file mode 100644
index 0000000000..4cd1f96558
--- /dev/null
+++ b/package/refpolicy/0002-policy-modules-services-wireguard.te-make-iptables-o.patch
@@ -0,0 +1,54 @@
+From 67394d078c2e1438293b25d08cf408b0b0d55755 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 22 Sep 2021 23:55:59 +0200
+Subject: [PATCH] policy/modules/services/wireguard.te: make iptables optional
+
+Make iptables optional to avoid the following build failure raised since
+version 2.20210908 and
+https://github.com/SELinuxProject/refpolicy/commit/7f1a7b1cacd5d211077ce62fbb4e91890e65c820:
+
+ Compiling targeted policy.33
+ env LD_LIBRARY_PATH="/tmp/instance-0/output-1/host/lib:/tmp/instance-0/output-1/host/usr/lib" /tmp/instance-0/output-1/host/usr/bin/checkpolicy -c 33 -U deny -S -O -E policy.conf -o policy.33
+ policy/modules/services/wireguard.te:66:ERROR 'type iptables_exec_t is not within scope' at token ';' on line 591892:
+ #line 66
+	allow wireguard_t iptables_exec_t:file { getattr open map read execute ioctl };
+ checkpolicy:  error(s) encountered while parsing configuration
+ make[1]: *** [Rules.monolithic:79: policy.33] Error 1
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a4223accc6adb70b06fd4e74ca4f28484446b6fa
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/SELinuxProject/refpolicy/pull/408]
+---
+ policy/modules/services/wireguard.te | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/policy/modules/services/wireguard.te b/policy/modules/services/wireguard.te
+index 7241f65e6..33fd3c55d 100644
+--- a/policy/modules/services/wireguard.te
++++ b/policy/modules/services/wireguard.te
+@@ -61,10 +61,6 @@ corecmd_exec_shell(wireguard_t)
+ 
+ domain_use_interactive_fds(wireguard_t)
+ 
+-# wg-quick can be configured to run iptables and other networking
+-# config tools when bringing up/down the wg interfaces
+-iptables_domtrans(wireguard_t)
+-
+ # wg-quick tries to read /proc/filesystem when running "stat" and "mv" commands
+ kernel_dontaudit_read_system_state(wireguard_t)
+ kernel_dontaudit_search_kernel_sysctl(wireguard_t)
+@@ -75,3 +71,9 @@ miscfiles_read_localization(wireguard_t)
+ sysnet_run_ifconfig(wireguard_t, wireguard_roles)
+ 
+ userdom_use_user_terminals(wireguard_t)
++
++# wg-quick can be configured to run iptables and other networking
++# config tools when bringing up/down the wg interfaces
++optional_policy(`
++	iptables_domtrans(wireguard_t)
++')
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
