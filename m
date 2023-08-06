Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF845C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6134760E46;
	Sun,  6 Aug 2023 21:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6134760E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ikFQUYyCVByw; Sun,  6 Aug 2023 21:26:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABAF160D65;
	Sun,  6 Aug 2023 21:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABAF160D65
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 704C11BF909
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E00A981765
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:25:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E00A981765
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0fEYQM4cV0wM for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:25:56 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B6A681314
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B6A681314
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-317744867a6so2905856f8f.1
 for <buildroot@buildroot.org>; Sun, 06 Aug 2023 14:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691357154; x=1691961954;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pTjrZKHa7EyZNenCFFYaR5QkH760YyPHF30m3ePc36s=;
 b=Q3vK8rXbq6vM10NbgxAoZ2CGVleiTPLtpadav3I+JM1IVG8Fxas+8skvr6e9H27i8x
 jAjP+odjUbeHihb+0IL32/RsZfRF3qIGQNJl/xCZdLMEDm2xTYTZPSQ4GnQJzsEzohnf
 fgQJcbAieysRsiMEkRwyzhQg1H6fBx+zEo8yghInj5Tl/C/SMkTCuthiAu6NPM+XRxR7
 Nr2iC6ZZXthR0t7KU89tD4xxswUntavVvzvJC/iHE7lVEoyW9CpRDbELa5erexnrZx4A
 nyA9QD4Apszj74iGlCbEn0k7PRMnnItcKjppEDPINqNoNno5VNCRU2W0fiDCB1jz/Mf2
 urQQ==
X-Gm-Message-State: AOJu0Yzv6vEvBwQ+W/Ez5n9+Q88tNi01yFaAVRFtg+wLE4CmKcrMXf5z
 g7IKmKAhdjx8cafSAxn7YmngFA==
X-Google-Smtp-Source: AGHT+IHZUz+UJO1OScN+ev47xr0ItylDaBH7CDv66USlCL+1VYhTsG8UZTG7tF++D6PkEdqzA8ZBvA==
X-Received: by 2002:adf:e802:0:b0:317:4755:9e3f with SMTP id
 o2-20020adfe802000000b0031747559e3fmr4280813wrm.62.1691357154514; 
 Sun, 06 Aug 2023 14:25:54 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:eeca:726b:991c:1980?
 (2a01cb05945b7e00eeca726b991c1980.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:eeca:726b:991c:1980])
 by smtp.gmail.com with ESMTPSA id
 h12-20020adff4cc000000b00314367cf43asm8417285wrp.106.2023.08.06.14.25.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Aug 2023 14:25:54 -0700 (PDT)
Message-ID: <2d73fe79-ae7c-6fab-defd-0d73cff598b8@smile.fr>
Date: Sun, 6 Aug 2023 23:25:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20230725142120.318785-1-james.hilliard1@gmail.com>
 <20230801102221.264475b0@windsurf>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230801102221.264475b0@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1691357154; x=1691961954;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pTjrZKHa7EyZNenCFFYaR5QkH760YyPHF30m3ePc36s=;
 b=t1fb8nWqHZ4/8i5Qy0lTWERoMFveNFGbj1GZxfBlmnqePVLx4mCXH88Yr6YBL6FqKf
 IIDM+2I0lK1wdlPVcmeXOfp0ajh9mBr+BhWBfgO4QpmVHo7LTMIX9nACgU/nILSfOP92
 ZkIwudq6YoU41WGQp7G+etksWOInbT4LlH5gqhDhxziFBszVUOwncbWVDdD9/WXdgc+K
 9gsOIzoxjNzbGRChURwszBy6KHiHVbth+rZPTQ2wGKCYlz6I+b4o/5yuISRjg4coLa9M
 gHcOjmMLRsCe7zfjloWaBeevLZ/vtpmW2AYy3oGUd5zbTMd2MCzP+snSYglz3hfvIlqG
 ZMUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=t1fb8nWq
Subject: Re: [Buildroot] [PATCH 1/1] package/python-urllib3: bump to version
 2.0.4
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLCBKYW1lcywgYWxsLAoKTGUgMDEvMDgvMjAyMyDDoCAxMDoyMiwgVGhvbWFz
IFBldGF6em9uaSB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gSGVsbG8gSmFtZXMsCj4gCj4g
T24gVHVlLCAyNSBKdWwgMjAyMyAwODoyMToyMCAtMDYwMAo+IEphbWVzIEhpbGxpYXJkIDxqYW1l
cy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPiAKPj4gTWlncmF0ZSBmcm9tIHNldHVwdG9v
bHMgdG8gaGF0Y2hsaW5nIHBlcDUxNyBidWlsZCBiYWNrZW5kLgo+Pgo+PiBMaWNlbnNlIGhhc2gg
Y2hhbmdlZCBkdWUgY29udHJpYnV0b3JzIGNoYW5nZToKPj4gaHR0cHM6Ly9naXRodWIuY29tL3Vy
bGxpYjMvdXJsbGliMy9jb21taXQvOGU5NDc1NGY4NWM1OWQ4MjZhYzA2MDRkMGRkMmEwYjQxODc0
YmIzNgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQx
QGdtYWlsLmNvbT4KPiAKPiBUaGlzIGNvbW1pdCBicmVha3MgdHdvIHRlc3QgY2FzZXM6Cj4gCj4g
ICAgIFRlc3RQeXRob25QeTNCb3RvMyAgICB8IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC8tL2pvYnMvNDc2ODU2MTQ4MSAgfCBPUlBIIAo+ICAgICBUZXN0UHl0aG9u
UHkzQm90b2NvcmUgfCBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qv
LS9qb2JzLzQ3Njg1NjE0ODIgIHwgT1JQSCAKPiAKPiBDb3VsZCB5b3UgcGxlYXNlIGhhdmUgYSBs
b29rPwoKRnJvbSBbMV0KSW1wb3J0RXJyb3I6IGNhbm5vdCBpbXBvcnQgbmFtZSAnREVGQVVMVF9D
SVBIRVJTJyBmcm9tICd1cmxsaWIzLnV0aWwuc3NsXycgaXMKZHVlIHRvIGJvdG9jb3JlIHdoaWNo
IGRvZXMgbm90IHN1cHBvcnQgdXJsbGliMyAyLjAgeWV0IFsyXS4KCkl0IHNlZW1zIG1hbnkgcHJv
amVjdHMgYXJlIGFubm95ZWQgYnkgdXJsbGliMyAxLnggdG8gMi4wIG1pZ3JhdGlvbi4KClNlZSBo
dHRwczovL2dpdGh1Yi5jb20vdXJsbGliMy91cmxsaWIzL2Jsb2IvbWFpbi9kb2NzL3YyLW1pZ3Jh
dGlvbi1ndWlkZS5yc3QKClsxXQpodHRwczovL2dpdGh1Yi5jb20vdXJsbGliMy91cmxsaWIzL2Js
b2IvbWFpbi9kb2NzL3YyLW1pZ3JhdGlvbi1ndWlkZS5yc3QjaW1wb3J0ZXJyb3ItY2Fubm90LWlt
cG9ydC1uYW1lLWRlZmF1bHRfY2lwaGVycy1mcm9tLXVybGxpYjN1dGlsc3NsXwpbMl0gaHR0cHM6
Ly9naXRodWIuY29tL2JvdG8vYm90b2NvcmUvaXNzdWVzLzI5MjEKCkJlc3QgcmVnYXJkcywKUm9t
YWluCgo+IAo+IFRoYW5rcyBhIGxvdCEKPiAKPiBUaG9tYXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
