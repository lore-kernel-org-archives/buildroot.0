Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5135ACA5FFE
	for <buildroot@archiver.kernel.org>; Mon,  5 Oct 2026 22:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E167405AD;
	Mon,  5 Oct 2026 22:40:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SiwJ9rz5T_Z1; Mon,  5 Oct 2026 22:40:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ED94F4061D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791240048;
	b=i7ewadGdVD1vKQK/j+P9hxpAOaZiomPwvSRH+IxlyAW5DGs52rZ7eByYc2K3Bv7KBQlT
	 gOglkWOStVJrwA+Qm5/Nx48CSfBds9yhPgH2btXTsKohRfqy7IsrpzXHzu3a63KLuq5HZ
	 MZNurSnt3xKQ38cAOKJuh7PLzfGXvR6k4a8qgT8Ui9c0aKhBb1LULbl518DTEwmKY6hed
	 YnDbjSo5w5s5TV+kJg5z5nJ2PA1PBIfSFgeA1gWg2fF4ORHLNKLqMP+OfCSwOAybap24O
	 bmFaB3D+FXfJBfBC5FPzGPpR70gTzo8S2ER76RKk4e8gk5JHwhpKzD44gRWnTZCJIfg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791240048;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=WEFYY9WjI+29gO2VNGsFhiJFfsAmLp4fXwUbcMTwG5c=;
	b=JXDznXXSyIeSOzWekAc+ockm2fnmDa4WT8IJ0svchOZ2svCYhs2F81aKXHw9a3Z57OrE
	 uBgVoScgmudf6B4LbFgd87DKixzu9pTY5l4yGwuVg8AImBEDAOPqCdESnjUASe/j1iKRA
	 CuxCz9oxNJY6vIfi2ZXRAU9blV0x2rbF8gW3nbARN3HHsH/NXk5xuZj2gJJO5+Orxdv9F
	 JG5XSIIVi+OrVkqZNs9bcp7rdQEbgk/WWS7/PNt7jOFlmsN8dw5J+LW6CxWKSdoLTEZqH
	 jOjI/EkMN9lHlcIF9X4CfRgw/xtpzx2rlcu1ccd5AscEOqtiQ09wJPsXYrNoYssKmjg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mhRvgTU9;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791240048;
	bh=WEFYY9WjI+29gO2VNGsFhiJFfsAmLp4fXwUbcMTwG5c=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nGf39I7CCjayCzLZv9RhwCpaaddP9Xt/1J1V/Utr7rA1g0GCDH/SPH8gC8y8qX/J4
	 dv08UXeobrlr6JQRK1csTw7mvWAXh1+XFPlwfFmFXTKIW+WXV3e6TGnZHWT5Jev37w
	 4n6DogHv0l+/Fk4SwCqr8ZaG1AqiHEhqazNRJWKcWOWKQpATyYhN0/xqrCKG+PbgIf
	 0uceGsB5NZu4/iJaPJMLbH9US0I5hOXV7F1Woh4TEi1bcaVdowk3RFpov3PtaVuEJy
	 t0xj+aoPZamz0g4s27v8Lrp77O4CnWCvk04m0h3+dZCPdXNCS24QczIH2vzWwbT8ot
	 R9SK8eXA4mNEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED94F4061D;
	Mon,  5 Oct 2026 22:40:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B4BCA34E
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6555405AD
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hp2wl7YzlutH for <buildroot@buildroot.org>;
 Mon,  5 Oct 2026 22:38:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D45814053C
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::1b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791239909;
 b=h9GZ0osjVXXcoBbUtynJ1XkBhOTyn2coIo74RDWUmnAwq84s+DTu60bexFuRJmvnmnLN
 juqqbMBZ2L7RSBUcALH8Af44gNNJzsv1CaIUIpCXmqaNAQfYorQOynX3KJyIgzyRLoCpC
 XnxCi1j1mC3FgbfmPhp7PtpLw2xBvcJ/4GPoxNfHsb1fiX/xhnYLZ39R4nAaCE06WZOqC
 a3LFoKEp5SiMXWWaX6l2HZueeVDEfqpWkWrybp8vclhW5a+lMNZTYma4UN3Rt2mgkRgzN
 KQIH+NkEvny9WkgIvpuZhlw16uC0KHx60+W58i8yvIM4u1JuCbOfPj2qiFilHbScVDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791239909;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=PJu8BobevC2eS0qdZFIe60hoIwJYn2KDsx5LjqaXPYM=;
 b=iL7nWItGwhZis2RQdkcEkIBl2z9613D9GALQAFGNFVG4SfNSHcCBAJitrkSD7I4b69xS
 w/v53SGgMsGEdnkGLP8dgVpH7QfyrtJ9u4O/Ep6y8Xwl/t7mHBstPpWlEFppVpX4auS0s
 Q8EOzb+oqTit5I84SVZIbD2A1TaEs7h7nq72KsoAKlf8tNlVXg3SluGVIVkMX9bcRPGyA
 ZR7rKuCJuXrDSJ3iC9I73mYbvpgJiTqToIXJvKAUVJh+isva/+ZJtm+Gg+cqJfHhRkztw
 LQA9c3EuifO+jhEn95z6Schohyv7xEqAe3yVAqsDhFqhm0cvpzWErZ9F0QtWvz/EyXg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=mhRvgTU9; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::1b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::1b; helo=mail-oo2-x1b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=mhRvgTU9
Received: from mail-oo2-x1b.google.com (mail-oo2-x1b.google.com
 [IPv6:2607:f8b0:4864:31::1b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D45814053C
 for <buildroot@buildroot.org>; Mon,  5 Oct 2026 22:38:28 +0000 (UTC)
Received: by mail-oo2-x1b.google.com with SMTP id
 006d021491bc7-6c72bd8a02fso1484200eaf.0
 for <buildroot@buildroot.org>; Mon, 05 Oct 2026 15:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791239907; x=1791844707; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PJu8BobevC2eS0qdZFIe60hoIwJYn2KDsx5LjqaXPYM=;
 b=mhRvgTU9m2aRNiJA4FQhmCf+QzRj85sJDbDaBPR9hpnZvc53bQNAQ+1IkYYdRRMCmi
 gOr399gCbRxDrVx+FxintbN4Lsb0BlJPI0LgQPS1GlwoYDiJf+9Dcy8c6PHNWVqkslzI
 CbConx4Wy3AVPiWA3H3EFx++JoIAD22StoPByFYG0wMGSzid4NOgLp48GfY36iq/D7R3
 HG6BmM/Zmk0vLQiCEc6qFXWBjncnlnlujhALOoG5Oqqud67Bhc7ulwvPZO52I/kEAdK6
 cJ6KRhJtACoSvQozm/fJk5zEIG/ocxslE/2wB6rXQdo4w9gr8Vc/n+H3+P6D71gC5k+b
 YOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791239907; x=1791844707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PJu8BobevC2eS0qdZFIe60hoIwJYn2KDsx5LjqaXPYM=;
 b=1pQPttlinA+tzbgNG2IYjNik9NpsqJHH+kSku0ePBDLPkrkMC7Xbh22xctkf52dsi4
 wotwzh9a4aA7HSkKrXRmmT4cvBBCl33EqNoqegQ9W1LTu/f+DrmTlejqVrsaV7YsLMUS
 gZaXV2Yua0Gq/ORpXEa1yYXe3TRsF4BdR23Ifzsw2/Dgg9gBdv6CaVh2vADzRaKCFDvJ
 9aS+DQc1aodLDbF8uxMFhScgy2lruLJeeF0bzbPNQlFeskPkHJMEUZX8iTTQ4LFvx6JL
 YC42F2AMEWl9m34oiMqvR+2FON9L3Ov9aX5sTLoz5cZWqFEJJqpzjpeudicl+rPYX+KJ
 9jhg==
X-Gm-Message-State: AFuF++l45bHRgS+JOgDZloFZorPWB42VXdQsMlefai67YWbyyWRixcpm
 gzP8yjxQ/cJcm3N1ZzN1ZURajQaz/KjYnp4cS0qpTjrcrfLdvpNBJkUwiETCmw==
X-Gm-Gg: AYBFou2K1r43gTUvfYyGNvfsuYl2UCudNZUYMwSDNjSVeNoQ9WZr/yN+tjn8mn2ZHe9
 DorS8ABkNf9UdCFE/z8EM+ZxxE9Q3poQQAyhEaKbjfMLywN2ZIWYFUSmyZ8uRb6rTcYjxAWY//q
 kfJ7LyKz7sudodppFO5Nj9R0U6Z8HBnYIOL6BMb1WiwDYD5jBdouLHxOpqHIUzqR5KH27lOWHNU
 fBEtNsvou/WbDZDVgn2f/4Pi0XNgEKcOFLoJZjFydFTRyOLmTNxmWM62dE1ozxjsOuvJZHn7Bsh
 T0m5xDl4wOJpBtjnZCuquF+OTH2Wq6CzfG7IORsnFQ6KGB2V/WthUgeY/xRWO6VDnvAn+D187t+
 R/mqAsoZQLVgaUMdVsiOSGBDDkdgn9d7Qbg3+BRr39pOsxpOF03WcND3Va9RBbROR39A5IWwBYc
 RUiQ3lnYxupZOdTo9TmpptWCi5xKVg8rkEOVDHUn3yMwrjkEo77RPzYykrM5bwCiBjFZzyKwfo9
 SvTaQGObdy8tA1EmqS+V83BqL1HPJjpTrMgjHK08amq2Dt49Fnx3C+VhnYwqWSBDi/ULLhzInBD
 sX/I0KlISXMSq+8EgWpjoN2q32M0/ZWcNLyxmIZpX9QPAPXgZpxFdbirX+6yYi85GEdhkCgdrty
 MSLKvdZcc+KTwsOVvkliL0qtmM+WwOG5+BCpFhXZQDw==
X-Received: by 2002:a05:6820:f012:b0:6e0:fb60:d5b4 with SMTP id
 006d021491bc7-6e0fb60de37mr6725273eaf.7.1791239907480; 
 Mon, 05 Oct 2026 15:38:27 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-828201c6f0dsm720704a34.12.2026.10.05.15.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 15:38:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Oct 2026 16:38:09 -0600
Message-ID: <20261005223811.2094796-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005223811.2094796-1-james.hilliard1@gmail.com>
References: <20261005223811.2094796-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/5] package/pkg-python: add meson setup type
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Xukai Wang <kingxukai@zohomail.com>, Julien Olivain <ju.o@free.fr>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the Meson infrastructure's setup options, compiler flag defaults
and cross-file generator when building Python wheels with meson-python.
Install the resulting wheels through the existing Python infrastructure.

Pass package CONF_OPTS as individual setup-args settings while
preserving quoted and empty values. Retain the Meson build directory
for incremental builds and diagnostics.

Document the new setup type.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 docs/manual/adding-packages-python.adoc | 31 +++++++++++---
 package/pkg-python.mk                   | 54 ++++++++++++++++++++++++-
 2 files changed, 77 insertions(+), 8 deletions(-)

diff --git a/docs/manual/adding-packages-python.adoc b/docs/manual/adding-packages-python.adoc
index d6bae299a0..2dc773545c 100644
--- a/docs/manual/adding-packages-python.adoc
+++ b/docs/manual/adding-packages-python.adoc
@@ -4,7 +4,7 @@
 === Infrastructure for Python packages
 
 This infrastructure applies to Python packages that use the standard
-Python setuptools, pep517, flit or maturin mechanisms as their build
+Python setuptools, pep517, flit, maturin or meson mechanisms as their build
 system, generally recognizable by the usage of a +setup.py+ script or
 +pyproject.toml+ file.
 
@@ -51,9 +51,9 @@ On line 13, we declare our dependencies, so that they are built
 before the build process of our package starts.
 
 On line 14, we declare the specific Python build system being used. In
-this case the +setuptools+ Python build system is used. The seven
+this case the +setuptools+ Python build system is used. The eight
 supported ones are +flit+, +hatch+, +pep517+, +poetry+, +setuptools+,
-+setuptools-rust+ and +maturin+.
++setuptools-rust+, +maturin+ and +meson+.
 
 Finally, on line 16, we invoke the +python-package+ macro that
 generates all the Makefile rules that actually allow the package to be
@@ -96,14 +96,16 @@ Note that:
 One variable specific to the Python infrastructure is mandatory:
 
 * +PYTHON_FOO_SETUP_TYPE+, to define which Python build system is used
-  by the package. The seven supported values are +flit+, +hatch+,
-  +pep517+, +poetry+, +setuptools+, +setuptools-rust+ and +maturin+.
+  by the package. The eight supported values are +flit+, +hatch+,
+  +pep517+, +poetry+, +setuptools+, +setuptools-rust+, +maturin+
+  and +meson+.
   If you don't know which one is used in your package, look at the
   +setup.py+ or +pyproject.toml+ file in your package source code,
   and see whether it imports things from the +flit+ module or the
   +setuptools+ module. If the package is using a +pyproject.toml+
   file without any build-system requires and with a local in-tree
-  backend-path one should use +pep517+.
+  backend-path one should use +pep517+. Packages using the +mesonpy+
+  build backend should use +meson+.
 
 A few additional variables, specific to the Python infrastructure, can
 optionally be defined, depending on the package's needs. Many of them
@@ -132,6 +134,23 @@ therefore only use a few of them, or none.
   build backend use the +--config-setting=+ (+-C+) flag of the +build+
   module.
 
+* +PYTHON_FOO_CONF_OPTS+, for +meson+ packages, to specify
+  additional options to pass to +meson setup+. These options follow the
+  default options shared with the xref:meson-package-reference[Meson infrastructure].
+  Quote arguments containing spaces as for +FOO_CONF_OPTS+ in that
+  infrastructure. The host variant uses +HOST_PYTHON_FOO_CONF_OPTS+.
+
+* +PYTHON_FOO_CFLAGS+, +PYTHON_FOO_CXXFLAGS+, +PYTHON_FOO_FCFLAGS+ and
+  +PYTHON_FOO_LDFLAGS+, for +meson+ target packages, to override
+  the compiler and linker flags in the generated Meson cross file.
+  They default to +TARGET_CFLAGS+, +TARGET_CXXFLAGS+, +TARGET_FCFLAGS+
+  and +TARGET_LDFLAGS+, respectively.
+
+* +PYTHON_FOO_MESON_EXTRA_BINARIES+ and
+  +PYTHON_FOO_MESON_EXTRA_PROPERTIES+, for +meson+ target
+  packages, to add entries to the Meson cross file. They have the same
+  format as the corresponding variables in the Meson infrastructure.
+
 * +PYTHON_FOO_INSTALL_TARGET_OPTS+, +PYTHON_FOO_INSTALL_STAGING_OPTS+,
   +HOST_PYTHON_FOO_INSTALL_OPTS+ to specify additional options to pass
   to the Python +setup.py+ script (for setuptools packages) or
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 32ace4aac1..f040f53bdb 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -285,6 +285,27 @@ HOST_PKG_PYTHON_POETRY_BUILD_CMD = \
 HOST_PKG_PYTHON_POETRY_INSTALL_CMD = \
 	$(HOST_PKG_PYTHON_PEP517_INSTALL_CMD)
 
+# Target meson packages
+PKG_PYTHON_MESON_ENV = \
+	$(PKG_PYTHON_PEP517_ENV)
+
+PKG_PYTHON_MESON_INSTALL_TARGET_CMD = \
+	$(PKG_PYTHON_PEP517_INSTALL_TARGET_CMD)
+
+PKG_PYTHON_MESON_INSTALL_STAGING_CMD = \
+	$(PKG_PYTHON_PEP517_INSTALL_STAGING_CMD)
+
+PKG_PYTHON_MESON_DEPENDENCIES = \
+	$(PKG_PYTHON_PEP517_DEPENDENCIES) \
+	host-python-meson-python
+
+# Host meson packages
+HOST_PKG_PYTHON_MESON_ENV = \
+	$(HOST_PKG_PYTHON_PEP517_ENV)
+
+HOST_PKG_PYTHON_MESON_INSTALL_CMD = \
+	$(HOST_PKG_PYTHON_PEP517_INSTALL_CMD)
+
 ################################################################################
 # inner-python-package -- defines how the configuration, compilation
 # and installation of a Python package should be done, implements a
@@ -311,8 +332,8 @@ endif
 
 $(2)_SETUP_TYPE_UPPER = $$(call UPPERCASE,$$($(2)_SETUP_TYPE))
 
-ifneq ($$(filter-out setuptools setuptools-rust pep517 flit flit-bootstrap hatch maturin poetry,$$($(2)_SETUP_TYPE)),)
-$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'maturin', 'setuptools', 'setuptools-rust', 'pep517', 'flit', 'hatch' or 'poetry'.")
+ifneq ($$(filter-out setuptools setuptools-rust pep517 flit flit-bootstrap hatch maturin poetry meson,$$($(2)_SETUP_TYPE)),)
+$$(error "Invalid $(2)_SETUP_TYPE. Valid options are 'maturin', 'setuptools', 'setuptools-rust', 'pep517', 'flit', 'hatch', 'poetry' or 'meson'.")
 endif
 ifeq ($(4)-$$($(2)_SETUP_TYPE),target-flit-bootstrap)
 $$(error flit-bootstrap setup type only supported for host packages)
@@ -374,6 +395,35 @@ $(2)_DOWNLOAD_POST_PROCESS = cargo
 $(2)_DOWNLOAD_DEPENDENCIES = host-rustc
 endif # SETUP_TYPE
 
+ifeq ($$($(2)_SETUP_TYPE),meson)
+ifeq ($(4),target)
+$(call PKG_MESON_SET_TARGET_FLAGS,$(2))
+
+ifndef $(2)_CONFIGURE_CMDS
+define $(2)_CONFIGURE_CMDS
+	$$(PKG_MESON_GENERATE_CROSS_FILE)
+endef
+endif
+endif
+
+ifndef $(2)_BUILD_CMDS
+define $(2)_BUILD_CMDS
+	(cd $$($$(PKG)_BUILDDIR)/; \
+		set --; \
+		for arg in $$(PKG_MESON_$(call UPPERCASE,$(4))_OPTS) $$($$(PKG)_CONF_OPTS); do \
+			set -- "$$$$@" "-Csetup-args=$$$$arg"; \
+		done; \
+		$$($(if $(filter host,$(4)),HOST_)PKG_PYTHON_MESON_ENV) \
+		$$($$(PKG)_ENV) \
+		$$(HOST_DIR)/bin/python3 \
+		$$($(if $(filter host,$(4)),HOST_)PKG_PYTHON_PEP517_BUILD_CMD) \
+		-Cbuild-dir=$$($$(PKG)_SRCDIR)/buildroot-build \
+		$$(addprefix -Ccompile-args=,$$(NINJA_OPTS)) \
+		"$$$$@" $$($$(PKG)_BUILD_OPTS))
+endef
+endif
+endif
+
 ifeq ($(4),target)
 #
 # Build step. Only define it if not already defined by the package .mk
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
