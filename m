Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431E3C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 05:38:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94FE4600EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 05:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 94FE4600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CA7F40621;
	Mon, 27 Sep 2021 05:38:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id opwF8KXUXBaN; Mon, 27 Sep 2021 05:38:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DF5A405C9;
	Mon, 27 Sep 2021 05:38:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5E091BF30B
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 05:38:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D266F81B10
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 05:38:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YdfUjzJSVbx3 for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 05:38:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D636281A58
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 05:38:17 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id g16so48801586wrb.3
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 22:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ga6z/NkdBxBTzp+NxRCx/Sk42Cu/9NB1G9TNBNtdGP4=;
 b=gHWgHwy6slJfU1NaEQyktrau8ISX/cTl8cZMjzvTRumOM7FhwZ6ls9Haa7/v0zQVHh
 IqqKIviSP2SG4RKeJYZopd9QXWSk3eDNZgvrrsF6jXvorkPZ1c0tWOmxF8r5FEnzwTzd
 mo0LysLBb0NicwjyztJVf+U8EzORfKFJWP0OJHkLZ9dsdFitQ+ADJV3Nml6mz5u2LDuQ
 S4IJ6oSKpL7hesHIyUF4Ksmf3oJ5POxFur1kWuRMBScCup2RA8/Qdrqppd3q9bqgjePu
 f+2iXowTDIcAYFp1Xj9G6p7oQYIPVSppC8rCGStIPIMvAADQmYPKZKVxurQGwtw9n6GW
 M4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ga6z/NkdBxBTzp+NxRCx/Sk42Cu/9NB1G9TNBNtdGP4=;
 b=v8wPHnKqr4D34q+xzxRESKEEmWlq5mynZz/p5u5YB9vVzTTfAG0/1mQvmAvClG7JD8
 2zt8LTwbdq75cqiKKpRXH6jHVtpUGQBpzSIKoIMdfeeXa2vZ9dP59r4/234vmWKkFiKs
 YPGwiuhPDcGHMsbuxLZFhTVtfYiJMah9nFGUzXzC/E+QBtKA4aEQR+W55fJ6J9Wlnp7q
 D7Jpv3jBKLt8BehiaVAJHIZAh+0p+UQU1lnoc9VnfclCQYBZ6PPj+OySKPCzFJs6DQuR
 gSTmDn6NgSwwDHt4jKsqlTuiXLiE6Nz/2HYbB73d2tKzIbiH6pdSByRwPWg4BfF8a3Ex
 VN5Q==
X-Gm-Message-State: AOAM53292syQEweTUjls1pgk7QEJe8DSuH27EuGxwATamcm8jpK+GfHz
 RnHj5IGH72MaC3QidTbQOsiv7mdH/Bw=
X-Google-Smtp-Source: ABdhPJx+NuZTVX+CTD1rvuPCEMbiAlnA4oWZ60hN8cKUN0J4lZ/JlZNpD1AyKpJs1SGtzrdN08VB8w==
X-Received: by 2002:a1c:90:: with SMTP id 138mr13941036wma.30.1632721095490;
 Sun, 26 Sep 2021 22:38:15 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id o3sm16246171wra.52.2021.09.26.22.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 22:38:15 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 07:37:40 +0200
Message-Id: <20210927053740.1060569-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-inflection: needs python3
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
Cc: John Faith <jfaith@impinj.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python 2 support has been removed since version 0.4.0 and
https://github.com/jpvanhal/inflection/commit/a826dac7a562e67881ab704adbef45440566836e
resulting in the following build failure since bump to version 0.5.1 in
commit 6c09567e6b6f2cc826e64cd9b36fb41ed7c6e00c:

  File "/home/giuliobenetti/autobuild/run/instance-1/output-1/build/host-python-inflection-0.5.1/inflection/__init__.py", line 91
    def _irregular(singular: str, plural: str) -> None:
                           ^

Propagate host-python3 dependency to host-sdbusplus

Fixes:
 - http://autobuild.buildroot.org/results/6d6e937135ef95c63001359fec5f8c28183fc0a9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-inflection/Config.in | 4 ++--
 package/sdbusplus/sdbusplus.mk      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-inflection/Config.in b/package/python-inflection/Config.in
index 427275bc71..5b6a26fead 100644
--- a/package/python-inflection/Config.in
+++ b/package/python-inflection/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_INFLECTION
 	bool "python-inflection"
-	select BR2_PACKAGE_PYTHON_UNICODEDATA if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_UNICODEDATA if BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_UNICODEDATA
 	help
 	  A string transformation library that singularizes and
 	  pluralizes English words, and transforms strings from
diff --git a/package/sdbusplus/sdbusplus.mk b/package/sdbusplus/sdbusplus.mk
index f4e258089b..498b835052 100644
--- a/package/sdbusplus/sdbusplus.mk
+++ b/package/sdbusplus/sdbusplus.mk
@@ -10,7 +10,7 @@ SDBUSPLUS_DEPENDENCIES = host-autoconf-archive host-pkgconf systemd
 HOST_SDBUSPLUS_DEPENDENCIES = \
 	host-autoconf-archive \
 	host-pkgconf \
-	$(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python) \
+	host-python3 \
 	host-python-inflection \
 	host-python-mako \
 	host-python-pyyaml
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
