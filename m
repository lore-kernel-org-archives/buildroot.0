Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B40C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 06:30:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53BE161184
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 06:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53BE161184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 004F4826FB;
	Wed, 22 Sep 2021 06:30:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t0BcoW3l07Rv; Wed, 22 Sep 2021 06:30:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EA7881A6D;
	Wed, 22 Sep 2021 06:30:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5BF721BF409
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 06:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 589B1404A9
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 06:30:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VkB8wspUZn5J for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 06:30:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BF0D404A0
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 06:30:23 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 j11-20020a9d190b000000b00546fac94456so2093658ota.6
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 23:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wuq3V2fgtxkMgTaJY6NDLUd7cuAIDNtKNVhziz084Fc=;
 b=GTslp+XCZ2x936Bft2ozI3I4hvqFGZmgJG5444G3MglOPoHqLjRqoa3XxW3xhrP/Wy
 YXCGk4wxpWmDAeNC866XyUd15eDQ90YqvlitdACvpBey7JNAmyBGG+ag2oqfKrIF1AMq
 w47+83kAXj9i4JevhOfua77QrZwMcesDOzMVYAU7NElSWPPXH+cto9PK1e86JhJx+JcF
 6lbp7oZyzzY1I528GpEuPq62a3G25bgvswyZOMoo4UZG52yfpgq3h/qWR4MF0+fEOIyt
 9UatiCNxefhU1ctSn9pf6wdnZPjrc36zUVz8c4SYYB5Es8hKvWRu35nDK8imhg3mve33
 flug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wuq3V2fgtxkMgTaJY6NDLUd7cuAIDNtKNVhziz084Fc=;
 b=MEhCeXW2Ij8mBYC7xqJzmfgFkRSSneNTikZlwLgRl7sIdA8B8jsgv0BtNNjULYuWmT
 VfTHICI1f5iLgF395lI9Ms8+N7BzYxIcIQrWO6ztNkco/U2b8/fReJmS7YkKcqyNwo4j
 gW+xoxW+1dheVxrO5MbHIqlSLhySJ716Jnbb8Q9ToUcxSg7UAdMM2k/T+W4hdv/sUOrD
 t2b38Hji5vREakOFWlEjy1U99Y53HqmzlXWnMQgXKQb4KW6VFNIV+9m/benjTNNDhdRs
 AVIMF5h2/qmbnfMD3NefCa4+EelIKQe/Z6x8Md6PowXbT/uBRhrtKfywQnnfV6Uf6XBy
 dBtA==
X-Gm-Message-State: AOAM532wWAwOTBvz/GPnUFd8MYo5Q3rY5EJE9WIquNOTdWm8LpOpSXUS
 1dQsjlr45YDth+9/Kz+Ey/IaqUAAYo8=
X-Google-Smtp-Source: ABdhPJzeD9MPCVheG+WLEQAsrHZ3T4ULc5MX42xuuRX0I2vRnuMJqXJLaqnFXhVMFAOyyKpw7/B8rw==
X-Received: by 2002:a9d:4a83:: with SMTP id i3mr29848453otf.385.1632292220927; 
 Tue, 21 Sep 2021 23:30:20 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id m20sm311140oiw.46.2021.09.21.23.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:30:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 00:30:16 -0600
Message-Id: <20210922063016.3866548-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-dateutil: bump to version
 2.8.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dateutil/python-dateutil.hash | 6 +++---
 package/python-dateutil/python-dateutil.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-dateutil/python-dateutil.hash b/package/python-dateutil/python-dateutil.hash
index f3dc69f272..a52fb30a0f 100644
--- a/package/python-dateutil/python-dateutil.hash
+++ b/package/python-dateutil/python-dateutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-dateutil/json
-md5	f2a1d4b680b297b367a974664ca3a4f6  python-dateutil-2.8.1.tar.gz
-sha256	73ebfe9dbf22e832286dafa60473e4cd239f8592f699aa5adaf10050e6e1823c  python-dateutil-2.8.1.tar.gz
+md5  5970010bb72452344df3d76a10281b65  python-dateutil-2.8.2.tar.gz
+sha256  0123cacc1627ae19ddf3c27a5de5bd67ee4586fbdd6440d9748f8abb483d3e86  python-dateutil-2.8.2.tar.gz
 # Locally computed sha256 checksums
-sha256	ba00f51a0d92823b5a1cde27d8b5b9d2321e67ed8da9bc163eff96d5e17e577e  LICENSE
+sha256  ba00f51a0d92823b5a1cde27d8b5b9d2321e67ed8da9bc163eff96d5e17e577e  LICENSE
diff --git a/package/python-dateutil/python-dateutil.mk b/package/python-dateutil/python-dateutil.mk
index 759261d2d1..b75f510bce 100644
--- a/package/python-dateutil/python-dateutil.mk
+++ b/package/python-dateutil/python-dateutil.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_DATEUTIL_VERSION = 2.8.1
-PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/be/ed/5bbc91f03fa4c839c4c7360375da77f9659af5f7086b7a7bdda65771c8e0
+PYTHON_DATEUTIL_VERSION = 2.8.2
+PYTHON_DATEUTIL_SITE = https://files.pythonhosted.org/packages/4c/c4/13b4776ea2d76c115c1d1b84579f3764ee6d57204f6be27119f13a61d0a9
 PYTHON_DATEUTIL_SETUP_TYPE = setuptools
 PYTHON_DATEUTIL_LICENSE = BSD-3-Clause
 PYTHON_DATEUTIL_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
