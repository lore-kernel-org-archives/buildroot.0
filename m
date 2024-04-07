Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64521CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 16:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AE8B82076;
	Sun,  7 Apr 2024 16:08:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id as4mD0kWp6Wa; Sun,  7 Apr 2024 16:08:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E4958207D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E4958207D;
	Sun,  7 Apr 2024 16:08:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B8E2C1BF326
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B094A60B15
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V7EdN3qOq8kB for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 16:08:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5B10B60ADD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B10B60ADD
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B10B60ADD
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 16:08:19 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-345600106d3so702693f8f.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 09:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712506097; x=1713110897;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EI2TiQiwITuBJ/aZkOrOZL7xUZ7rusThgaHx02NUVVg=;
 b=NDhwrGNLipUbEBHrTMIOj9jrbNn2ZzVGc1GiB+dIcmS0CFogfA9yahLRIx2we06zfS
 9lxC9eoHr39jpzmV9KE7eE77qPUG/4KDJ/HU3jAHoPtixzXONkV9oBOcbzyFigtZhUlj
 JBtM3gayKKiXl4AZUW1YjDsJEJ2UB/q+gJswhLajSDbWwu1840RF2vew6aaSrbUWPbkX
 IGaGriqv49/KuT0X4ikvWABzcfJA6TGeIrqD0eGJ4IdL86Ix2YzMfNrEzhTYmwLfFzAi
 CS7budl/HV0zWRSEQm9/10bebOEJpEpxLtT+v3VCs6sYKDtPGAB6Eio8tj4Q1QKifsbl
 cSRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXulxhBNiYxc3ZppY1RFYj9gY4G0Q9jiKLGKTcweugC6OGTMbhpUOKFHTHZqVzVaEX0YqmNeOB3n3r/xstSAP9wR1rkJiuMdw==
X-Gm-Message-State: AOJu0Yyotdx0ZdMJfv+Wyr8yFDEpGXuar0uWMwcYClt01htRNSw0ijL4
 51G1xPcHecrkJBB78IR7PrskixUWzLTS4iAvgDHl3nHCjrGiGU6JUt3ZPM8HfRA=
X-Google-Smtp-Source: AGHT+IGUSdotfCbbxDuF1NEvAlyUC9iy2F+m3kcNveYg5uUYQ/fG+RNj4s7hNpOTu82n5aasJO8/XQ==
X-Received: by 2002:a5d:4ac9:0:b0:33e:c924:5486 with SMTP id
 y9-20020a5d4ac9000000b0033ec9245486mr4471909wrs.46.1712506097188; 
 Sun, 07 Apr 2024 09:08:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 e38-20020a5d5966000000b003437ad152f9sm6909881wri.105.2024.04.07.09.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 09:08:16 -0700 (PDT)
Message-ID: <f6066d44-0140-4a38-a2d3-cf09ace197e0@mind.be>
Date: Sun, 7 Apr 2024 18:08:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240306091930.32801-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240306091930.32801-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712506097; x=1713110897; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EI2TiQiwITuBJ/aZkOrOZL7xUZ7rusThgaHx02NUVVg=;
 b=cixX+jWsJsR+4tuwsHWPlvyin0GGDqvp8GbzA2yULsKQ8ExllM/2pW2G+yps7+xHsX
 3L4zOxwonQR5EA1USKNqd2VZF899PXRIeAYxoBjCgp8Hfgub+rBjNERnn/0GiGbtPy5h
 lwUrGUxlMnPc0QUDjZb4OV3q1MNW5cJBAbcRDTAvnwkIYYsLtx3zYmzgi6sD2o47D1eO
 w87kf0C0CC8fIFjcLA1TYRRh7C8IymIXOyOWf4Y3oI7Ma8A20GFxckt1yJ1BL5rEE+wK
 Ytf8Aa6mjRXNbts67akSiv22/HUSlalvGZabsKQhBPTZ5hfJdDqKUa8my7O5tenewq9x
 AQFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cixX+jWs
Subject: Re: [Buildroot] [PATCH 1/1] package/dmraid: fix musl build
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/03/2024 10:19, Fabrice Fontaine wrote:
> dmraid is a very old package from 2010 with an awkward configure script
> which doesn't honor CFLAGS:
> 
>   ac_cv_env_CFLAGS_set=set
>   ac_cv_env_CFLAGS_value='-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 '
> 
> [...]
> 
>   ## ----------------- ##
>   ## Output variables. ##
>   ## ----------------- ##
> 
>   AWK='gawk'
>   CC='/home/autobuild/autobuild/instance-3/output-1/host/bin/sh4a-buildroot-linux-musl-gcc'
>   CFLAGS='-O2'
> 
> resulting in the following build failure with musl >= 1.2.4 and
> https://github.com/bminor/musl/commit/25e6fee27f4a293728dd15b659170e7b9c7db9bc
> because _LARGEFILE64_SOURCE is not set:
> 
> /home/autobuild/autobuild/instance-3/output-1/host/lib/gcc/sh4a-buildroot-linux-musl/12.3.0/../../../../sh4a-buildroot-linux-musl/bin/ld: misc/file.o: in function `rw_file':
> file.c:(.text+0x150): undefined reference to `lseek64'
> 
> To fix this issue, pass TARGET_CONFIGURE_OPTS through DMRAID_MAKE_OPTS
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/5c7c82959ce92db908d3ca20e2c1137509c2f981
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/dmraid/dmraid.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
> index 0382cd4d99..9a78c2ae07 100644
> --- a/package/dmraid/dmraid.mk
> +++ b/package/dmraid/dmraid.mk
> @@ -13,6 +13,7 @@ DMRAID_MAKE = $(MAKE1)
>   DMRAID_INSTALL_STAGING = YES
>   DMRAID_LICENSE = GPL-2.0
>   DMRAID_LICENSE_FILES = $(DMRAID_SUBDIR)/LICENSE_GPL $(DMRAID_SUBDIR)/LICENSE
> +DMRAID_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
>   
>   DMRAID_DEPENDENCIES = lvm2
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
