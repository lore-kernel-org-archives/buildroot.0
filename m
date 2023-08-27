Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5D6C83F11
	for <buildroot@archiver.kernel.org>; Sun, 27 Aug 2023 19:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 587A4403FD;
	Sun, 27 Aug 2023 19:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 587A4403FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i3TxZx1548s5; Sun, 27 Aug 2023 19:40:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CD24403BF;
	Sun, 27 Aug 2023 19:40:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CD24403BF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 270E31BF2E4
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 19:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0723E404F5
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 19:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0723E404F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2j_DqTjYQElT for <buildroot@lists.busybox.net>;
 Sun, 27 Aug 2023 19:40:09 +0000 (UTC)
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3920400AC
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 19:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3920400AC
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7926de0478eso76122839f.0
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 12:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693165208; x=1693770008;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l9xK3hIhNjms7XhRZQS4ZZxwBKAoItIo9EMtuhis5+E=;
 b=XBimGmAvXR5bg0xvJRqvFFSPfLFko0oFzqQ2okHgzgHY4Onbj2XBz2ytOfjq281A+d
 vKSMJHWqFZuzM/54miv02Ou+kxQnVyMhBLiv4jucP5RFGAkVwUqURrYM32vdxJwCmRGM
 /VMw6OaDNMi75tvXdYJ0wUl7a3WIZ6qLyENW/iijj54eRNsspbaZGUNAUuMBztPdYmYm
 9UU++xeDUZ5npP5GB+oxSQzNO86hmh7m1SB4NG6ToIpYT8AJe2LxPCY6avzJgDCy/xgd
 r3QtJs6qNlbniAc906IIoAHvvLfe/xcGwRZud2lProxDpys66uW43oMgtv+QE+qQy8yH
 /BJg==
X-Gm-Message-State: AOJu0YxrJBWAWDJfKohsoOrIs501Ts9cjVZPMzJnmFJf+zRUTFWiPjeu
 Wc2OnwrR0UqKm4Y562rxBN4LxAkI/cw=
X-Google-Smtp-Source: AGHT+IEjtScjYSVnDEulQx3VGHMAis0s1W9SEFAiCsjny8Or/khqcWiDvTp3cr1jnZumCNkm0KcCyA==
X-Received: by 2002:a92:c84a:0:b0:34c:ecc8:98e5 with SMTP id
 b10-20020a92c84a000000b0034cecc898e5mr2394683ilq.1.1693165208081; 
 Sun, 27 Aug 2023 12:40:08 -0700 (PDT)
Received: from james-x399.localdomain (97-118-146-15.hlrn.qwest.net.
 [97.118.146.15]) by smtp.gmail.com with ESMTPSA id
 z20-20020a029f14000000b0042bb5a8e074sm1993776jal.8.2023.08.27.12.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Aug 2023 12:40:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Aug 2023 13:40:02 -0600
Message-Id: <20230827194003.3387773-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693165208; x=1693770008;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l9xK3hIhNjms7XhRZQS4ZZxwBKAoItIo9EMtuhis5+E=;
 b=BHoBjoQrch28fQ51R7/vy8c4gmQxDgXAzQwY3dkeb5AKdRXca2KnivVRaF/QthmJXt
 NK3OLBt8mH4yLry84dm2VELYGLV5sCcSzTeY01zAXpPoJwEmhbcO3K0mwZx+jheEBK4y
 ZWHMlUjM3C9iHcVny7TNZfrkXPS1vVY8IOHQkR7vb4loZdKqHbaHJkaxrk723vzomHF+
 Qe/vGUdg3P8ay3x9ju/UN+e59a3l73qIisXI/ShQj5ypda+IlqIplb0mtl4dvwNWhty4
 XSX1Vz0yMu4F3jlXBpNrmeMbb5YDEjLBqoneZm9G29cI0uaXfx05Xo0++coRQL+LsNoq
 ryfw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=BHoBjoQr
Subject: [Buildroot] [PATCH 1/2] package/python-distlib: new host package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-distlib/python-distlib.hash |  5 +++++
 package/python-distlib/python-distlib.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-distlib/python-distlib.hash
 create mode 100644 package/python-distlib/python-distlib.mk

diff --git a/package/python-distlib/python-distlib.hash b/package/python-distlib/python-distlib.hash
new file mode 100644
index 0000000000..506d10824c
--- /dev/null
+++ b/package/python-distlib/python-distlib.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/distlib/json
+md5  44e4357e35bbd77fdf1b81e174e34f20  distlib-0.3.7.tar.gz
+sha256  9dafe54b34a028eafd95039d5e5d4851a13734540f1331060d31c9916e7147a8  distlib-0.3.7.tar.gz
+# Locally computed sha256 checksums
+sha256  808e10c8a6ab8deb149ff9b3fb19f447a808094606d712a9ca57fead3552599d  LICENSE.txt
diff --git a/package/python-distlib/python-distlib.mk b/package/python-distlib/python-distlib.mk
new file mode 100644
index 0000000000..cae025dbdb
--- /dev/null
+++ b/package/python-distlib/python-distlib.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-distlib
+#
+################################################################################
+
+PYTHON_DISTLIB_VERSION = 0.3.7
+PYTHON_DISTLIB_SOURCE = distlib-$(PYTHON_DISTLIB_VERSION).tar.gz
+PYTHON_DISTLIB_SITE = https://files.pythonhosted.org/packages/29/34/63be59bdf57b3a8a8dcc252ef45c40f3c018777dc8843d45dd9b869868f0
+PYTHON_DISTLIB_SETUP_TYPE = setuptools
+PYTHON_DISTLIB_LICENSE = PSF-2.0
+PYTHON_DISTLIB_LICENSE_FILES = LICENSE.txt
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
