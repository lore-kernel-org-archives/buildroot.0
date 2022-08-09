Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5029AC25B0C
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 14:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2651409EC;
	Tue,  9 Aug 2022 14:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2651409EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EiasTi3TIibM; Tue,  9 Aug 2022 14:32:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEBEA40992;
	Tue,  9 Aug 2022 14:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEBEA40992
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC69A1BF2F2
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 14:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86BF781551
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 14:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86BF781551
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ouVrnnfJ0Bhi for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 14:31:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80DAE81439
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80DAE81439
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 14:31:46 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 186-20020a1c02c3000000b003a34ac64bdfso6770328wmc.1
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 07:31:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=KLuV1nHD9yKhtdaMvNwpAOvVzMuzTe7Qt0mbH5jjJbA=;
 b=MWyIOEwpAg8XvyLjMncqnJW0VrJHnKlNNWEvClLTno3iZnc9s8WythqmG0sAunanbU
 mSMSPwzFOBLnVzvkgm7lrbOWuoGa/UA3FNpMW0WcyFSBYqaqeFWwBmjq1F8uilCVjrC6
 wn6Hf6GnnhPchz5REHEfijesQhNayDWhqTV1k81a2M0+lAGqVO6uOI1Q4PlB2opYiAlz
 mwAfvbIcBOHBiHV/Osu99viXscWecBlVHQ3h2f3hfRnH7ZiaDdk4kvWNYpDgWKt2t4yO
 aJi+nh1Tg5iUSBZ3VcwTknzxrxoSIVi6AMlh4O2r5OQHb+wstd5P0M74ubzW5F7p6ZoG
 VnTQ==
X-Gm-Message-State: ACgBeo0r+FfpyWAsIxctpvxXMCHHtIXTDzahFIwmyidtmyanOw7Ogt2s
 0nVHC7Ng8LSTEPwuAeuaiwuX5EHWvgo=
X-Google-Smtp-Source: AA6agR5Ky1pCRoYMd2/I8Weuw6FEUctlgxid2rBZn7uxqjCevTsnSgeH+sDnG3DLO7s8vGqmyaTlgQ==
X-Received: by 2002:a1c:7401:0:b0:3a3:182f:7be9 with SMTP id
 p1-20020a1c7401000000b003a3182f7be9mr20609166wmc.189.1660055504467; 
 Tue, 09 Aug 2022 07:31:44 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a5d6647000000b002217aed23b4sm10584938wrw.12.2022.08.09.07.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 07:31:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 16:31:26 +0200
Message-Id: <20220809143126.1912662-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220809143126.1912662-1-fontaine.fabrice@gmail.com>
References: <20220809143126.1912662-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=KLuV1nHD9yKhtdaMvNwpAOvVzMuzTe7Qt0mbH5jjJbA=;
 b=MRTNf1ODvn43pHahD+LGzjQ0hE7D9w/Vo8Z3nmMWBo+BQo00+hAgCMhpbYSBgd+ZLX
 hrWiMJmLz0pYbMdfwIZrOxH+v8rvEB6e907a2SdHEQcPIj77UtHHwQ/rhzjRqV0Etz7z
 p5dZZpYVXllJexvphyJloBbS7MfWAJrVnmie1h5Py3fcfQNu2HQfUZZY5CuFOLCl9ODS
 o/yTGxB5KlDYsTtX70P94aZhP17ENep0eVdGHV8YGG1yeLZ1y2yXsb20LtreqEk83W+t
 i14ypJUuX1HVKmwVhhXN3Q8fo2mtndZXuNVOyhwHsEsiFbI4YoUgH8caa1tquaerz+RE
 YLbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MRTNf1OD
Subject: [Buildroot] [PATCH v3,
 2/2] utils/genrandconfig: add xenomai custom handling
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add custom cases to make sure that a random configuration with an empty
git, tarball location or version for xenomai doesn't fail. It reverts to
BR2_PACKAGE_XENOMAI_LATEST_VERSION in these cases.

Fixes:
 - http://autobuild.buildroot.org/results/19419759b4add0197b4e629d0b2216c2a07624b2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Thomas Petazzoni):
 - Update utils/genrandconfig instead of setting default values in
   package/xenomai/Config.in

 utils/genrandconfig | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 4846c316bb..b8ca628724 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -542,6 +542,27 @@ def fixup_config(sysinfo, configfile):
         configlines.append('BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION=y\n')
         configlines.remove('BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL=""\n')
 
+    if 'BR2_PACKAGE_XENOMAI=y\n' in configlines and \
+       'BR2_PACKAGE_XENOMAI_CUSTOM_GIT=y\n' in configlines and \
+       'BR2_PACKAGE_XENOMAI_REPOSITORY=""\n' in configlines:
+        configlines.remove('BR2_PACKAGE_XENOMAI_CUSTOM_GIT=y\n')
+        configlines.append('BR2_PACKAGE_XENOMAI_LATEST_VERSION=y\n')
+        configlines.remove('BR2_PACKAGE_XENOMAI_REPOSITORY=""\n')
+
+    if 'BR2_PACKAGE_XENOMAI=y\n' in configlines and \
+       'BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL=y\n' in configlines and \
+       'BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL_URL=""\n' in configlines:
+        configlines.remove('BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL=y\n')
+        configlines.append('BR2_PACKAGE_XENOMAI_LATEST_VERSION=y\n')
+        configlines.remove('BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL_URL=""\n')
+
+    if 'BR2_PACKAGE_XENOMAI=y\n' in configlines and \
+       'BR2_PACKAGE_XENOMAI_CUSTOM_VERSION=y\n' in configlines and \
+       'BR2_PACKAGE_XENOMAI_CUSTOM_VERSION_VALUE=""\n' in configlines:
+        configlines.remove('BR2_PACKAGE_XENOMAI_CUSTOM_VERSION=y\n')
+        configlines.append('BR2_PACKAGE_XENOMAI_LATEST_VERSION=y\n')
+        configlines.remove('BR2_PACKAGE_XENOMAI_CUSTOM_VERSION_VALUE=""\n')
+
     if 'BR2_PACKAGE_XVISOR=y\n' in configlines and \
        'BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG=y\n' in configlines and \
        'BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE=""\n' in configlines:
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
