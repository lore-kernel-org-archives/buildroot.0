Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600EDC83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 08:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E53FE60ACD;
	Fri, 11 Jul 2025 08:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MjvtM8uN04Dp; Fri, 11 Jul 2025 08:47:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAEEB608FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAEEB608FE;
	Fri, 11 Jul 2025 08:47:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88247199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 08:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8508940238
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 08:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nqEOOzWNv5oL for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 08:47:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=tim.soubry@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A5082400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5082400B8
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5082400B8
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 08:47:20 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-607cf70b00aso3516610a12.2
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 01:47:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752223638; x=1752828438;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FaExwfbNBV6sm09fYlmwyJTXSl8G0Oc3ixo68ybgZCQ=;
 b=HaTxaF7PiB9mMtkEXVQREvC5dIesIodmaLzSunw8jbEEa+rX5OY06KlkCMw5dx41hu
 w1OjQS7agX3AYynqRMWtqo+Xb7recFxNZA1Xxpw7cuaG1EEcaPI0os5Fny9LeXGxBK0a
 x2ctmMwtNkKGXUdv7NIHbAdbNEQFgdmKEihLYV5WsFfUZIYhBbGh9XvTux3mfKpCC5is
 YSkd0b8ksYQrDvLTo+pzrWqeul2qlLRZArDWrG9eRyC7lYCh3ZDTJns1CL9afBKA+LMZ
 gZz6GJQcpvaepSFylw6ebqqp7Atz7UBXIGcTLaEvDweR42Y4DZeoA/9F+PZPeYWU+d5x
 iunw==
X-Gm-Message-State: AOJu0Yy29OCK8GYUW7KCmrGrMgi0q7xqACbR4jh5FFFvvH5okjdhNLHu
 zfpS3RX5ISfUL+HT+YHsyfFRZ1DiuQmQknUVfCvGKXXdP7h0qspK93sa8SBFQpPn181i/VDmeci
 IMaaa474=
X-Gm-Gg: ASbGncs7JGE6azbWL1N3zN+hSAXFDBu6ikrewDPAKLy0EtFAKyd3KEgTyFGFKbKU26d
 +1abpwJHEqJBVAIiwE0mY45g5XqRMsOLjo9H+Z2f7C2bySduuOwC4C7Ds27hpq/xjh+DmwQH2gJ
 S43kfHWcP9w1/y4GCfqCclyCgrd4SoEZZYRijFdxAWquK0Cs+0xS5+uZDCDE16GTSGzZcN0zwUc
 qUaeSm9w/k+mwqGPd9a15rZAdbAuQ5lH3gtUVTObJX96SB5PntR8sHV9MuruwcC3BCcuDLD/jKq
 sBhF+TpzOuVG1uYSvnxVSWpCpLFqLDhqiydS/El9Avl52tR0YfctVoE1u1JEiuUFs2Tvo4S8Dxd
 m9cT7tsmqxBQnDepcwFALZQoRilGxXuSQHW34ZQ==
X-Google-Smtp-Source: AGHT+IFdzfUdU/S4/Zx3h1tJxWvIpqZScLuSplMYB8IreFBCts9bW9EquU8yvgJ9cHM4Rhs2KCMN3g==
X-Received: by 2002:a17:907:2daa:b0:add:f2c8:7d3f with SMTP id
 a640c23a62f3a-ae6fbf2395emr230297366b.33.1752223637608; 
 Fri, 11 Jul 2025 01:47:17 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:65ae:b800:1718:12a8:2587:721f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7e91c81sm265292066b.37.2025.07.11.01.47.17
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 01:47:17 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 10:47:08 +0200
Message-Id: <20250711084708.1081039-1-tim.soubry@mind.be>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752223638; x=1752828438; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=FaExwfbNBV6sm09fYlmwyJTXSl8G0Oc3ixo68ybgZCQ=;
 b=fudsyGEnH9/doJAZ11XugEfPxdQrsSCau4bU3XYiCEJUP5F2u/1ZL0GHoefDnc+rPy
 hcF8sQual0vsnqSWeSTQAutfW51hxPZA0ZzVsojvUPEbqdUtQIB6cAv07wz0+1lCPd9w
 oFzEFd/1isBoVwsBseqWeNvl2UuBtlrfZHXKwq14p6U3oFi5/hSSqv5XiVB83gHUiWJF
 Cq3h2f2YeU8NPkqndMbnR+xHV98IFNVi9woYE2eMbXDkRZb9kIG83IyYlsEMNTrhOrNZ
 mNaqS7xMqDtDJoh/Fj0mgZEZFFlEU7CLOyK7bp5cDYLU9hjOOorg6LcO3JRzv9lWWafP
 WrVg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fudsyGEn
Subject: [Buildroot] [PATCH 1/1] package/gdk-pixbuf: add patch for static
 build issues
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
From: Tim Soubry via buildroot <buildroot@buildroot.org>
Reply-To: Tim Soubry <tim.soubry@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When statically building gdk-pixbuf using uClibc or musl, linking errors
arise, as seen on autobuilder [1]:

FAILED: gdk-pixbuf/gdk-pixbuf-csource
/workdir/instance-0/output-1/host/bin/arm-buildroot-linux-uclibcgnueabi-gcc  -o gdk-pixbuf/gdk-pixbuf-csource gdk-pixbuf/gdk-pixbuf-csource.p/gdk-pixbuf-csource.c.o -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -static -Wl,--start-group gdk-pixbuf/libgdk_pixbuf-2.0.a -lm /workdir/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libglib-2.0.a /workdir/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/lib/libatomic.a -pthread /workdir/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpcre2-8.a /workdir/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgobject-2.0.a /workdir/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libffi.a /workdir/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgmodule-2.0.a /workdir/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgio-2.0.a /workdir/instance-0/output-1/host/arm-buildroot-l
 inux-uclibcgnueabi/sysroot/usr/lib/libz.a -lintl -lintl -Wl,--end-group
/workdir/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/13.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: gdk-pixbuf/libgdk_pixbuf-2.0.a(io-jpeg.c.o): in function `real_save_jpeg':
/workdir/instance-0/output-1/build/gdk-pixbuf-2.42.12/buildroot-build/../gdk-pixbuf/io-jpeg.c:1518:(.text+0x6a4): undefined reference to `jpeg_std_error'
/workdir/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/13.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /workdir/instance-0/output-1/build/gdk-pixbuf-2.42.12/buildroot-build/../gdk-pixbuf/io-jpeg.c:1524:(.text+0x6ec): undefined reference to `jpeg_destroy_compress'
/workdir/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/13.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /workdir/instance-0/output-1/build/gdk-pixbuf-2.42.12/buildroot-build/../gdk-pixbuf/io-jpeg.c:1530:(.text+0x704): undefined reference to `jpeg_CreateCompress'

Meson does not include the libjpeg, libpng and libtiff by default. When
support for one of these is required, they should be added as a library
dependency in meson.build when statically building. This patch works by
adding included_loaders_deps to the dependency array in meson.build.
include_loader_deps contains support for all of these as seen in [2].

[1] https://autobuild.buildroot.org/results/a42/a4268791e3d385f11293f4dca871d02b20ebd544/build-end.log
[2] https://lists.gnome.org/archives/commits-list/2019-August/msg00005.html
[3] https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/merge_requests/161/diffs

Signed-off-by: Tim Soubry <tim.soubry@mind.be>
Fixes: https://autobuild.buildroot.org/results/a42/a4268791e3d385f11293f4dca871d02b20ebd544/build-end.log
---
 ...lve-issues-for-static-build-using-uC.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/gdk-pixbuf/0001-meson.build-resolve-issues-for-static-build-using-uC.patch

diff --git a/package/gdk-pixbuf/0001-meson.build-resolve-issues-for-static-build-using-uC.patch b/package/gdk-pixbuf/0001-meson.build-resolve-issues-for-static-build-using-uC.patch
new file mode 100644
index 0000000000..ed284b130f
--- /dev/null
+++ b/package/gdk-pixbuf/0001-meson.build-resolve-issues-for-static-build-using-uC.patch
@@ -0,0 +1,31 @@
+From 723f66ac2818e9671713956967120ebda207473c Mon Sep 17 00:00:00 2001
+From: Tim Soubry <tim.soubry@mind.be>
+Date: Thu, 10 Jul 2025 16:37:49 +0200
+Subject: [PATCH 1/1] meson.build: resolve issues for static build using uClibc
+ or musl
+
+This patch resolves issues when statically building gdk-pixbuf with musl
+or uClibc.
+
+Signed-off-by: Tim Soubry <tim.soubry@mind.be>
+Upstream: https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/merge_requests/161/diffs
+---
+ gdk-pixbuf/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gdk-pixbuf/meson.build b/gdk-pixbuf/meson.build
+index 570625bfe..d56ccf200 100644
+--- a/gdk-pixbuf/meson.build
++++ b/gdk-pixbuf/meson.build
+@@ -269,7 +269,7 @@ endif
+ gdkpixbuf_dep = declare_dependency(
+   link_with: gdkpixbuf,
+   include_directories: root_inc,
+-  dependencies: gdk_pixbuf_deps,
++  dependencies: [ gdk_pixbuf_deps, included_loaders_deps ],
+   sources: [ gdkpixbuf_enum_h, built_girs ],
+ )
+ meson.override_dependency('gdk-pixbuf-2.0', gdkpixbuf_dep)
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
