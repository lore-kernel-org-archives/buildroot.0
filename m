Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38DDC433F5
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 12:42:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 385D46113B
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 12:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 385D46113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E819040219;
	Sat, 13 Nov 2021 12:42:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0c6K-rn8JJll; Sat, 13 Nov 2021 12:42:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2512340180;
	Sat, 13 Nov 2021 12:42:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 034C81BF31F
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 12:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1CA440180
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 12:42:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lFzqXq-PyxOt for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 12:42:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8CC540017
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 12:42:41 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so8766495wmd.1
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 04:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LSyC0SZjbBVLx60t1tY85rnAIlDTOGH74sGojOuReDE=;
 b=KL0JoT3Lp6jyxJ7nKxGwUs2OCEe9dUY7mkt65H2I32ZfhgeP9qsos+f31C1yFE1rVP
 IK/8DgSc0x81YFWrym+WGFGudfLKFRzSugHKBucPN0A7wlB9D3XjzOyYCa/hzzQdM8Ai
 AHDYchEuWc3lZJ1yDyJJbJUDll/WT0Y/cTUBwzywTzg9IdouhDkSckq9qAAZAdpaLCkC
 bjQ5aMK5nQEhT97vTbjSbwI86s0PacQK+WK8fc1uUolNUVXkXx+mYVcPKCrSPIc3EXIA
 Lwvlcow0eMzPsNDn//+l0VipiRB6YATr+gXYKsqVQki/6c8SMZIRsg4/MjewXLdjXJwf
 kIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=LSyC0SZjbBVLx60t1tY85rnAIlDTOGH74sGojOuReDE=;
 b=OfiHg5baUtlU5mjfh8tjeZvZR0oswwZ6Z1Ot1AOXEIvKX2tonk8CXt/rWi5JcUwCnW
 JPcclPaBM5oGfRb8IDed3GQhzxLNObGvN5OjEENkmaRVRZIDFW6sjxqoNBpaCzsFZjVf
 NFBtnUkwg1Zl+kEi5oTFUUNWFwCkUNqHzbwVD5VQAC5G+0vHkJipJmHs8O2FQLVK1981
 d+Utfg6vhi+8U/p+DbH+259v0KhDqePXM8KKyk655+xdkp0Mni6NtxsoAHcuzEMbX47w
 SABkiBnDLsIuvCeRgy/NdZA/zygFs4QXksgF+/jztk/1w7g+Vz6HqSOrd/3krVZ0MUF8
 zcHA==
X-Gm-Message-State: AOAM531ZC1QVn2uak430jzesnQVbVqGSlvmdyjZgeh9FQ3iJdI4u8/lI
 nKZpekuh1tMyyAV2XstlSZKTEJ+ZYlVT8g==
X-Google-Smtp-Source: ABdhPJyLwbvwb2v3MyNh8bcJmbXGaEMLHjiACgU62a9Epq2Idiq8eZG09u7E8/khI0AHiEa1o67XDw==
X-Received: by 2002:a1c:f614:: with SMTP id w20mr42200024wmc.71.1636807359821; 
 Sat, 13 Nov 2021 04:42:39 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:68ab:b59:72c3:89f3])
 by smtp.gmail.com with ESMTPSA id x13sm8716752wrr.47.2021.11.13.04.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 04:42:39 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 13:42:34 +0100
Message-Id: <20211113124234.524796-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/pkg-stats: support values with an equal
 sign in them
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The heuristic to extract the various variables of interest is pretty
crude: we filter on variables ending with certain suffixes (like
'%_VERSION' to get the version strings).

However, in doing so, we may dump variables that are not actual package
versions (especially with br2-external trees), and those may contain one
or more equal sign.  And anyway, an actual package version string may
very well contain an equal sign too.

But the current situation is that the output of 'printvars' is split on
all equal signs, which will not fit in the 2-tuple we assign the result,
thus causing an exception.

Fix that by limiting to a single split.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 65ffa05f17..3992c8312a 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -388,7 +388,7 @@ def package_init_make_info():
 
     for item in variable_list:
         # Get variable name and value
-        pkgvar, value = item.split("=")
+        pkgvar, value = item.split("=", maxsplit=1)
 
         # Strip the suffix according to the variable
         if pkgvar.endswith("_LICENSE"):
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
