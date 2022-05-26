Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1CCC433F5
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 22:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91621847E5;
	Thu, 26 May 2022 22:20:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gm3vX0dl7IE0; Thu, 26 May 2022 22:20:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A782484794;
	Thu, 26 May 2022 22:20:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F19D1BF33D
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 22:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E6F441BB1
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 22:19:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mMciroFizajY for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 22:19:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5B6841B70
 for <buildroot@buildroot.org>; Thu, 26 May 2022 22:19:50 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 p5-20020a1c2905000000b003970dd5404dso1803683wmp.0
 for <buildroot@buildroot.org>; Thu, 26 May 2022 15:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XNl8AgXssD0cRp0HWpkDUbdRpRz3pPKRInzhyu7w3Eo=;
 b=BFhe5cieBv4rJTrvPda1GQ1JPGBCxWmO1H4NfddzCghfq9/IA3JZC2X1rm9DWaf/kr
 c6Rty49te7u4vvcYUIwMyYuBSALx+lh8muaZx8xtLiQ59mnyING/yunFbzVs7qvPZWCt
 aTa2zz7yOSGF8QOPrRRiu1d6jEIWiYfm+EefV4vjR9PcjfQt65rl/qhXQ0e+du2MndFQ
 a0Z2xraPhYJMYQ2kYsXyDzCEuBg/5c2rZqb8/2uERETlIaXBEo/jsRoCNnAQUuSKGKtM
 9GWA8HpnTK/WRmW0Qq4F1GNFcQMzpZT/wJU365XPWR5j0ORNSfB0xjtY9n3KrDQ+CXhz
 ihbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XNl8AgXssD0cRp0HWpkDUbdRpRz3pPKRInzhyu7w3Eo=;
 b=uoGm/mIWVtDuBNIl+DnHBkF/Cs9HkrGFVWoKc0RXK+1ZSLI1xjAq0CasBrs+dClPft
 GaEH03GkMMOxje+KqQVuwvDYBCSrAUAz2iuAi0dB9TSbyIJcg7aSeAPParlwxGcOSLgr
 akG3H3ypQfxtLMFQ18Gm7JPpgGk3yHOyN8obETKoLtc7ppCniVH5ifIF1eRL0pMRz/vI
 7knUa18gfpMj3sufu5RlK9nIkCiJlB/OLnUAgxhNGN87hcBlCLJtqfIJ0KorLtnYaNx5
 AVBiqNjRpSDRBIbYfdQlwyvx4N2a3TFbIE5TY995CmDgvfmQCykC8ruFVEhxURrlByIb
 l6Qw==
X-Gm-Message-State: AOAM530KxzY6X+RxG9nrB5CK7tLkqefDTMjndBPfuLCICnwkGS8oCfqj
 sZLmxH4x6pbCF/9DrM/XyIDRGSX7YP4=
X-Google-Smtp-Source: ABdhPJyhylzKEiprTPCAAu0bL9NzJH55hmRjjbVR2HZu1dq5RwdUhuhGNMtANyw6E8TpPvyQ4vlStA==
X-Received: by 2002:a05:600c:511e:b0:397:60e4:8ceb with SMTP id
 o30-20020a05600c511e00b0039760e48cebmr4256626wms.204.1653603588416; 
 Thu, 26 May 2022 15:19:48 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m23-20020a05600c3b1700b003976525c38bsm472488wms.3.2022.05.26.15.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 15:19:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 00:17:11 +0200
Message-Id: <20220526221711.731246-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220526221711.731246-1-fontaine.fabrice@gmail.com>
References: <20220526221711.731246-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/fbv: fix build with giflib and gcc
 >= 10
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

Fix the following build failure with giflib and gcc >= 10:

/nvmedata/autobuild/instance-30/output-1/per-package/fbv/host/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/11.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: gif.o: in function `fh_gif_load':
gif.c:(.text+0x338): undefined reference to `m_rend_gif_decodecolormap'

Fixes:
 - http://autobuild.buildroot.org/results/dca603a61b1fd0558992b4a40152d23b5b9c0049

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0007-gif.c-fic-build-with-gcc-10.patch    | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/fbv/0007-gif.c-fic-build-with-gcc-10.patch

diff --git a/package/fbv/0007-gif.c-fic-build-with-gcc-10.patch b/package/fbv/0007-gif.c-fic-build-with-gcc-10.patch
new file mode 100644
index 0000000000..57d5777b61
--- /dev/null
+++ b/package/fbv/0007-gif.c-fic-build-with-gcc-10.patch
@@ -0,0 +1,36 @@
+From 8877207b290da1c3bc100f2705c30e6bdafcd985 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 26 May 2022 23:59:46 +0200
+Subject: [PATCH] gif.c: fic build with gcc >= 10
+
+Fix the following build failure with gcc >= 10::
+
+/nvmedata/autobuild/instance-30/output-1/per-package/fbv/host/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/11.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: gif.o: in function `fh_gif_load':
+gif.c:(.text+0x338): undefined reference to `m_rend_gif_decodecolormap'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/dca603a61b1fd0558992b4a40152d23b5b9c0049
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not upstreamable (most active fork dropped gif
+support: https://github.com/godspeed1989/fbv/pull/17)]
+---
+ gif.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gif.c b/gif.c
+index 689e549..5560f25 100644
+--- a/gif.c
++++ b/gif.c
+@@ -48,7 +48,7 @@ int fh_gif_id(char *name)
+     return(0);
+ }
+ 
+-inline void m_rend_gif_decodecolormap(unsigned char *cmb,unsigned char *rgbb,ColorMapObject *cm,int s,int l, int transparency)
++static inline void m_rend_gif_decodecolormap(unsigned char *cmb,unsigned char *rgbb,ColorMapObject *cm,int s,int l, int transparency)
+ {
+     GifColorType *cmentry;
+     int i;
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
