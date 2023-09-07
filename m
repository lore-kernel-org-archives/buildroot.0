Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07C1EE14DE
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 11:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D9D141BD5;
	Thu,  7 Sep 2023 11:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D9D141BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pd_pLPnGxLwr; Thu,  7 Sep 2023 11:03:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37032402CD;
	Thu,  7 Sep 2023 11:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37032402CD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30FB01BF41A
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 11:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 025A44028D
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 11:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 025A44028D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id auArMmWs8ISh for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 11:03:12 +0000 (UTC)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24A79401E5
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 11:03:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24A79401E5
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2bcb89b4767so14497711fa.3
 for <buildroot@buildroot.org>; Thu, 07 Sep 2023 04:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694084589; x=1694689389;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NeIMKh7rPfXDe5w6HD9msa2uhTAbiI9MJbjl5c2Wm2M=;
 b=Jnd4kuLumIEI1Lp8O9jWYPee4SOJ02vVPXx7wTJ1mUs0MrtluwoYkSl9Q4gvhJQQCv
 hXd0xTn7REQ1a7vNRF9AVlRLb+aS32giNF6hgAlYktHlZExe6JGQCHlL0ipkCrREASjd
 Ipi8xXS9FKq5nnd4HCN7L4MHI+qCBw2xzmN77v6wer7zly6txTcnuQoSAFx2p4uAdXMb
 J27jTvY71ose1poxh26mNA35FzZCQwu8CtdLevX5cEnKF1JmPzdq617rOzDdZLzgmKJr
 7bG3+X8BiZsGVE2+TmfNudCEG6mRmiEugRRZ1Y6gt0I5rl5kmF1M/1fUiIJxy5QGHWOl
 kmJw==
X-Gm-Message-State: AOJu0Yx1/zEwB+YSHnVa32XJDrU2pEHMD1+tHyAdtgvMHV0kd/Em7DNe
 m+Xl6aOWPzDJvQ3HShpn7gQxaWx62c58mtkw+8xWFw==
X-Google-Smtp-Source: AGHT+IEjrwuIIHCH1Zdl5aD7c9fK7zm99fFnsoh6E1wj6xGlOFoCWIGdkozMtw0pQb0RoFhXqGzTTA==
X-Received: by 2002:a2e:b0f6:0:b0:2bd:1908:4432 with SMTP id
 h22-20020a2eb0f6000000b002bd19084432mr4315387ljl.3.1694084589413; 
 Thu, 07 Sep 2023 04:03:09 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 h18-20020a1709066d9200b0099b5a71b0bfsm10311598ejt.94.2023.09.07.04.03.08
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 04:03:08 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-52a5c0d949eso1053869a12.0
 for <buildroot@buildroot.org>; Thu, 07 Sep 2023 04:03:08 -0700 (PDT)
X-Received: by 2002:a50:fe8e:0:b0:522:c1b1:8cb0 with SMTP id
 d14-20020a50fe8e000000b00522c1b18cb0mr4087823edt.33.1694084588366; Thu, 07
 Sep 2023 04:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <0a92454be5519ae93ca3c07770bc9cf8c0b6c19d.1694078576.git.stefan@agner.ch>
 <d913f7da2bb9720535c0e1826960d01fb1c53e3f.1694078576.git.stefan@agner.ch>
In-Reply-To: <d913f7da2bb9720535c0e1826960d01fb1c53e3f.1694078576.git.stefan@agner.ch>
Date: Thu, 7 Sep 2023 04:02:57 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rUeZGGLX+OkupfMAbnEC_J0TKwB5bpR-CEYi2Wo3m=Og@mail.gmail.com>
Message-ID: <CA+h8R2rUeZGGLX+OkupfMAbnEC_J0TKwB5bpR-CEYi2Wo3m=Og@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1694084589; x=1694689389; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NeIMKh7rPfXDe5w6HD9msa2uhTAbiI9MJbjl5c2Wm2M=;
 b=X/lKI89vBykVn9Mtt7INQqIhDqzhwHCDazdNJm0ve1DRrM1eXLeU+B125E/flcVKHj
 4QqAKVFBB485aO0x7w4HqxdBKW2U+W6lLRrgY1hd/IbwsovHIJcwtGJVFPYZLcdzo0xc
 kYv86K0d+bCjdABf7wvCGiiq0ey5BRDQKNLtAmFWoEbB4afCaRFW9LdkXExXH+ZXDVbm
 gVIc6a2DFDzoRPTc+P6TM/FlekwzakxeE2dyJozxfWEjQY+Cqgj6kFDgx3xbrRxP7W/8
 BdAKbHO4NEW66VT7HmQxMlTe5oLVVHIlpF0RqhZSmQlzMll7FQbSWS3it+/D6REb/JGG
 DNrg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=X/lKI89v
Subject: Re: [Buildroot] [PATCH] package/docker-cli: bump version to v24.0.6
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpPbiBUaHUsIFNlcCA3LCAyMDIzIGF0IDI6MjPigK9BTSBTdGVmYW4gQWduZXIgPHN0ZWZh
bkBhZ25lci5jaD4gd3JvdGU6Cj4KPiBCdWcgZml4ZXMgaW4gY29udGFpbmVyZCBzdG9yYWdlIGJh
Y2tlbmQgYW5kIERvY2tlciBpdHNlbGYgYW5kIGEgc2luZ2xlCj4gbmV3IHdhcm5pbmcgYWJvdXQg
b2xkIERvY2tlciBpbWFnZSBmb3JtYXQgZGVwcmVjYXRpb24uCj4KPiBodHRwczovL2dpdGh1Yi5j
b20vbW9ieS9tb2J5L3JlbGVhc2VzL3RhZy92MjQuMC42Cj4KPiBTaWduZWQtb2ZmLWJ5OiBTdGVm
YW4gQWduZXIgPHN0ZWZhbkBhZ25lci5jaD4KPiAtLS0KPiAgcGFja2FnZS9kb2NrZXItY2xpL2Rv
Y2tlci1jbGkuaGFzaCB8IDIgKy0KPiAgcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkubWsg
ICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9kb2NrZXItY2xpL2RvY2tlci1jbGkuaGFzaCBi
L3BhY2thZ2UvZG9ja2VyLWNsaS9kb2NrZXItY2xpLmhhc2gKPiBpbmRleCA5NTA1MGJlODhiLi41
ZDhjMWIwZjU5IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZG9ja2VyLWNsaS9kb2NrZXItY2xpLmhh
c2gKPiArKysgYi9wYWNrYWdlL2RvY2tlci1jbGkvZG9ja2VyLWNsaS5oYXNoCj4gQEAgLTEsMyAr
MSwzIEBACj4gICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gLXNoYTI1NiAgZmEzMmI1ZjNjMmY4NWZi
YTllZjZlMWI1MDk5YTRiNjA4ZmEyMGFmNDViYTcxYjNkYTIxOTRlODcyODAzN2VlYyAgZG9ja2Vy
LWNsaS0yNC4wLjUudGFyLmd6Cj4gK3NoYTI1NiAgYzFhNGE1ODBjZWQzNjMzZTQ4OWM1Yzk4Njlh
MjAxOTg0MTVkYTQ0ZGY3MDIzZmRjMjAwZDQyNWNkZjVmYTY1MiAgZG9ja2VyLWNsaS0yNC4wLjYu
dGFyLmd6Cj4gIHNoYTI1NiAgMmQ4MWVhMDYwODI1MDA2ZmM4ZjNmZTI4YWE1ZGMwZmZlYjgwZmFm
MzI1YjYxMmM5NTUyMjkxNTdiOGMxMGRjMCAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2RvY2tlci1jbGkvZG9ja2VyLWNsaS5tayBiL3BhY2thZ2UvZG9ja2VyLWNsaS9kb2NrZXItY2xp
Lm1rCj4gaW5kZXggNGMzOGU3Y2JhNS4uNTNjOWRkYjZiOCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdl
L2RvY2tlci1jbGkvZG9ja2VyLWNsaS5tawo+ICsrKyBiL3BhY2thZ2UvZG9ja2VyLWNsaS9kb2Nr
ZXItY2xpLm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKPgo+IC1ET0NLRVJfQ0xJX1ZFUlNJT04gPSAyNC4wLjUKPiArRE9DS0VSX0NMSV9WRVJTSU9O
ID0gMjQuMC42Cj4gIERPQ0tFUl9DTElfU0lURSA9ICQoY2FsbCBnaXRodWIsZG9ja2VyLGNsaSx2
JChET0NLRVJfQ0xJX1ZFUlNJT04pClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hy
aXN0aWFuQGFwZXJ0dXJlLnVzPgoKVGhhbmtzIQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
