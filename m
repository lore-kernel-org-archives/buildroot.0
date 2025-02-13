Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57C0C021A0
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 20:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87B2F607CE;
	Thu, 13 Feb 2025 20:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4MGOJIdX5rDr; Thu, 13 Feb 2025 20:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 875CA607F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 875CA607F0;
	Thu, 13 Feb 2025 20:33:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 63943C2
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 20:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46DF140CEA
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 20:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WMeXs5__f4q0 for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 20:33:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BD97040CE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD97040CE4
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD97040CE4
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 20:33:30 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38dc0cd94a6so737656f8f.0
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 12:33:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739478808; x=1740083608;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ifbtEO1Szd4gcIECCqHcUIjd2LJlcbElXTiJTilVasY=;
 b=JV9Y6pqtwFNlICv2BxgSohhKVB2kpzqgi/bHhayVD0jlP8MhMX8NNVdp5lRupJ6wKd
 daHyjBMYAY6Dlm+KWd1hzFw5Uo5Gh4M8q8Ryx4MeXOP6AZTddOCoBTDR/SgJ4RS1uElX
 OjAf/AkoBBchPsE3brXZJilc5OTDxxBruJmZEBv60Jrhu4RXLjlaLKwhfwh2lSkQRsec
 JULacQnGRuXCB49LzMe4QBpS2xgjPoLVqDceUaHvNKsD7e89C1dRtwclaVJbcQsYbTKZ
 MnYTVCFGOyPXazlUIc3z6lUC6eztbTPPLEMKpOHfjUnWvclbY+lpitmSfzK4pJJhL90F
 XRuw==
X-Gm-Message-State: AOJu0YzvXTX//vTnB1Tcl5IKP/N6suEDsQsxzMOAyt7y3kqarP7Sd8BX
 k5ZYCA2ogVEDxQ96/DKsiPbXIa+sMal7En7mvtVcDvUUrcSnjiAIXTPZHytB5S9T4Obia69hnOr
 +
X-Gm-Gg: ASbGnctQ25bpvOFoqtFKy3EBWMZaFgyjySKQgKUZdgyPO6Emf2/HwjV5ISF7f5/VB1a
 mSC1rm/qAKcs6fU6LqP72qu0sJS7DlVpmkmz0I2hwjSNCcC1EwtStYwn0XVipzWEKnErAVO4idv
 XStjXVD3wV29LqhQbo3ay+OdtIKjp7ijIMcvhp7rHfhrPoY2lTMne2ht+Ygx5G+B69bArWBo96c
 e81yTzro+TE0LzRYByuZ8WQSlzyr70w0GGskIN/iuAwmjlQqULyMDXieNuYjlkjst6C5Bgp+8OS
 dmNjfSX5cpmJ088LiobK6cpJZAFRjKCI3fBeIUh+NNiMCTY5KSlmEgioMno6WQTZ9BXZ/ZXLDRW
 ZzvWUY1FCi4WEdyyDWKP4/cUZ7jHNkffI4yoZzYSSLkp1ig==
X-Google-Smtp-Source: AGHT+IEd4JszM5qLKi98V85/E7QW0ZpKapFypAlRLvIVgaazI2QfYjRs2fedfxrB0ed5H8Cu4INbQQ==
X-Received: by 2002:a5d:6484:0:b0:38d:a879:4778 with SMTP id
 ffacd0b85a97d-38f24505651mr6506425f8f.33.1739478808283; 
 Thu, 13 Feb 2025 12:33:28 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f25915146sm2819277f8f.56.2025.02.13.12.33.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 12:33:27 -0800 (PST)
Message-ID: <6dac612c-96c5-429a-951c-891e6c287d08@mind.be>
Date: Thu, 13 Feb 2025 21:33:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Javad Rahimi <javad321javad@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, linux-amarula@amarulasolutions.com,
 Julien Olivain <ju.o@free.fr>
References: <20250211093349.2153008-1-dario.binacchi@amarulasolutions.com>
 <87zfis2zsg.fsf@dell.be.48ers.dk>
Content-Language: en-GB
In-Reply-To: <87zfis2zsg.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739478808; x=1740083608; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ifbtEO1Szd4gcIECCqHcUIjd2LJlcbElXTiJTilVasY=;
 b=b7z4G3k4ayXoCu2C4bwd5+aH1LiH6NEhSf12V62PeVzB9vHXRqu7XnkiaRgq93fvKC
 3aYTiWZgN+wkAsiI250xohYXfdyjVcmfaFNj0OrhDpCs0FixMrTQlQtmnNVogcHTglCc
 hU1d/za7Rq2LbsB3OYhARmIS6FjkbsDp65tFs5+nD6pGz/LipzKBgjQKq0KDajFdupBV
 itci5+/RaEDiERMRycBZ/cLafroAJeNcFmEdmovxaYV3zzBgWBo8Eb8aaAbJD0noe61g
 Gg2khWBLV46ZSHQrJBm9fp2FtyB2/jXcuIMhdvNDZPbQ22vVRd52Tj0SR3JuWZP1nm15
 v84g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=b7z4G3k4
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: support System Control
 Processor (SCP) firmware blob
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/02/2025 17:48, Peter Korsgaard wrote:
>>>>>> "Dario" == Dario Binacchi <dario.binacchi@amarulasolutions.com> writes:
> 
>   > The commit 4bce3270d680 ("Config.in: timeout earlier when connecting to
>   > download servers"), among other things, adds the connection timeout
>   > parameter to the default scp command:
> 
>   > config BR2_SCP
>   >        string "Secure copy (scp) command"
>   >        default "scp -o ConnectTimeout=10"
> 
>   > Since the package/pkg-download.mk file exports this command using the
>   > SCP variable:
> 
>   > export SCP := $(call qstrip,$(BR2_SCP))
> 
>   > and the U-Boot Makefile uses this variable as the path for the system
>   > control processor (SCP) firmware blob:
> 
>   > cmd_binman = $(srctree)/tools/binman/binman $(if $(BINMAN_DEBUG),-D) \
>   > 		$(foreach f,$(BINMAN_TOOLPATHS),--toolpath $(f)) \
>   >                 --toolpath $(objtree)/tools \
>   > 		$(if $(BINMAN_VERBOSE),-v$(BINMAN_VERBOSE)) \
>   > 		build -u -d $(binman_dtb) -O . -m \
>   > 		--allow-missing --fake-ext-blobs \
>   > 		$(if $(BINMAN_ALLOW_MISSING),--ignore-missing) \
>   > 		-I . -I $(srctree) -I $(srctree)/board/$(BOARDDIR) \
>   > 		$(foreach f,$(of_list_dirs),-I $(f)) -a of-list=$(of_list) \
>   > 		$(foreach f,$(BINMAN_INDIRS),-I $(f)) \
>   > 		-a atf-bl31-path=${BL31} \
>   > 		-a tee-os-path=${TEE} \
>   > 		-a ti-dm-path=${TI_DM} \
>   > 		-a opensbi-path=${OPENSBI} \
>   > 		-a default-dt=$(default_dt) \
>   > 		-a scp-path=$(SCP) \
> 
>   > the following error occurs:
> 
>   >   BINMAN  .binman_stamp
>   > usage: binman [-h] [-B BUILD_DIR] [-D] [-H] [--tooldir TOOLDIR] [--toolpath TOOLPATH] [-T THREADS] [--test-section-timeout] [-v VERBOSITY] [-V]
>   >               {build,bintool-docs,entry-docs,ls,extract,replace,sign,test,tool} ...
>   > binman: error: unrecognized arguments: -o ConnectTimeout=10
>   > make[2]: *** [Makefile:1126: .binman_stamp] Error 2
> 
>   > The issue was already present, as the scp command was being passed
>   > instead of the path to the SCP firmware, but it is now detected due to
>   > the compilation error.
> 
> Indeed.
> 
>   > Adding the BR2_TARGET_UBOOT_SCP_FIRMWARE option allows passing the
>   > correct parameter to U-Boot, even if it is not set. This also requires
>   > removing the SCP setting from BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS for
>   > configurations that previously set this variable explicitly.
> 
>   > Fixes: 4bce3270d680 ("Config.in: timeout earlier when connecting to download servers")
>   > Suggested-by: Julien Olivain <ju.o@free.fr>
>   > Co-Developed-by: Julien Olivain <ju.o@free.fr>
>   > Signed-off-by: Julien Olivain <ju.o@free.fr>
>   > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> So the real fix is presumably to stop globally exporting all these
> variables in package/pkg-download.mk. I don't right away see why they
> couldn't just be passed in $(PKG)_DL_ENV to the dl-wrapper instead.

  It shouldn't be in _DL_ENV, but directly in the DOWNLOAD macro like is already 
done for TAR.

  Also, they are Buildroot-internal environment variables, so they should 
normally be prefixed by BR_.

  Regards,
  Arnout


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
