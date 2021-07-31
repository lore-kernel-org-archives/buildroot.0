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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E53C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 08:33:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10A5060FE7
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 08:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 10A5060FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C71C6404CF;
	Sat, 31 Jul 2021 08:33:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OMgoHZvamueC; Sat, 31 Jul 2021 08:33:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20992404C8;
	Sat, 31 Jul 2021 08:33:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75C521BF836
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 08:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 714514026D
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 08:33:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JmT5H90gFCKP for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 08:33:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F24B401C8
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 08:33:16 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id u15so7373223wmj.1
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 01:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sCbb4OeoSGihDraPAEJlagVCCbJWPTYYK2zyL12yVVw=;
 b=OqU/ujguDPoyddjxYx1oVctxxdSoQd2H4XCDpnGLDVsF6JPzu8reU+le7Mk8gNgPfj
 ZQMn1nCECK6Oy9JPkiKcOTGT+Cpy8lhugLbs0Lf6mXdw/xP37RokZiEBxdB50Wry07En
 /b2Nd4RkKej8jxVUwtN4BGgZtzoT3+ayVYW9YqzZSIJyTsngfuDWO5QPDtRAHW5Q4Y4V
 MWYAcNwxBMAwQc7NpWJN3h87dvA9I/EF6sFZPPf8uWog9VKSupCRYYEyQILGUDm4z9cT
 zDSjOi3hYcPc9d4Z2/zqw/pn9PmKgyRqHnNctUYnZkb6LrH9euhullIWPkjeGL0WIt+z
 VuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sCbb4OeoSGihDraPAEJlagVCCbJWPTYYK2zyL12yVVw=;
 b=TVyu+1a9334tBi8NUxyBO4lXS1T5siaf7OqT8JFEtgYWpFdcP67kHwksnwXpm3W5Z/
 b8FdVjaEUbJs1XOdKM6WVQnSeBY4pdbVSxuJAJrdYgPNKMtWf7jrsLIQRC/n/GEu/8ZA
 qUE6acRX76AzR01qXG02DtR4+j9gVSOAxeKI5CpwKT2sTfOZMBMn+7Lwq7UMEqZMYzTX
 FbFa68fyIbumED9NjfXqCG4HAqliZeZGIVwCPoikjMcYJ2mt4zaY8TbZvdGuCWBQDd8S
 m1ML9hAmrmUw1u7OpZnzw98z+v9ho8yj5lZNdVxJv2PYROdwLvA+DKGlNMNpwv6q6NII
 7m7Q==
X-Gm-Message-State: AOAM5321gS20VARLceSWudRkNlSO3IXfZCglZNaN+yxXFOnb7iy2EKqG
 z0NbGh+KiBrnCZlUQTOx3Ce504yBY3QMhw==
X-Google-Smtp-Source: ABdhPJyws+uhETQVYg74JuiQc8S2HDK9R94QRNHKJx0EXFdMb7yXhmInZSKsNxvAkD9zt6pPdfx6gg==
X-Received: by 2002:a05:600c:4105:: with SMTP id
 j5mr7283998wmi.86.1627720394814; 
 Sat, 31 Jul 2021 01:33:14 -0700 (PDT)
Received: from kali.home (pop.92-184-116-151.mobile.abo.orange.fr.
 [92.184.116.151])
 by smtp.gmail.com with ESMTPSA id m20sm3766054wms.3.2021.07.31.01.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 01:33:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 10:33:00 +0200
Message-Id: <20210731083301.623101-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/refpolicy: fix build with cvs
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

Fix build failure with cvs raised since commit
da93f38cb19f7f7a9b75232f5f2bad25b8180982 by making inetd optional

Fixes:
 - http://autobuild.buildroot.org/results/838266bef1deec560e336d03a64d64fa1990c344

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-services-cvs.te-make-inetd-optional.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/refpolicy/0002-policy-modules-services-cvs.te-make-inetd-optional.patch

diff --git a/package/refpolicy/0002-policy-modules-services-cvs.te-make-inetd-optional.patch b/package/refpolicy/0002-policy-modules-services-cvs.te-make-inetd-optional.patch
new file mode 100644
index 0000000000..ae1200a88f
--- /dev/null
+++ b/package/refpolicy/0002-policy-modules-services-cvs.te-make-inetd-optional.patch
@@ -0,0 +1,37 @@
+From 21b0a5bc50e15e9af7edb3edad9fac0bf03f7028 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 30 Jul 2021 23:11:38 +0200
+Subject: [PATCH 2/2] policy/modules/services/cvs.te: make inetd optional
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ policy/modules/services/cvs.te | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/policy/modules/services/cvs.te b/policy/modules/services/cvs.te
+index f2f60556c..61589228f 100644
+--- a/policy/modules/services/cvs.te
++++ b/policy/modules/services/cvs.te
+@@ -15,7 +15,6 @@ gen_tunable(allow_cvs_read_shadow, false)
+ 
+ type cvs_t;
+ type cvs_exec_t;
+-inetd_tcp_service_domain(cvs_t, cvs_exec_t)
+ init_daemon_domain(cvs_t, cvs_exec_t)
+ application_executable_file(cvs_exec_t)
+ 
+@@ -98,6 +97,10 @@ tunable_policy(`allow_cvs_read_shadow',`
+ 	auth_tunable_read_shadow(cvs_t)
+ ')
+ 
++optional_policy(`
++	inetd_tcp_service_domain(cvs_t, cvs_exec_t)
++')
++
+ optional_policy(`
+ 	kerberos_read_config(cvs_t)
+ 	kerberos_read_keytab(cvs_t)
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
