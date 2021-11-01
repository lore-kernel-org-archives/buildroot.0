Return-Path: <SRS0=b2+E=PU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB681C433F5
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 13:34:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED0A060F42
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 13:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED0A060F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 716B240131;
	Mon,  1 Nov 2021 13:34:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y-d4sJAPu4BS; Mon,  1 Nov 2021 13:34:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74F0D401CC;
	Mon,  1 Nov 2021 13:34:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A5A11BF29C
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 13:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86FEF401C8
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 13:34:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9x9vRsm712Ds for <buildroot@lists.busybox.net>;
 Mon,  1 Nov 2021 13:34:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CDA8401C0
 for <buildroot@buildroot.org>; Mon,  1 Nov 2021 13:34:04 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so5574136wmb.5
 for <buildroot@buildroot.org>; Mon, 01 Nov 2021 06:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NER7VRlVuw0MF5lrqQLx+h19lkVCBf/QhwkTd+nCDXI=;
 b=ED5lCljGBx5vCqTqK0GTB8aE9alnDEmq4P+jlePThi3OKtMdWBQoOojK+ObyEi3f46
 v87rIGOq1e2zK5FhD1kW8UvwotudS+yBKIaiWXsUrVEAD2hmef9e3zF4kqHmmzNcPLJ6
 ReoQwqX+BDrS7CcrCvgxoS/I3ockIpsxuotnC5+t6SIoRvaCGLQyI8HOCWK+pUI4xDaX
 W7fDu657me2WVbegW/pfajCddtn+QkoTlb1ZWGp0ygSdV6Ti4lrn6tGGB0DjmWhrRQ/+
 1QKWYlrK8/qKHtjL2sMaC938HUSCWCDFB2/vqtxjALtxjMHDlBq9gv6MeLpHBWh4bWGy
 Ac9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NER7VRlVuw0MF5lrqQLx+h19lkVCBf/QhwkTd+nCDXI=;
 b=jglCy8rzLRprBzrg3TsmcF9jdcn648iJGw3zg8lTmB1h4HMeFFAc3fOoodEWHAy6jH
 Tplgu+aHIGOgyl/rKGhIKHN84Otr4FT6APAuTjUaA95w30tGajMJgH/HSOQ+0HWP1OVL
 QbZQPcoc9miy4XNcHqPBLeSPzMwfNzrtJ+/UL1HhVflGLpSza5/yvumTJxy7nhP8TpEw
 7mEgOwIkFXDUeg4mi7Lf5suNzi+6XSWO2f+7a1JvgvqNr6hqwQ1svjMz660U/aJkCrpE
 xq+nYmHEHiNFpdhFU3qGL7utHSfMQ9iYxWuZIw3c99MjxF1juWg/h60YdzNfU4hH9UzP
 oY1w==
X-Gm-Message-State: AOAM533NiETn9zyNro13OvFRR6omdSV+MJOyvXbGXZB5vDL1pL/j/+6K
 tkCkIqkHyE9m89AW7onOM/VAP9t+LDw=
X-Google-Smtp-Source: ABdhPJwh3dhNsHj25HTgwfGTfE5gJgEOXwray7584VU6lC75h5kSNkzhwpcDRB5mPXPOmV4aEB2Uaw==
X-Received: by 2002:a1c:9814:: with SMTP id a20mr11454147wme.18.1635773642592; 
 Mon, 01 Nov 2021 06:34:02 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id j8sm7477074wrh.16.2021.11.01.06.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 06:34:02 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Nov 2021 14:33:59 +0100
Message-Id: <20211101133359.2228115-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/ca-certificates: add missing
 host-python3-six dependency
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
Cc: Romain Naour <romain.naour@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ca-certificates use some python scripts during the build step that
requires python-six for host-python3.

python3 certdata2pem.py
Traceback (most recent call last):
  File "/builds/buildroot.org/buildroot/test-output/TestDockerCompose/build/ca-certificates-20211016/mozilla/certdata2pem.py", line 31, in <module>
    from cryptography import x509
  File "/builds/buildroot.org/buildroot/test-output/TestDockerCompose/host/lib/python3.9/site-packages/cryptography/x509/__init__.py", line 7, in <module>
    from cryptography.x509 import certificate_transparency
  File "/builds/buildroot.org/buildroot/test-output/TestDockerCompose/host/lib/python3.9/site-packages/cryptography/x509/certificate_transparency.py", line 10, in <module>
    import six
ModuleNotFoundError: No module named 'six'

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1734417711
http://autobuild.buildroot.net/results/d14/d145f997cc6db17a8eab14d9ced8fa35332c4969/build-end.log

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Martin Bark <martin@barkynet.com>
---
 package/ca-certificates/ca-certificates.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index eb75d23f44..e21ac5d907 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -7,7 +7,7 @@
 CA_CERTIFICATES_VERSION = 20211016
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
 CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20211022T144903Z/pool/main/c/ca-certificates
-CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3 host-python-cryptography
+CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3 host-python3-six host-python-cryptography
 CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
