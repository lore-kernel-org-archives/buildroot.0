Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20055E67A8D
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 08:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E26D261336;
	Tue,  3 Mar 2026 08:13:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Jstc8_stmHo; Tue,  3 Mar 2026 08:13:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FD2261385
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772525614;
	bh=SAor1k+FJBaY/u23LpeHXzk+QdDycWr7dkxuSNpzuWM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cJZW6vCIQg89qp5hcZyFXVFVdDj2A+d3uGmPU2+8GATpiZdmwzqX1kSCN122NKorz
	 B8fg6OwCPhUxhGaxuuG5XVw69/JzBVmnQQLsD5ysCNTeNheYT4DPvaVtniPJrpUyPy
	 4ZYh7KVTnlpyuxJcM8/vPe4m57sxo4Y/GQ65H2yeXYfxOYzCol09GoolowFMhDllA2
	 MOvLYKMraD3Ck6GdcoCaIo4gR2+4GdPRcM0xGju9ljYROhGvuOIuDmw65KSuykkO5y
	 q24dD7gmQCeAqDxUWy9M3ksb9Msia3mM9dee8/VPA44uQJdOhKmTiHoP9ePuWlKN9s
	 ZjEVk6uTcxgxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FD2261385;
	Tue,  3 Mar 2026 08:13:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 166491EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 08:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEBA483F52
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 08:13:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qtYFQl6nsG4 for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 08:13:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8B80E83FA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B80E83FA5
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B80E83FA5
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 08:13:28 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-48069a48629so57939365e9.0
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 00:13:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772525606; x=1773130406;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=abIZwKnneakyLnibMmCl8n6XTbwSWYyfU/P/OoEbHFA=;
 b=N0VzdA57E/NNg41Oq35/R9mVJF0efBdAeIR+KwTLn1DN17oYpxVD1LmgFqfV+tJtrS
 HpXfzQI7mOgOIpVF9ysgsqfn1yB3MeeKsoYBVWYMb3kBfWoi8rno5huLQwq2JUXN6xP4
 ZckkFdGSMbiv5G2rju5Fofx8ZM5k3PK1Qf+f/lgtu7vGLfQsPc7+Fg/rsoPrx5/rhTyn
 ya04+4JTMFBu1eECtGRQotbKPQcossTfW8zU+G15DsWjCo7Vd0lVTplbyeUJAOed+M7E
 CbMPZfZSM8NH2aAo601JqYEJFjTIF2306w2lgDldx+daYEmKM2C0Qr766RjZ2Pm+ZE/1
 Afdw==
X-Gm-Message-State: AOJu0YxRiAg5z529QljJxlvFP/te6ei4T1v8gOkI/5Gz6Pcrvgg2KU+n
 pgemvIcjh/SxNTbSBiGnqlb161mxWo3SuaJT3SF6NyLiROLcw52rhI0mghy+sI0QPBxYw/pEA2V
 HpWTL
X-Gm-Gg: ATEYQzz2wrXJkCps1WSnNajTp1YrNcndtiWB7cmxKG7DTnDccoTKdbLgcRHEnAuiwx8
 dT1eLQJGBSmtBdNUcx9jesgaubQrn/0B7xiXzTuxWabQryuRI0H7J56riWieLtM480ZfGSOksMA
 +RMSY8ju66FVWSvHyv7BEK6wrmsNoOnEBxry2ObxTo9Yoxnyj05kD+d3lb5pYaVWnC4qihS6noZ
 7GFbtG1+cJOO2pSl/EGDZgZgmtzqDaWQXHxVfPyWGF8TLGIuThPaNo5qkilKV8q9Wrajh5ZTqnI
 w8UOtY2Ctn+M+ovYcevzb4f3/0kJqb9gZNRcVyCdRHtxfs5k9NrHvfgfTEDKo231WWzDqrgDQBs
 6TNwCnw+VgZ9UF+NPGRgPX/ub6Q/+yxZipqOmQiKKvQfWV7v33+Vq6lCESIjcPnuEx2BSQcpxab
 J+xOs3RD/MSvPjjr8=
X-Received: by 2002:a05:600c:4744:b0:477:93f7:bbc5 with SMTP id
 5b1f17b1804b1-483c9bc03d1mr260770335e9.10.1772525606100; 
 Tue, 03 Mar 2026 00:13:26 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485135d8870sm9242235e9.32.2026.03.03.00.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 00:13:25 -0800 (PST)
To: buildroot@buildroot.org
Cc: Grzegorz Blach <grzegorz@blach.pl>
Date: Tue,  3 Mar 2026 09:13:23 +0100
Message-ID: <20260303081323.53405-4-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303081323.53405-1-thomas.perale@mind.be>
References: <20260303081323.53405-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772525606; x=1773130406; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=abIZwKnneakyLnibMmCl8n6XTbwSWYyfU/P/OoEbHFA=;
 b=eAa6HI9Ose2RBso1DP28ESDSZKbyvVwcVmVG5dG8nNpsu8FJLajuKA0miZdEHKFm8Q
 hKNfOKvEPq9gNNh8EJJp3cIFkrGovetT0MYChTB41NHCD3qEhjhLCSePrdk8KtgzhBDG
 ck/Jv+wsmv3KBNx0G7wh7lURKBwAzIYW10BUgR7oh7b5BTn1v9tx/WOiVA4vA/iRaDVT
 SszNGsxuzdFAQzOq+AtE8KpDWM1tDyhyXH6FUIrWHSLTgon8+AA7oTfBJHpfLwdLXjvg
 hIlzf+jqUrQ0zRz3yYJj8GzWCy85aD/VuGhNQ7t/jymCHCF9EDI3saYpZehVR9cJBdJd
 Q2MA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eAa6HI9O
Subject: [Buildroot] [PATCH 4/4] package/graphicsmagick: bump to v1.3.46
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For more information, see the release note:

- http://www.graphicsmagick.org/NEWS.html#october-29-2025
- https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/compare/GraphicsMagick-1_3_45...GraphicsMagick-1_3_46

This release include now upstream fixes for CVE-2025-27795,
CVE-2025-32460, CVE-2025-27796.

Copyright year updated in [1].

[1] https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/13454c83b42327a29796b2bf418e4f90f5fc9292

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...pply-image-dimension-resource-limits.patch | 33 ----------
 ...ixel_format-num_channels-needs-to-be.patch | 61 -------------------
 ...er-is-allocated-and-the-current-size.patch | 55 -----------------
 package/graphicsmagick/graphicsmagick.hash    |  4 +-
 package/graphicsmagick/graphicsmagick.mk      | 11 +---
 5 files changed, 3 insertions(+), 161 deletions(-)
 delete mode 100644 package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
 delete mode 100644 package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch
 delete mode 100644 package/graphicsmagick/0003-Assure-that-palette-buffer-is-allocated-and-the-current-size.patch

diff --git a/package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch b/package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
deleted file mode 100644
index 56122e466e..0000000000
--- a/package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-# HG changeset patch
-# User Bob Friesenhahn <bfriesen@GraphicsMagick.org>
-# Date 1725886903 18000
-#      Mon Sep 09 08:01:43 2024 -0500
-# Node ID 9bbae7314e3c3b19b830591010ed90bb136b9c42
-# Parent  db3ff8d00c28c38895e1600a28706ce251dac570
-ReadJXLImage(): Apply image dimension resource limits. Addresses oss-fuzz Issue 69728
-
-CVE: CVE-2025-27795
-Upstream: https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/9bbae7314e3c3b19b830591010ed90bb136b9c42
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-[Peter: drop ChangeLog/version changes]
-diff --git a/coders/jxl.c b/coders/jxl.c
---- a/coders/jxl.c
-+++ b/coders/jxl.c
-@@ -571,6 +571,7 @@
-                                       basic_info.alpha_bits, basic_info.num_color_channels,
-                                       basic_info.have_animation == JXL_FALSE ? "False" : "True");
-               }
-+
-             if (basic_info.num_extra_channels)
-               {
-                 size_t index;
-@@ -637,6 +638,9 @@
- 
-             image->orientation=convert_orientation(basic_info.orientation);
- 
-+            if (CheckImagePixelLimits(image, exception) != MagickPass)
-+              ThrowJXLReaderException(ResourceLimitError,ImagePixelLimitExceeded,image);
-+
-             pixel_format.endianness=JXL_NATIVE_ENDIAN;
-             pixel_format.align=0;
-             if (basic_info.num_color_channels == 1)
diff --git a/package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch b/package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch
deleted file mode 100644
index 004594523c..0000000000
--- a/package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-# HG changeset patch
-# User Bob Friesenhahn <bfriesen@GraphicsMagick.org>
-# Date 1743004970 18000
-#      Wed Mar 26 11:02:50 2025 -0500
-# Node ID 8e56520435df50f618a03f2721a39a70a515f1cb
-# Parent  036a1376a2a6dc9504c5148249cbd8feaef72de6
-ReadJXLImage(): pixel_format.num_channels needs to be 2 for grayscale matte.
-
-CVE: CVE-2025-32460
-Upstream: https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/8e56520435df50f618a03f2721a39a70a515f1cb
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-[Peter: drop ChangeLog/version changes]
-
-diff --git a/coders/jxl.c b/coders/jxl.c
---- a/coders/jxl.c
-+++ b/coders/jxl.c
-@@ -658,7 +658,7 @@
-                       ThrowJXLReaderException(ResourceLimitError,MemoryAllocationFailed,image);
-                   }
-                 grayscale=MagickTrue;
--                pixel_format.num_channels=1;
-+                pixel_format.num_channels=image->matte ? 2 : 1;
-                 pixel_format.data_type=(basic_info.bits_per_sample <= 8 ? JXL_TYPE_UINT8 :
-                                         (basic_info.bits_per_sample <= 16 ? JXL_TYPE_UINT16 :
-                                          JXL_TYPE_FLOAT));
-@@ -843,6 +843,24 @@
-             size_t
-               out_len;
- 
-+            if (image->logging)
-+              (void) LogMagickEvent(CoderEvent,GetMagickModule(),
-+                                    "JxlPixelFormat:\n"
-+                                    "    num_channels: %u\n"
-+                                    "    data_type: %s\n"
-+                                    "    endianness: %s\n"
-+                                    "    align: %" MAGICK_SIZE_T_F "u",
-+                                    pixel_format.num_channels,
-+                                    pixel_format.data_type == JXL_TYPE_FLOAT ? "float" :
-+                                    (pixel_format.data_type == JXL_TYPE_UINT8 ? "uint8" :
-+                                     (pixel_format.data_type == JXL_TYPE_UINT16 ? "uint16" :
-+                                      (pixel_format.data_type == JXL_TYPE_FLOAT16 ? "float16" :
-+                                       "unknown"))) ,
-+                                    pixel_format.endianness == JXL_NATIVE_ENDIAN ? "native" :
-+                                    (pixel_format.endianness == JXL_LITTLE_ENDIAN ? "little" :
-+                                     (pixel_format.endianness == JXL_BIG_ENDIAN ? "big" : "unknown")),
-+                                    pixel_format.align);
-+
-             status=JxlDecoderImageOutBufferSize(jxl_decoder,&pixel_format,&out_len);
-             if (status != JXL_DEC_SUCCESS)
-               {
-@@ -852,6 +870,10 @@
-                 break;
-               }
- 
-+            if (image->logging)
-+              (void) LogMagickEvent(CoderEvent,GetMagickModule(),
-+                                    "JxlDecoderImageOutBufferSize() returns %" MAGICK_SIZE_T_F "u",
-+                                    (MAGICK_SIZE_T) out_len);
-             out_buf=MagickAllocateResourceLimitedArray(unsigned char *,out_len,sizeof(*out_buf));
-             if (out_buf == (unsigned char *) NULL)
-               ThrowJXLReaderException(ResourceLimitError,MemoryAllocationFailed,image);
diff --git a/package/graphicsmagick/0003-Assure-that-palette-buffer-is-allocated-and-the-current-size.patch b/package/graphicsmagick/0003-Assure-that-palette-buffer-is-allocated-and-the-current-size.patch
deleted file mode 100644
index 8a98034833..0000000000
--- a/package/graphicsmagick/0003-Assure-that-palette-buffer-is-allocated-and-the-current-size.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-# HG changeset patch
-# User Bob Friesenhahn <bfriesen@GraphicsMagick.org>
-# Date 1734634653 21600
-#      Thu Dec 19 12:57:33 2024 -0600
-# Node ID 883ebf8cae6dfa5873d975fe3476b1a188ef3f9f
-# Parent  cf7cd5ebabb0ca40204de7539f4fb9ae02121958
-ReadWPGImage(): Assure that palette buffer is allocated and the current size.
-
-CVE: CVE-2025-27796
-Upstream: https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/883ebf8cae6dfa5873d975fe3476b1a188ef3f9f
-[thomas: remove changelog and binary]
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
-
-diff --git a/coders/wpg.c b/coders/wpg.c
---- a/coders/wpg.c
-+++ b/coders/wpg.c
-@@ -1704,28 +1704,23 @@
-                 ThrowReaderException(CorruptImageError,InvalidColormapIndex,image);
-               }
- 
--              if(pPalette!=NULL &&
--                 PaletteAllocBytes < 4*(WPG_Palette.StartIndex+WPG_Palette.NumOfEntries))
--              {
--                MagickFreeResourceLimitedMemory(pPalette);
--                PaletteAllocBytes = 0;
--              }
-+              /* Assure that buffer is allocated and the current size */
-+              if (PaletteAllocBytes != Max(4*(WPG_Palette.StartIndex+WPG_Palette.NumOfEntries),4*256))
-+                {
-+                  PaletteAllocBytes = Max(4*(WPG_Palette.StartIndex+WPG_Palette.NumOfEntries),4*256);
-+                  MagickReallocateResourceLimitedMemory(unsigned char *,pPalette,PaletteAllocBytes);
-+                }
-               if(pPalette==NULL)
--              {
--                PaletteItems = WPG_Palette.NumOfEntries;
--                PaletteAllocBytes = 4*(WPG_Palette.StartIndex+WPG_Palette.NumOfEntries);
--                if(PaletteAllocBytes < 4*256) PaletteAllocBytes = 4*256;
--                pPalette = MagickAllocateResourceLimitedMemory(unsigned char *,(size_t)PaletteAllocBytes);
--                if(pPalette==NULL)
--                    ThrowReaderException(ResourceLimitError,MemoryAllocationFailed,image);
--                for(i=0; i<=255; i++)
-+                ThrowReaderException(ResourceLimitError,MemoryAllocationFailed,image);
-+
-+              PaletteItems = WPG_Palette.NumOfEntries;
-+              for(i=0; i<=255; i++)
-                 {
-                   pPalette[4*i] = WPG1_Palette[i].Red;
-                   pPalette[4*i+1] = WPG1_Palette[i].Green;
-                   pPalette[4*i+2] = WPG1_Palette[i].Blue;
-                   pPalette[4*i+3] = OpaqueOpacity;
-                 }
--              }
-               if(ReadBlob(image,(size_t) PaletteItems*4,pPalette+((size_t)4*WPG_Palette.StartIndex)) != (size_t) PaletteItems*4)
-               {
-                 MagickFreeResourceLimitedMemory(pPalette);
diff --git a/package/graphicsmagick/graphicsmagick.hash b/package/graphicsmagick/graphicsmagick.hash
index 044214c8fc..0a2e926c3f 100644
--- a/package/graphicsmagick/graphicsmagick.hash
+++ b/package/graphicsmagick/graphicsmagick.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  dcea5167414f7c805557de2d7a47a9b3147bcbf617b91f5f0f4afe5e6543026b  GraphicsMagick-1.3.45.tar.xz
-sha256  27d121f97ad71ff506ac5a6a9539e969154f3a66f3da24fd5b6f268acd106295  Copyright.txt
+sha256  c7c706a505e9c6c3764156bb94a0c9644d79131785df15a89c9f8721d1abd061  GraphicsMagick-1.3.46.tar.xz
+sha256  a610fd86484bf7c80b53f84f9644995c25c74f1dd711f16d2608bbe81176d18b  Copyright.txt
diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index e329e51b70..0b7875b5cc 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRAPHICSMAGICK_VERSION = 1.3.45
+GRAPHICSMAGICK_VERSION = 1.3.46
 GRAPHICSMAGICK_SOURCE = GraphicsMagick-$(GRAPHICSMAGICK_VERSION).tar.xz
 GRAPHICSMAGICK_SITE = https://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/$(GRAPHICSMAGICK_VERSION)
 GRAPHICSMAGICK_LICENSE = MIT
@@ -20,15 +20,6 @@ GRAPHICSMAGICK_IGNORE_CVES += CVE-2008-6621
 # https://bugzilla.redhat.com/show_bug.cgi?id=210921#c5
 GRAPHICSMAGICK_IGNORE_CVES += CVE-2007-0770
 
-# 0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
-GRAPHICSMAGICK_IGNORE_CVES += CVE-2025-27795
-
-# 0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch
-GRAPHICSMAGICK_IGNORE_CVES += CVE-2025-32460
-
-# 0003-Assure-that-palette-buffer-is-allocated-and-the-current-size.patch
-GRAPHICSMAGICK_IGNORE_CVES += CVE-2025-27796
-
 GRAPHICSMAGICK_INSTALL_STAGING = YES
 GRAPHICSMAGICK_CONFIG_SCRIPTS = GraphicsMagick-config GraphicsMagickWand-config
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
