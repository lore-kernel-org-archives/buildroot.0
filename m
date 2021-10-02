Return-Path: <SRS0=UKoJ=OW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C55B2C433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 19:24:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4455161B40
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 19:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4455161B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC00040695;
	Sat,  2 Oct 2021 19:24:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2FB1DPVv72ez; Sat,  2 Oct 2021 19:24:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47FAF4068D;
	Sat,  2 Oct 2021 19:24:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA5D41BF356
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 19:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8FA860883
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 19:24:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-VvKaldb2iA for <buildroot@lists.busybox.net>;
 Sat,  2 Oct 2021 19:24:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0258D6084A
 for <buildroot@buildroot.org>; Sat,  2 Oct 2021 19:24:03 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 b136-20020a1c808e000000b0030d60716239so528158wmd.4
 for <buildroot@buildroot.org>; Sat, 02 Oct 2021 12:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=2qr/7l1OboddcqacP77KzU4BalZEW64nuEoT856suiE=;
 b=KQlHHcjTU1jQ1xidihcJe83P8tcw8M0F96gDVel1qTx7mfc/ctrYbibVClwYf0niPa
 YEqen17bM0gKl0QXn8iex532w9V9O9d1So6R//rPbaBDhm2LS2JfloTj/MXjaWbrWR3K
 km1Ah33X0tSy+SYdrp8fk0lj1VuF3OIffzfFeZAjiYpaH1AAd3+m94evluBftvH/SzpJ
 gk2TU5KbT8BDtwXsHUif+2WCpy1yQm2z+Kmfbj87gbjmkxrVnCrX0ZZrBhSrI1y0eKqt
 PZb4SgrHSRrRQslWlhv4xQgmzyJnDVCwxZtHZ3TDnQ/u1u94+dsWORGVBboEjhFYbpoU
 xG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=2qr/7l1OboddcqacP77KzU4BalZEW64nuEoT856suiE=;
 b=FTVIPlGVrv4k41TI5M+nak2gR1OrRVVmsoG49d7KgVJv1HPZKle5C6HQEeC/Y9GQo6
 KyL4sSYl2wOCxlPbtoJT1ma7CkW814NK3Tjgsrzphob93f3DR+8FM45eN5Q13mYW6WeP
 9HPUGKk0F4xyK2JyGpgqd1xMmGnJe1oibtXzNQfmi3ue9fdMxF/jb3xlrXbC2J2qti+D
 jnYKM+j2V7l2+WR67RxbuRIw2xDT33q+EJAfkXeYNHaLGFpRWQ9I+wkundiOg8IUaWO7
 wiWRYlxOzu9TRYsetYFL/GgCiP0cyaTjVCY5QhlQJWy7dWlJbkNZC/ILm21UMOV3CWb9
 pxmA==
X-Gm-Message-State: AOAM531g+e+L20qigWf+nSbkpI3ICZS24LdbrasQfSAX6E300VCShld1
 2N3B3xUq4Zoi1k6s1m6fE1g=
X-Google-Smtp-Source: ABdhPJyu6DUHM/8k08CL46k8Um/4dWjEja2k35B0al1jMbFxIh5dBFuNPge+MyLvohS3F3+X0iPzxA==
X-Received: by 2002:a1c:8045:: with SMTP id b66mr10540192wmd.189.1633202642095; 
 Sat, 02 Oct 2021 12:24:02 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id g188sm4940583wmg.46.2021.10.02.12.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 12:24:01 -0700 (PDT)
Date: Sat, 2 Oct 2021 21:23:58 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <YVixzsDuSTPyq6as@pevik>
References: <20210928195533.1736944-1-mmayer@broadcom.com>
 <a87c586e-1e73-a3e3-7722-c56e48809d76@mind.be>
 <YVTIghzHs82uFBIe@pevik>
 <20211001175329.GA1973888@lbrmn-mmayer.ric.broadcom.net>
 <20211001181710.GW1504958@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211001181710.GW1504958@scaer>
Subject: Re: [Buildroot] [PATCH 0/1] Build issue related to "command -v"
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: David Laight <David.Laight@aculab.com>, Markus Mayer <mmayer@broadcom.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

PiBNYXJrdXMsIEFsbCwKCj4gT24gMjAyMS0xMC0wMSAxMDo1MyAtMDcwMCwgTWFya3VzIE1heWVy
IHZpYSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+ID4gT24gV2VkLCBTZXAgMjksIDIwMjEgYXQg
MTA6MTE6NDZQTSArMDIwMCwgUGV0ciBWb3JlbCB3cm90ZToKPiA+ID4gSGkgTWFya3VzLCBBcm5v
dXQsIGFsbCwKPiA+ID4gPiAgVGhhbmsgeW91IGZvciB0aGlzIGV4dGVuc2l2ZSBpbnZlc3RpZ2F0
aW9uIQoKPiBZZXMsIHRoYW5rcyBmb3IgdGhlIGludmVzdGlnYXRpb24gYW5kIHRoZSBleHRlbnNp
dmUgZmVlZGJhY2suIPCfkY0KCj4gPiBZb3UgYXJlIHdlbGNvbWUuIEl0IHdhcyBhbiBpbnRlcmVz
dGluZyBvbmUgYXMgeW91IGNhbiBwcm9iYWJseQo+ID4gaW1hZ2luZS4gOi0pCgo+IFllcywgSSBj
YW4gLiA7LSkKCj4gPiA+ID4gT24gMjgvMDkvMjAyMSAyMTo1NSwgTWFya3VzIE1heWVyIHdyb3Rl
Ogo+ID4gPiA+ID4gQWZ0ZXIgY29tbWl0IGNhNmEyOTA3YzI3Y1sxXSwgb3VyIGF1dG9tYXRlZCBu
aWdodGx5IGJ1aWxkcwo+ID4gPiA+ID4gc3RhcnRlZCBleHBlcmllbmNpbmcgYnVpbGQgZmFpbHVy
ZXMuCgo+IEkndmUganVzdCByZXZlcnRlZCB0aGUgdHdvIGNvbW1pdHMsIGJlY2F1c2UgdGhlIGNo
YW5nZSB3YXMgcmFpc2luZyBhIGZldwo+IG90aGVyIGlzc3VlczoKPiAgICAgaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjExMDAxMTgwMzA0LkdWMTUwNDk1OEBzY2Flci9ULyNt
M2E4ZjM2YmQ3NmVjN2Q4ZTUwMzhhNmM4OTMyYmI2ZmZlMjNlYTI2OAoKWWFubiwKCnRoYW5rcyBm
b3IgcXVpY2sgcmV2ZXJ0IHRvIGZpeCBwcm9ibGVtcyEKCktpbmQgcmVnYXJkcywKUGV0cgoKPiBS
ZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
