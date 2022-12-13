Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76F3C00145
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 01:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4527B40384;
	Tue, 13 Dec 2022 01:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4527B40384
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nawXU0QSJeVe; Tue, 13 Dec 2022 01:50:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDAF3408DE;
	Tue, 13 Dec 2022 01:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDAF3408DE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 195601BF2FB
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 01:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5AD2408E9
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 01:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5AD2408E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3GaxziopdaPY for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 01:50:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B97A4400DD
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B97A4400DD
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 01:50:19 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id h6so1003893iof.9
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 17:50:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sdgvrrrzVumFekp+nDBVAVc9++hXIk9sbTJEVw2/x0I=;
 b=7pT9EFvVEU1w7VCVdcLpGQ/HV410x9AsZ7bBlLSRMZjfBuOmsm6zQ+AtcK2hRIDeNz
 4pr1JIhlhF856LL46T4V4WODamYnEIM7I1Hb5mUdKx7LqiBCjF5MygTmfhf5p3QPuclO
 qUEjGjdYBHxWwRxhbdPc8l/Y6TOX4jHn925jlghqJ3DdlUZOy5/+0tq7vp3r5U+YFF9t
 aLa0lI7rfPuTvDd0P/PKV4A4FMxpuqX0FHy9O+MESU42wh0zE3hhvjC86kacMe/CKqVo
 3Gj5Env8gd9v6eOYv40V2g1S/GTjo3ELyzx4DPDpGkuMzj2Dp7GyR757st96L2OvQnhH
 XFDg==
X-Gm-Message-State: ANoB5pmcw8LayjRyqlrqEhi2Kn8Hpf1z7moi0XDt1ba6QlJ6pKg2ybgO
 9/oUafzFtA09LIfiAuTgeh8rVqIQWKPcrw==
X-Google-Smtp-Source: AA0mqf5KWWNw/qD2Vb8K8uLVSKfqX98L8tlSkL/TZ/FRe4LhaohyLc0RJrJFiEAQSOBnJNJqeQ7H8A==
X-Received: by 2002:a6b:4f08:0:b0:6e1:a62e:f658 with SMTP id
 d8-20020a6b4f08000000b006e1a62ef658mr11382855iob.18.1670896218674; 
 Mon, 12 Dec 2022 17:50:18 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y18-20020a027312000000b003760a908bfasm413354jab.169.2022.12.12.17.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 17:50:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 18:49:59 -0700
Message-Id: <20221213015001.4175808-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221213015001.4175808-1-james.hilliard1@gmail.com>
References: <20221213015001.4175808-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sdgvrrrzVumFekp+nDBVAVc9++hXIk9sbTJEVw2/x0I=;
 b=R8Ca7kE7oFs9lz5XM+fbhMVT6JOnO9eyAo0B+8PsKMSYttII9IO5MMGX6bqCiHdzAE
 wNlvaSN8MXQnak08RrXLoRBLC4upIuVOjM5Rr5EQhpQx0Sdy1RXeqbssilW0PXm5KvpS
 /a58SjPDXuG18PHl0UWxAxRMprP4hod1UtfqETY56Q+x3p1WR0DyTGmhfp0i+f7pj5uI
 SaPdWr64g9XhQRU4P8w9PhTTNgStN2XpptSSFxHHd4q9e3mWM1415EMQ6B+SPFjb8ICg
 dvauSikbu0yd8WYoueMgGynBAOBCIVIGYsdtDFFBas6oljA5XjsNMOEX8E8KPTgiLq3O
 GKYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=R8Ca7kE7
Subject: [Buildroot] [PATCH 5/7] package/python-wsproto: new package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-wsproto/Config.in           |  7 +++++++
 package/python-wsproto/python-wsproto.hash |  5 +++++
 package/python-wsproto/python-wsproto.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/python-wsproto/Config.in
 create mode 100644 package/python-wsproto/python-wsproto.hash
 create mode 100644 package/python-wsproto/python-wsproto.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 769cde7155..89d2a9a2c3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1401,6 +1401,7 @@ F:	package/python-trio/
 F:	package/python-typeguard/
 F:	package/python-typing-inspect/
 F:	package/python-weasyprint/
+F:	package/python-wsproto/
 F:	package/python-yarl/
 F:	package/python-zopfli/
 F:	package/rtl8192eu/
diff --git a/package/Config.in b/package/Config.in
index dbf705bbdd..cd22bc9935 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1335,6 +1335,7 @@ menu "External python modules"
 	source "package/python-wrapt/Config.in"
 	source "package/python-ws4py/Config.in"
 	source "package/python-wsaccel/Config.in"
+	source "package/python-wsproto/Config.in"
 	source "package/python-wtforms/Config.in"
 	source "package/python-xlib/Config.in"
 	source "package/python-xlrd/Config.in"
diff --git a/package/python-wsproto/Config.in b/package/python-wsproto/Config.in
new file mode 100644
index 0000000000..0610348b8d
--- /dev/null
+++ b/package/python-wsproto/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_WSPROTO
+	bool "python-wsproto"
+	select BR2_PACKAGE_PYTHON_H11 # runtime
+	help
+	  WebSockets state-machine based protocol implementation.
+
+	  https://github.com/python-hyper/wsproto/
diff --git a/package/python-wsproto/python-wsproto.hash b/package/python-wsproto/python-wsproto.hash
new file mode 100644
index 0000000000..4eb3195785
--- /dev/null
+++ b/package/python-wsproto/python-wsproto.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/wsproto/json
+md5  f64973434117e23d2079460ed64b05c3  wsproto-1.2.0.tar.gz
+sha256  ad565f26ecb92588a3e43bc3d96164de84cd9902482b130d0ddbaa9664a85065  wsproto-1.2.0.tar.gz
+# Locally computed sha256 checksums
+sha256  c0329a8dbf3437b095f7f5cf4257d6bb855e07120cae8786586073ff7a699959  LICENSE
diff --git a/package/python-wsproto/python-wsproto.mk b/package/python-wsproto/python-wsproto.mk
new file mode 100644
index 0000000000..629f4431b4
--- /dev/null
+++ b/package/python-wsproto/python-wsproto.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-wsproto
+#
+################################################################################
+
+PYTHON_WSPROTO_VERSION = 1.2.0
+PYTHON_WSPROTO_SOURCE = wsproto-$(PYTHON_WSPROTO_VERSION).tar.gz
+PYTHON_WSPROTO_SITE = https://files.pythonhosted.org/packages/c9/4a/44d3c295350d776427904d73c189e10aeae66d7f555bb2feee16d1e4ba5a
+PYTHON_WSPROTO_SETUP_TYPE = setuptools
+PYTHON_WSPROTO_LICENSE = MIT
+PYTHON_WSPROTO_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
