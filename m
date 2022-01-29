Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD81BC433EF
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 20:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 457B540281;
	Sat, 29 Jan 2022 20:27:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XSztH2A9BsbG; Sat, 29 Jan 2022 20:27:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 963FC40210;
	Sat, 29 Jan 2022 20:27:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D82C1BF5E6
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 20:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF53D400F3
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 20:27:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oen07MphrnnC for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 20:27:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1207A400E4
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 20:27:54 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id n17so11978552iod.4
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 12:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X+F2Jv5TAbx7KfIpiRwNy7VoIiKOUoBWME85QlFSeHA=;
 b=flrmPd8nox3Y0N+MMPZN/muyHfBq4P8zIJCykz78+C3sUk4v7zAgkUz+8jPpxoBsTL
 i8VLGmixx0ju1cdJ8ua3fOsKc2jOfceIbczIqmc0IRfnCV8qX4otud9U8Z2GobxMI7Md
 3Pju5Nnw5eeRTGZwEwcYYLg5SrPtxkqpr06k2p7EzjlcwwfC7i7SItOi2Df2g2CzwMjo
 XOENZV1fc32tYkQ+JjQBjHqlpkez8Iqokre0Gs2aQam96yczTahJq8+zf1YRKnkTOKza
 +BL9H2f2rneUrPPdKiQE9mjZgjqkXL210GVaWyp480tfjJBNrmcy0hlMPFLuXBAdyA2V
 KWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X+F2Jv5TAbx7KfIpiRwNy7VoIiKOUoBWME85QlFSeHA=;
 b=w838gF7zEXr4Z3Fd69ucVlxCLZD/KnHSST5BsbCkPEal182l0j3lkwCfyqxmvxjShn
 Nlt2iGV0s0e9Kw1W/d33Z11Zq+0amraPg879dYHTijfmMmt7l8KqrksT9LVv+nKaGE/Y
 r2wAGq1nOWQfdv0ItHcAXapyIR7BZ38Odd3U8kdD1e/or0+5s7NLzfBvgzCBs9SvOETm
 9UoKZoAKVB8u6kS3U1w9wINHWoGVfhxQ9wxjhn2ffPwl7zRdn4gwyrBRarI/WYZDoz6S
 7VK5V1SLUxQruoC0d2+5QndkPOSjREou11z6viwlZAyNFmVlM5DEYeYe5CZJkgRhXEMQ
 bfKw==
X-Gm-Message-State: AOAM532sZCn2/gSSL1loSTBQizfWqGD5gghHtjmz3oo95AcNgdlsZGxp
 65DgLkQiGSCf0EsEfQjDpJgF6g9lln4=
X-Google-Smtp-Source: ABdhPJwe/yv05nxpQm6hPCrKVjR9khA9fsEvv0AQlIPEhjYigmQH/VUDerSJ/+CB+7ngKIyj4l8eUA==
X-Received: by 2002:a05:6638:3781:: with SMTP id
 w1mr8096898jal.178.1643488073865; 
 Sat, 29 Jan 2022 12:27:53 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id r189sm12146537ior.2.2022.01.29.12.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 12:27:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 13:27:51 -0700
Message-Id: <20220129202751.3851776-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: add missing
 openssl build dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
build/temp.linux-x86_64-3.10/_openssl.c:575:10: fatal error: openssl/opensslv.h: No such file or directory
  575 | #include <openssl/opensslv.h>
      |          ^~~~~~~~~~~~~~~~~~~~

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cryptography/python-cryptography.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index fc1686af9a..e642691bc5 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -12,7 +12,11 @@ PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
 PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
 PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
 PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
-PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-setuptools-rust host-python-cffi host-rustc
+PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
+	host-python-setuptools-rust \
+	host-python-cffi \
+	host-rustc \
+	openssl
 PYTHON_CRYPTOGRAPHY_ENV = \
 	$(PKG_CARGO_ENV) \
 	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
