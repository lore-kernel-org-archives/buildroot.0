Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0A0C7EE2D
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 09:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7065740586;
	Sat, 25 Feb 2023 09:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7065740586
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 98dvf6IqQJKJ; Sat, 25 Feb 2023 09:35:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9BB26400EC;
	Sat, 25 Feb 2023 09:35:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BB26400EC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0479E1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D176760B30
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 09:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D176760B30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FNpdOfnjBPX2 for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 09:35:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60AB560B1C
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60AB560B1C
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 09:35:34 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id j3so1294343wms.2
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 01:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h2gi/cbWr3E3unBFoU3HljBndaSjEv9HoWMMn9+d45U=;
 b=PBc3b0/DcIHImb9qFCWlLcHTd1uv7ZVnF1nqWI8xhWOeZUwIUuHEErNKUsavTwNhmH
 t+Q30ecwx3OzBiXlOLpIf1AL0viLIcHVAlNQrvvOWL6PUn8aITVSgeTRIIuXFXh2P7wa
 FEkoMMtIZTinrZF2XHBq3fQauSWgxTkXgvcpEtHIueF6V0X3/bAk4SHZXoJpaz8l5VMC
 A35nj2ljBf4qySjyWGFcjrDAFAk9Xkqx8SHR9ludNuJEtg149VBHRhc859iNZW72G+LT
 hCN3X7ai0gHg2SLUfefnH3pIPTnfI4VZA8LAm9oJHr3rOc9U+QCNBz7uRl1K1z+AFwqN
 Jb/g==
X-Gm-Message-State: AO0yUKWslIidNubY9cNtMVpIUH2nFYvg+GJSqVSvvl+/2DpD5bRyqsU5
 W5KVPg6mxfmOjp/Mh9Gvj79j8zGlpHQ=
X-Google-Smtp-Source: AK7set9t8ysYQNxWDai8Kq7WFUMc4xbN2KHbXLy9lLjpOi0ce3Rxw/O+SHyYrM5oOZ2yOqrNKnrfVA==
X-Received: by 2002:a05:600c:4f16:b0:3eb:2e32:72c3 with SMTP id
 l22-20020a05600c4f1600b003eb2e3272c3mr2418387wmq.22.1677317732015; 
 Sat, 25 Feb 2023 01:35:32 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 d24-20020a1c7318000000b003dc522dd25esm1931204wmb.30.2023.02.25.01.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:35:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 10:35:27 +0100
Message-Id: <20230225093527.16587-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h2gi/cbWr3E3unBFoU3HljBndaSjEv9HoWMMn9+d45U=;
 b=Kx4imHukZGRa1YmLPVaB+fVtg0jaVB6EY+AFSBJyqgypvdD1MQLfxK+o4u/yub2mZs
 isEbKyWgMjrrOT/qw+xVAq8T4LVFJxMa7jt/0e+YIw8/OvvjK3R/JZAuEKCYdjXSiY2/
 0w3iOP5vyRYckAx6+Z3lxs7d9QnlQTpNznLKU8OrkMK8TU64rFZ8Q+ylJhXKVvRGGdh5
 wsRN3dD+WILInutslIwVx1lyBrJefDU+rjDMYqc7Spt8KfuYeaswCNfOzxwuabnXeebt
 u69X+mD7Y1aWRn7ZqgAb8+2Ds3vUem4eWVqiWRNBqC6lgwhyr7bKqzrdAYnKoqrIh7KT
 V8zQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Kx4imHuk
Subject: [Buildroot] [PATCH 1/1] package/postgresql: add host-pkgconf
 dependency
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-pkgconf is mandatory to find lz4 and zstd resulting in the
following build failure since commit
9cd2e6e090449f9d2f371d24152580c038892f3d:

configure: error: in `/home/autobuild/autobuild/instance-5/output-1/build/postgresql-15.2':
configure: error: The pkg-config script could not be found or is too old.  Make sure it
is in your PATH or set the PKG_CONFIG environment variable to the full
path to pkg-config.

Alternatively, you may set the environment variables LZ4_CFLAGS
and LZ4_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

Fixes:
 - http://autobuild.buildroot.org/results/8744277ebe9910635ef8fe290c8ba4eee420b538

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/postgresql/postgresql.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 1e9e4b83df..f087c0c964 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -92,14 +92,14 @@ POSTGRESQL_CONF_OPTS += --without-libxml
 endif
 
 ifeq ($(BR2_PACKAGE_ZSTD),y)
-POSTGRESQL_DEPENDENCIES += zstd
+POSTGRESQL_DEPENDENCIES += host-pkgconf zstd
 POSTGRESQL_CONF_OPTS += --with-zstd
 else
 POSTGRESQL_CONF_OPTS += --without-zstd
 endif
 
 ifeq ($(BR2_PACKAGE_LZ4),y)
-POSTGRESQL_DEPENDENCIES += lz4
+POSTGRESQL_DEPENDENCIES += host-pkgconf lz4
 POSTGRESQL_CONF_OPTS += --with-lz4
 else
 POSTGRESQL_CONF_OPTS += --without-lz4
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
