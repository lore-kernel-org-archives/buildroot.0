Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA24C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 07:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94B4E412A5;
	Fri, 12 Jul 2024 07:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KdX4jWH_T4bM; Fri, 12 Jul 2024 07:21:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F05E4129B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F05E4129B;
	Fri, 12 Jul 2024 07:21:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA4B21BF48C
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4ABA607BC
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:21:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0mAZTBHLRkln for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 07:21:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9DB946070C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DB946070C
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DB946070C
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:21:31 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3679f806223so1637529f8f.0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 00:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720768889; x=1721373689;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O2r6f6Gijnu36r9nBR5U0eaMPVjBl2yQV++J00ck3Hs=;
 b=ADHM95wZhz+amEVbfzD7ymyOa3m1i2pG3xSw8ZNjUqHgREbnAqCyDwoV2evA8FSr2G
 R+TEW+psxLMvUHYCGSYANbDpJ/0omZdXOhurR4Qdqtl1C8Qj0BLc3LTCia0JzKSoGimu
 TL1V5utqRT5wpHKfRYLZ5dAA0auSL7y2zVqBqm5uRhQmAviivllecS6/Hob+F7tDyppc
 lwhuLcTxfGpg6IU1phZ5vHBbXU3+NSkNX1Tb3CX13kh/o+dYs1x1f1pYWC1oBaj/iaFH
 RUm5hJ3+RRbxoqyf9dnCbAV97dcKNZ/N0PLgR7Rn3Jyzjgj3pdbiKZ3SzWUC/S69Wrxo
 QoKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5D5JuqeiSAkyzIBRRbyqFcYoJ5YggXub7QlocIJDsWdMGEmih2RZfdaU7bpRzx1By0NZ/UJ9NXrjIW0TKxFSTRLfXZGDFZQ==
X-Gm-Message-State: AOJu0YzEqGCFYJGDH56UK6m2BR9+zO3hemvXhmK2RBgZugz7c6OlO+SO
 zbGs8cpyHCNarfVTA7TZ6TouIy3NmTiaHnIzDiP0UEU0aHoCXBFL6Z/SACJ/sB8Vz9fVKho48QJ
 Bpe4=
X-Google-Smtp-Source: AGHT+IGu5R4F7C65/3SAi0fbUbUmaNGKAcG/sIxzjiy4g8i6l6QgXJBA4d3cVaxQ6nhPfH1IUO2Hiw==
X-Received: by 2002:a5d:47af:0:b0:366:e09c:56be with SMTP id
 ffacd0b85a97d-367ff6e7a3amr1965441f8f.6.1720768889432; 
 Fri, 12 Jul 2024 00:21:29 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2ba622sm12726795e9.33.2024.07.12.00.21.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 00:21:28 -0700 (PDT)
Message-ID: <8c2fe11c-c669-407b-9be4-24a1c0c987d2@mind.be>
Date: Fri, 12 Jul 2024 09:21:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240612094251.3336896-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20240612094251.3336896-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720768889; x=1721373689; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O2r6f6Gijnu36r9nBR5U0eaMPVjBl2yQV++J00ck3Hs=;
 b=hdqMMUiGyV7h5dvXx24w2oqgtHt4XqsHC6zy8hIOfaBmUtVATm5io6U5uSZ5tZW9HK
 70E4H0YEnLWYlOHVGBdpzcdAoVfOosGbvNfW69rfwaBOGJ2zNMLxH0ulZueJExaXn9fB
 kpvED1LJjFfKe6CmM/RRqG2WVNCmQ7pHbxcXvoGRBHMARmXey26cpuzl/Qu8F2Xe4SQX
 uc5jnARyJQgbVCig4fRTNVtpVvUSYH4NFUyqlaRsV0EMGQARHUSVKJAQEz4nLlen5/SI
 T7eh6ZFd0ZIBAyKwQ2dyVQzO8gW9gpTTLF5e2ZqPSRPFTyfHLA/sqYEUoK0G4Nc4VHX/
 g4tw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hdqMMUiG
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss: fix build failure for
 missing sqlite header
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 linux-amarula@amarulasolutions.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/06/2024 11:42, Dario Binacchi wrote:
> The host compilation of the package fails with the following error:
> 
> ../../coreconf/nsinstall/Linux6.2_x86_64_gcc_glibc_PTH_64_DBG.OBJ/nsinstall -R -m 775
> Linux6.2_x86_64_gcc_glibc_PTH_64_DBG.OBJ/bltest buildroot/output/build/host-libnss-3.100/dist/bin
> /usr/bin/gcc -o Linux6.2_x86_64_gcc_glibc_PTH_64_DBG.OBJ/sdb.o -c -std=c99 -g -g -fPIC
> -m64 -pipe -ffunction-sections -fdata-sections -DHAVE_STRERROR -DLINUX -Dlinux -Wall
> -Wshadow -DNSS_NO_GCC48 -DXP_UNIX -DXP_UNIX -DDEBUG -UNDEBUG -D_DEFAULT_SOURCE -D_BSD_SOURCE
> -D_POSIX_SOURCE -DSDB_MEASURE_USE_TEMP_DIR -D_REENTRANT -DDEBUG -UNDEBUG -D_DEFAULT_SOURCE
> -D_BSD_SOURCE -D_POSIX_SOURCE -DSDB_MEASURE_USE_TEMP_DIR -D_REENTRANT -DNSS_DISABLE_SSE3
> -DNSS_NO_INIT_SUPPORT -DUSE_UTIL_DIRECTLY -DNO_NSPR_10_SUPPORT -DSSL_DISABLE_DEPRECATED_CIPHER_SUITE_NAMES
> -DNSS_USE_STATIC_LIBS -Ibuildroot/output/host/include/nspr -Ibuildroot/output/build/host-libnss-3.100/dist/include
> -I../../../dist/public/nss -I../../../dist/private/nss  sdb.c
> sdb.c:24:10: fatal error: sqlite3.h: No such file or directory
>     24 | #include <sqlite3.h>
>        |          ^~~~~~~~~~~
> 
> Link: https://bugzilla.mozilla.org/show_bug.cgi?id=1901932
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

  Since then, libnss has been bumped and thus this patch is superseded. Marked 
as such in patchwork.

  Regards,
  Arnout

> ---
>   ...ing-sqlite-header.-r-jmux-kaie-gland.patch | 31 +++++++++++++++++++
>   1 file changed, 31 insertions(+)
>   create mode 100644 package/libnss/0002-Bug-1901932-missing-sqlite-header.-r-jmux-kaie-gland.patch
> 
> diff --git a/package/libnss/0002-Bug-1901932-missing-sqlite-header.-r-jmux-kaie-gland.patch b/package/libnss/0002-Bug-1901932-missing-sqlite-header.-r-jmux-kaie-gland.patch
> new file mode 100644
> index 000000000000..3aae8d7e156a
> --- /dev/null
> +++ b/package/libnss/0002-Bug-1901932-missing-sqlite-header.-r-jmux-kaie-gland.patch
> @@ -0,0 +1,31 @@
> +From a236a40dc9055a66903efb537aa25230a767d0af Mon Sep 17 00:00:00 2001
> +From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +Date: Sat, 8 Jun 2024 18:47:25 +0200
> +Subject: [PATCH] Bug 1901932 - missing sqlite header. r=jmux,kaie,glandium
> +
> +Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> +
> +Differential Revision: https://phabricator.services.mozilla.com/D213397
> +Upstream: https://phabricator.services.mozilla.com/D213397
> +---
> + nss/coreconf/location.mk | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/nss/coreconf/location.mk b/nss/coreconf/location.mk
> +index 9c43394d8cb0..16e8cc7169a3 100644
> +--- a/nss/coreconf/location.mk
> ++++ b/nss/coreconf/location.mk
> +@@ -64,6 +64,10 @@ ifndef SOFTOKEN_LIB_DIR
> +     SOFTOKEN_LIB_DIR = $(DIST)/lib
> + endif
> +
> ++ifdef SQLITE_INCLUDE_DIR
> ++    INCLUDES += -I$(SQLITE_INCLUDE_DIR)
> ++endif
> ++
> + ifndef SQLITE_LIB_DIR
> +     SQLITE_LIB_DIR = $(DIST)/lib
> + endif
> +--
> +2.43.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
