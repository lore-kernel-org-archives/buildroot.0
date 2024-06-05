Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5EDC27C52
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 21:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBD2A81139;
	Wed,  5 Jun 2024 21:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1s6P7Pudpbt8; Wed,  5 Jun 2024 21:21:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD9458113F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD9458113F;
	Wed,  5 Jun 2024 21:21:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4762A1BF5A8
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41ED661032
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 21:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id faYOipM0i9ZD for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 21:21:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3673660EE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3673660EE2
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3673660EE2
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 21:21:47 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-42147970772so2127235e9.0
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 14:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717622506; x=1718227306;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Iu0C7godDNaT9Z1urXCv8HzkcS/VPaEkDdwSxsF/xk0=;
 b=cirtf8uzVOLiGGUF1+T0dsCcTHjsOzAOTw70NhMnVQna3c1X/B//BpnQd9riGCJZsW
 dtua5T4blI3pSTjFTpERM0Ea8WshkmM7nBP/9ZXbl95tz5ldHY0UV5/VliBsAFjOOMgV
 +8Z19nVIbVuhFQKC4UE/GtED29oUVv4JOWRUA9ugSrspoMkEqM5GFqiINB9tAkBwBYF6
 7vkeDKrD0GB2yZiiEf2K/b6U6zeYXGYxmNYuoWNqgtzUF/ah++rT6hDswG9+1m/kNqa9
 JSwQn/sRrdBHCCTgqxjRQFlpwcWMm+0XqWy39GhktyZmNViW2hpIQj+Kd/ck27EmfSbk
 85/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs4ovSoGL0biJ3BLiQ0hSVFgY1gXjo6Cumy9MdznXakd4PkF14RAHf7vLJwDicYcb0hZzYT5HkgWvjgkG7MBJZB0xWD0AlTA==
X-Gm-Message-State: AOJu0Yz8fWgQ2lHd6FKGt3NHGMRFSyGnTnvjnmLssjDZ4KAt842hNfmp
 YVe1oZkOk7npgg73q6Qk+qmOU8hK2HeuXKmrmF1XZxcu0YD7SnvLMfrE+uuw3Yo=
X-Google-Smtp-Source: AGHT+IHU2dByk6Kpao77EJjWoPdpIVUyorp+GjlfGGxAs02cHQX/4T9z9hflqbyfKS5EALwGjNTH/A==
X-Received: by 2002:adf:e7d0:0:b0:35b:a0b2:464a with SMTP id
 ffacd0b85a97d-35e8ef8feefmr3018624f8f.45.1717622505746; 
 Wed, 05 Jun 2024 14:21:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd062eda6sm15757810f8f.86.2024.06.05.14.21.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jun 2024 14:21:45 -0700 (PDT)
Message-ID: <8ab08dec-bc99-4fcc-a99a-e552b8df2d01@mind.be>
Date: Wed, 5 Jun 2024 23:21:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1717609998.git.yann.morin.1998@free.fr>
 <f9e65da986bd67bb665a18db4ac5ebeee91a4758.1717609998.git.yann.morin.1998@free.fr>
Content-Language: en-GB
In-Reply-To: <f9e65da986bd67bb665a18db4ac5ebeee91a4758.1717609998.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717622506; x=1718227306; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Iu0C7godDNaT9Z1urXCv8HzkcS/VPaEkDdwSxsF/xk0=;
 b=SbPsgsCPIonWnfElaBV4OAl7XkRy55xfr8hnlIc2U438zdOGvCnN1W6S74bjSPOhHG
 6/PL0FOsbW2JYXgICZNHOaEN32VmFLijROjPnmz9SfIJxjnyDuq2oeaayxoShRIRNQpZ
 hA6djmbkK8bCN5B6rr7/z3ESzEwZlv87YxAXcT6/gFt4PXgvYACbx37oCNDKzioxZViK
 2uJjOm/WzShswOgpFgsZJrEeQTXH2Wqv8wCeK24NzvHR8h+tfFFbAtCQ7IfHnBhidXo7
 yKcO2cKHPpkXVz9qPsTFGLtdChQIqIGDS08Vsy7pz0oLdhiLslkmvz8Vwm13PvDpURlw
 hrzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=SbPsgsCP
Subject: Re: [Buildroot] [PATCH 01/10 v2] package/liblockfile: drop empty
 patch tarball
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



On 05/06/2024 19:53, Yann E. MORIN wrote:
> The Debian control aarchive does not contain any patch for liblockfile
> 1.17; it has had no patch since Debian packaged version 1.16-1.1.
> 
> Drop the path tarball now.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>   package/liblockfile/liblockfile.mk | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
> index f472809ebc..6535634efa 100644
> --- a/package/liblockfile/liblockfile.mk
> +++ b/package/liblockfile/liblockfile.mk
> @@ -7,7 +7,6 @@
>   LIBLOCKFILE_VERSION = 1.17
>   LIBLOCKFILE_SOURCE = liblockfile_$(LIBLOCKFILE_VERSION).orig.tar.gz
>   LIBLOCKFILE_SITE = http://snapshot.debian.org/archive/debian/20210128T210947Z/pool/main/libl/liblockfile
> -LIBLOCKFILE_PATCH = liblockfile_$(LIBLOCKFILE_VERSION)-1.debian.tar.bz2

  I took the liberty of also dropping it from the .hash file :-)

  Applied to master, thanks.

  Regards,
  Arnout

>   
>   LIBLOCKFILE_LICENSE = LGPL-2.0+, GPL-2.0+ (dotlockfile)
>   LIBLOCKFILE_LICENSE_FILES = COPYRIGHT licenses/GPL-2 licenses/LGPL-2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
