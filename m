Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8ABC021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 20:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FC2C402A9;
	Mon, 17 Feb 2025 20:46:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXhcnOXmfcGE; Mon, 17 Feb 2025 20:46:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0455A40524
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0455A40524;
	Mon, 17 Feb 2025 20:46:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DDDF6C8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEB8840290
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZT0M8BYiSdTP for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 20:46:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B9BFE40153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9BFE40153
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9BFE40153
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 20:46:11 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-38f325dd90eso1679318f8f.3
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 12:46:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739825169; x=1740429969;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OgivhKEFuWeIud/t/8UFOTdNWi+0Xkc+tEzVG0poQ/4=;
 b=ggwo1WSS59IaL5VE9UFMcovNylyGwAKeoJAGyy5tYa3uOt0rFtRUQj/8vkOpd0cASj
 Tz9InKdBCpJBVBnLS4xPaCAeyQLxg4RsufRjBL4oqsxj/OTOa0IN0TWB7bDywPQEbtUA
 jfNKxcJHdlZjDCRonS1E/3TKO9e/cFd8vcQruj5qJx1LZBChPsL8A6x8D6jrhDcWI6wc
 yuosvFos6melanOoGMfAvDj2S900HzURevnpCYmVn3d77RjjnbQEcSbw/ZFxh1CqgW87
 4kprHTF3prfFuA2nzyLgUGXvbB2jW+dkvq4R6xWPLac3CBgqPViFOGkPo1BMlOzt4wFH
 z6zw==
X-Gm-Message-State: AOJu0YyqDuKe0PpKPt/Xc6iSAo7M6pe2nkkmUtKNeO7d+AhySyciwJ7g
 xYKESzwDH8urA6kdRzlWkSRTCHPK5cU1dOvoH//46P8mE4PjWAwfhDnOUrB9DGmBdwAFFZz5Yv2
 /
X-Gm-Gg: ASbGnctEx7ZnuR0MQpFVh25vs51nJOh6qABJQL4uMwtFKhd4vVum77O3ERIdWwHv4N7
 gxN+ONbrLOnlDQwCBdb2ur98C7aPqAoAelDzBR2cFwis2UUfzYeFGnwFKqP4YWyS+UlLc0e1epv
 2zlpKurM6UkTL3Fxdj+C/GwaHojTLvT+9jF76klcpIWHziiVkFWgJ37VYa6+epmjc84waCsLteV
 oW/x2ttGv9GQc3AvFYUJuxZFsaQEWyrZsUx/lKhDViuU5UdALpSp71chiVtlfTOwymZHs0G+C2v
 hTcCOtJfXmW8hBZX8t2LYLufLTzcNUocBEoxT7vzRUKUjBA192kp8krsY9XaAO1bXugyM8YuLBQ
 FDd/OKnkFfT6MvdFjJyaJqq+ZJBQ0rviv58jU6fRFOckjJQ==
X-Google-Smtp-Source: AGHT+IGDwT7ds3UyNIB5u1cKuHYJS9IekJaKARGvKozZKvyAlhPFk8AzQUyDpgDqpibz3M75LiQ9KA==
X-Received: by 2002:a5d:598b:0:b0:38f:5014:22d with SMTP id
 ffacd0b85a97d-38f50140375mr919070f8f.30.1739825169395; 
 Mon, 17 Feb 2025 12:46:09 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5655sm13122393f8f.77.2025.02.17.12.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 12:46:08 -0800 (PST)
Message-ID: <0361ab02-84ce-4b10-b19a-2fdea6a7c836@mind.be>
Date: Mon, 17 Feb 2025 21:46:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vladimir Oltean <olteanv@gmail.com>, Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
References: <20241208143802.1048266-1-olteanv@gmail.com>
 <20241208143802.1048266-4-olteanv@gmail.com>
 <6c30c95e-e76d-45a3-959c-02c9873d5660@smile.fr>
 <20250216143610.irsdhj3m6jxdkbmv@skbuf>
Content-Language: en-GB
In-Reply-To: <20250216143610.irsdhj3m6jxdkbmv@skbuf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739825169; x=1740429969; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OgivhKEFuWeIud/t/8UFOTdNWi+0Xkc+tEzVG0poQ/4=;
 b=d6HJUnGSQh44gFhm6csVkOeSQsL1KHKIj+sbpnIWITH3QzzCL8+p8/E7DjQZdh8tJC
 78s70ir3+riuAQvcfZ+DDw6jhxXFIT7avnPgN8aygmRcgO2NWIKLKLuwXgBSNip1nFY+
 IZtdiJZIuRaIFXP3KaBJC1NkYrETLn+Q/eRQnkey+McamRJWdXNwdRZvUreh8EZN24h8
 IDNvJzUUaasShvDtqWNFzh9kCOnoOZfVrJHpHsYl31rClocJAFJRmupA3phlEw/VVmDd
 t9J84hwlTMqRMP4Kqp47gbeLtjqihAvwdFkNmIo52Gx6Fv+9q/iExwZlrBYF1ZzV07VK
 G3Sw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=d6HJUnGS
Subject: Re: [Buildroot] [PATCH v2 03/11] package/qoriq-mc-binary: new
 package
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



On 16/02/2025 15:36, Vladimir Oltean wrote:
> On Wed, Feb 05, 2025 at 03:45:22PM +0100, Romain Naour wrote:
[snip]
>>> +MC_PLATFORM = $(call qstrip,$(BR2_QORIQ_MC_PLATFORM))
>>> +MC_DIR = $(call qstrip,$(BR2_QORIQ_MC_DIR))
>>> +MC_BIN = mc_$(MC_PLATFORM)_$(QORIQ_MC_BINARY_VERSION).itb
>>
[snip]
>> Try with:
>> QORIQ_MC_BINARY_MC_PLATFORM = $(call qstrip,$(BR2_QORIQ_MC_PLATFORM))
>>
>> Same for MC_DIR and MC_BIN.
> 
> If I were to replace MC_DIR with QORIQ_MC_BINARY_DIR, it would conflict
> with package/pkg-generic.mk's use of $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASENAME).
> I guess I don't fundamentally understand the best practices of naming
> private Make variables when I don't want them to collide with the build
> system's use, and the "tips and tricks" link didn't really cover that.
> I'd guess you'd recommend renaming "QORIQ_MC_BINARY_DIR" to
> "QORIQ_MC_BINARY_DIRECTORY" and just "knowing" that the latter is not a
> variable used by the build system?

  In general, you have to make sure that all variables begin with the package 
name, and that they don't conflict with existing variables. It's unfortunately 
indeed tricky to do that...

  However, in this specific case, you're not doing anything in configure and 
build anyway, and you can use the subdir variable:

QORIQ_MC_BINARY_SUBDIR = $(call qstrip,$(BR2_QORIQ_MC_BINARY_DIR))
QORIQ_MC_BINARY_PLATFORM = $(call qstrip,$(BR2_QORIQ_MC_BINARY_PLATFORM))
QORIQ_MC_BINARY_BIN = mc_$(QORIQ_MC_BINARY_PLATFORM)_$(QORIQ_MC_BINARY_VERSION).itb

define QORIQ_MC_BINARY_INSTALL_IMAGES_CMDS
	$(INSTALL) -D $(QORIQ_MC_BINARY_DIR}/$(MC_BIN) $(BINARIES_DIR)/mc.itb
endef


(note that Config.in options also have to begin with the package name, so 
BR2_QORIQ_MC_BINARY_PLATFORM instead of BR2_QORIQ_MC_PLATFORM).


  Regards,
  Arnout
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
