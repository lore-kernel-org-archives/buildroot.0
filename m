Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E40BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 21:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF60F401AF;
	Mon, 27 Dec 2021 21:42:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fucctLuCznKm; Mon, 27 Dec 2021 21:42:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0223A4016D;
	Mon, 27 Dec 2021 21:42:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A6CD1BF983
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F476812F1
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:41:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RANQuQ0WeaUp for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 21:41:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D454F812EF
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 21:41:56 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s1so34579098wra.6
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 13:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yaPxR3SNVE25Cg9Tzrkb9FJIHjtAqpK6fzypqBZwRjg=;
 b=P25yc7EP7bLAuoTSlkNyMErZMYs11cN9HUQ0neO+uy9iKV9h5sDuXe5cg0+6R5ViKL
 NQ18lrLuN+EiDhAKmYeul0HEHPvS9kiDbe3+BpC7j753A420gnOlMixcqQbkn2r0rSko
 jcwDFKZOGI5gEbzpivPjP6Qk26TpD2nlMaCAhyhZOxH0TFDEvHgvAZJzNo02ZLzfyXrb
 VyUzw0/YOLxhgu2tyg9yC8FlGB6OJ6ogjewWNmNkM4SP/mv/ua5vYoqvu+YiPXQjbPgb
 ju8qpM+TOa+2T5rcv1WQYuV8RZUiwKNqvoBq+sFKAZRR21wPCYbmfvwMEWNDX1zZorYX
 wYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yaPxR3SNVE25Cg9Tzrkb9FJIHjtAqpK6fzypqBZwRjg=;
 b=dSvmB076yvEybL7wxnTxpmIkJsEvF7Q8Xyb3lD716e+NAXMxHLxuNVBiHzSQbRcmt0
 aiAJzdgocOLUvWdT2BZkQnCCFA8AR5+mxZEi76+mSCC6TsTXYUM+vJAw0gLLgf5NQgUU
 M4YEPWe/jYCQPQeY7XYG/YFesLb03I26AyHPys3IKArUWZj6JJEdqabnNdZLkDmAbXCk
 eGQxg+O2XUTPP6J7H/z/UoH/ciLyMexhh4knxdfYngtluUMhQQ+xW5Kam9t/19CtmWHr
 i1e7Ty8qAkJ0pRbkVi7RIVkK3IiE+kN5CnYcLK4GfqTDxKtSSGf/Bi63IU6lK0qgfMGD
 dYxQ==
X-Gm-Message-State: AOAM531mLx11e3201wAG1CAPMMSYEbbEyMKRylVhU0RrCTm/79DoEpoO
 9uTiMcNQhPnnlOSRNfimmC/QOwESQAQCVA==
X-Google-Smtp-Source: ABdhPJzatyL85FOrToSce8oXKseczwYpwfE4gNr9hRu4G/yNVpd+Y7gO4/ROxdLnP7BA1wvoKewWiw==
X-Received: by 2002:a5d:58ef:: with SMTP id f15mr13790377wrd.108.1640641314845; 
 Mon, 27 Dec 2021 13:41:54 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id m15sm18696678wrw.27.2021.12.27.13.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 13:41:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 22:40:50 +0100
Message-Id: <20211227214050.2890558-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-parso: bump to version 0.8.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/davidhalter/parso/blob/v0.8.3/CHANGELOG.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-parso/python-parso.hash | 4 ++--
 package/python-parso/python-parso.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-parso/python-parso.hash b/package/python-parso/python-parso.hash
index 538ffccf37..67e77a162e 100644
--- a/package/python-parso/python-parso.hash
+++ b/package/python-parso/python-parso.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/parso/json
-md5  dd8fed40ceb890d3e277ad44a678c1f1  parso-0.8.2.tar.gz
-sha256  12b83492c6239ce32ff5eed6d3639d6a536170723c6f3f1506869f1ace413398  parso-0.8.2.tar.gz
+md5  7ee251113f31f8d851c4a5d9e98977cb  parso-0.8.3.tar.gz
+sha256  8c07be290bb59f03588915921e29e8a50002acaf2cdc5fa0e0114f91709fafa0  parso-0.8.3.tar.gz
 # Locally computed sha256 checksums
 sha256  fa67973073753d17624caf8684d5ee816d70c89d912c5bca7ca0f08e7b150edb  LICENSE.txt
 sha256  9c1e620a5cf8e74fe81c1fd4c55e9cc0b189fc04e677cfc7ef915de746c3f59e  docs/_themes/flask/LICENSE
diff --git a/package/python-parso/python-parso.mk b/package/python-parso/python-parso.mk
index 6862a7e97d..ce1d3401ff 100644
--- a/package/python-parso/python-parso.mk
+++ b/package/python-parso/python-parso.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARSO_VERSION = 0.8.2
+PYTHON_PARSO_VERSION = 0.8.3
 PYTHON_PARSO_SOURCE = parso-$(PYTHON_PARSO_VERSION).tar.gz
-PYTHON_PARSO_SITE = https://files.pythonhosted.org/packages/5e/61/d119e2683138a934550e47fc8ec023eb7f11b194883e9085dca3af5d4951
+PYTHON_PARSO_SITE = https://files.pythonhosted.org/packages/a2/0e/41f0cca4b85a6ea74d66d2226a7cda8e41206a624f5b330b958ef48e2e52
 PYTHON_PARSO_SETUP_TYPE = setuptools
 PYTHON_PARSO_LICENSE = MIT, Python-2.0, BSD-3-Clause (flask theme)
 PYTHON_PARSO_LICENSE_FILES = LICENSE.txt docs/_themes/flask/LICENSE test/normalizer_issue_files/LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
