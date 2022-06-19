Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E47C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90DD841506;
	Sun, 19 Jun 2022 16:37:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90DD841506
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rvzsal6LNwSR; Sun, 19 Jun 2022 16:37:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5D69408D4;
	Sun, 19 Jun 2022 16:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5D69408D4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F1121BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 388924010E
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 388924010E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HOxgIxBbeGUd for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:36:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09563400CC
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09563400CC
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:36:29 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id gl15so16964426ejb.4
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 09:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9lfgEy9/5PFCWrFGJe3ydrdGSUBWc7BMCcM3o9MCBu8=;
 b=pooi7+NKOy16LZHcGWD15KpWTznFUoFQ+ko1IdsV0n+8We/ptpwCCBAj3hNGq45Y1M
 N6Was3pMuPU4QsB6oDais4ObIRWzY12DdJ03A6SHN5Vi/P7V8RejpiePj4+nzqOgdK84
 f3RpFKKQ7hqKTNId/w+4KX8ta9c6dpl5jA99TOJS27ljRyQ4/RIfTNKrSZWPCTyjwEE+
 ETVAz9z3ket787CUx83AIkK3uC7aWFQRhwVg+W050uw7iRhsxVETrwaan+/zGy3S/k5Q
 bfVB4+1eOmxwovsmwED2VDDNGyFx0G4vXsnpy6spc2Lu+1k8JvdpgO/6DJjZcCq+Y9S2
 V0Pg==
X-Gm-Message-State: AJIora8xwpbO14NWaMXA0NjKaT0q8LhWlXFbbCM8e+kMKMY6fYs3fR8K
 qpWjmUEaWPqvXljg/7HnfBbQ4S+2btcDHw==
X-Google-Smtp-Source: AGRyM1tnzJ/EvQG1ug2mvPeIQdpuIZH5vqcESAEGP2wSyFim9UuSIXTFwm70O2x30GpNDfaO5JOdHg==
X-Received: by 2002:a17:907:3e04:b0:6f5:1132:59de with SMTP id
 hp4-20020a1709073e0400b006f5113259demr18252150ejc.755.1655656587927; 
 Sun, 19 Jun 2022 09:36:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a170906169200b006fec69a3978sm4672199ejd.207.2022.06.19.09.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 09:36:27 -0700 (PDT)
Message-ID: <72fdceba-eb04-e8c3-2679-0ca5196de5ba@mind.be>
Date: Sun, 19 Jun 2022 18:36:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>,
 Yu Chien Peter Lin <peterlin@andestech.com>
References: <20220607205921.3312256-1-thomas.petazzoni@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220607205921.3312256-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=9lfgEy9/5PFCWrFGJe3ydrdGSUBWc7BMCcM3o9MCBu8=;
 b=VyZGJNoUHx0bjSkfpMfMV5kzRYZLRztqOAYRE3wH75+juPNakstcAZW4Rp0WNypgyL
 5TsYm5C/OGwzkrgSyPvUj+JQR3zfHomcd6t2JcA3Pzlu15SwCMese3HRO5X5Z2iCeS9K
 MNI227bty8BFWXDdCToRUi4Nu8cSWC8LeC7XGRT2QkFuiDxtNkVu8xgaNugYY+TommtA
 dWTATQ+GYmkCf9isdYseCu5o5HwwdKMIOnmtWxZBdjqH72GdI0KepcrjjXO08SWUM/td
 7K+esCedlIcrKhL/BZglzy4cWz7puKvHxVJ/osCLIFoa7UcNj6fKl6+wa5Kc4ejnlKcf
 LlmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VyZGJNoU
Subject: Re: [Buildroot] [PATCH 0/3] Remove NDS32 architecture
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/06/2022 22:59, Thomas Petazzoni via buildroot wrote:
> Hello,
> 
> The upstream Linux kernel community has removed the NDS32 architecture
> support in commit
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aec499c75cf8e0b599be4d559e6922b613085f8f.
> 
> There has been very little to no activity in Buildroot around this CPU
> architecture recently, so let's drop the support for this CPU
> architecture.
> 
> Thomas

  Series applied to master, thanks.

  Regards,
  Arnout

> 
> Thomas Petazzoni (3):
>    configs/andes_ae300: remove defconfig
>    toolchain/toolchain-external/toolchain-external-andes-nds32: remove
>      package
>    Remove support for the NDS32 architecture
> 
>   Config.in.legacy                              | 10 ++++
>   DEVELOPERS                                    |  3 --
>   arch/Config.in                                | 12 -----
>   arch/Config.in.nds32                          | 17 ------
>   board/andes/ae300/ae300.fragment              |  1 -
>   ...0001-nds32-Fix-boot-messages-garbled.patch | 28 ----------
>   ...ve-redundant-YYLOC-global-declaratio.patch | 52 -------------------
>   board/andes/ae300/readme.txt                  | 49 -----------------
>   configs/andes_ae300_defconfig                 | 10 ----
>   docs/manual/known-issues.txt                  |  2 +-
>   package/dhcpcd/Config.in                      |  1 -
>   package/gdb/Config.in                         |  1 -
>   package/gdb/Config.in.host                    |  1 -
>   package/libbsd/Config.in                      |  1 -
>   package/postgresql/postgresql.mk              |  2 +-
>   package/strace/Config.in                      |  2 +-
>   package/uclibc-ng-test/uclibc-ng-test.mk      |  2 +-
>   .../autobuild/andes-nds32.config              |  3 --
>   .../autobuild/toolchain-configs.csv           |  1 -
>   toolchain/toolchain-external/Config.in        |  6 ---
>   .../toolchain-external-andes-nds32/Config.in  | 15 ------
>   .../Config.in.options                         |  9 ----
>   .../toolchain-external-andes-nds32.hash       |  2 -
>   .../toolchain-external-andes-nds32.mk         | 10 ----
>   utils/genrandconfig                           |  3 --
>   25 files changed, 14 insertions(+), 229 deletions(-)
>   delete mode 100644 arch/Config.in.nds32
>   delete mode 100644 board/andes/ae300/ae300.fragment
>   delete mode 100644 board/andes/ae300/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch
>   delete mode 100644 board/andes/ae300/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
>   delete mode 100644 board/andes/ae300/readme.txt
>   delete mode 100644 configs/andes_ae300_defconfig
>   delete mode 100644 support/config-fragments/autobuild/andes-nds32.config
>   delete mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
>   delete mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options
>   delete mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.hash
>   delete mode 100644 toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.mk
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
