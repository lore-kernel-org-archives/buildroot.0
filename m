Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B86C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 19:30:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DEDF611C0
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 19:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7DEDF611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FE20406B9;
	Thu, 14 Oct 2021 19:30:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sqg2iJKAxPIE; Thu, 14 Oct 2021 19:30:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D4AF406CF;
	Thu, 14 Oct 2021 19:30:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B42901BF5A1
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 19:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A21D04028E
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 19:30:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L2nOMgJjLwzG for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 19:30:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D1F840125
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 19:30:43 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id i20so27672858edj.10
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 12:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zkiwoi7jRffSniFR2Srk0oS+noZWsG9h6ePQY4NtLic=;
 b=R+fxl4bDdg+cvLUie5qLPhw7aC2L39sR43KAKiykWReQic/7pc6cX2QbeDjAen3RbX
 2p2/az+NRM8hs/IXzkmtoZtWE1AFHy3zvb+jLz8ahARSggtuOmItp7U5nYmbOa6JujgJ
 08aQi5Hq16hbPFqjbC54pxg+bjIQ7fhBsO+AXKhbkvIc5NROxaS0Yrq0O1YMJuI2Myor
 Utka3OQ2S22qoZWOr43OD3XMI6JbCFKSAwGlnsV959ziDxA4r6LLhE1dgb/QC2A4gGDl
 B0RCxxy5kORb1FUFOKzjDNaTJwJ7YH3i942rKW5FN0kKGaGEQgG0aDvl8qQtcHM1II1G
 3RHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zkiwoi7jRffSniFR2Srk0oS+noZWsG9h6ePQY4NtLic=;
 b=yk/B0vldGOcdM1WaIHUyxVTCf3bur71vbCHvH1PafKW4mcHjZkIMXfcuWo2PUrj0bU
 yIyapOymBaKmMtYZClqWb4CYtRmrApjAgLE9ZW1kDB2Pb7DPPnr3FDd+aqdg+35/dsGv
 PHDOaVIY5sfOT6j2i0Bv9fSFUzPSjI3obrWbFjIkp31tMIhNZUkeevs6WHcujcvwGIwk
 5y9FsMKWc7aWnUV/fzwWuiYxrqLhFKZXjQ4CfzxOK53Nht9qzcdZtAU4xsMW6V88NS9t
 vnckNS7Nyaw+PeQj98h289KwE8+N3/R8CXp18b8AmdFBpJoVPLPyG22AT0+YkPEl627Q
 YaPA==
X-Gm-Message-State: AOAM533GnziDIxtByfBsk138E5D5mc3/DvN5m4DV+W6WvgjNjlX5HuwU
 Ac/KM773Kq7JFvaM6H+fayV64Q==
X-Google-Smtp-Source: ABdhPJzSpuPWiJDk+0tLVv5UzhQWnamchjEEB1KET8SlJ0JZ0BXn9DAXq3rr8MvmpMQSL6ChfBI+KQ==
X-Received: by 2002:aa7:dcc2:: with SMTP id w2mr10913536edu.192.1634239841426; 
 Thu, 14 Oct 2021 12:30:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f4sm2639464ejf.61.2021.10.14.12.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 12:30:40 -0700 (PDT)
Message-ID: <9af643e3-0047-5fb4-1c17-ed08bc4bf2fd@mind.be>
Date: Thu, 14 Oct 2021 21:30:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: =?UTF-8?Q?Esa=c3=afe_Ledoux_NJONGSSI_KOUAM?= <kouamdoux@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
References: <CA+eej5MzpM30U7sMqba5gKQ3dG5FznZqd6roacphLhx6J-9auA@mail.gmail.com>
 <CA+eej5ObHKKx4x=uOYRDF1npRR4kqnucWByTtNkbS40A+1y-GA@mail.gmail.com>
 <fe8b5e30-6cb7-161d-6e6e-cdddadcbbe01@gmail.com>
 <CA+eej5M-SbCseCpknXdMboR7Lz+A94BNHMBZd2WJkcbDD6pZAg@mail.gmail.com>
 <59c215b4-63e2-ba22-285f-0fb4032111b8@mind.be>
 <CA+eej5M2CjZvH+cYL31OhspJCkN0isrbmJA9pUKHsnOzdbuegA@mail.gmail.com>
 <CA+eej5Niy_Qkag54jkV39WgcCLy2t11=S-gY+UndMtjOMqNWpQ@mail.gmail.com>
 <CA+eej5NNTNONO_GX1T=DhRyvbQJzxNhJMrRi-T4Ue-bexYRR3w@mail.gmail.com>
 <CA+eej5NKcWV6n_sM19Px+NP4EoqSDmUqw2W3DdTDGGKQRSqZ5Q@mail.gmail.com>
 <20211012225224.23525d4f@gmx.net>
 <b1aa1e5e-18b1-11b6-0f8d-14982d25ad3b@mind.be>
 <CA+eej5OCBy1brQFnRMQjMqu8DrPtrTgVPRpTT8hKxXTwz5uvNQ@mail.gmail.com>
 <CA+eej5Py5=BfZzMuZS8ARZ5K24xBjGTrpu0iANh7hX9AjK6NQA@mail.gmail.com>
 <20211013182644.6b10f575@gmx.net>
 <CA+eej5M-9OVMikj2YFdL7bDUWKRztiqJZqxk0UzEkYXvHaxh3Q@mail.gmail.com>
 <CA+eej5MVoG1uFTxNyCnSXjdhBQj5enHSxTz_GfFnMioFWihogQ@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CA+eej5MVoG1uFTxNyCnSXjdhBQj5enHSxTz_GfFnMioFWihogQ@mail.gmail.com>
Subject: Re: [Buildroot] error when i build buidroot
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNC8xMC8yMDIxIDE3OjI0LCBFc2HDr2UgTGVkb3V4IE5KT05HU1NJIEtPVUFNIHdyb3Rl
Ogo+IFRoYXQncyB0aGUgb3V0cHV0IGluIG15IHRlcm1pbmFsIC4uLgo+IENhbiBpIGhvcGUgdGhh
dCBldmVyeXRoaW5nIGlzIG9rYXkhPz8KPiAKPiBMZSBqZXUuIDE0IG9jdC4gMjAyMSDDoCAxMjoz
NSwgRXNhw69lIExlZG91eCBOSk9OR1NTSSBLT1VBTSA8a291YW1kb3V4QGdtYWlsLmNvbSAKPiA8
bWFpbHRvOmtvdWFtZG91eEBnbWFpbC5jb20+PiBhIMOpY3JpdMKgOgo+IAo+ICAgICBpcyBpdCBm
aW5pc2ggPz8KPiAKPiAgICAgQ3JlYXRpbmcgZmlsZXN5c3RlbSB3aXRoIDYxNDQwIDFrIGJsb2Nr
cyBhbmQgMTUzNjAgaW5vZGVzCj4gICAgIEZpbGVzeXN0ZW0gVVVJRDogNzIxYjlhMGQtZDM4My00
YjA2LTk0NjktNzc5NDRjZmZiN2M2Cj4gICAgIFN1cGVyYmxvY2sgYmFja3VwcyBzdG9yZWQgb24g
YmxvY2tzOgo+ICAgICA4MTkzLCAyNDU3NywgNDA5NjEsIDU3MzQ1Cj4gCj4gICAgIEFsbG9jYXRp
bmcgZ3JvdXAgdGFibGVzOiBkb25lCj4gICAgIFdyaXRpbmcgaW5vZGUgdGFibGVzOiBkb25lCj4g
ICAgIENvcHlpbmcgZmlsZXMgaW50byB0aGUgZGV2aWNlOiBkb25lCj4gICAgIFdyaXRpbmcgc3Vw
ZXJibG9ja3MgYW5kIGZpbGVzeXN0ZW0gYWNjb3VudGluZyBpbmZvcm1hdGlvbjogZG9uZQo+IAo+
ICAgICBsbiAtc25mCj4gICAgIC9ob21lL2xlZG91eC9Eb2N1bWVudHMvYnVpbGRyb290L291dHB1
dC9ob3N0L3g4Nl82NC1idWlsZHJvb3QtbGludXgtdWNsaWJjL3N5c3Jvb3QKPiAgICAgL2hvbWUv
bGVkb3V4L0RvY3VtZW50cy9idWlsZHJvb3Qvb3V0cHV0L3N0YWdpbmcKPiAgICAgID4+PiDCoCBF
eGVjdXRpbmcgcG9zdC1pbWFnZSBzY3JpcHQgYm9hcmQvcWVtdS9wb3N0LWltYWdlLnNoCgogIFll
cyB0aGF0IGxvb2tzIE9LLgoKICBSZWdhcmRzLAogIEFybm91dAoKW3NuaXBdCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
