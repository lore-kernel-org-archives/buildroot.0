Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4514EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 08:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA1AF82438;
	Wed, 29 Dec 2021 08:43:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SFzVUFyv7ZyL; Wed, 29 Dec 2021 08:43:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2D738269C;
	Wed, 29 Dec 2021 08:43:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B96D1BF293
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 08:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29C90400F5
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 08:42:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uZ6iPKU0_M6S for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 08:42:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24D3040022
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 08:42:33 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id u8so16086461ilk.0
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 00:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5hpigwG3K+sAaxswoluVd07XPWWeq4ht2plyumlXBlU=;
 b=PP5mE8XBlfkaOTxI/1WvUobdHEY8vZYK1z94jHVH//6j/362VJYhPl1QBXIk3Bs1T3
 h6wphAx15WIvc97tq4nkUy+p464zaXmxg9a3WcsVQL5IJKuU7DOPeRcJTjHH+2kIhcey
 uCufg79XiCigxHtsixX85jrLT5ln7ARQ+tOWzR8lp+cl5F9k6KNGji4oKStpNcIYSz2Z
 pYDyImcyPQ5vzdHSe0N8UDMVWxBs8WuVG50RXlPAcOy7Xr/yVGgRTPt0FMnybWP5ss+Y
 mMPfUiq1rKT4UCFPZpewWLP/xaX6apVYWAEpUBZzyS+3/nLk3XXAG/zE2MkR2ANhUGaz
 ZKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5hpigwG3K+sAaxswoluVd07XPWWeq4ht2plyumlXBlU=;
 b=nzdX0vb9yHR2fjUeMxgxCJo1QS5cWq1V181tZELjY525F1XWHgSvau+vdqVR/kV/dD
 V/njeU8c5IzOJtrTP/oCJ447Q8eGgOE3BR/pAc5sVq7tMyX3OkI1xIj1E8vnsJ/BFlgp
 zCMUwHGKk6hc7VlDBIAwWsTn97LBKAP3jX2oQvvPjcjsO/fNZ1nSnM4PsGEv20EKkcSy
 ZXLZVJB9o+dlkJsBe93sxBCE+JarlHbqQYOLqGkPC7E9haI6s3A2zRixzKYKUfJcoxXA
 eSV286kmSaCh5fho9aupstj2sxLJO/fyEK4zYNMbDJYXy75caxmHfikvz+KvJMdgH5Yi
 J5sg==
X-Gm-Message-State: AOAM532i3Wl6xpHHW1gl217HP1YbsvGgZYP5ieOY8oJczMgXNpv1yqks
 b8NRke+IsnO+S1TYILsEL12j0VTftgVFKw==
X-Google-Smtp-Source: ABdhPJxGzgd2OliPkDDV2+eMTP9URVXVah0rw010EMZ2KPLiq62jcd9Ca+4pQ7YqGprLIZtcIVAIHg==
X-Received: by 2002:a92:320f:: with SMTP id z15mr11445552ile.93.1640767352105; 
 Wed, 29 Dec 2021 00:42:32 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id p15sm12166788ilo.83.2021.12.29.00.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 00:42:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 01:42:19 -0700
Message-Id: <20211229084223.521362-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211229084223.521362-1-james.hilliard1@gmail.com>
References: <20211229084223.521362-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/6] package/python-pep517: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pep517/python-pep517.hash |  5 +++++
 package/python-pep517/python-pep517.mk   | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 package/python-pep517/python-pep517.hash
 create mode 100644 package/python-pep517/python-pep517.mk

diff --git a/package/python-pep517/python-pep517.hash b/package/python-pep517/python-pep517.hash
new file mode 100644
index 0000000000..4dd4c47fa0
--- /dev/null
+++ b/package/python-pep517/python-pep517.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pep517/json
+md5  7ed0adb5f737c316e071d48d66329a5d  pep517-0.12.0.tar.gz
+sha256  931378d93d11b298cf511dd634cf5ea4cb249a28ef84160b3247ee9afb4e8ab0  pep517-0.12.0.tar.gz
+# Locally computed sha256 checksums
+sha256  1b22b049b5267d6dfc23a67bf4a84d8ec04b9fdfb1a51d360e42b4342c8b4154  LICENSE
diff --git a/package/python-pep517/python-pep517.mk b/package/python-pep517/python-pep517.mk
new file mode 100644
index 0000000000..da0431a637
--- /dev/null
+++ b/package/python-pep517/python-pep517.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-pep517
+#
+################################################################################
+
+PYTHON_PEP517_VERSION = 0.12.0
+PYTHON_PEP517_SOURCE = pep517-$(PYTHON_PEP517_VERSION).tar.gz
+PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/0a/65/6e656d49c679136edfba25f25791f45ffe1ea4ae2ec1c59fe9c35e061cd1
+PYTHON_PEP517_LICENSE = MIT
+PYTHON_PEP517_LICENSE_FILES = LICENSE
+PYTHON_PEP517_SETUP_TYPE = distutils
+HOST_PYTHON_PEP517_NEEDS_HOST_PYTHON = python3
+HOST_PYTHON_PEP517_DEPENDENCIES = host-python-tomli
+
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
