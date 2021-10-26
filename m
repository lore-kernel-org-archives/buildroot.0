Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C17A6C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 16:34:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AAAA60EBD
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 16:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6AAAA60EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 361C960A44;
	Tue, 26 Oct 2021 16:34:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Djz7vfm0GHOB; Tue, 26 Oct 2021 16:34:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C105608CE;
	Tue, 26 Oct 2021 16:33:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA0841BF4D5
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 16:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA26540091
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 16:33:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iqpRhAsi7-Ez for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 16:33:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB2C44003C
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 16:33:56 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 j2-20020a1c2302000000b0032ca9b0a057so2797997wmj.3
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 09:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8evfsj1u4iCoCJJiPYQf0B12jwjJHX+r2eZeSB5OjyE=;
 b=b4ka9UOp9VdMWko9qzm6tjRtDzFxu1OzNEP+ntTD3XnmQaE2Km1TNQ8jAqOiGD3hOQ
 /ViZ6AIudVK9x8DEfx2GB+Dxns8qPe+UXaJIKZ5z7vs4bdugltcOOIzrMYOmWyrgSmjx
 ZYmj3LgkavIfJ9O7/pX9s/slfjh82DCLepEckJ+JIs3lxLBoZpGEs79y+SoJ1JMBNNSd
 +gOo/xZIfn5CLQV3IEiQsA4u8VUeYTRRBTsBnCMlebWlsi+t5IeLFZHixutDjjqOnsT9
 yPOo7zTQYV/UdchwWH08IL3gS8LoT/swOcpGqYo8+BxMcQxVt33J7MdmvvuQcUKYAzE/
 5aAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8evfsj1u4iCoCJJiPYQf0B12jwjJHX+r2eZeSB5OjyE=;
 b=2UDgr5BIs2k5/CSfhA0Tg+KNXudIhzmYZwhmu+cWB9mwrzgVoGg6Ks2sOr0dtjbGzC
 ytzV5IPJyP6XVZYa9YH2kEiG5nsxgGPzzJLBt+Un2tWnezJndFZwQS4MPbN4iNXtatCO
 wOKby7gUr2F9Uj6Tz7jRvEhyWcC2txHIaKbzd/Bm80i0OKqUZa5wA9AIbIa3nLDPF/Kw
 2edzY/C5kDSpSCIdBrbk+T3FRjt0XAa2JLkJy/HRZHu15+iFPpm9Av1BfxwbEU6uCt+V
 cjIdgLEUJFUymws0pKA92PmxdBzoDOaTSdyZlg1nk8Yyb/JtUzAfCYvcSvlgP/i7ungA
 a6mA==
X-Gm-Message-State: AOAM532rMnS2AFLkRyYOyls5G+Dfgi2o/gq6jp966pQ+ian6B/xteZsE
 vXC1/msSKCf55ig1FakIThCkgVTbCOg=
X-Google-Smtp-Source: ABdhPJxoyxtD8QnzsN4bSxma1FKRiHp18IClisXXxjPyyRAYQAfRnzrciz4+7akP/k+I5/B4nwjSpw==
X-Received: by 2002:a05:600c:2314:: with SMTP id
 20mr21067572wmo.76.1635266034832; 
 Tue, 26 Oct 2021 09:33:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id c7sm16277951wrp.51.2021.10.26.09.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 09:33:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 18:32:22 +0200
Message-Id: <20211026163222.3912644-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/python-cryptography: add host-python-six dependency
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the wrong assumption that six is not a dependency with python3 made
in commit 95a63a34ac9204c4fe069154783bd97ed48c3ae2 to avoid the
following build failure with ca-certificates:

Traceback (most recent call last):
  File "/home/buildroot/autobuild/instance-2/output-1/build/ca-certificates-20211016/mozilla/certdata2pem.py", line 31, in <module>
    from cryptography import x509
  File "/home/buildroot/autobuild/instance-2/output-1/host/lib/python3.9/site-packages/cryptography/x509/__init__.py", line 7, in <module>
    from cryptography.x509 import certificate_transparency
  File "/home/buildroot/autobuild/instance-2/output-1/host/lib/python3.9/site-packages/cryptography/x509/certificate_transparency.py", line 10, in <module>
    import six
ModuleNotFoundError: No module named 'six'

Fixes:
 - http://autobuild.buildroot.org/results/2b6872eec31362bf3edf88c69b67d681b2f016aa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Arnout Vandecappelle):
 - Use host-python-six instead of host-python3-six

 package/python-cryptography/python-cryptography.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index e21b9db042..acc21c1227 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -14,7 +14,7 @@ PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
 PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
 PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
 HOST_PYTHON_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
-HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-openssl
+HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-python-six host-openssl
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
