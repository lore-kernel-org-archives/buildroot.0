Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13080C432BE
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 20:28:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7DCF60FE7
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 20:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7DCF60FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 796B8403F2;
	Fri,  6 Aug 2021 20:28:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4oYvZPjxDPsV; Fri,  6 Aug 2021 20:28:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D16144041F;
	Fri,  6 Aug 2021 20:28:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C51A81BF3AF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 20:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3EA8403F2
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 20:27:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0hW0QOPVKJmj for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 20:27:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84268403E9
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 20:27:58 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 n12-20020a05600c3b8cb029025a67bbd40aso9810907wms.0
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 13:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IKXvhLflUpUvKkKSVoVpHfEhyqsC49h9cfRI0vEx34c=;
 b=TPvf2Zfrwsm/ioKpc2kWa0pB/gtmhUnPs2BWdsA5vSJRM4PKHmrDLKfZ0C3r2GD4va
 auGEeUWGZxKC4HS3lEQ8XBiTgcQcgJXPJWizRdOibStZrGlC3YHhSbGMZ6yzWUtH3F/F
 RXFLO6tPFaZsC1/pF/14PHwOc8wXhUfcwvf8NYJX1kArdPfLwkdNvb2Omnh3CVwVM2nv
 bnRMoKFWXhqE6h9ah5DDgIlY+SyvtNDfbNFR9v4CepWlyhiqRt04hfWF2eun19rHYZJf
 zazWtjQZmeGYhyfMRqnWROqwmgdP7Xg1vFe5abykjioR1cxPHS8xJJvIQ/SxChbrb9hP
 5ZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IKXvhLflUpUvKkKSVoVpHfEhyqsC49h9cfRI0vEx34c=;
 b=dsM6tJv4q8BI+O9RwQUSPzhdY4k5vAmUWimlt0diyAh97SsF4ILumb3qwwq7ntWek2
 gByfGZPoaDzdzTxBYEX+7ASiAz/ApTUYiIiH+HE9MlEEvlUsy5eH3TuaVmtwr/1YtnYV
 gkkiC1JLcvoms0Q29QaFL9f3npRLiduoHL9ZFtdrFutLHFXzw3ZRYizXvQ4y6XU/4SF+
 +I313df2ImCNh/bNPH/3fVxlObGhdmVkRgEZACjSeGM6cY9sJO04CM/Rvn8RxrOHQ9rl
 QXSo8EvfPQ++HBEo2z/bkMsibAPTkklZlW9M66EroUpPWTL2IE8ZGjIFeQtdkabo/7oy
 +eow==
X-Gm-Message-State: AOAM530fE2pvMp5jO+up5gufs/MtmMrKYWtUEwYPjGQVQqtUFoNpaAf0
 g3l/8r5bitaKeXzjP/Wb2Mtaj/tu3SKtJQ==
X-Google-Smtp-Source: ABdhPJziOtapBCVONMTmcvJy5rRhFOih+gwvt/TBcJ30vwvjAb+ZrCWxaJuRIt+R/7eGx/vHEwC0RA==
X-Received: by 2002:a05:600c:350c:: with SMTP id
 h12mr411735wmq.17.1628281676364; 
 Fri, 06 Aug 2021 13:27:56 -0700 (PDT)
Received: from kali.home (pop.92-184-97-136.mobile.abo.orange.fr.
 [92.184.97.136])
 by smtp.gmail.com with ESMTPSA id x18sm9570062wmc.17.2021.08.06.13.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 13:27:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Aug 2021 22:27:46 +0200
Message-Id: <20210806202746.4064407-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mpd: needs gcc >= 8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Since bump to version 0.22.3 in commit
b6576a458ca0d2e01b97799f64fef4a34a0dc6ea, mpd needs gcc >= 8 (following
upstream answer to https://github.com/MusicPlayerDaemon/MPD/issues/1112)
to avoid the following build failure with gcc 7.3.1:

/tmp/instance-7/output-1/host/opt/ext-toolchain/aarch64-linux-gnu/include/c++/7.3.1/bits/stl_tree.h:2091:28: error: no matching function for call to 'std::_Rb_tree<std::__cxx11::basic_string<char>, std::pair<const std::__cxx11::basic_string<char>, std::__cxx11::basic_string<char> >, std::_Select1st<std::pair<const std::__cxx11::basic_string<char>, std::__cxx11::basic_string<char> > >, std::less<std::__cxx11::basic_string<char> >, std::allocator<std::pair<const std::__cxx11::basic_string<char>, std::__cxx11::basic_string<char> > > >::_M_get_insert_unique_pos(std::pair<std::basic_string_view<char>, std::basic_string_view<char> >::first_type&)'
  = _M_get_insert_unique_pos(_KeyOfValue()(__v));
    ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/4888d99404cc4273349ab036035c5ff7e086b83e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpd/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index e8d10f8481..5ff4b432ec 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -4,8 +4,8 @@ menuconfig BR2_PACKAGE_MPD
 	depends on BR2_USE_WCHAR # boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
-	depends on BR2_HOST_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
+	depends on BR2_HOST_GCC_AT_LEAST_8 # C++17
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -412,9 +412,9 @@ config BR2_PACKAGE_MPD_ID3TAG
 
 endif
 
-comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 7, host gcc >= 7"
+comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 8, host gcc >= 8"
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
-		!BR2_HOST_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
+		!BR2_HOST_GCC_AT_LEAST_8
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
