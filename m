Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A7BE95A67
	for <buildroot@archiver.kernel.org>; Sun,  8 Oct 2023 09:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22A676100E;
	Sun,  8 Oct 2023 09:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22A676100E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1xiZ2ZsxaMuV; Sun,  8 Oct 2023 09:32:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1960960648;
	Sun,  8 Oct 2023 09:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1960960648
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E90261BF3D9
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 09:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFBA8821B9
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 09:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFBA8821B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AimMDXaFHV-Q for <buildroot@lists.busybox.net>;
 Sun,  8 Oct 2023 09:32:43 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BE7A821B8
 for <buildroot@buildroot.org>; Sun,  8 Oct 2023 09:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BE7A821B8
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so640132966b.0
 for <buildroot@buildroot.org>; Sun, 08 Oct 2023 02:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696757561; x=1697362361;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9xYH8UbCAdM8jYwBCWWrCvHgQnc/ofYVs3Vepnb+3/c=;
 b=p5Wa8CXPcCKfqvPR4iawk+7cRDyZ4IFq5on+LA6jPH/BiZklB/P6f4bLsw1KBxhZmc
 wqn8q3JfoWNmsgaxE2+T5KoYMx24Xf5SpbCSj2Pl64tiOxI5Yl3QpAA/Lp03IX8lBQnU
 MAvpdA1/T3SO8lPLdHXsTEe1LENirqqJ5t0MbLhoYyaeJSB3mtHBA2YPEubqyay/ZV4Y
 p66NVGQZFSbpfIzF06u0lnDpdlDLfmBfixxM9PDOPUd81C9zonCAs/zhI7GvBfAN+AZk
 j8FjMwxMF5xiHEwGiWdEtDk5IaNxHfibVTDrDwutYkN4y6mwgGhCmZUKZGbh3svGHpth
 /A7g==
X-Gm-Message-State: AOJu0YyMYjYa0djeDwMS1AdBdFodSHewopCZrNohlU7kzlS0ElxFM2oq
 n+m6HlQj4+5A8ga5vTGu3FI+wg==
X-Google-Smtp-Source: AGHT+IH7pqSXcPAKLom/PTexLyVbwyBjoOJGhX+5GrY7ebnviXYAd60WVj4BtPqJp2EgYKevFYCrzA==
X-Received: by 2002:a17:906:53d2:b0:9ad:e2c8:1741 with SMTP id
 p18-20020a17090653d200b009ade2c81741mr11287265ejo.58.1696757560854; 
 Sun, 08 Oct 2023 02:32:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a1709063e5900b0098f33157e7dsm5251532eji.82.2023.10.08.02.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Oct 2023 02:32:40 -0700 (PDT)
Message-ID: <f53be617-ff47-0675-edc8-ae5a36a67716@mind.be>
Date: Sun, 8 Oct 2023 11:32:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20231007205749.443600-1-yann.morin.1998@free.fr>
In-Reply-To: <20231007205749.443600-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696757561; x=1697362361; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9xYH8UbCAdM8jYwBCWWrCvHgQnc/ofYVs3Vepnb+3/c=;
 b=WT4B17oB89kzwM80q2VHx1eyfzfxtB9hl/kNH+BqdEYudYHz6nsoZtwmjgaGIj1SoP
 sWDpZ3avIbJkpe8JvPsm4ZyJnFASZT3xy+R+mNvSXWYumHTTfWQsWj9aE04ZT+lKD+1m
 KfqFSBJ7CpIzHbe1ZhBkpgtIvesyif+jOw5YnBalHxvAxwBTVCAijndSWJZShMYURvkk
 v8J/l0F4wbdabZUlp8uIcFI2ic6llSK3R+UnLDt+MczlrYFVPL+kUmun1vdB7cRy4HKu
 XBeuoTIzQKFlaY20X7GjKVH3w3GUMXjaJ8FUS29HPA56q8Uf/fn5zz/p7GmF3DWvrOfv
 HM4Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WT4B17oB
Subject: Re: [Buildroot] [PATCH] support/bootlin-toolchains: don't depend on
 non-existent gcc version
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
Cc: Vincent Fazio <vfazio@xes-inc.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/10/2023 22:57, Yann E. MORIN wrote:
> Commit a0d2a5cfec0a (support/scripts/gen-bootlin-toolchains: generate
> BR2_ARCH_NEEDS_GCC_AT_LEAST_X guard) added a negative dependency to the
> gcc version required by the configured architecture.
> 
> However, when the toolchain is using the latest gcc version currently
> known to Buildroot, this generates a dependency on a non-existing gcc
> version. For example, a toolchain using gcc 13, the most recent version
> currently known to Buildroot, this would generate a dependency against
> BR2_ARCH_NEEDS_GCC_AT_LEAST_14, which does not exist yet.

  That means, however, that if we add GCC 14, we need to remember to add the 
condition to the Bootlin toolchains again... Of course, that can easily be 
solved by regenerating them, but we don't currently do that when adding a new 
GCC version.

  So really, I would feel more comfortable just adding the symbols for GCC 14 
support already.

  Regards,
  Arnout

> 
> This dependency is in practice a no-op, because the symbol is missing,
> so Kconfig evaluates it to false, and since it is negated, the
> dependency is fulfilled. Still, this is spurious and semantically
> incorrect.
> 
> We fix that by extracting the most recent gcc version that an
> architecture may require, and use that to decide whether the guard is
> needed for the toolchain.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Vincent Fazio <vfazio@xes-inc.com>
> ---
>   support/scripts/gen-bootlin-toolchains | 19 ++++++++++++++++---
>   1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
> index 4344221213..3b5f65515d 100755
> --- a/support/scripts/gen-bootlin-toolchains
> +++ b/support/scripts/gen-bootlin-toolchains
> @@ -305,7 +305,7 @@ class Toolchain:
>           return os.path.join(BASE_URL, self.arch, "fragments",
>                               self.fname_prefix + ".frag")
>   
> -    def gen_config_in_options(self, f):
> +    def gen_config_in_options(self, f, latest_gcc):
>           f.write("config %s\n" % self.option_name)
>           f.write("\tbool \"%s %s %s %s\"\n" %
>                   (self.arch, self.libc, self.variant, self.version))
> @@ -339,7 +339,8 @@ class Toolchain:
>                   assert m, "Cannot get gcc version for toolchain %s" % self.fname_prefix
>                   selects.append("BR2_TOOLCHAIN_GCC_AT_LEAST_%s" % m[1])
>                   # respect the GCC requirement for the selected CPU/arch tuning
> -                depends.append("!BR2_ARCH_NEEDS_GCC_AT_LEAST_%s" % str(int(m[1]) + 1))
> +                if int(m[1]) + 1 <= latest_gcc:
> +                    depends.append("!BR2_ARCH_NEEDS_GCC_AT_LEAST_%s" % str(int(m[1]) + 1))
>   
>               # kernel headers version
>               if frag.startswith("BR2_TOOLCHAIN_EXTERNAL_HEADERS_"):
> @@ -462,6 +463,17 @@ class Toolchain:
>               (self.arch, self.libc, self.variant, self.version, self.option_name)
>   
>   
> +def get_latest_gcc():
> +    match = "config BR2_ARCH_NEEDS_GCC_AT_LEAST_"
> +    with open("arch/Config.in", "r") as f:
> +        latest = sorted([
> +            int(line[len(match):].strip().split("_")[0])
> +            for line in f.readlines()
> +            if line.startswith(match)
> +        ])[-1]
> +    return latest
> +
> +
>   def get_toolchains():
>       toolchains = list()
>       for arch, details in arches.items():
> @@ -494,6 +506,7 @@ def get_toolchains():
>   
>   
>   def gen_config_in_options(toolchains, fpath):
> +    latest_gcc = get_latest_gcc()
>       with open(fpath, "w") as f:
>           f.write(AUTOGENERATED_COMMENT)
>   
> @@ -520,7 +533,7 @@ def gen_config_in_options(toolchains, fpath):
>           f.write("\tprompt \"Bootlin toolchain variant\"\n")
>   
>           for toolchain in toolchains:
> -            toolchain.gen_config_in_options(f)
> +            toolchain.gen_config_in_options(f, latest_gcc)
>   
>           f.write("endchoice\n")
>           f.write("endif\n")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
