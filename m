Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90792C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 21:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FACB61195;
	Wed,  8 Feb 2023 21:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FACB61195
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SDrrVRRSPoJ4; Wed,  8 Feb 2023 21:08:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7483061191;
	Wed,  8 Feb 2023 21:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7483061191
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72A681BF3DC
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 21:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B98A82068
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 21:08:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B98A82068
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E_Z6EJO9NYqQ for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 21:08:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D86281EFE
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D86281EFE
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 21:08:12 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d14so18159242wrr.9
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 13:08:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GNlV0dqF2f4rnSm89/3AzyzWYkOIWj+x5h6Sr8Xiz8M=;
 b=Anc1tv7rEJqL5Xe8fOfa7CTLy0OqRiAjz8+MvshNTOHNEVh1EHGy306JWxUxpPTCYT
 E/AfkZbXC1F2jp2r5qVau8SqJcERwZS9VNosoyn8jxPaYTa8spa5AHxYui2Vosx1P0vr
 WzPQiH4ivtRJrNKI6zkdkwH9sOLcxOK2LKTUxitZmRsvz8J4LsRKGaEhIjHnO+PB+Nld
 k1SLUckcjhd5XhwxcRfaye1JHm84QTOcfdOr1CseTX03/p4VyB+R27EihGsXigmra3ii
 7meCgGHYAxhxepkLSnDtLyM7i8JNpW0eD4Dljj57fN8qd6ZQkYBkO3I2GsdgJxWLXbsW
 JrqQ==
X-Gm-Message-State: AO0yUKVi1MHbzHTwc7gJ0LV2V1KSgXy+Roy0AyH2I6puLe3TmoL8vGyC
 tlOAWXaAAdoDZcytjQv+gWcCLw==
X-Google-Smtp-Source: AK7set+fyJn0GRwTbtTb0DIRiPnLkAXsbE+Bv7Mkc0TCDxOU8mLX78FqbmWgbv/+KfiS5JIyLRLA6A==
X-Received: by 2002:a5d:534f:0:b0:2c3:f026:907b with SMTP id
 t15-20020a5d534f000000b002c3f026907bmr8283823wrv.11.1675890490376; 
 Wed, 08 Feb 2023 13:08:10 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a5d5044000000b002bdf3809f59sm14379486wrt.38.2023.02.08.13.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 13:08:09 -0800 (PST)
Message-ID: <e4c3b574-0e81-41ce-8e75-2f0837b9b83f@smile.fr>
Date: Wed, 8 Feb 2023 22:08:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20230208181933.3925279-1-peter@korsgaard.com>
 <20230208181933.3925279-2-peter@korsgaard.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230208181933.3925279-2-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GNlV0dqF2f4rnSm89/3AzyzWYkOIWj+x5h6Sr8Xiz8M=;
 b=x4Cqes4bGD9WpRjL/81zHQUOTIRLt7uDXxJLmvO1nJbxla1r+ugBkLWOdZ2X+h6hNY
 WYNsFosoS+/fu2h8c/BxmATdw4ClNH9ae++PNlKq3fyMvHvNWUTMLd3QwP/LN65diCer
 4WVpoxZNhWtFHdGu7zgnEFGPFNR2IfjsLtsb49hL1Atn6gnFz5bwfguxdvps+0vk7Eh/
 PD7YicwbXU8dy6zPyro+a2SQy0AakVUdnpYDWwXC8x+2TsArkxYS+LBHsxV9OZx+upbC
 jy0t96Kadndsms7H4FBdyXe6gdFH8HKMbcF/GcE27BQ/KEf3R7tc/9oOn+CYRQTvH/Nc
 kfzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=x4Cqes4b
Subject: Re: [Buildroot] [PATCH 2/5] package/aubio: drop
 AUBIO_REMOVE_OLD_WAF hook
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDgvMDIvMjAyMyDDoCAxOToxOSwgUGV0ZXIgS29yc2dhYXJkIGEgw6ljcml0wqA6Cj4gQXMg
dGhhdCBpcyBub3cgaGFuZGxlZCBieSB0aGUgd2FmLXBhY2thZ2UgaW5mcmFzdHJ1Y3R1cmUuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgoK
UmV2aWV3ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKCj4gLS0t
Cj4gIHBhY2thZ2UvYXViaW8vYXViaW8ubWsgfCA2IC0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9hdWJpby9hdWJpby5tayBi
L3BhY2thZ2UvYXViaW8vYXViaW8ubWsKPiBpbmRleCBjOTk1ZmRmYWM3Li42NDE3NGExMTNkIDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvYXViaW8vYXViaW8ubWsKPiArKysgYi9wYWNrYWdlL2F1Ymlv
L2F1YmlvLm1rCj4gQEAgLTIxLDEyICsyMSw2IEBAIEFVQklPX0NPTkZfT1BUUyA9IFwKPiAgIyBo
dHRwczovL2dpdGh1Yi5jb20vamFja2F1ZGlvL2phY2syL2lzc3Vlcy84OTgKPiAgQVVCSU9fTkVF
RFNfRVhURVJOQUxfV0FGID0gWUVTCj4gIAo+IC0jIFRoZSBvbGQgd2FmIHNjcmlwdCBidW5kbGVk
IGluIGF1YmlvIDAuNC45IG5lZWQgdG8gYmUgcmVtb3ZlZCBmaXJzdC4KPiAtZGVmaW5lIEFVQklP
X1JFTU9WRV9PTERfV0FGCj4gLQkkKFJNKSAtZnIgJChARCkvd2FmICQoQEQpL3dhZmxpYgo+IC1l
bmRlZgo+IC1BVUJJT19QT1NUX0VYVFJBQ1RfSE9PS1MgPSBBVUJJT19SRU1PVkVfT0xEX1dBRgoK
Tm90ZTogdGhlIHBrZy13YWcgdXNlIGEgUFJFX0NPTkZJR1VSRV9IT09LUyBpbnN0ZWFkIG9mIFBP
U1RfRVhUUkFDVF9IT09LUy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAtCj4gICMgQWRkIC0t
bm90ZXN0cyBmb3IgZWFjaCBidWlsZCBzdGVwIHRvIGF2b2lkIHJ1bm5pbmcgdW5pdCB0ZXN0cyBv
biB0aGUKPiAgIyBidWlsZCBtYWNoaW5lLgo+ICBBVUJJT19XQUZfT1BUUyA9IC0tbm90ZXN0cwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
