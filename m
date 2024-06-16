Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098BAC27C53
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 15:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76AAB4054D;
	Sun, 16 Jun 2024 15:41:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qt2Y_geDj4Cj; Sun, 16 Jun 2024 15:41:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3411A4055A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3411A4055A;
	Sun, 16 Jun 2024 15:41:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F4331BF2C0
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 15:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BF074055A
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 15:41:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8haAsYRZrssl for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 15:41:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=alex.suykov@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4908E4054D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4908E4054D
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4908E4054D
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 15:41:36 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57c76497cefso4214778a12.1
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 08:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718552494; x=1719157294;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dSqdv9tilncYroz6M6gqYfxAkduqa/TnwUNMpxRTWDA=;
 b=iv2lLDpykTWzWMUBnTOIZIwHXBK3waLosqpkwGtbIoMjS5szXHsN0EcPu9Y3GjXYQc
 1ZZ/ofP867rQXRGw+p3C3oj01d1UJvMRPaw73XPznbgt4OAN54g03IfIa8SasEH17KM3
 RGt+wue5FMsbxT/abAyTuvqu4SZiWyYZ6nXVGhOSwhUNSYInny2s3O1vkJStPP+fKJIQ
 q1JI0PKd6pV2HxZF8iBpJn4zefmJSWyK1Y4k2/Yhamv6PJIegJMNhd8Cd5N3Gfy3dtCN
 d1XLzPYwKPIybLU/ygI7AQDMxlIvIBqvfI2xFd85yWQQ7Pnbk/FiESstdJw4ckkNZeDu
 AycA==
X-Gm-Message-State: AOJu0Yy9VTlS5JEj1jIR7knOuszgXB8lxDXfZ/7ewJN0J7WNyZ+ov9ZR
 KvIYJszkOCkW9/RZN1Wc127jRlCmbBQhKjFvucHzhQsyfTRwZBF4xsGIAA==
X-Google-Smtp-Source: AGHT+IERDZFkQw2aM/ZulPeFIVwMJy968PHn+qppgMXevyqDW2W9Xx0/pH9xGbX4ZrhqxiNh3jMgyQ==
X-Received: by 2002:a05:6402:8c9:b0:57c:cdb5:cd68 with SMTP id
 4fb4d7f45d1cf-57ccdb5d22dmr2747657a12.10.1718552493471; 
 Sun, 16 Jun 2024 08:41:33 -0700 (PDT)
Received: from localhost ([46.119.184.249]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da713sm5164239a12.30.2024.06.16.08.41.32
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jun 2024 08:41:33 -0700 (PDT)
Date: Sun, 16 Jun 2024 18:41:31 +0300
From: Alex Suykov <alex.suykov@gmail.com>
To: buildroot@buildroot.org
Message-ID: <Zm8HqxlyfhIbYhdt@latitude.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718552494; x=1719157294; darn=buildroot.org;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dSqdv9tilncYroz6M6gqYfxAkduqa/TnwUNMpxRTWDA=;
 b=XIjvD3C8DJjmsHN/X3vWZECCyOT6u3Uk5HCvcW7a631Y4KIDV1PmHSJdQCA7c5dLpx
 6pEwG39ati9f5nJ5P21zQNsG9FtpgcU0fCoQ8/OQ9ac1rkZdCSjtY+nTWvS8mwH6Of+K
 /7jJKx2dbOSoJZA2P6s2dXuE3pjAs89Bl5N7PpbEzmEGlA7J8/ArY1dePJzK07nH/GCd
 o9MiG6E1A40W3zA2XDOX0b61u4opH+qV3hddggd9pX6ykK9apu7LDWGSo+Y2igko8DQW
 +1yC6xceIAo9JjTyhgqvtBaWxiNsijL14lGo+QSVo8h2swHO9iLKYV8+UVGig8hp7HpR
 zzEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XIjvD3C8
Subject: [Buildroot] [PATCH] vboot-utils: fix failing builds
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A typo in the RSA patch and a missing include, which current gcc
apparently treats as hard errors and earlier ones probably didn't.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>

diff --git a/package/vboot-utils/0003-Avoid-RSA-type-redefinition.patch b/package/vboot-utils/0003-Avoid-RSA-type-redefinition.patch
index 86374ca854..259b2bb7b4 100644
--- a/package/vboot-utils/0003-Avoid-RSA-type-redefinition.patch
+++ b/package/vboot-utils/0003-Avoid-RSA-type-redefinition.patch
@@ -35,7 +35,7 @@ index 9f98ccc..c2d01a5 100644
  /* Private key data */
  typedef struct VbPrivateKey {
 -  RSA* rsa_private_key;  /* Private key data */
-+  struct rsa_rt* rsa_private_key;  /* Private key data */
++  struct rsa_st* rsa_private_key;  /* Private key data */
    uint64_t algorithm;    /* Algorithm to use when signing */
  } VbPrivateKey;
  
diff --git a/package/vboot-utils/0008-firmware-stub-assert.patch b/package/vboot-utils/0008-firmware-stub-assert.patch
new file mode 100644
index 0000000000..01fc2c5abd
--- /dev/null
+++ b/package/vboot-utils/0008-firmware-stub-assert.patch
@@ -0,0 +1,17 @@
+Missing include, assert() is used without <assert.h>.
+
+Most likely it was getting included indirectly somehow but that
+changed in some recent glibc version so it fails to compile now.
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+--- a/firmware/stub/tpm_lite_stub.c
++++ b/firmware/stub/tpm_lite_stub.c
+@@ -25,6 +25,7 @@
+ #include <sys/stat.h>
+ #include <time.h>
+ #include <unistd.h>
++#include <assert.h>
+ 
+ 
+ #define TPM_DEVICE_PATH "/dev/tpm0"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
