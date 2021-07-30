Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB25C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 07:23:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 523D26101C
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 07:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 523D26101C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C767400F8;
	Fri, 30 Jul 2021 07:23:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 94M2VbuOBUW8; Fri, 30 Jul 2021 07:23:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03A4240358;
	Fri, 30 Jul 2021 07:23:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB4641C116E
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 07:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAD726063F
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 07:23:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fC270otF2bAR for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 07:23:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8FD560624
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 07:23:37 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id k4so5317797wms.3
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 00:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UVhvfq2NbNnlJtsEB0z0YL6gIHKeUj0AcdaCIQhHNJo=;
 b=qGxVwL3rzt+hfZOUqREB1KIWYzqhTvuWWFfYJJ6WqzCbIKgSwi6BvsIam52wt/Pu5t
 cjyHJ9gYAoeClxvTrUYy5N6RiYPm0HZOrVSFtI4sEyifEiGn7Mwh0AQOpUm2b+Un/I9a
 WND7pffqchaD65WHivCfpvLGc5jHXfMvTNnFYvPucbUxCJehl80r7giUFkM84VfX4CgS
 YPXrjKixGPG9lDwuuKEHbYwBoQ0iaDGOBi+CdXnAM7VnPDgjuXocl8J5FE+0aKJOxjiE
 +LQUxQfqlb/F3QPIm4CPoLFYSOmYfOylzdiHIGM4Z0eUDL4LpkCO0Vayu8CLakEFFC4r
 1sTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UVhvfq2NbNnlJtsEB0z0YL6gIHKeUj0AcdaCIQhHNJo=;
 b=ecrTn9a6bom1Hw3LQB/Z2JwuLaiQsTf4WGIwTRZXu+zuDkMXYnpvG/F9duP0r6HX52
 ul/AXhJtToILdOjbnQdfSQzhCjbpAtsNDXwFQsDI6aYzgU7JtCYTLlVLmDFBHqGfuSIq
 yRUjL5Q86Tzy9Qf0dRPVpOLPXm9o+38Afo5exHAowRdSDg+uDllXatVRn1OQkfZ+w/Yi
 ONDmPSefuBEpBaJ0fdsVMS1tGS9+xgWr0q1PQxCEUFOigCHzP0HSE55FEO7Vi7zVAJXI
 3PHPHe2xdWRDWQWplLXSQe3CpN82iqKtpZRRs9uNDCSzVpUuaNKSBI+OIhGYAUk4nWZH
 Cr7Q==
X-Gm-Message-State: AOAM530wC+tdvRmQe662E7I0SxnOjmr/3sIKatK6pWu+ksINk3PRmVM/
 aYvaQZAVqAiwsl9M7cvHxUTt+lAI3lWXYQ==
X-Google-Smtp-Source: ABdhPJzyRymH2RnHwbpIStZQW4in84ltzhJR77EwxjQMGCdFX+q4yaNbNXIDRlE7/HCJwpImEfr0jg==
X-Received: by 2002:a1c:984e:: with SMTP id a75mr1487292wme.16.1627629814886; 
 Fri, 30 Jul 2021 00:23:34 -0700 (PDT)
Received: from kali.home (pop.92-184-116-13.mobile.abo.orange.fr.
 [92.184.116.13])
 by smtp.gmail.com with ESMTPSA id p5sm847793wrd.25.2021.07.30.00.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 00:23:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 09:23:23 +0200
Message-Id: <20210730072323.3645837-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/refpolicy: fix build with minidlna
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

Fix build failure with minidlna raised since commit
e3c31814adaa3e773c310cd97e28ffea9b980a10

Fixes:
 - http://autobuild.buildroot.org/results/52490172afd9b72b08a7deb0bd3c2124398bbffa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ervices-minidlna.te-make-xdg-optiona.patch | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/refpolicy/0001-policy-modules-services-minidlna.te-make-xdg-optiona.patch

diff --git a/package/refpolicy/0001-policy-modules-services-minidlna.te-make-xdg-optiona.patch b/package/refpolicy/0001-policy-modules-services-minidlna.te-make-xdg-optiona.patch
new file mode 100644
index 0000000000..c4e98ad141
--- /dev/null
+++ b/package/refpolicy/0001-policy-modules-services-minidlna.te-make-xdg-optiona.patch
@@ -0,0 +1,52 @@
+From 65c87bdfb1c895934582988f03f1c9c452c1426b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 25 Jul 2021 17:59:15 +0200
+Subject: [PATCH] policy/modules/services/minidlna.te: make xdg optional
+
+Make xdg optional to avoid the following build failure:
+
+ Compiling targeted policy.28
+ env LD_LIBRARY_PATH="/home/buildroot/autobuild/instance-1/output-1/host/lib:/home/buildroot/autobuild/instance-1/output-1/host/usr/lib" /home/buildroot/autobuild/instance-1/output-1/host/usr/bin/checkpolicy -c 28 -U deny -S -O -E policy.conf -o policy.28
+ policy/modules/services/minidlna.te:85:ERROR 'unknown type xdg_music_t' at token ';' on line 146109:
+ #line 85
+	allow minidlna_t xdg_music_t:dir { getattr search open };
+ checkpolicy:  error(s) encountered while parsing configuration
+ Rules.monolithic:78: recipe for target 'policy.28' failed
+
+Fixes:
+ - http://autobuild.buildroot.org/results/52490172afd9b72b08a7deb0bd3c2124398bbffa/build-end.log
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/SELinuxProject/refpolicy/pull/396]
+---
+ policy/modules/services/minidlna.te | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/policy/modules/services/minidlna.te b/policy/modules/services/minidlna.te
+index b980d2707..4d87e8ee7 100644
+--- a/policy/modules/services/minidlna.te
++++ b/policy/modules/services/minidlna.te
+@@ -82,10 +82,6 @@ logging_search_logs(minidlna_t)
+ miscfiles_read_localization(minidlna_t)
+ miscfiles_read_public_files(minidlna_t)
+ 
+-xdg_read_music(minidlna_t)
+-xdg_read_pictures(minidlna_t)
+-xdg_read_videos(minidlna_t)
+-
+ tunable_policy(`minidlna_read_generic_user_content',`
+ 	userdom_list_user_tmp(minidlna_t)
+ 	userdom_read_user_home_content_files(minidlna_t)
+@@ -101,3 +97,9 @@ tunable_policy(`minidlna_read_generic_user_content',`
+ 	userdom_dontaudit_read_user_home_content_files(minidlna_t)
+ 	userdom_dontaudit_read_user_tmp_files(minidlna_t)
+ ')
++
++optional_policy(`
++	xdg_read_music(minidlna_t)
++	xdg_read_pictures(minidlna_t)
++	xdg_read_videos(minidlna_t)
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
