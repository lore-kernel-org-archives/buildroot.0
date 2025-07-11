Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF40CC8303C
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83CFC60E51;
	Fri, 11 Jul 2025 10:44:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZTI9FtWTzah; Fri, 11 Jul 2025 10:44:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FFE460E34
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FFE460E34;
	Fri, 11 Jul 2025 10:44:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3AFA199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C573B40510
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xa6abcIEfAhh for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E4A7940251
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4A7940251
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4A7940251
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:35 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so1705039f8f.0
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230674; x=1752835474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e2Pe149w55D7sTnJYIw/lCwCy/k427Zs1inFZt7LCQE=;
 b=V1AlbS4eh+E5ZnI9NVCKcyG/YTrHEZfCSn8fMy0RzwrNr4dptri7cBcbQGeKqC2MOV
 LckiXWJXnrDhOrqthy442phZZ/2CeqRSw7RF5Qu8rE6VJqyO4GQqP+wDrMqpui6R/ni9
 e5jfUH7+CpqQWIUwqeM4zV5/dC0yAOduXyj8/6pXJOfU3nEC+KmTlLvgFItJ5gQtZQd3
 c4xQWjBOMCrbt1Cqbe/vKw4icWwTmZnlAMIQpPhr9JeKUTVUmvHfqjfKFcaMVfXlwA83
 //lNhA32ByUVeeKDE9kaQywxpvtjgCTwiNeKTCP7Fj9jm0FDxVFdEEJWdu3+SlJRA01n
 a1pQ==
X-Gm-Message-State: AOJu0Yw+mHEf2vA/LAtiRvDfUs0QJgEDNrK/Y8hD8yN0S8iBMCxtnEUf
 qnFZQ+s+DVTs+uHCNIN0S4COOCVlDxyyYsGpPGLJdKfXocV1dSAsV+ksV98pqgrMbxM=
X-Gm-Gg: ASbGncst5hdkjPH8U+tGDbAbBVYPCGGK+oio6vCo5m1i/R8GNSBUlbNGkXEeKY0mFC3
 1zWT+1vroiH+/VEtmQ5SeT0al1SW3vLTjzhVGz/0uXs4MBWmCgYW/18v8QbNyvYDNRggBmnx5tA
 RVlyEKj0xPTzZJvNS76trFvdNmII1BN7AUJ+4d6lp98AaOUCZ3Qytqo39Tfh4PragW+mNbAbsyv
 csbyMhsSsmPqTeolaWjcol1s1ODj7Bm/vLb2dqzv3dyEVCC1NKWcxuXpT7Ud6qyRtTZO7meYfA4
 axm/bW5yjwdmE8MrYpfHwOBrZv0LdDCIhsQO2klMB3vfhrkjrm+T9Ff3JFJo5dQvSgn7L5nyEv7
 S06NISp35rWKbDA==
X-Google-Smtp-Source: AGHT+IGlQ1ndMvM+PlYMRsyHWeCApRU/TWzDTIL3WZsTbsZlBDAU3r59lYWbSZKfvBW7Tt8vkYZBog==
X-Received: by 2002:a05:6000:2c04:b0:3b5:e6bf:8379 with SMTP id
 ffacd0b85a97d-3b5f18d987cmr3032265f8f.28.1752230673965; 
 Fri, 11 Jul 2025 03:44:33 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d872sm4185591f8f.60.2025.07.11.03.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:33 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:33 +0200
Message-ID: <20250711104433.823234-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250701203228.1075726-1-thomas.perale@mind.be>
References: <20250701203228.1075726-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230674; x=1752835474; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e2Pe149w55D7sTnJYIw/lCwCy/k427Zs1inFZt7LCQE=;
 b=HnDtNgb0Ks0m1ZxI6AVW4EkG103v+ygYg8frL6+r4/WgYx0h6RqmsY8r6PS0/tph43
 56wy5HKQHXepZAsZh9hDmnZGD/Nn6YVlHOc7UB0IGRwlBsxq3UPNY3byvCpLvqRxfU9E
 QWhdeWLw7eKJPZIFJhL+8iV+j16n86FUOrVx4pctb3fQ27RIIEOOrwToSbPG8Biv6YMA
 aLgnWaC/F4I8EkT0813w71n4eNRjsyooUvJ9cl1hz6zs7cZvogrt9RMiXCc3atiUUzlj
 cNL65t0NuL7/Y2Mxk79dLn8EewDxxOGXo7oisaKIQmjHfsKGnh0Mf5SJ4yA4RjVlqSk6
 8W1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=HnDtNgb0
Subject: Re: [Buildroot] [PATCH 1/1] package/daq: fix build with GCC14
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

In reply of:
> The daq package fails to build with GCC14 toolchains:
> 
> ```
> daq_nfq.c: In function 'SetPktHdr':
> daq_nfq.c:395:37: error: passing argument 2 of 'nfq_get_payload' from incompatible pointer type [-Wincompatible-pointer-types]
>   395 |     int len = nfq_get_payload(nfad, (char**)pkt);
>       |                                     ^~~~~~~~~~~
>       |                                     |
>       |                                     char **
> ```
> 
> The issue can be reproduced with the following config:
> 
> ```
> cat > daq.config <<EOF
> BR2_arm=y
> BR2_cortex_a7=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_PACKAGE_DAQ=y
> BR2_PACKAGE_LIBDNET=y
> BR2_PACKAGE_LIBNETFILTER_QUEUE=y
> EOF
> ```
> 
> This patch port a patch taken from openembedded meta-networking [1] and
> is tested with test-pkg:
> 
> ```
> $ ./utils/test-pkg -c daq.config -p daq
> ```
> 
> [1] https://layers.openembedded.org/layerindex/recipe/37594/
> 
> Fixes: https://autobuild.buildroot.org/results/c69/c69ab134463a18eec65ded836aecf89a5cb4a75c/build-end.log
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  ...-fix-incompatible-pointer-type-error.patch | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/daq/0003-daq-fix-incompatible-pointer-type-error.patch
> 
> diff --git a/package/daq/0003-daq-fix-incompatible-pointer-type-error.patch b/package/daq/0003-daq-fix-incompatible-pointer-type-error.patch
> new file mode 100644
> index 0000000000..a15d325cd6
> --- /dev/null
> +++ b/package/daq/0003-daq-fix-incompatible-pointer-type-error.patch
> @@ -0,0 +1,31 @@
> +Fix daq incompatible pointer type error when gcc option
> +'-Wincompatible-pointer-types is set:
> +
> +| ../../daq-2.0.7/os-daq-modules/daq_nfq.c: In function 'SetPktHdr':
> +| ../../daq-2.0.7/os-daq-modules/daq_nfq.c:394:37: error: passing argument 2
> +   of 'nfq_get_payload' from incompatible pointer type [-Wincompatible-pointer-types]
> +|   394 |     int len = nfq_get_payload(nfad, (char**)pkt);
> +|       |                                     ^~~~~~~~~~~
> +|       |                                     |
> +|       |                                     char **
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/daq/files/daq-fix-incompatible-pointer-type-error.patch?h=master
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + os-daq-modules/daq_nfq.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/os-daq-modules/daq_nfq.c b/os-daq-modules/daq_nfq.c
> +index 4de94b6..a6de2f3 100644
> +--- a/os-daq-modules/daq_nfq.c
> ++++ b/os-daq-modules/daq_nfq.c
> +@@ -391,7 +391,7 @@ static inline int SetPktHdr (
> +     DAQ_PktHdr_t* hdr,
> +     uint8_t** pkt
> + ) {
> +-    int len = nfq_get_payload(nfad, (char**)pkt);
> ++    int len = nfq_get_payload(nfad, (unsigned char**)pkt);
> + 
> +     if ( len <= 0 )
> +         return -1;
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
