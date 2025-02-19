Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E46C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8AB2500D6;
	Wed, 19 Feb 2025 08:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id APqv7QgK2WLS; Wed, 19 Feb 2025 08:50:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 191F6503A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 191F6503A3;
	Wed, 19 Feb 2025 08:50:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85ABD127
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 707D640603
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gn9J-9KFpAzY for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4C260400F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C260400F6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C260400F6
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:45 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38f3486062eso3150396f8f.0
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955043; x=1740559843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Vl0RpGCGragOZ/Vc4EDiYSCTVjs0TNo1ixieRZfHn+8=;
 b=cMwHfQtoocj3lc4a0oAOWn9XnaupxmLUpxfD7fKldylCNngjUjZGXipca+230G+ZXD
 bLSHRq4I9E6k06dCgu6gjumJJfyB8GYkqkcS2KCCLEXkGnozzS6Dfi4jePxJMbrFvsJK
 8WuG2OwCaZTc+qB1OpScjuNMhtrFFZiFnfmka+nM7botrnXkIk+1J3MPycTJjEuhT1Lf
 9ImBxnVEBU3AfrrqnLBziV0e4k0f+V/TtS0cPSVsU6CgYdNr5vgCoYcRAKs76PmP9zGH
 gunc3v7q+JNCZPrh12LHIE/kG63r6ebfYRwQgWdxs5ofCbDceZMlpi5PugmKL2xUCJdz
 Yy4g==
X-Gm-Message-State: AOJu0YwsGQ95AjNTkrh+T01doXfEzNjV8EXqtNdsM7dl1X9QttaRp69H
 Io/GDjvQIa0hTxhes4iMzB7ZcHvgkhtVmluU3WJjq7fb7M3ZbHnNuv+MUQ==
X-Gm-Gg: ASbGncskjqfheqqFadoO5ILni8z1JYXgJsL+AhjoJb9eeR95z36v+uTWTV3nw7O08dr
 9Xz8Y22F/kFToXQjlRifxi/hciZnbiPm20o+6ayidkRGYy7JCe/vN3pUf5w+BQH/2ay0QbwSd/c
 uc0gcr9Ttj2NiaXruAQ7nSK3FuEP7OnKNiuRAoyl2EPyRtJs/d5iWfULnqvkCnjMK5AvBZr9sTC
 2UnBZVfIyX/LlC20wSbWnqElllvXEi9kzhZGyAyMo2rPioV+fEmhgtYRWxYz3luz8k8VDXcpLt8
 N9c1EoYzZFAQJQn1qVNL7p9QlQ==
X-Google-Smtp-Source: AGHT+IEJvccuU+7THg2HTZ8uCmTnU9ZJf4e3AWfgzT5CB3cYqz8/K0DKea1mKZe2WUe7mmEck4xvGA==
X-Received: by 2002:a05:6000:188d:b0:38d:bccf:f342 with SMTP id
 ffacd0b85a97d-38f587e16dbmr2566418f8f.43.1739955043110; 
 Wed, 19 Feb 2025 00:50:43 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:42 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed, 19 Feb 2025 09:50:16 +0100
Message-ID: <8f3be57ff1799e60fe241ce0b83c4105dba6ba39.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955043; x=1740559843; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vl0RpGCGragOZ/Vc4EDiYSCTVjs0TNo1ixieRZfHn+8=;
 b=HwEMJOLJI7Fo5Si+XKYuXeyI6agzDhq5BlX8vN9jP8GFECXQ1NcGZWIf6onHIbbD07
 F+cXUYvEWwRjrUvNkXK5UwRugMxgWRjCMwY6bWW1NxCAjTnhfGrrIMNqEne9m8QuiZS1
 PeIrJ0wD1U7aGqYiebobPLmECuFjb12+sDOx/qBQj0Jn3U2cPMP71vukDVwtySmX4CtB
 RwPIJD3tiD3+6ihevHS+DtfwDL5qrzZWEVw+oX/9r2G3Uy7TvJslV8qVemNMnz9WWCGl
 4XOJvolcNgB3YynP1iEETtTZ+ka/JrAg9NB1yhOS7MmY5yd2w2IyJkHD5fZvf53YRk29
 zFIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HwEMJOLJ
Subject: [Buildroot] [PATCH 01/27] package/libsigrokdecode: needs python3 w/
 zlib support
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

Some protocol decoders in libsigrokdecode need the zlib module:

    srd: ModuleNotFoundError: Failed to load decoder usb_power_delivery: import by name failed: No module named 'zlib'
    srd: Traceback (most recent call last):
      File "/usr/share/libsigrokdecode/decoders/usb_power_delivery/__init__.py", line 24, in <module>
        from .pd import *
      File "/usr/share/libsigrokdecode/decoders/usb_power_delivery/pd.py", line 24, in <module>
        import zlib   # for crc32
        ^^^^^^^^^^^
    ModuleNotFoundError: No module named 'zlib'

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libsigrokdecode/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsigrokdecode/Config.in b/package/libsigrokdecode/Config.in
index b58c8a2a29..463cb25f28 100644
--- a/package/libsigrokdecode/Config.in
+++ b/package/libsigrokdecode/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBSIGROKDECODE
 	depends on !BR2_STATIC_LIBS # python3
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_ZLIB  # runtime
 	help
 	  Libsigrokdecode is a shared library written in C, which
 	  provides (streaming) protocol decoding functionality. Say
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
