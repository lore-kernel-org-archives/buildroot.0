Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78E2ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 06:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6F40817AF;
	Wed, 14 Sep 2022 06:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6F40817AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j3S0EsrEb_1T; Wed, 14 Sep 2022 06:31:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABF068190B;
	Wed, 14 Sep 2022 06:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABF068190B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B37A1BF947
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 06:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 009E040A09
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 06:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 009E040A09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l-AS6srX1KEf for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 06:31:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F961400E9
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F961400E9
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 06:31:14 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id y3so32439747ejc.1
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 23:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date;
 bh=ORRhQujSqePRdkPbiKxTQ829o1JEcQh6dfdFxk2Us+k=;
 b=MWf2Us/8QIVUVt0kwXHdClKo62GM+ee+wOz3+eD3PvVLvK1ve6wQKtEJjKAVqfBl2R
 OBOh7xb7J23qvoRLLiVi8XI+gZmsypDVFdGHj4NC+3pcP0T73b/7/Lggsy7DEfYGFQCT
 WypdiCm/ldMzpqLhNtmZ4gexItgHFw8eLjpyx7TXXMxY2B12YaIaQIt2EGGmP2ax3hZh
 py8oAAt+euOxI3nEZ1o+YtkBvsHgpYKGnla5kRWIqkqXsddK4vcOudQXubSZ6PfazErA
 eVc7zpnUNYx1awdlsET8epi4eN1XyCrGwJXCdqCDCs1L0Ncy4DGpTUCf5fANwicDErc2
 PiPQ==
X-Gm-Message-State: ACgBeo2MusksVNCId2CC/LkNXOtt71T92vokGRsxNnS8t0w8AqMg3c7b
 t9+dEJS/rZPv8FJuJnd1wABxvy7KO+dnbA==
X-Google-Smtp-Source: AA6agR738n7zAPkAbwznu4kpMZvpOLSj6CawRHhYotR0TIarNFLEhgbgYfSJTLsB+TuVnlCt1SgQXA==
X-Received: by 2002:a17:907:a049:b0:77c:1f27:1b28 with SMTP id
 gz9-20020a170907a04900b0077c1f271b28mr12562062ejc.20.1663137072492; 
 Tue, 13 Sep 2022 23:31:12 -0700 (PDT)
Received: from thomas-OptiPlex-7090.nmg.localnet (d528f5fc4.static.telenet.be.
 [82.143.95.196]) by smtp.gmail.com with ESMTPSA id
 ju19-20020a17090798b300b00741a251d9e8sm7328548ejc.171.2022.09.13.23.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 23:31:11 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 08:31:08 +0200
Message-Id: <20220914063108.3686785-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date;
 bh=ORRhQujSqePRdkPbiKxTQ829o1JEcQh6dfdFxk2Us+k=;
 b=L9Wt6sgbtj+FIo/WYcBhi0CpDOeEMyRTJZR1celAYmTdoOa26IGo8lUfwg29QUepu6
 Vt/zJxLXpsw7OtXDMClhYKWw3/lbLYUpOF2xp1tJFce4AP6X9lgDpT4grTwSUxf0jFQf
 csmzJoMFjQqU0BDmx5m9I8oYmMJmrXAEkOmLVbxtztc3ktsoK6CkjHmbo/pVtw6K8/0b
 svZ3L4agyf5ja1xBa688kxKDllLwRS11EobGcjYNegPimZYGfpXiOfYesmsW6tM02SOw
 IHhV19slYGJ/QGLaMfCwZCsj6TgItrIqzdfZ4aEJY62Nc0RRYznGNmG/IGz3iLM7HMe0
 R0sQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=L9Wt6sgb
Subject: [Buildroot] [PATCH] package/gdk-pixbuf: fix test compilation (don't
 build the test suite)
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
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Not needed + breaks compilation on some platforms.
The compilation error was seen on 2.42.8, but also relevant
for 2.42.9 to not compile the test suite.

The option was added in 2.42.9:
https://github.com/GNOME/gdk-pixbuf/commit/801eef111df624f4377baed9a90c94b6a2d4340c

```
[179/246] Generating tests/resources.c with a custom command
FAILED: tests/resources.c
/buildroot/output/host/bin/python3 /buildroot/output/build/host-gdk-pixbuf-2.42.8/build-aux/gen-resources.py --glib-compile-resources=/buildroot/output/host/bin/glib-compile-resources --pixdata=/buildroot/output/build/host-gdk-pixbuf-2.42.8/build/gdk-pixbuf/gdk-pixbuf-pixdata --loaders=/buildroot/output/build/host-gdk-pixbuf-2.42.8/build/gdk-pixbuf/loaders.cache --sourcedir=/buildroot/output/build/host-gdk-pixbuf-2.42.8/tests --source ../tests/resources.gresource.xml tests/resources.c
failed to load "/buildroot/output/build/host-gdk-pixbuf-2.42.8/tests/icc-profile.png": Couldn?t recognize the image file format for file ?/buildroot/output/build/host-gdk-pixbuf-2.42.8/tests/icc-profile.png?
../tests/resources.gresource.xml: Child process exited with code 1.
```

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/gdk-pixbuf/gdk-pixbuf.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 7a75ed23f6..4a513effbd 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -19,11 +19,13 @@ HOST_GDK_PIXBUF_DEPENDENCIES = host-libpng host-pkgconf host-libglib2
 
 GDK_PIXBUF_CONF_OPTS = \
 	-Dgio_sniffing=false \
+	-Dtests=false \
 	-Dinstalled_tests=false \
 	-Dman=false
 
 HOST_GDK_PIXBUF_CONF_OPTS = \
 	-Dgio_sniffing=false \
+	-Dtests=false \
 	-Dinstalled_tests=false \
 	-Dintrospection=disabled \
 	-Drelocatable=true \
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
