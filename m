Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D64AEE14C3
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 20:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD2FB8215B;
	Wed,  6 Sep 2023 20:09:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD2FB8215B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ccsgIIGb23qA; Wed,  6 Sep 2023 20:09:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB98582158;
	Wed,  6 Sep 2023 20:09:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB98582158
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B6C711BF363
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 20:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9008482145
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 20:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9008482145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0xxXJG11klg1 for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 20:09:53 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DD8A8216B
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 20:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DD8A8216B
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1c0d0bf18d7so1816525ad.0
 for <buildroot@buildroot.org>; Wed, 06 Sep 2023 13:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694030993; x=1694635793;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W9y7NO9gY0bKuCDTgdjV+nM2jpARsoQUNaHxCVF1mzA=;
 b=EQiibLStJvXhnOD2GziHyLgEX6FRXobZh0OuXyAd2Eo48RaDV0rf5AC323tIM/29kc
 pWlohs9ZzzBXgFZIT4YPDKuDsEwfSCyfZfBkeKAi1K27nQRzcGbhJ344js2Ro2rp2lX+
 /ykZIW+bCONvgZVhBlng5Re07LIyxxUVoBr5VL0PqIgzdd06y6V7KUxhDIzWPYo88KBa
 P45wyiTBDLuoL2NvQrWozqL5OXFMA3Aoy+m1DR2VM833EaPdHzeoXuMFxNcamfPl2ggW
 M0KwTegS3NC9HrXBJSos4Jk5jD7OaDCHQqN89dGZa+21IYOWddqaMMXmi4gLMxH+8PEX
 IvCQ==
X-Gm-Message-State: AOJu0YwLVlwvqncRoMAG+0+tDt/zTY2tQR/jS3RQOdJ48f4JtqoMYBMV
 9JgXVHXdxYGImV6bbzXSzys2vuIOnqQ3rd7Kndi923ej
X-Google-Smtp-Source: AGHT+IFGjb0PsTnv80cKDwPVHRlMVV9zUsdU+EypY+lIngGE2EQvTLRykR04ZouYOS601aa3npXzEQ==
X-Received: by 2002:a17:903:244d:b0:1b5:561a:5ca9 with SMTP id
 l13-20020a170903244d00b001b5561a5ca9mr16835047pls.50.1694030992858; 
 Wed, 06 Sep 2023 13:09:52 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 g2-20020a170902c38200b001b66a71a4a0sm11434819plg.32.2023.09.06.13.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 13:09:52 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  6 Sep 2023 13:09:51 -0700
Message-ID: <20230906200951.2712954-1-christian@aperture.us>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1694030993; x=1694635793; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W9y7NO9gY0bKuCDTgdjV+nM2jpARsoQUNaHxCVF1mzA=;
 b=0J32SuLe2b2p08Zl3/Vdr3UYUGJH6FM+GW9Feq+wT+9npSbRrAVu/0z9xxosBE/zer
 OF4niMzsUcpbCJ3Ag5Rn6f2qOYyC9l7DJmVAA3EDJ8TE+114xxJ4W4ZiVqRO4r7k4wKc
 xFsMZKIplQs0XdpAaZDZAtUcHA9vSoBXKiL3/AxLJgnsMXOZN0UrsK2ZLeMuBrZa4Uzm
 MZwE8OKFBZieUChwQaNi5KDbncGQ11pIs8CLh7e0zwYSPVYieCu1WAxwwpQPjZqXmKU2
 SmDot14yRSBX7a28/EWy/3FaE5eqbqRtKv2DL+/qq6Bri7BHfDCfiZ0Um5iKK+W/UlAr
 iGYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=0J32SuLe
Subject: [Buildroot] [PATCH-NEXT v1 1/1] package/go: security bump to
 version 1.21.1
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.21.1 (released 2023-09-06) includes four security fixes to the cmd/go,
crypto/tls, and html/template packages, as well as bug fixes to the compiler,
the go command, the linker, the runtime, and the context, crypto/tls,
encoding/gob, encoding/xml, go/types, net/http, os, and path/filepath packages.

Security fixes:

CVE-2023-39320: cmd/go: go.mod toolchain directive allows arbitrary execution
CVE-2023-39318: html/template: improper handling of HTML-like comments within script contexts
CVE-2023-39319: html/template: improper handling of special tags within script contexts
CVE-2023-39321: crypto/tls: panic when processing post-handshake message on QUIC connections

https://go.dev/doc/devel/release#go1.21.0

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 2289442a72..be8af438b3 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  818d46ede85682dd551ad378ef37a4d247006f12ec59b5b755601d2ce114369a  go1.21.0.src.tar.gz
+sha256  bfa36bf75e9a1e9cbbdb9abcf9d1707e479bd3a07880a8ae3564caee5711cb99  go1.21.1.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 04aa612256..aa5d7f97b5 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.21.0
+GO_VERSION = 1.21.1
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
