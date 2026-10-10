Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A92CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 10:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6B5640653;
	Sat, 10 Oct 2026 10:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvrcwiI7Ghqw; Sat, 10 Oct 2026 10:24:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CDC64407A0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791627850;
	b=ffRGJZRUMEYhhpQ2vkTCxY6IDKSlTzVStvluZ7jaDVxKirkYdK6PzB21BcLtjdEMmLDa
	 ac/yRe9BVKW7JU9W0lzrEpdY858j8Ig5VZAgZOtXx5UjYNZzH4R3rB0zgdVyFuB3FRDEy
	 zeMn0F6Xi8mblFS4voZjxvXDw8xjsvAdKCCqib0ufGvWNRvzgH3qD9+SoCd/cpxlPwXpI
	 SwhxAQhhJ+NrTqlKeqS9X+KXsR2oE3CcTZtcGavJX8O4hUIlL3LrIezLaf1mBTGAVGmKJ
	 +MKhV7RzWTc1RWdK/RV7uO3mUh9EIVyR7rMeLV9OHVsMilMqpgWWMsf22eZMCdUDzSw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791627850;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5ZdHxchaCHa1qZmvnLAtA/CVQ715Jk2r5KsKpkiacHM=;
	b=mjY97Ea+Brry9tfjnsVEEeznkrUE2t3PuBuAPTcnDgrM1x6+otWHvE0DLmh+YjF7zBTH
	 KZK1ynF9LxlwtP6B2TT0YZg59og9OaV5nspb1bbK+9GhpqPtQBjDXoYDhQzjUo0tTYQqA
	 l9RHCxQqpG2k6cWOOjKTh4xSZyZtM9C0c26+OJe98K6Z2az8hROXvamLh8jR2PwEXSzCE
	 tUOIDiy/LuvuNRbaV5P2Tek9Tcr5usJ9/+bcfBtVNwnylul/9+lPYh8P+Mobwi2DkT088
	 Vw+s6NkL9Ra5Q+f0W0RoXVhBT7otmIy+8jDFypDAX7OB4Uegl8xVgemWbGTY0fo2P6w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791627850;
	bh=5ZdHxchaCHa1qZmvnLAtA/CVQ715Jk2r5KsKpkiacHM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NuOlkdNWKtSKWz7E4vjPyZVFGKlDmfQGXJxiWKoWf5SYavH/pMLFvhZYRjp0puN05
	 cZkXZ85hPYNjXjSsL4NLotRv1OyDiekzP1Q5ZinowMFL1k1Zxr5Qd48f/KaXBlR99w
	 1wVJMPV0Tgzp5pcKGb+hk94cr2TsL1dVPDbxup4KBdSIBPwEgvBWl9TXoANvTWnbUd
	 0PpDlZEMtlZK6tIDpcc6j7JVBzIDsGXWQU5FRp/tj2w0IUYRi2VmeWHh5lTtcW1GyF
	 USPcsE0xW2QQh0H0VMz6SY0ImTCAf+rvTw6ARGOpar2RnK+hEh2jUrQfzRcO3Z9FtR
	 zGsoIuvPAB7Jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDC64407A0;
	Sat, 10 Oct 2026 10:24:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EDF681DE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E044760650
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eIJ5R9V4-Qgz for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 10:24:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B8F8A60600
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791627848;
 b=fgXjins6z6Y0sd9cYrupKj9LZj+gO0WIB12WYaOxo7H3CtjTzg+93+cuqjb5/fZszlUT
 jK6QpaNN6eO7tFKlC3pnB3siYW60/mG2YsuPpbiWNEEjttB7kOe43AkiTU1FcN0jJU0cs
 zKmYFe/nk/1Lmbp2aeUVptmu7MpInVVPQmE2MwFo7PgxcEPBm8VLW/dt7tMhDP0r0xCur
 OT+SEY4s8AXO0ZAlaMJ6Xp0F3ML2iyytQ4B30ls8644NH8TwS4dNbtZheNOlRODkN4wgl
 yoglBPF3P9Un6MU+GphQJyreA6MPVJWIPoSr6uS4vXvh2iukx9aE5fQjaMXGbv1Uhjw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791627848;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=WSHtLCvI3nyYziRM3Wcnc+pDWqBIDV3T12l5IoBnxno=;
 b=cMBXfswvTAOgY1JI2x1EA09ctCHMKIzsysN1XArV3CLXmwjXp3vBUn02Ubktxk4QiRwD
 92SgZMlkr/EtQxBfyxCEepn1sWm0bgKo1Nyi4u2r7VwLRn8UOENBWzJ3GDDcOBNmvXUHe
 IRWV6cChiGrPRuRt9TQd89V7c8Yz1TENf9VQeC864aMIv9zXFQKat4LjnxfyZzTJnHtOI
 I76/fHSJMVbyRbG9aiQ38zBQy5Kk+aiOimlU5IVN8jOLaMq7kimp2r04FClBhGVgTQ8Y3
 8vC8iZXBf/o/dxDEjCOa0+DC+LEPfwqyEZsCLr+y5DbDRlXPE2vJ2tgaf9Pe4D+aOaA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Db4gB28w; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8F8A60600
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:24:07 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a018792ab3so4469305e9.0
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 03:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791627845; x=1792232645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=WSHtLCvI3nyYziRM3Wcnc+pDWqBIDV3T12l5IoBnxno=;
 b=XfFY8K7wr38U5BtJIaXHb/68tWzIp2samvBPAMxrrS/zpA4eRDzSNguA3huT7UQdVv
 5iiq/AAJZr0AlQO7M8XfFNPe54ChypC7Bnjqq2DMJuqLMxZbZ/S4mHJPpw0i338ASRk8
 zRLXiQKFhB8glitEAuKvqRdCLmgl5a3OQ7bogNOuKRAKZ0xGr5RrtW6cApRVuAa8RUt1
 JNur9pySUqXXOQVmQg2H7Mp+D6U74AoTU9GzyR4tSOwdNAIiLFTlEH8EKcRGOdi/Q9Q5
 ncLaKBy8L1fH1UkpO6k0amnZRGndeEaP123zqhBfDMtoJ30M/0epnw2Mh4UxUkw68Wv8
 UmZA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwbTjukszFnQ5jIhv1wqUJJnrhSTiTPacq/J3rYLVS8TOFw4Q5I5Y6hB5Oa8+6yf6eO28zRKntXsM4=@buildroot.org
X-Gm-Message-State: AFq9FYIfJ3WRIZIM3DFSSIHz3rq1Xu8/OAl31obcSVJA7hLYsXbxyHpZ
 kdRzYY+2jLwUqRKvFJ0Tt3I9t+WuhXMPI9v50II2JjuscLhjqF+8v44vXbNwuxAl4gE=
X-Gm-Gg: AYBFou3aiODYbizl7VX+n7mN/GJdE6QDeC0M3vHjM9icMf00tlK+gdPlm9YHlOkaeUh
 a2onuxa2juCbj3MNXPUCTXChp3kB+t091WSHdM6KLUaizZ+kDxtHtl5gcYo1Npekljc0VVGLhsN
 2NF42EUKN1pRrmzq645gXwv4+ATWhtEncpUmFwX+khMUbE8N70D4+qU2jdQGEL8M1mAIY10bdD0
 /1ZjG1q6SXifTt2y5Fqujr+FclvGhp5YavG2yBZHki58foMBC9rFEksz9p3TLOH+AYKIENg/DNq
 r5vbxQfd+mH+57LOZObGlfIEgymHTkpXy5pog2cuXixwkvWJF0zbt8u4OtUCBWEvJ2XzAqwCXF9
 Ch/8Jt9XBWQCbVDU3FFJEg8yqlGzTMtEmA0hB9kkyuPUxNbCpfREJk+gIodfCRiHCcOq3ypnIPn
 xQJrtx6OGf9iPGtZumdw0df61LYfeJICVC/HWD81xrfz7arH1vCqehBqMi7Olf6fF84rkiDA2Nw
 IEHSbBSAIeIYAPPggHCP7IrKMBS2zEKWVy4im+D30xX130/R4rDn/Fv
X-Received: by 2002:a05:600c:1c15:b0:4a0:2867:d8a9 with SMTP id
 5b1f17b1804b1-4a18e4d67e2mr95692085e9.30.1791627844895; 
 Sat, 10 Oct 2026 03:24:04 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18e49792bsm185307225e9.4.2026.10.10.03.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 03:24:04 -0700 (PDT)
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 12:24:03 +0200
Message-ID: <20261010102403.493756-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260225105707.139320-2-fabien.lehoussel@smile.fr>
References: <20260225105707.139320-2-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] linux/linux.mk: add generation of
 compile_commands.json
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

Hi Fabien,

We will try to have a more 'generalistic' approach to this issue. Add an SBOM
step to the current package infrastructure.

There is a number of packages that have the ability to generate an SBOM better
than what we can generate ourself today: python, cargo, go packages etc ...
Also a number of C project are starting to add support to generate an SBOM but
it's way more fragmented than all those ecosystem I just listed.

Having a seperate steps would allows to enable the generation automatically per
infrastructure and to be able to add additional information that would allows
us to export the information in `make show-info`.

The ideally would be to then be able to read this information in `generate-cyclonedx`
and add it to the resulting SBOM we generate.

For the kernel we would need to add a sbom generation step that generate the
list of compiled file to a known location.

The `generate-cyclonedx` would read the listing and generate a result that
would look like the following:

```json
{
  "components": [
    {
      "type": "library",
      "name": "linux",
      "components": [
        {
          "type": "file",
          "name": "filename1"
        }
      ]
    }
  ]
}
```

I will start working on a RFC.

Best regards,
PERALE Thomas

In reply of:
> Enable automatic generation of compile_commands.json during the kernel
> build process to facilitate security analysis and CVE filtering.
> 
> The compile_commands.json file is generated after the kernel build
> using the native kernel target (available since Linux 5.4). It
> contains the complete list of compiled source files with their
> compilation commands and flags.
> 
> The generated file is saved as linux_compile_commands.json in the
> binaries directory and can be used to:
> - Extract the exact list of compiled kernel files
> - Cross-reference with CVE databases (NVD, CNA) to filter relevant
>   vulnerabilities
> 
> In the future, this information could be leveraged to:
> - Map affected files to their corresponding Kconfig CONFIG_ options
> - Determine which CVEs are actually applicable based on the current
>   build configuration
> - Provide more accurate vulnerability impact analysis
> 
> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>

> ---
>  linux/Config.in | 20 ++++++++++++++++++++
>  linux/linux.mk  | 12 ++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 73a8059523..48faf1a7d8 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -519,6 +519,26 @@ config BR2_LINUX_KERNEL_INSTALL_TARGET
>  	  /boot if DTBs have been generated by the kernel build
>  	  process.
>  
> +
> +config BR2_LINUX_KERNEL_COMPILE_COMMANDS
> +	bool "Generate compile_commands.json file"
> +	help
> +	  Generate compile_commands.json during the Linux kernel build.
> +	  This file contains the exact list of all compiled kernel files
> +	  with the current build options/configuration in JSON format
> +
> +	  The generated file is copied to the binaries directory as
> +	  linux_compile_commands.json and can be used for:
> +	  - Static analysis and code indexing tools
> +	  - Cross-referencing with CVE databases (NVD, CNA) to determine
> +	    which vulnerabilities are actually applicable to the current
> +	    kernel build configuration
> +
> +	  Note: This option requires Linux kernel 5.4 or newer.
> +
> +	  If unsure, say N.
> +
> +
>  config BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL
>  	bool "Needs host OpenSSL"
>  	help
> diff --git a/linux/linux.mk b/linux/linux.mk
> index c61089bfe0..649921a87b 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -550,6 +550,18 @@ define LINUX_BUILD_CMDS
>  	$(LINUX_APPEND_DTB)
>  endef
>  
> +define LINUX_GENERATE_COMPILE_COMMANDS
> +	@$(call MESSAGE,"Generating compile_commands.json")
> +	$(Q)$(LINUX_MAKE_ENV) $(BR2_MAKE) $(LINUX_MAKE_FLAGS) \
> +		-C $(@D) \
> +		compile_commands.json
> +	cp $(@D)/compile_commands.json $(BINARIES_DIR)/linux_compile_commands.json
> +endef
> +
> +ifeq ($(BR2_LINUX_KERNEL_GENERATE_COMPILE_COMMANDS),y)
> +LINUX_POST_BUILD_HOOKS += LINUX_GENERATE_COMPILE_COMMANDS
> +endif
> +
>  ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
>  # When a DTB was appended, install the potential several images with
>  # appended DTBs.
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
