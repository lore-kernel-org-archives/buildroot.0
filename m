Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89B1C0015E
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 04:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E48CA41FD7;
	Fri, 28 Jul 2023 04:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E48CA41FD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f94xaUTG_-gL; Fri, 28 Jul 2023 04:24:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCC4A41FE3;
	Fri, 28 Jul 2023 04:24:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCC4A41FE3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A1AED1BF3ED
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 04:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AD5560F17
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 04:24:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AD5560F17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EokxcArr1Ryk for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 04:24:55 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5655C60ACD
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 04:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5655C60ACD
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5221b90f763so2150185a12.0
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690518293; x=1691123093;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xEtWXYsIjWfD/AFrq2F+PvlDzRxYhFbZoKUDFjxF8Vk=;
 b=YIHoUkwG5JbRfPy+IEOnw6jzZCs1aSvFHNlxBGtJauODUK3U0cnf3ZnYv1U74wn+Kh
 nbjbpVbxZYHW8MCKqVHylJ97RhGLKWTnKADaUkzOCrTrXdHXlmncOwqwlOztYPGBMMQm
 iAGaEWhqEYFtKzrINw8UuLHCpI0xiB0UYmcGbzMizZp1a1BRoySIv5Rae11EHqxVGHHe
 5mElyPoykh5hqd0ovYG18NlaNRZMBcVi9n5XI2EZI7KA06hc7dDn4lTwYowqprUymliq
 aXo/7+7JHL4VqAvsx6sBj/mHTiHwxgZJZGdYMxX4upm72B4bQebb56MBqbZfKS+o0icH
 ILXw==
X-Gm-Message-State: ABy/qLZQCtBFfMLeQbL2+H6/490ycALj95kk9XRzy5emHiG9G/UKQBZg
 2RqodEFYFNGjKRyVNLTzaDqY0HvmIhiDea8SGNDWB2Fl
X-Google-Smtp-Source: APBJJlE9qv7jS3sUmIe+zRVQyNr0lGFB0T0oylLQ4n/kfv/TZaONXiV7JIoPMsbzKJMqKmWMDOwIWA==
X-Received: by 2002:aa7:d549:0:b0:522:3855:7ec5 with SMTP id
 u9-20020aa7d549000000b0052238557ec5mr737610edr.10.1690518292910; 
 Thu, 27 Jul 2023 21:24:52 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 g7-20020aa7c847000000b0051e2549c4f9sm1360987edt.47.2023.07.27.21.24.51
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 21:24:52 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5221c6a2d3dso2127472a12.3
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:24:51 -0700 (PDT)
X-Received: by 2002:a17:906:8a57:b0:99b:bc51:8ca7 with SMTP id
 gx23-20020a1709068a5700b0099bbc518ca7mr976814ejc.1.1690518291527; Thu, 27 Jul
 2023 21:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230721213121.178783-1-romain.naour@gmail.com>
 <20230722232630.1c759813@windsurf>
 <CA+h8R2qhnFzK8WQOVQNi=etMhKyg=hFhyBcRHPu7NYg5S=kjWA@mail.gmail.com>
 <dbadbf67-797f-ad6f-d519-35567417a291@smile.fr>
 <CA+h8R2oZ=oEr8hrJbHqw1K6AnBb__w1u6PGPmDUSONVb0Q0f6g@mail.gmail.com>
 <CA+h8R2p0VrrNpSA=sMqs5C8bpe41L9sOfo_5z6E8X9z6T_m9-w@mail.gmail.com>
In-Reply-To: <CA+h8R2p0VrrNpSA=sMqs5C8bpe41L9sOfo_5z6E8X9z6T_m9-w@mail.gmail.com>
Date: Thu, 27 Jul 2023 21:24:40 -0700
X-Gmail-Original-Message-ID: <CA+h8R2qm2i94fcggkXvScyv9unAWa6S6pF8TwYWTQLPt=r9eDw@mail.gmail.com>
Message-ID: <CA+h8R2qm2i94fcggkXvScyv9unAWa6S6pF8TwYWTQLPt=r9eDw@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690518293; x=1691123093;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xEtWXYsIjWfD/AFrq2F+PvlDzRxYhFbZoKUDFjxF8Vk=;
 b=TyN3khlMNp3knBUjaf18gAI1GqnriGCvO2/XZfe2om7/O3pflODk827P1sH53+zsev
 tOJhS/A1TvYv+qs49EF6OKAK/zlVWE+bQQX1Apt/zvJ/Oy3CYZTVEym2yoB6quarr7FJ
 H0+H7YUC9dIKGobF2ABXQAx8J0z6AUxa3QwG2EC7ksokP4GcsWLFtDtrsaaWsNH6jppA
 wml8hUkuVVlvHN/Xl82YWNlIfsFLU7Sqbv+BrECspohIf9MUq5GYrnEdNCAN0TBpGN/A
 c3lntWbE6q1kP9nk+hNR8SI3ZwwL/qMHe7hfG2Roz1CpcrR5k1FrRgNRpCYYSXpMZljl
 yxmA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=TyN3khlM
Subject: Re: [Buildroot] [PATCH] package/util-linux: bump version to 2.39.1
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLAoKT24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgMjozM+KAr1BNIENocmlzdGlhbiBTdGV3
YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+IE9uIFRodSwgSnVsIDI3LCAyMDIz
IGF0IDI6MjDigK9QTSBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVzPiB3
cm90ZToKPiA+IE9uIFRodSwgSnVsIDI3LCAyMDIzIGF0IDE6NDfigK9QTSBSb21haW4gTmFvdXIg
PHJvbWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6Cj4gPiA+IEl0IHNlZW1zIHRoZSBnbyBib290
c3RyYXAgZG9lc24ndCB3b3JrIGV2ZW4gYWZ0ZXIgR28gMS4yMC54IG1lcmdlLAo+ID4gPiBzZWUg
WzFdCgo+ID4gV2lsbCBjaGVjayBpbnRvIHdoeSB0aGlzIENJIGpvYiBmYWlsZWQgcmlnaHQgYXdh
eS4KCj4gPgo+ID4gPiA+Pj4gaG9zdC1nbyAxLjIwLjYgQnVpbGRpbmcKPiA+ID4gLi4uCj4gPiA+
IEJ1aWxkaW5nIEdvIHRvb2xjaGFpbjEgdXNpbmcgWy4uLl10ZXN0LW91dHB1dC9UZXN0TWVuZGVy
L2hvc3QvbGliL2dvLTEuMTkuMTAuCj4gPiA+IGVycm9yIG9idGFpbmluZyBWQ1Mgc3RhdHVzOiBl
eGl0IHN0YXR1cyAxMjgKPiA+ID4gICAgICAgICBVc2UgLWJ1aWxkdmNzPWZhbHNlIHRvIGRpc2Fi
bGUgVkNTIHN0YW1waW5nLgo+ID4gPgo+ID4gPiBbMV0gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxk
cm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy80NzI1MTg2NTI1CgpJdCB0b29rIG1lIGEgbG9uZyB0
aW1lIHRvIGZpbmQgYSByZXByb2R1Y3Rpb24gZm9yIHRoaXMgaXNzdWUsCgpJIGZpbmFsbHkgdHJh
Y2VkIGl0OiBpZiB0aGVyZSBpcyBhbiBpbnZhbGlkIC5naXQgaW4gYW55IHBhcmVudApkaXJlY3Rv
cnkgb2YgdGhlIEdPUk9PVF9CT09UU1RSQVAsIHRoZSBidWlsZCB3aWxsIGZhaWwuIFJlcHJvZHVj
dGlvbjoKCmBgYAojIFRoaXMgcmVwcm9kdWN0aW9uIHNldHMgdXAgYSBkaXJlY3Rvcnkgc3RydWN0
dXJlIHRoYXQgYnJlYWtzIEdvIG1ha2UuYmFzaC4KIyBtYWtlLmJhc2ggc2hvdWxkIG5vdCBicmVh
ayBkdWUgdG8gLmdpdCBmaWxlcyBvdXRzaWRlIG9mIHRoZSBHbyBzb3VyY2VzLgojCiMgVGhlIGVy
cm9yIHNwZWNpZmljYWxseSBvY2N1cnMgd2hlbiBhbiBpbnZhbGlkIC5naXQgaXMgcHJlc2VudCBp
biBhIHBhcmVudCBnaXQKIyBkaXJlY3Rvcnkgb2YgdGhlIEdPUk9PVF9CT09UU1RSQVAuIEdvIGlz
c3VlICM2MTYyMApta2RpciBnby1pc3N1ZS02MTYyMApjZCAuL2dvLWlzc3VlLTYxNjIwCndnZXQg
aHR0cHM6Ly9nby5kZXYvZGwvZ28xLjE5LjExLnNyYy50YXIuZ3oKbWtkaXIgZ28tYm9vdHN0cmFw
CnRhciAteGYgZ28xLjE5LjExLnNyYy50YXIuZ3ogLUMgLi9nby1ib290c3RyYXAgLS1zdHJpcC1j
b21wb25lbnRzPTEKY2QgLi9nby1ib290c3RyYXAvc3JjLwpiYXNoIG1ha2UuYmFzaApjZCAuLi8u
Li8Kd2dldCBodHRwczovL2dvLmRldi9kbC9nbzEuMjAuNi5zcmMudGFyLmd6Cm1rZGlyIGdvCnRh
ciAteGYgZ28xLjIwLjYuc3JjLnRhci5neiAtQyAuL2dvLyAtLXN0cmlwLWNvbXBvbmVudHM9MQpw
cmludGYgImdpdGRpcjogLi4vLi4vZG9lcy9ub3QvZXhpc3QvLmdpdCIgPiAuLy5naXQKY2QgLi9n
by9zcmMvCkdPUk9PVF9CT09UU1RSQVA9JChwd2QpLy4uLy4uL2dvLWJvb3RzdHJhcC8gYmFzaCBt
YWtlLmJhc2gKIyBCdWlsZCBmYWlscyB1c2luZyAtYnVpbGR2Y3M9ZmFsc2UgZXJyb3JzLgpgYGAK
ClN1Ym1pdHRlZCB0byB0aGUgZ28gaXNzdWUgdHJhY2tlcjogaHR0cHM6Ly9naXRodWIuY29tL2dv
bGFuZy9nby9pc3N1ZXMvNjE2MjAKCkJlc3QgcmVnYXJkcywKQ2hyaXN0aWFuIFN0ZXdhcnQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
