Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9FFC48260
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 19:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABB956067B;
	Fri, 16 Feb 2024 19:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sBMWMX6PMudK; Fri, 16 Feb 2024 19:45:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA639606A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA639606A3;
	Fri, 16 Feb 2024 19:45:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 06FF01BF34D
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 19:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E87D083EA9
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 19:45:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bdvtk-pJYO2f for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 19:45:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D870E83E87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D870E83E87
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D870E83E87
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 19:45:33 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d0b4ea773eso30516311fa.0
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 11:45:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708112731; x=1708717531;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7cpSw7k7KpytdbBab5n5TJZFjrAXRw6SGNYdoXeK7go=;
 b=SHA+5kptOjdu7OYD1bwojxzbkb+hB7uU1zU5C/2N24JNn69lXWmlJ5Ebhqb8zsiJkH
 D8bhFuWRnkvrgpqliwy91s6fOeRswBsA8f8ryX5SeP6oZn+wgAAdHGixNnEPK2GF+rJ1
 zJTcSETExStiKWVqMQW38TyndkbbwoTbwG8VMLxsfz72F0N7gjBWGcOItvW0Uj3aD2bA
 YFLD6Yi24qOoas7JiWsA0D7mGGtORtQ77oiUb3Ui5kELoMbniubVg7AhbcQmC4BiULL4
 FhS0iwdO8mqjbVq7p5+UURJIBrFQ5gHixdsDQUEgzKIFzVcLClcCE0jYKlJY19uP/Ikt
 /nLw==
X-Gm-Message-State: AOJu0YzZmHnCie53fToVcBGohdeQrj5wHOV9giRKoxXks3aGgRf8vyrG
 /og3/a+QLDMO9B3ooF7SmoszZbNSP2MInifk41kDShTV27+dAcQIIfo8r7dYKOo=
X-Google-Smtp-Source: AGHT+IHQj0td2ZLn0UWM1/WCVeaAgJgJx65B/inaEp4by1RzeNSz6AiluXDARr6pAxsUCmpdKD26FQ==
X-Received: by 2002:a2e:7d08:0:b0:2d0:97e1:6c1d with SMTP id
 y8-20020a2e7d08000000b002d097e16c1dmr3916673ljc.47.1708112730375; 
 Fri, 16 Feb 2024 11:45:30 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c3b8e00b00410709fa0d3sm3262940wms.33.2024.02.16.11.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 11:45:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 16 Feb 2024 20:45:20 +0100
Message-ID: <20240216194520.1806313-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708112731; x=1708717531; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7cpSw7k7KpytdbBab5n5TJZFjrAXRw6SGNYdoXeK7go=;
 b=DEhSXHHqaobwJyJI2dHkZd55yDBPt3DKh7mgqZQBEmz++XNhIEfAgBuOJmhf1WE0Cn
 CWCNqZmxT4Fx05dL2yRk6K1wfdwQiQXRT7G5zyYOWvIYonK/ep2qq871UTqlx5Oh7+iE
 omInJ0lR3Y23RkIiMUjqesi9SozWoeszWVXgGm3z02VWLH3JGOsj5Vg5OkIW9hX6+jAw
 GAYqXu2OW1Cq5BAZUI0TkNANEfSNOecIR5wmPMdMq46yRdA+gD0VJBY8msHpQ6B9ssVq
 NA2/J1qC/7scUbTKe5Wtl7PG2+bVhsnwo1TWlshfKESftx9U2ojht4zCITsnKjcqj7Xx
 wL4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DEhSXHHq
Subject: [Buildroot] [PATCH 1/1] package/gdal: deflate64 needs libzlib
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
Cc: Dominik Michael Rauh <dmrauh@posteo.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

deflate64 unconditionally uses FAR since its addition with
https://github.com/OSGeo/gdal/commit/d6baebcc73ffc2ede6e9635846676b275b02bab3
resulting in the following build failure with zlib-ng since bump to
version 3.8.2 in commit d2e349301b79ad3a1840083714ee396f4302b68a:

In file included from /home/autobuild/autobuild/instance-2/output-1/build/gdal-3.8.2/frmts/zlib/contrib/infback9/infback9.c:6:
/home/autobuild/autobuild/instance-2/output-1/build/gdal-3.8.2/frmts/zlib/contrib/infback9/minified_zutil.h:46:17: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'uchf'
   46 | typedef uch FAR uchf;
      |                 ^~~~

Fixes: d2e349301b79ad3a1840083714ee396f4302b68a
 - http://autobuild.buildroot.org/results/8b55108dee4faa98c234d00a1a22b62ed948e8d3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdal/gdal.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index 3104332db9..247e13663c 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -124,6 +124,12 @@ else
 GDAL_CONF_OPTS += -DGDAL_USE_LIBXML2=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBZLIB),y)
+GDAL_CONF_OPTS += -DENABLE_DEFLATE64=ON
+else
+GDAL_CONF_OPTS += -DENABLE_DEFLATE64=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
 GDAL_DEPENDENCIES += postgresql
 GDAL_CONF_OPTS += -DGDAL_USE_POSTGRESQL=ON
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
