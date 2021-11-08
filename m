Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35085C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 18:38:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94FFE61989
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 18:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 94FFE61989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D43D40003;
	Mon,  8 Nov 2021 18:38:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xgiyvxjRfIII; Mon,  8 Nov 2021 18:38:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62548400B5;
	Mon,  8 Nov 2021 18:38:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E5A271BF3F3
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 18:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D425E402F5
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 18:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HJ_jg1mZNVdG for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 18:38:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08A97402ED
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 18:38:50 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x15so35170347edv.1
 for <buildroot@buildroot.org>; Mon, 08 Nov 2021 10:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jUfPH3BjosG0E9JdNX4fty1ocrHMpDOWRnlb3Z+PDzQ=;
 b=LoJCPwsjb1we49dKo/jsZHfKGDXvMoRZNaSPmRvs6A4ITQAJIEcBG7hHNVhTodF/GK
 7Vyo94gQF5Cg5DoeEQG2rfqzAx2OWlSmNR8sRIjm0NE0oWLxM7/huFWZu/LQaUHt0kkQ
 YBlUoQUukPo+e30TY0/PwZdPpG6Gml8ud0t9vQt8+kjsI7fH24q2Cg+XLMIDxV0im0DW
 uTCk98LcaG9OliLfWWQM+BviRE+6Tjo9vUtbwAolPcFpnJJbsy13/i/07h2u74nkzHPG
 ZJujMFmitVDMysBSG6NEh5QktcbOUkoeSJvsHTri7plLDumKq9vkDr7eANozveymo1CV
 iGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=jUfPH3BjosG0E9JdNX4fty1ocrHMpDOWRnlb3Z+PDzQ=;
 b=YMcgq9gLANE5+FfpTwf7q1Q5UJKLPhS9aKsfLb0MnigdpXZ/AQikK4f3nfVbZjxqQN
 VCluZgGV/qw/FQ+Ry9O9ihzC1mRjjKHbccSuS6tsygI/97mfBEPa6uvKsGiZmIGa4vWA
 Afv1fQFYgSdQO7Lxjp4mwGREEfFrvJ76D6sQsQKg71smLYVqAPMdmMyfZYXOujoBuMJd
 GomcNxNGx22yYvvvPx5WmeL7Lm45MtsGO2Nx+zq7k4RjQelfodBcd5097IfkDWlkQoXS
 gu86tf1PJT5IGvoV5AzASNzdpAoX9CnpqqlgFOC6ReCHfOpVXZEBVJIgsor5U8EQYfaJ
 XiJQ==
X-Gm-Message-State: AOAM532LHXSygVJ7Gp4S0qpnInE7YyQSH/YW4+3YznQV9YPoDY/vAjNh
 dhTujfaE210rXqb2SSTomCVJirIXVgVnCA==
X-Google-Smtp-Source: ABdhPJy19DJEgGuLReOlaibx1WDxVYNBjQ6rSt2Wkh+gUc3fq2DhhkqI8n9+i94Hfn+ZGXN9DJ8e/g==
X-Received: by 2002:aa7:c5ca:: with SMTP id h10mr1570196eds.194.1636396729290; 
 Mon, 08 Nov 2021 10:38:49 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id y15sm7090013eda.35.2021.11.08.10.38.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 10:38:48 -0800 (PST)
Message-ID: <7b908088-542f-56e7-a4ce-6f8c8b5d36e7@mind.be>
Date: Mon, 8 Nov 2021 19:38:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211108150731.GD680793@scaer>
 <E2D49D49-B09A-4E0F-88E8-9DC939C8A1E0@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <E2D49D49-B09A-4E0F-88E8-9DC939C8A1E0@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 000/102] Standardize/beautify genimage .cfg
 files for all boards
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOC8xMS8yMDIxIDE3OjAxLCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiBIaSBZYW5uLCBB
bGwsCj4gCj4+IElsIGdpb3JubyA4IG5vdiAyMDIxLCBhbGxlIG9yZSAxNjowOCwgWWFubiBFLiBN
T1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IGhhIHNjcml0dG86Cj4+Cj4+IO+7v0d1aWxp
bywgQWxsLAo+Pgpbc25pcF0KPj4gICAtIHRoZSBnZW5pbWFnZSBmb3JtYXQgaXMgbm90IHdlbGwg
ZGVmaW5lZCwgYW5kIHRoZXJlIGlzIG5vIGxpbnRlciwgc28KPj4gICAgIHRoZSBleGlzdGluZyBm
aWxlcyAqd2lsbCogZGl2ZXJnZSBhZ2FpbiwgYW5kIHdlIHdvbid0IG5vdGljZSB0aGF0Cj4+ICAg
ICBuZXcgZmlsZXMgd29uJ3QgYmUgY29tcGxpYW50Lgo+Pgo+PiBXZSBrbm93IHRoZSBmaWxlcyB3
aWxsIGRpdmVyZ2UgYWdhaW4sIGJlY2F1c2UgdGhhdCBhbHJlYWR5IGhhcGVubmVkIHdpdGgKPj4g
b3VyIHB5dGhvbiBzY3JpcHRzLCBldmVuIHRob3VnaCB3ZSBkaWQgaGF2ZSBhIGNoZWNrIHJ1bm5p
bmcgZmxha2U4LiBTbywKPj4gZm9yIGdlbmltYWdlIGZpbGVzIHdpdGhvdXQgYSBsaW50ZXI/IE5v
IHdheSB0aGV5IGNhbid0IGFuZCB3b24ndC4uLgo+IAo+IFllYSBJIHRob3VnaHQgYWJvdXQgdGhp
cy4gSSBkb27igJl0IGtub3cgaG93IG11Y2ggZGlmZmljdWx0IGl0IGNvdWxkIGJlIHdyaXRpbmcg
b25lLgoKICBJIHRoaW5rIGl0IHNob3VsZCBiZSBlYXN5IGVub3VnaCB0byBleHRlbmQgdGhlIGNo
ZWNrLXBhY2thZ2Ugc2NyaXB0IHRvIGNoZWNrIApmb3IgYXQgbGVhc3Qgc29tZSBvZiB0aGUgaXNz
dWVzIChlLmcuIHRhYnMgdXNlZCBmb3IgaW5kZW50YXRpb24pLgoKCiAgUmVnYXJkcywKICBBcm5v
dXQKCltzbmlwXQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
