Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A56C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 16:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB13B41A42;
	Sun, 18 Sep 2022 16:29:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB13B41A42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XRSFHhe7Bv8a; Sun, 18 Sep 2022 16:29:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA41841A3C;
	Sun, 18 Sep 2022 16:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA41841A3C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 715EE1BF5B5
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 16:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C0AC40A1E
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 16:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C0AC40A1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cVoTCDTTL8qP for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 16:28:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F1DD40989
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F1DD40989
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 16:28:56 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id g3so22659692wrq.13
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 09:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=23lxIDRhFwlxCpN20Q/hVNiPR0EMK4xq+SEur1iWs08=;
 b=Jf40UcEtpRZrP1bRUspLciC0yLMg6vwdxfU3DKOi/cI3KMKuTBMsPPhmHLnXle6RvX
 71UEXSHk8/YCBBaumXFTjq3gMY76N1+pXeFklLxxgWZTLHfE1Lj33gYAJNZwYjB1DC1i
 7si7XPs0qIIIwhg8ceYUFKjow+eH21eHsTpDpkmbvb43ILtNZlk1/o+fdIXLmxpncMEq
 /Wxuh4lOO7YCZt2Kuiawaz2nfhHce1qB6DY2Dwt2lWnShI4T0UjwHl/Zjts8ikJ/Wh2H
 mU4+NM0Chrbm8VpmDRquDZCIbnJrSZ2/j9FvEPVdEee6aMC0xA/dimg5ZHJ40R+GQzYg
 o7ng==
X-Gm-Message-State: ACrzQf0lkX/Wx4UkSL7npOSSJdm+aVO8ln5kKB0kWPV0jBa9H5aaraEN
 8XLjPqlqXg/fwpSTll7liirLCFTaU/8=
X-Google-Smtp-Source: AMsMyM5qh2W5i3cYkK5iwIQZFCzZ72nxK7KxlQoeLtPt9jK90WfS02ot3aiQUnwuq8BsJ+vxcl6iMg==
X-Received: by 2002:a05:6000:186d:b0:22a:45a3:7935 with SMTP id
 d13-20020a056000186d00b0022a45a37935mr8072380wri.209.1663518533903; 
 Sun, 18 Sep 2022 09:28:53 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 o13-20020a5d684d000000b0022a53fe201fsm10698671wrw.68.2022.09.18.09.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 09:28:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 18:28:50 +0200
Message-Id: <20220918162850.25720-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=23lxIDRhFwlxCpN20Q/hVNiPR0EMK4xq+SEur1iWs08=;
 b=ZFf2HZ+tXsv9ivrRLHzE+H2Osv1hoTW0mbqEiYc8PH3uvokwPVDLSQ5rqgLJUizw0A
 8w6zqTcgMNuCMk5KelxvDMFJbg9z6i/EXG4B087v0brUQMvJPKKbYd7haY1QAHrfL8I2
 a6vIr9GdRC6l5YAP75xNysTk+w2Ly7EaQ5BUZQsJLMklBOHPReFUgSFN6htJ9A2bbOLV
 4iAo6B0pgY4PHkdia0RN/7K50Nr6N5x5MX+Sa2i0T9GZ2hSzPbeVkTxfx3hkhHDKMcya
 NXjQeZslJriJh+uT+IT7kjAkDzSh5xAqf8q8LpboTU7HCL9BvSa3x9FQaHOyLEKwc+50
 QF5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZFf2HZ+t
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: handle a10disp
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

a10disp will raise the following build failure with a mainline kernel:

cp: cannot stat '/home/autobuild/autobuild/instance-0/output-1/build/linux-5.17.15/include/video/sunxi_disp_ioctl.h': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/1f2607d6adece4d5dfe17fbdb032a2d228fc030f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 utils/genrandconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index e43452d5b7..10a29912d2 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -304,6 +304,8 @@ def fixup_config(sysinfo, configfile):
     if 'BR2_PACKAGE_AUFS_UTIL=y\n' in configlines and \
        'BR2_PACKAGE_AUFS_UTIL_VERSION=""\n' in configlines:
         return False
+    if 'BR2_PACKAGE_A10DISP=y\n' in configlines:
+        return False
 
     if 'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y\n' in configlines and \
        'BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE=""\n' in configlines and \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
