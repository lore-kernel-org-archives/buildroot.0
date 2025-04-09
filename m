Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C090EC369A5
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 900A783F83;
	Wed,  9 Apr 2025 20:04:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qnnMIBkJgC8L; Wed,  9 Apr 2025 20:04:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0E4083FBA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0E4083FBA;
	Wed,  9 Apr 2025 20:04:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A491D6
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F8DF40BAE
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id psrSpBjffUpa for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E4BA640A24
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4BA640A24
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4BA640A24
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:52 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43ed8d32a95so867925e9.3
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229031; x=1744833831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a1nuEzThm+xv67opt2YnxJ4Vrj1e5XVu0k/e5vhWELc=;
 b=vqROG82mwJAUcOA30d2r81ldsj2U0zAmPUJJlNU3MX6kSUGUSXiYpbz2XMahTt3u0V
 k3LR1aagSf/1AMemhyY1eUDE9HeJ+tiU9Day042bx7HAO7KTFJB99He8qgV8K6iHGMv4
 kAcBjscxwRw/OuOVN0y06e2dc5XuXFNpyzrKOJINHbf5R63tDeLY5nVR02JfmqM98LN4
 O4/PxSEewJBg7UQdE1SFlVo73Ok0pyyUuovXqdM2cr8DsXWMhlPgtiEAf33n4apSl/Dk
 XoYTUcD3D1lwLGMga2Hs5XoPivDDjzyJbvLbAllolQ5ru759uLBZyDGyvsw38Qom8t41
 Bbhg==
X-Gm-Message-State: AOJu0YyY9uwYFzPL93EgdOoj0qk0v6zrkUbgy35fZP9tjbTiIJoe1vt3
 S/arYA25tOJgLKvZQe0LVI0ZrDbGZ0z4Y57eX2Awe7s4Jg2z/e98WmQgcg==
X-Gm-Gg: ASbGncufRbvWCg/308OmK+b2yrT+VqWikx4PBLeCqJL16SPDavQL77LGm0x91/K8q21
 KMjUbwel2scVLh0Eyybxnm+JVEoOHeiVQdEf/At+M+sShOZ5aJ74wKlBvNqoVys/g8ScG0Pr55c
 DiEfDmMEWtMYSgoJ/2026SPEgrIemvqC7Gl9fl0+RHCiA/ORL3IpcdEV3KtTA4iQja/gLC8+KWW
 5NO8s0AaboZiMWiExXlrh/chMpaHuQWGjTtji5zy1ve0p5jYz9TYLcKqzvSpDFVBCIkK2mQjsgy
 DfxQXF3a20t8iaGfeXSb+uJU7afoa2hDWqXxdCTDxz6lY3oqIO8=
X-Google-Smtp-Source: AGHT+IF/LJRZGxtaOiQ9c1tcNDYsaqtBVeLypHe5Hq1J4rtL5y35LAy4ojGuCciLMtmvfTgUJu/wrw==
X-Received: by 2002:a05:600c:3c91:b0:43b:cc3c:60bc with SMTP id
 5b1f17b1804b1-43f2d7d6f10mr3247295e9.15.1744229030821; 
 Wed, 09 Apr 2025 13:03:50 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:50 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Wed,  9 Apr 2025 22:03:29 +0200
Message-ID: <552592df3604c5fc2d601f4d1a837db562193bb6.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229031; x=1744833831; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a1nuEzThm+xv67opt2YnxJ4Vrj1e5XVu0k/e5vhWELc=;
 b=ih54HE0J14wxy/xoJY58qdGmprneAqp1Gxk64hLciQ8QRaXxCzckuNNSZJMhZ1DbNb
 4iwELMWuFJLz8NeSnT4URYwqISW4nNAFVqqdeJLPpbx3Ab9LfB1HvCMM0enzNwuT7Bbu
 XiXy9ZOpHiV5kyz1R58kB16cwEzcviaT3BIOxSXla6jK8Pq2D2BOWseBjHSzV1KhHGxo
 5ZeysTTX6es4K28spKbaF1cY6zut7LTjYSHQHbOOg9KXIvYDu+8jMwWr6vYBwmaN76xI
 hZuNydksPX6c5/ME6zvp1JL4pnfR067CjPB+slYi2KI1Fg64Wm/vFnj2PkloKsm3+/np
 cWQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ih54HE0J
Subject: [Buildroot] [PATCH 14/29 v2] package/riscv-isa-sim: afirm
 host-boost dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Julien Olivain <ju.o@free.fr>
---
 package/riscv-isa-sim/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/riscv-isa-sim/Config.in.host b/package/riscv-isa-sim/Config.in.host
index 4ccf6e9546..eb28d5b063 100644
--- a/package/riscv-isa-sim/Config.in.host
+++ b/package/riscv-isa-sim/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_RISCV_ISA_SIM
 	bool "host riscv-isa-sim"
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++11
+	select BR2_PACKAGE_HOST_BOOST
 	help
 	  Spike, the RISC-V ISA Simulator, implements a functional
 	  model of one or more RISC-V harts.
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
