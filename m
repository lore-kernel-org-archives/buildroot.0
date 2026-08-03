Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118ECC55175
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 07:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A984B405B0;
	Mon,  3 Aug 2026 07:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5JU0ff7Gjsr2; Mon,  3 Aug 2026 07:00:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB51E405B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785740401;
	bh=jfI2iLpx1aaTMTkErSRyGFQXxDbjKEbDsIzsntPBeb8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GELr5pC51kk3miN71c8G99gC0RzBBpjZ3I979OV2SBAVdBiGXssqUcK2Em4IkHFPf
	 Jc85UxtImkKT3RaPQbZb+CUbgHUpkTrnB3J595Mj1Wnv0slfi2xH6E6H82WvHtfPqq
	 xSMNoK0OppTX9LY3M6Kz5Pp7O9FrLrLgGluulHUtJtvMOqMbiRRb5BVOQD87H+Q9NH
	 8fMSzzWB4f+aO2XUyLclkMU1CFz3KtnpQ2EZpj/ef6uPe9WXyQDiggmzEFxiOPPCnL
	 uqJ1M4zNNwCY/tj/u+ykiEpJ7Epp+dKHYk/2P5z2Mjkv4LYzAqnTEqsmw38Twx7DcI
	 p+U6qlKdYk+pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB51E405B6;
	Mon,  3 Aug 2026 07:00:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8394E26C
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 06:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7527A80C9A
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 06:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id crHhS2KOLb4L for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 06:59:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5F3B280C98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F3B280C98
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F3B280C98
 for <buildroot@busybox.net>; Mon,  3 Aug 2026 06:59:55 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-495437bb891so13441745e9.1
 for <buildroot@busybox.net>; Sun, 02 Aug 2026 23:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785740393; x=1786345193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EBWO89nrsI/fPRW6ICTWZeH8DX5lANtG+iDivNW+IuQ=;
 b=pyUhlghniWDqoeVl7msJ7HqlpvpIorxVi/QdxNrCEzI/IiaPHc/luGuzw/E+sWmIMo
 sYMOreM2hqLdkADcWWzxeV8yH/orsJXWWlrlcrl7mx9/xwM9+CDuUhW67+tCg1ca+cKz
 QHuFyCHwzE4GTa/yL7UYSQKqcEW/7eImrONHeiIUh2fdz5eNjztaqXiXjlH/xx7iyuAm
 K7gfQ1e8xXSWtTC//5RFtlfkGzEnUbt4eYBUIJ+xIge8VmlxkX9RJjU63yPyI5895oc8
 uWjRvwqYIZn0zeOCuCUpoH5aNw32mYKMDB1aAqYui+eqW1w9HuN9CLeFDRiNBF1fOJyg
 NIZA==
X-Gm-Message-State: AOJu0Yw91XP0c0TVdbzBjw1tE0cwOg/W+/W4P6HRl3CRLCCTRCuTqiA5
 8UzBo6QzQ3K4M2tLMiC6WqKYKFlVGkSH4ki7g3B+UIrlcBVfBCrF78TyRPwgOA==
X-Gm-Gg: AR+sD121AptvZkx4/DDIKBvLUcMfyHnDpyDEWmKk1xCj91MAc+cS8c5QOjXVNeSRigI
 W2ajp3gFTeZH9NIUq0AX0vsRD/isCtsrDCCpo7Kly4k5IPQ2QagoBTr7A7WP4D71BfxUeRZ543e
 mzKEg/MfxtLSD4VvZ9Hh8uPR+XX1HNw2J3WyTQexygz0wpM6hTfNOLVcLIdzLlELYIhOU9yFsZ0
 tOULTaFHcdq2xHm4YKNHU17obC2A40CzRoEWJx3BvaggmGsulUTdd6bcddgFIIv7Apbq4X7LOAD
 grvnYenA+l/jDZ5ZW/fRomchkc8oNHdosp6QiaNIzxTfq4JlbDg3WmwFH3Ko9aewUFN4Xq8SATe
 qZOzv5/vqO9baN1k3ciawpLN4dQIUCKEZoxlvnMLgVSOscSnD5ZjKJ2EFhP04yx5XAjvZwkWJ+n
 TvBHaJZ9im/OI/NpM17TTI34GeV9VmyJ0DBFfEOqDgKdT8dDlF4pKuSwh9dhsrgkQlaREyNZrRt
 T+A7V484WFU29IVa+6IPdvFJZ1qgCVZZg==
X-Received: by 2002:a05:600c:1f8f:b0:493:f478:4c71 with SMTP id
 5b1f17b1804b1-4980eba0817mr164250675e9.7.1785740393279; 
 Sun, 02 Aug 2026 23:59:53 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b5b4a2sm234639805e9.1.2026.08.02.23.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2026 23:59:52 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon,  3 Aug 2026 08:59:37 +0200
Message-ID: <20260803065940.224429-7-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803065940.224429-1-francois.perrad.86@gmail.com>
References: <20260803065940.224429-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785740393; x=1786345193; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EBWO89nrsI/fPRW6ICTWZeH8DX5lANtG+iDivNW+IuQ=;
 b=o6C6v14Topk7mBcLgNbi6o/G2MdAsJ3XrtQEFJSt8EOnCTJcSrMLP1ZK+WC89UecZy
 gCVo0NjP/4cpI/pDM9Aur39GyIzYbSaAbb0iHrYYCQUjBUrvMoq378ReMcF76qPyVtJ3
 7Z6M+OyZKKRYgwXstzYhmaCWxbjN9LwjJQ3bVlBOkXqxEmt670/7hAO9Q/Aj5fh9Rdkk
 R7HKAqwTIXRsXovNXQbLcyBhvFmZHufdQUFR0LCCebxEh1EnNC0w2OGPVsa466BfuTp8
 Vdwx2Pc5YA2jrtGJ3haH1ALG8dLpwhoxjXRoByAhJAhDH0Fxgo5YvNkl+wFOeuERtOWi
 M42g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=o6C6v14T
Subject: [Buildroot] [PATCH v4 6/8] package/hare-ev: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/Config.in            |  1 +
 package/hare-ev/Config.in    |  8 ++++++++
 package/hare-ev/hare-ev.hash |  3 +++
 package/hare-ev/hare-ev.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/hare-ev/Config.in
 create mode 100644 package/hare-ev/hare-ev.hash
 create mode 100644 package/hare-ev/hare-ev.mk

diff --git a/package/Config.in b/package/Config.in
index 630662477..5cdf0c13d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2168,6 +2168,7 @@ menu "Other"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
 	source "package/gumbo-parser/Config.in"
+	source "package/hare-ev/Config.in"
 	source "package/highway/Config.in"
 	source "package/jemalloc/Config.in"
 	source "package/lapack/Config.in"
diff --git a/package/hare-ev/Config.in b/package/hare-ev/Config.in
new file mode 100644
index 000000000..5a65e1fbc
--- /dev/null
+++ b/package/hare-ev/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HARE_EV
+	bool "hare-ev"
+	depends on BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_HARE
+	help
+	  This package provides an event loop for Hare programs.
+
+	  https://git.sr.ht/~sircmpwn/hare-ev
diff --git a/package/hare-ev/hare-ev.hash b/package/hare-ev/hare-ev.hash
new file mode 100644
index 000000000..beb0c6f4d
--- /dev/null
+++ b/package/hare-ev/hare-ev.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c80dc647f3a227259c05dab3b42b4cdfee44c68acd8e7cf31245807a8fa79188  hare-ev-0.26.0.0-git4.tar.gz
+sha256  be782a711236b742d7231a4a9a15ca781013e61dead0d6908105fbc2cb38a317  COPYING
diff --git a/package/hare-ev/hare-ev.mk b/package/hare-ev/hare-ev.mk
new file mode 100644
index 000000000..0f374f3a3
--- /dev/null
+++ b/package/hare-ev/hare-ev.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# hare-ev
+#
+################################################################################
+
+HARE_EV_VERSION = 0.26.0.0
+HARE_EV_SITE_METHOD = git
+HARE_EV_SITE = https://git.sr.ht/~sircmpwn/hare-ev
+HARE_EV_LICENSE = MPL-2.0
+HARE_EV_LICENSE_FILES = COPYING
+HARE_EV_INSTALL_STAGING = YES
+
+$(eval $(hare-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
