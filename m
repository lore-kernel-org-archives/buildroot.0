Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9703CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 19:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 128FA60FF1;
	Mon, 20 Jun 2022 19:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 128FA60FF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BQuGFylCPQR0; Mon, 20 Jun 2022 19:34:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA26760FF2;
	Mon, 20 Jun 2022 19:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA26760FF2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9696B1BF3FD
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73F1183E6C
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73F1183E6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S0BHZyICh16J for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 19:34:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4911B83E49
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4911B83E49
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 19:34:06 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id kq6so23004000ejb.11
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 12:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OXkcpb8ad46p3Z68AJ4zyRDMi6XfDdD862UIwWn6suI=;
 b=ZxsoC32K4J5Me5QwTg8rQ35k0C9a2qXdv0FcLbbU4qKsbCAWpZ3o+8Ag2UK3ZdebZX
 zDJi7m5uv4i0MyPg0fMuqrPgYLLxSAungZacsK4aGeYIotDt2t0JFkhaZmg7a/xeTmAP
 U/vcfMf1bFfHjsbXwCWs099YWyHHSQlCc54P75ETC0c0qE2hCAn4+QEK0kO+Yxg3DtVx
 /gxUb5eMvWAcpBoWPkLnsvSYRb544l18rQ6EJA4NXNezMX+bieQVMuw3PCmuADUPfAtd
 rtl8fCSKMkrL/zh+9JZlyUv5i6L69O4qRWdXx7iuYdZ/uSZYXEd/rSKk7Uw5KLHG1a3C
 rzYg==
X-Gm-Message-State: AJIora88G21i0+PctCnWU1GIsMQq0NttjvYXWqFN1WJnPw/v07Bki0I2
 FskmNqCXhRlkpONA8Wcnhof40w==
X-Google-Smtp-Source: AGRyM1sECejjOfZgvWIgADBeYUnEJ/Nxo532CrhQRgH3l40zXzHzy1K1ri8FDF8qhwSXoArbbuQSPg==
X-Received: by 2002:a17:906:9b8f:b0:711:d57e:bbfe with SMTP id
 dd15-20020a1709069b8f00b00711d57ebbfemr21900128ejc.409.1655753644410; 
 Mon, 20 Jun 2022 12:34:04 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 i21-20020a05640242d500b0042dddaa8af3sm10763797edc.37.2022.06.20.12.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 12:34:03 -0700 (PDT)
Message-ID: <738f1774-e187-1324-7776-de3cef7b5421@mind.be>
Date: Mon, 20 Jun 2022 21:34:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220322232224.2842266-1-james.hilliard1@gmail.com>
 <20220322232224.2842266-11-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220322232224.2842266-11-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=OXkcpb8ad46p3Z68AJ4zyRDMi6XfDdD862UIwWn6suI=;
 b=MKZulyoS5QxZ7JiTm9ytnEBYaNXgNsb6ve84dyrwSIqfnlJEOFEnqYqE0LRBXGdkHm
 JkpysteTHe9oB9sDsUuHltmcpl1rSxG0cPVD4vJA2+5lmooa2xCweyWTX/7iJBTKUM8L
 0Y6OWGxj/uYm7CKSSkrYOxkMQx0pNPTPKYq03ht+oq1SrshDzLmJiZSY+p0DJLyv4mb6
 Qf0ASGW+he9yBc+pP5p8qGc22gXAQB1bmkPQ50XLJpa4hkBMm8P9q2Qk1HsrtMDDSN3T
 1YltAeCFdGCF6Q1JMbuPpXu5Xx7gV6e5Q8PbIz6VqOABbbvm4kde96dwpvsKmwBfs6E9
 sYjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MKZulyoS
Subject: Re: [Buildroot] [PATCH v12 11/11] package/compiler-rt: runtime test
 use toolchain-wrapper
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Matt Weber <matthew.weber@rockwellcollins.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/03/2022 00:22, James Hilliard wrote:
> From: Matt Weber <matthew.weber@rockwellcollins.com>
> 
> The toolchain wrapper for clang allows the build of the
> libfuzzer package to not point at "-B $(HOST_DIR)/opt/ext-toolchain"
> which prevents a build failure to link due to missing crtbeging.o
> and libgcc.

  I've reordered the patches and squashed this with the one that adds the test.

  Regards,
  Arnout

> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>   .../clang-compiler-rt/package/libfuzzer/libfuzzer.mk            | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk
> index 6c6371bea7..0515b9da35 100644
> --- a/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk
> +++ b/support/testing/tests/package/br2-external/clang-compiler-rt/package/libfuzzer/libfuzzer.mk
> @@ -12,7 +12,7 @@ LIBFUZZER_DEPENDENCIES = compiler-rt
>   
>   define LIBFUZZER_BUILD_CMDS
>   	$(HOST_DIR)/bin/clang++ --sysroot=$(STAGING_DIR) \
> -		-B $(HOST_DIR)/opt/ext-toolchain -fsanitize=address,fuzzer \
> +		-fsanitize=address,fuzzer \
>   		$(@D)/tutorial/libFuzzer/fuzz_me.cc \
>   		-o $(@D)/fuzz_me
>   endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
