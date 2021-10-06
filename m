Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17FDC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:41:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A7E661075
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A7E661075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D637940DAA;
	Wed,  6 Oct 2021 20:41:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cyTzBGSd7y13; Wed,  6 Oct 2021 20:41:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02E4940DAC;
	Wed,  6 Oct 2021 20:41:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5DA911BF34F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DAF284098
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iMO1cXGuF0RH for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 20:41:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A69EC84042
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 20:41:44 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id x7so13871978edd.6
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 13:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JH24nNrTpfIx9A3QhOo3T929MDsM0xEl3EpnoPyHwzA=;
 b=b8aabyBtUVEEkcG+AlyPbHhnGSSmrmvRkZ/UdyLAeH2xOz89/yuAXepOWO5nl93Q2R
 TxSIaQ9hfY3hB+f5+5cw0i+N5pE6+hPPAIm+7ZNnJ6s2iGDAlaT3ybwsFvDckvUNTZp/
 fEoQmYUIsgOR1Ow9GZd1ralJ+1YaWhM2NSK/6ldR0mtTrn544qi0p6dEGGOpDOhkTeVm
 GQPFx+QCZMu/SPvFI4JDsMkdruXVNNoJ8KQidr13cbXm4GA0kC2PrMT/EeVtMLL+lJKZ
 wYb7vu4xLmudDgMzl2s77AYttJ0av5tJsJOzRBcAft3ncD5P00fARLEmSTW6Qz0jgbny
 V7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JH24nNrTpfIx9A3QhOo3T929MDsM0xEl3EpnoPyHwzA=;
 b=Iiyy4uUK1dQwrzj9bdbO7NDFWEZ/OuTFrSHy+b6/bXt0LxYIgSUTWVV34IIOKKnrqz
 fQx54YOlsVM24FDThtepc3D4nplKypFEDIqVl6CLL5/Pt6ozYlNlVl+aLZ0NF5i3wnqN
 lEmebY88iN6eq8UsJcl1lW5wJJLYeHlJrqvgxaMsCrsFBrcbqdw4TrLIxK984bPuGaXb
 UuQh4PM/vyyLsN4UFxj1rJHkAnbbeR4YHUEO6iKum0jOP1t/adwWXWZLDs2Vb2AWfpkE
 lVMUjT/aronUQOfZBe8k4A0aVnDetnPc7OfjhyWWDAvq9cPqdhf2i2lqz9UWmZYa2gnV
 Zt7Q==
X-Gm-Message-State: AOAM5324qB9ViWfAWDlNIXhYiONmSVBcjDBqeNXcolkxDk9u0Uz40+Go
 jZviViNucC4LFQAG0up9JqxvofV5nAc38T45
X-Google-Smtp-Source: ABdhPJxXP5DU/Qa9orc4VBijjLXZ53axK/5/WILIPoolK5SAjHagLdRn5JYB7AvKfyJi5+2uxU0JyQ==
X-Received: by 2002:a17:906:39cb:: with SMTP id
 i11mr546825eje.168.1633552902853; 
 Wed, 06 Oct 2021 13:41:42 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p6sm5736047edi.18.2021.10.06.13.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:41:42 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 22:41:33 +0200
Message-Id: <20211006204133.465875-2-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006204133.465875-1-arnout@mind.be>
References: <20211006204133.465875-1-arnout@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [RFC 2/2] Config.in: move toolchain menu before build
 options
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
Cc: Raul Cabello <raul.cabello@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Many of the build options depend on the toolchain configuration. In
addition, it's pretty logical that you select first target architecture,
then the toolchain, and only then things like debug and pic/pie.
Therefore, move the "Toolchain" menu before the "Build options" menu
instead of after.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 8ed11c994d..efdf397c01 100644
--- a/Config.in
+++ b/Config.in
@@ -87,6 +87,8 @@ config BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT
 
 source "arch/Config.in"
 
+source "toolchain/Config.in"
+
 menu "Build options"
 
 menu "Commands"
@@ -908,8 +910,6 @@ comment "Fortify Source needs a glibc toolchain and optimization"
 	depends on (!BR2_TOOLCHAIN_USES_GLIBC || BR2_OPTIMIZE_0)
 endmenu
 
-source "toolchain/Config.in"
-
 source "system/Config.in"
 
 source "linux/Config.in"
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
