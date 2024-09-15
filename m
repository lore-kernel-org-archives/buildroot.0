Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CBBC35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 08:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6358081B72;
	Sun, 15 Sep 2024 08:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NnpnnjAJOyPp; Sun, 15 Sep 2024 08:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DD0781B7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DD0781B7B;
	Sun, 15 Sep 2024 08:07:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 91EF91BF47D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E6CC4028E
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ImyVtytwYuBu for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 08:07:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4B23F40136
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B23F40136
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B23F40136
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 08:07:41 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-82521c46feaso161902639f.2
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 01:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726387660; x=1726992460;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2y1HysBS+RBM8dtgp0Ozw/Dw59m75plIcL8+Rpo7WOg=;
 b=pZOnDGurOTLlTM6e3oHFe+u9LJ7N6575qvo1fsjqAxP84eFJWt3HbVZjB6r9cPLfSa
 fbsZhZ9sKXM9LMZ+dGFd4fA1mWkWaaNRD+ipJJrSu7DDWdLd1iYoQ7x00DgPkEJY5sci
 PFjY7Q2P8y7T9GDhfByF+qhOpHFH+6Fog6yNedplY/d4XX6V6+L2DFfJbB9TDhum/T6T
 OxzIBD88wgsw9q+t24g3aTtE2UdXxqlxkHWEstKN7lEmvqYPZ0AuRYxx+lcJmw/MQvcO
 xdl2rMeJiWPG0NnY1pxxHXVMQqViq8/FuyZaCfqFgZsPIZSykMSO36I0S+202LaqnpXK
 g6JA==
X-Gm-Message-State: AOJu0YzzW6PPyhI+zNURHQ3N+MO6+mH503QzNFxukjRaaBjFhAGIZx+3
 9SixS+4DU0USR9Zff3TSmxdC5nQ5u9ig71NdpPNIjZcmPtGHcEjswBoT+w==
X-Google-Smtp-Source: AGHT+IG+baZCymNC5NW3tvgpQxewdbsSjc2H0e5IAava78d4XWu/q3R6STn7+e6HeZMOmmzqUpjBfg==
X-Received: by 2002:a05:6e02:1c4a:b0:377:14a7:fc99 with SMTP id
 e9e14a558f8ab-3a08b79b5cdmr90200735ab.24.1726387660059; 
 Sun, 15 Sep 2024 01:07:40 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092dfdba4sm9073685ab.8.2024.09.15.01.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 01:07:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 02:07:37 -0600
Message-Id: <20240915080738.1571637-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726387660; x=1726992460; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2y1HysBS+RBM8dtgp0Ozw/Dw59m75plIcL8+Rpo7WOg=;
 b=UYX66N4Ir6iPCvIeILrcVE7A69lzpA1aGRvHLyJ0MKf+nbRrpwumprYcEbGBGy8x3+
 OvRybs64xtlaGnqvqGuFBftegxJvWIJk5OLQYZ35vxhB6uKuWIlgdruYUiYRgABw1PPE
 bhsJxIoTCE8ytSq8kRH5kw3zx8UMEM4fGWE1CnGHi2wamu9t2HjQq8zc2WPO43KGE78C
 9QTWm5/o46x4ImGcwDclOtManvNFf1vW7PW+SxEizJUepsZ3c23WbCh0fq4WOhyh4Sby
 K1r+AnzpAHRlrrJGNDDVhZJduJSam+iz3TAwTadAxJT0JJtqtg/ZWptosrIPqKgBYIhB
 wiGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UYX66N4I
Subject: [Buildroot] [PATCH 1/1] package/python-idna: bump to version 3.9
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-idna/python-idna.hash | 4 ++--
 package/python-idna/python-idna.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
index 88459b38df..bf6a65a097 100644
--- a/package/python-idna/python-idna.hash
+++ b/package/python-idna/python-idna.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/idna/json
-md5  4490e5070a3dcbf1a6cd178cb523cdfb  idna-3.8.tar.gz
-sha256  d838c2c0ed6fced7693d5e8ab8e734d5f8fda53a039c0164afb0b82e771e3603  idna-3.8.tar.gz
+md5  3310aa9831d5ee7a33f3cf4bba993558  idna-3.9.tar.gz
+sha256  e5c5dafde284f26e9e0f28f6ea2d6400abd5ca099864a67f576f3981c6476124  idna-3.9.tar.gz
 # Locally computed sha256 checksums
 sha256  a59f0b0ef3635874109a4461ca44ff7a70d50696e814767bfaf721d4c9b0db0f  LICENSE.md
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index c9b83a5bff..a89427e42d 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IDNA_VERSION = 3.8
+PYTHON_IDNA_VERSION = 3.9
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
-PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/e8/ac/e349c5e6d4543326c6883ee9491e3921e0d07b55fdf3cce184b40d63e72a
+PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/00/6f/93e724eafe34e860d15d37a4f72a1511dd37c43a76a8671b22a15029d545
 PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.md
 PYTHON_IDNA_SETUP_TYPE = flit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
