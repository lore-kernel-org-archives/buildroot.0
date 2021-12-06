Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0595C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 19:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 560A640495;
	Mon,  6 Dec 2021 19:31:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h2Tir9M60Xn9; Mon,  6 Dec 2021 19:31:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AAF2404A5;
	Mon,  6 Dec 2021 19:31:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 304201BF29A
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 19:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2004584B4F
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 19:31:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bqx27-tEgR5N for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 19:31:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6CFAD80C6C
 for <buildroot@busybox.net>; Mon,  6 Dec 2021 19:31:50 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id c4so24587808wrd.9
 for <buildroot@busybox.net>; Mon, 06 Dec 2021 11:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2GGfW39ev5C4YIHmZJQYaAGNU4lM9+AbKvA84Bjj98Q=;
 b=ZY71SGRGuoMvH4g4HCqpq0TaXpSCs4cmhR90SomYUaJz1JHeQleyrrvlz1KEDk2FlC
 yUpwoaYMzCe/wNfKooYffc/oJ6Plz7rZIFn2g98kGSqJ5qfLJF4eOW1f0X5Qe9HtcZ9N
 eCxJmANAcBuUzxQ6WMTM4A8Zaa1tL8GOVLmNvpZ+S6N74DCLsmU9OmEmy77Ig8+PTc2+
 Ej+jHd0Bu2ddHbu/gwmcjLSomUpQ5y89RLrZecPo17a3kvkNr9ffDZ+CYFlCByrhWjuK
 fXbByk902GW7dF5eQq155tzAv9RmcbSz2reY7XSGeo1NubzMGkIC4MkkbB7em1DdlLJp
 VWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2GGfW39ev5C4YIHmZJQYaAGNU4lM9+AbKvA84Bjj98Q=;
 b=2i6M6X/xWbmJ6k0Z2keshihJtSSR+uTx5tuxjEOdtEGhFYwvG1um+b6yuFmkPdJitg
 kiwsdmmucPeoLqawlN090DxsiAKCcEMxMS99O/+AaCfeTHpoHcllF+vmmedWCZ3l4edj
 /gC8a6XTNSHKK9XFkpLh1DnyD46cSJ3kjS/+yiw/9xDQOkJ49hfmQlmSuGdcQ5FxjiiJ
 MBdQkUwDojYhYrCUjp5v+IinsqD7itsrXY4NzpE16ZZBTtJxYyh4mEHuEK3/D8EBn9oc
 Qjari3TP9ydqpnDlxTAtiNSdV0ZWVV5Dg9kvokjkpzpa4zZlFctcoUPXAJk7QmSUkiEZ
 XIWw==
X-Gm-Message-State: AOAM533gryw16Y8qQPxqg3GyK9zR1sANwDT2KG3pLXn3g9eRo0PZm/N/
 5L1XBe+9A+vGNDRl+1QXODZ33cvQynU=
X-Google-Smtp-Source: ABdhPJxYngcWbEFMUkgbitE50nR6beOhrJt2mkzYAv2c8UtC+mMa5NHuQFxEeMbsX6gE/Xoi+o2kUA==
X-Received: by 2002:adf:e2c5:: with SMTP id d5mr45056011wrj.338.1638819108641; 
 Mon, 06 Dec 2021 11:31:48 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id f15sm332265wmg.30.2021.12.06.11.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 11:31:48 -0800 (PST)
From: guillaume.bressaix@gmail.com
To: buildroot@busybox.net
Date: Mon,  6 Dec 2021 20:31:09 +0100
Message-Id: <20211206193109.21218-2-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211206193109.21218-1-guillaume.bressaix@gmail.com>
References: <20211206193109.21218-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] package/python-pybind: bump to version
 2.8.1
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
Cc: yann.morin.1998@free.fr, "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/python-pybind/python-pybind.hash | 2 +-
 package/python-pybind/python-pybind.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
index a68ac846e2..e1d86a4494 100644
--- a/package/python-pybind/python-pybind.hash
+++ b/package/python-pybind/python-pybind.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  cdbe326d357f18b83d10322ba202d69f11b2f49e2d87ade0dc2be0c5c34f8e2a  python-pybind-2.6.1.tar.gz
+sha256  f1bcc07caa568eb312411dde5308b1e250bd0e1bc020fae855bf9f43209940cc  python-pybind-2.8.1.tar.gz
 # License files, locally calculated
 sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index bfd7f6f59a..3aee9cf1e6 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYBIND_VERSION = 2.6.1
+PYTHON_PYBIND_VERSION = 2.8.1
 PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
 PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
