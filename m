Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706C1D5B16C
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 14:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 315A3409DF;
	Mon, 15 Dec 2025 14:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cL1_9ImFUFQU; Mon, 15 Dec 2025 14:25:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48455409D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765808753;
	bh=Ql+AOhVQn3p2NqJaDzLGhBUZesrd1yCLjs/DZluIl6A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AizJ5VxWVqm3A6ZYylhW0rGj0u6RN89+sEnmOsiXnswfpBKeU7mDpQA5LAXQJUOlx
	 k2Qta6uBksf/0qPpmkrNqatXiSaLdlR17XORzzYd0mt6UlCkruWGPE5fpz+zWcH8Fg
	 x67n/xCi9xrG9+2JnZ5Hm+QjGTxC0VG9clVlqqU0VbumYIHWMdUPzNMq3S0xPnYaJJ
	 DqOc9ilMsL2YF8hKYs1Ro4fY5EJlUc0BJZGDkTgRgtIFIz6cC/drd2SQbtlJl5dz9M
	 z77IAXRBRsbhI1bWf8OQArmvCFr68a+gsLr3Wku/vgvAYRu3Itja5AuLjnAVM1o42v
	 cl/AqxWbbdesw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48455409D9;
	Mon, 15 Dec 2025 14:25:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3DBF117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 14:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A122F81471
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 14:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ParkKDidJWtt for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 14:25:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 186BE8144A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 186BE8144A
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 186BE8144A
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 14:25:48 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-64979bee42aso5188429a12.0
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 06:25:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765808746; x=1766413546;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QHv5/35wke0QF4UEa1NWDXgs+TOpKLpslxEivhr3Sio=;
 b=gS9hnLTrSP1U2Vdb/WKYqg4C9Owdi6Py4lM+rZV9AqbEvUdbdavYZi+jlDJGZ9pn4V
 sDYaUWXTnJ3K7Bgeii5hgAUsVfy6KggeVzjnl7ItZPqM+73iVLznsPhMMbY3ysqlQfs7
 OUyJl/uchlsTYAgCBKoc63/PAd4hXG9v+R1T6azOYojA1dH2MPy56SSqC8VYuBjbq6+l
 LmpINt1owO9sA8q/OfqqHN94mAkR+hsdz8a8djbGfXzEzCw4Sbk9YSC0QXKpLpfnCd44
 YHONPuwkfNorlJuDEidLU8KqtSyleqEj2FeYhL2MaJ4DiTR013Xk3UNR4y/REFtZMC3c
 sptw==
X-Gm-Message-State: AOJu0YyXMKcqWBkv9FazzKgr8ZhaxS7tRiFf36GvhELozimXFJ/mEL7B
 p9GtdVAxZvQAtBX/E1+mAJG0R0X4OYFyg/Y1D58jXUdKfb25IHLFC15HHFaNrw==
X-Gm-Gg: AY/fxX43CwgfNo+EQbPUf1Ps7oujIY9+lEFMTUwV9wUmWQinrV28ib81rWLwSUYWD5T
 MqcgONVNXyZ/kq65cM6ceYXGbooqdO0b13IhP2DCU5mDYbukWoX+/TQt8ublJiB34UDnbcMNtAC
 7iSywsVf87HC5uNgNojBBQXYNdilRb0FmxwbOvi5uFqn6dRHZci28+HbY53fkoqQYghYisRFHnE
 W5eaKvncRaB0XTjbebr8QU4fFOs7PNanWx7dGJcy0slDUbv3oAbaFRGikc7riPlTgb6x3RPEnZG
 KXcbxB42iZnjRhOXy2KzhlpLGD8eGfZ/qz0+t7JYhe0CiwBcApw/t+Z6f1Y/B2oXmeYsX2BQHJx
 jGK7IouU+8OwWcag9SJ9WOBggN35R80z515xzFrPPOCobcyi0kanV4F1hnYdBEay2ivY/qW7GO8
 BoWPOucn3qLjc3WaAyQgt5v2DIo/Kl9fJ1m4/xwGeh5h7GnMwKGQbvcsBpEZ2Pmx9mco0=
X-Google-Smtp-Source: AGHT+IFMkYV/4ab1qU5Iqcrvm1rPOFsiroNspvFJ+Y4NByCq/pXqGgUQX7NMudGz50BW1nIJVFr9GQ==
X-Received: by 2002:a05:6402:274d:b0:647:b4b9:cd2f with SMTP id
 4fb4d7f45d1cf-6499b11007amr11229619a12.3.1765808746078; 
 Mon, 15 Dec 2025 06:25:46 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6498210de23sm13812663a12.28.2025.12.15.06.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 06:25:45 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 15:25:40 +0100
Message-Id: <20251215142540.2961761-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1765808746; x=1766413546; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QHv5/35wke0QF4UEa1NWDXgs+TOpKLpslxEivhr3Sio=;
 b=ZK6zitEN7hpoMO93vxHs0aUAItVUJQFyU+LgCNpEJd00KAYUQucfiu0VQmQTBlEWtf
 nexWJmczidNXKiRZ5uKa9Afft/BOWcRdD5ixZF6dtF7rFbEm4xT095Ers8b7pr238yeW
 5fkxx02JHVHBJ/gYJdW9Pl6nfsRicm8dY7TIU9IDi8KHIWxDwr78ovvoyf650aszeJg0
 wvpisOyKaXbbzlu6ZddxWuUjg5ameQ09p9zKSIVvorBKR9U52xykFoNoN7mXOkm3YObf
 q4zAU0LhB9eyww6k0GMAcs2UBZGEsZNhnmsPJVChlA6WdRjsfsh+ui09ffoCL5V3fsL1
 oJkw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZK6zitEN
Subject: [Buildroot] [PATCH] package/pkg-cmake.mk: suppress warnings about
 unused command-line variables
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Suppress warnings about unused command-line variables that we add by
default. Like, for example, BUILD_DOC, BUILD_DOCS, etc.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/pkg-cmake.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index ba287d244a..b723ff8fdb 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -118,6 +118,7 @@ define $(2)_CONFIGURE_CMDS
 		-DBUILD_TESTS=OFF \
 		-DBUILD_TESTING=OFF \
 		-DBUILD_SHARED_LIBS=$$(if $$(BR2_STATIC_LIBS),OFF,ON) \
+		--no-warn-unused-cli \
 		$$(CMAKE_QUIET) \
 		$$($$(PKG)_CONF_OPTS) \
 	)
@@ -163,6 +164,7 @@ define $(2)_CONFIGURE_CMDS
 		-DBUILD_TESTS=OFF \
 		-DBUILD_TESTING=OFF \
 		-DBUILD_SHARED_LIBS=ON \
+		--no-warn-unused-cli \
 		$$(CMAKE_QUIET) \
 		$$($$(PKG)_CONF_OPTS) \
 	)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
