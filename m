Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4E5C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 07:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A492B409E6;
	Tue,  9 Aug 2022 07:59:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A492B409E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PoSl6V-uOxNe; Tue,  9 Aug 2022 07:59:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86FC7408BA;
	Tue,  9 Aug 2022 07:59:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86FC7408BA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66EC41BF27E
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 500EE40549
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 500EE40549
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GNvqe48Tc1S7 for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 07:57:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EE704053F
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7EE704053F
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 07:57:33 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id t5so14053973edc.11
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 00:57:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=BrtmDOCd40M8jYeoVlNHVvKycBYfLwJViDKDhM/ChBk=;
 b=mSMv4yOZg+VwC3zBQ+WvPElJWXUcP2mFKzsNqw7w3MH8iZSGAHC3YKUxShQ1MVi9cz
 6ikBt4xD4n0YoU6mpcaopiQfAJJDc0ej1SaU9w144JVsp3p2/ueo5jBAMvBJSFH8sucz
 UEPPCpsR4aOlhmAjQ7Cmk3mws0G8WNLOsbUJ+KuldvCZXJFYKpym12j8EwjssevO6Gcr
 4eber1enc0yOuvU5NY274tfnIRYlpKGGZq8k1iF+wPkAptpCMVDA9JIIijY11CXy3Xq1
 QLUGeHF//Xf4gqatiU5L1v6ilpin1GknYZjHnYNZg/g048To+kEd+ixQ4RjbgeppYjKu
 V0yg==
X-Gm-Message-State: ACgBeo2AFZr8ycBwEdpAn4zh3Kp6lr4K0B7hOOJMLTBS/Qqq4i4kCSaK
 GhBCuwsxjjsUL4GUCMuSdLpjo3i6/e4=
X-Google-Smtp-Source: AA6agR4bEZ9FJ7TjhGPrVN6z4YOqxSuHQ05xe1jhGrUy/InbEpPjwS040PZM96VDkLNYqI/P3PSmLA==
X-Received: by 2002:aa7:da93:0:b0:43d:1d9d:1e5 with SMTP id
 q19-20020aa7da93000000b0043d1d9d01e5mr21277828eds.55.1660031851330; 
 Tue, 09 Aug 2022 00:57:31 -0700 (PDT)
Received: from mercury.. ([188.27.130.4]) by smtp.gmail.com with ESMTPSA id
 pk9-20020a170906d7a900b0073065767404sm819341ejb.34.2022.08.09.00.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 00:57:30 -0700 (PDT)
From: Alexandru Ardelean <ardeleanalex@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 10:57:00 +0300
Message-Id: <20220809075704.86472-10-ardeleanalex@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809075704.86472-1-ardeleanalex@gmail.com>
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=BrtmDOCd40M8jYeoVlNHVvKycBYfLwJViDKDhM/ChBk=;
 b=kBjOWM9+q6I5UGUkoEFUeblx1N8OakYc4pgkWN2RZUkefB1V2s/XVxQZWy7AdbFagX
 p0S0zT4ZVjTbcdhUAoEkJznt7DvGNmOMWckR3l/E9zZWVg+vlVNgUtMCHlLHDUHJ70Z7
 LBsMPjXlSYWgtRZAt2DW6/SROLLJ9pQauhOByeEDxkUS3z7Pt8W5j6OlxWvBfA05fP6e
 dlaJZo7EL4Qp02Gyl/KEVPEi8Lsy0qZMysPLUFDztOfqVgNzJFIaBU1CcB4ZAZJ+2RAg
 d5anPogE/v8QNrn4m8VS51mhVKJmyKurJ9srsdcHwzpeMbcShuyS+GX4YLmqnk8FjA/v
 GnQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kBjOWM9+
Subject: [Buildroot] [PATCH 09/13] package/nodejs: impose dep on ia32
 libs/compiler if target arch not 64 bits
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
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>, fontaine.fabrice@gmail.com,
 aduskett@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This addresses the situation of a host-64 (usually x86_64 host) building for
a 32 bit target.

nodejs cross-compilation also requires (for the JIT stuff) that a 64-bit
target be built with a 64-bit host + target compiler). And likely the same
is true for 32-bit.

Hopefully, we wouldn't have the case of 32-bit hosts building for 64-bit
targets.

But, with this, users require to install the 32-bit libs for
'libicu libc-ares libuv1 libnghttp2 zlib1g' to be able to build the
host-tools during build.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
---
 package/nodejs/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index fad211b750..0b6ded6562 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -27,6 +27,8 @@ config BR2_PACKAGE_NODEJS
 	# uses dlopen(). On ARMv5, we could technically support static
 	# linking, but that's too much of a corner case to support it.
 	depends on !BR2_STATIC_LIBS
+	select BR2_HOSTARCH_NEEDS_IA32_COMPILER if !BR2_ARCH_IS_64
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS if !BR2_ARCH_IS_64
 	select BR2_PACKAGE_HOST_NODEJS
 	select BR2_PACKAGE_HOST_C_ARES
 	select BR2_PACKAGE_HOST_LIBUV
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
