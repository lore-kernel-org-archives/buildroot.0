Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AEAC5478C
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 21:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28D9940852;
	Sat,  2 Mar 2024 21:54:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J-p9riyM9kjF; Sat,  2 Mar 2024 21:54:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2221F40867
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2221F40867;
	Sat,  2 Mar 2024 21:54:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6398A1BF2BA
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 21:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FD3F40131
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 21:54:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MgxO-hdpRGQT for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 21:54:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 315DF400C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 315DF400C4
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 315DF400C4
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 21:54:08 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33e162b1b71so2143125f8f.1
 for <buildroot@buildroot.org>; Sat, 02 Mar 2024 13:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709416446; x=1710021246;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OlWM8B2/KTTGEYeohJNdx35yKct6TiZpLb3Bhs9MKf8=;
 b=fCu88jHKl2gM9gBrq2W1t1RqcyKqFXsejQOz16ZiBToihbrer6ySMLW4yYvcMQj4sm
 59/z1b6Qp2xrcfHTqL9ZF9UtHy5Vxx5tsdwhPuAueKnrAvly7qnfD98pt26SL9aRxi9u
 C6O54/1dezV2TR9f8q5KsBIHOHfZCeRv6mfWP5OwElVLFzjOLUcLGPPYjRd0uBBp6T12
 JYI4HkqWmyfmG/xt4qyf0HExpbhbOMggTGYEpSuLBPAsD4RJg4OgQ6N8EtoJ+C09AW4S
 hW04P8h8D+wpbH49r9GNvpqRGNuELAe50ZPSvrOnEs5TPH0oixpT/NZg4GqMsCUGGq3d
 EAnA==
X-Gm-Message-State: AOJu0YzRSaf0aCsbPg7DayEZJ+gvRqIBFSGKRgE7zFydUJcNYniAYZ6O
 NSkz+tY/vcpudRPvfSvETyeKJHRiDAmfpYQx6nj0Dd/M8W8+dGz43Ei1GFZjrQE=
X-Google-Smtp-Source: AGHT+IEZ+ihx2StUI/0AMpd1LdXHuvdJMpPRRVioR0m057kU43GyWcEIMtBiUR8nErTXUcItU2LrXA==
X-Received: by 2002:a5d:6443:0:b0:33d:7e76:3080 with SMTP id
 d3-20020a5d6443000000b0033d7e763080mr4060420wrw.53.1709416446446; 
 Sat, 02 Mar 2024 13:54:06 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c220700b00412b65672d2sm11750320wml.9.2024.03.02.13.54.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Mar 2024 13:54:06 -0800 (PST)
Message-ID: <a760fba9-8f33-4184-8640-fef49efe36a5@smile.fr>
Date: Sat, 2 Mar 2024 22:54:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240229224122.1085300-1-romain.naour@smile.fr>
 <20240229224122.1085300-3-romain.naour@smile.fr> <ZeOd3DPvi0lZy5pU@landeda>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <ZeOd3DPvi0lZy5pU@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709416446; x=1710021246;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OlWM8B2/KTTGEYeohJNdx35yKct6TiZpLb3Bhs9MKf8=;
 b=f4uj0CKF9Z6a2qBHcbdv5W7Ci5UfzhO8Sz9/7qAPDOPw+juV7ONAsdHrA4Mi2Yqh0h
 UKlHnjYtR/IQqnwHsInb37y55JQAoo/aMUIIWQ3Erbe/9iEwmHeWxiwIweuW6+HgXf5+
 U6TvdrIppUXD884KHuleej7jKSm+/RWi3phrnnm+apjjvx3/5vlQQSMopys2ka6kVDGm
 3veOoO9Lt+RB241Mq3Y8cmpDPbXGo3d+6QtV19njbSabQOTxazytqZBUKf7p25SCmdtG
 sVw/nym20w8+iA7Ysk3X0i7cbAY/jtW1uyvS5DiK6hitLzOrVymezueo2Kn0tCuIhmHz
 hjyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=f4uj0CKF
Subject: Re: [Buildroot] [PATCH v2 3/3] package/rust: provide RUSTFLAGS for
 cargo
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCkxlIDAyLzAzLzIwMjQgw6AgMjI6NDUsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiBSb21haW4sIEFsbCwKPiAKPiBPbiAyMDI0LTAyLTI5IDIzOjQxICswMTAwLCBSb21h
aW4gTmFvdXIgc3Bha2UgdGh1c2x5Ogo+PiBXaGlsZSBidWlsZGluZyB0aGUgcnVzdCB0b29sY2hh
aW4sIHRoZSBidWlsZCBzeXN0ZW0gZW5kdXAgdXNpbmcKPj4gY2FyZ28gKGZyb20gWy4uLl0vb3V0
cHV0L2J1aWxkL2hvc3QtcnVzdC1iaW4tMS43NC4xL2NhcmdvL2Jpbi9jYXJnbykKPj4gdG8gYnVp
bGQgc29tZSB0b29sIGxpa2UgcnVzdGRvYy10b29sLgo+Pgo+PiBCdXQgdGhlIGhvc3QtcnVzdCBw
YWNrYWdlIGRvZXNuJ3QgdXNlIHRoZSBjYXJnbyBpbmZyYWN0cnVjdHVyZSAoc2luY2UKPj4gaXQg
cHJvdmlkZSBjYXJnbyBiaW5hcnkpIGFuZCBzb21lIGNhcmdvIGVudmlyb25tZW50IHZhcmlhbGJs
ZSBbMV0gaXMKPj4gbm90IHNldCB0byBjcm9zc2NvbXBpbGUgY2FyZ28gcGFja2FnZXMgaW4gdGhl
IHJ1c3QgdG9vbGNoYWluLgo+Pgo+PiBGb3IgZXhlbXBsZSwgd2UgdXN1YWxseSBzZXQgUlVTVEZM
QUdTPSItQyBsaW5rLWFyZz0tV2wsLXJwYXRoLCQoSE9TVF9ESVIpL2xpYiIKPj4gdG8gZm9yY2Ug
Y2FyZ28gdXNpbmcgbGlicmFyaWVzIHByb3ZpZGVkIGJ5IEJ1aWxkcm9vdCBpbiAkKEhPU1RfRElS
KS9saWIuCj4+Cj4+IFJVU1RGTEFHUyBpcyBhY3R1YWxseSBuZWVkZWQgdG8gZmluZCB6bGliIGxp
YnJhcnkgKGhvc3QtemxpYikgdG8gbGluawo+PiBydXN0ZG9jLXRvb2wgd2hlbiB6bGliIGlzIG5v
dCBpbnN0YWxsZWQgb24gdGhlIGhvc3QuCj4+Cj4+IEZpeGVzOgo+Pgo+PiAgIGVycm9yOiBjb3Vs
ZCBub3QgY29tcGlsZSBgcnVzdGRvYy10b29sYCAoYmluICJydXN0ZG9jX3Rvb2xfYmluYXJ5Iikg
ZHVlIHRvIHByZXZpb3VzIGVycm9yCj4+Cj4+IFsxXSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRy
b290Lm9yZy9idWlsZHJvb3QvLS9ibG9iLzIwMjQuMDItcmMxL3BhY2thZ2UvcGtnLWNhcmdvLm1r
P3JlZl90eXBlPXRhZ3MjTDE2Nwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJv
bWFpbi5uYW91ckBzbWlsZS5mcj4KPj4gLS0tCj4+IHYyOiBubyBjaGFuZ2UKPj4gLS0tCj4+ICBw
YWNrYWdlL3J1c3QvcnVzdC5tayB8IDQgKysrLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ydXN0L3J1
c3QubWsgYi9wYWNrYWdlL3J1c3QvcnVzdC5tawo+PiBpbmRleCA0OTAzMDYwMzY4Li4zOTRmYmZh
NGNhIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3J1c3QvcnVzdC5tawo+PiArKysgYi9wYWNrYWdl
L3J1c3QvcnVzdC5tawo+PiBAQCAtNzAsNyArNzAsOSBAQCBkZWZpbmUgSE9TVF9SVVNUX0NPTkZJ
R1VSRV9DTURTCj4+ICBlbmRlZgo+PiAgCj4+ICBkZWZpbmUgSE9TVF9SVVNUX0JVSUxEX0NNRFMK
Pj4gLQljZCAkKEBEKTsgJChIT1NUX01BS0VfRU5WKSAkKEhPU1RfRElSKS9iaW4vcHl0aG9uJChQ
WVRIT04zX1ZFUlNJT05fTUFKT1IpIHgucHkgYnVpbGQKPj4gKwljZCAkKEBEKTsgJChIT1NUX01B
S0VfRU5WKSBcCj4+ICsJCVJVU1RGTEFHUz0iJChhZGRwcmVmaXggLUMgbGluay1hcmdzPSwkKEhP
U1RfTERGTEFHUykpIiBcCj4gCj4gV2h5IGRvbid0IHdlIGpzdXQgcGFzcyAkKEhPU1RfUEtHX0NB
UkdPX0VOVik/IFRoYXQgb25lIGFsc28gY29udGFpbnMKPiBDQVJHT19IT01FPSQoRExfRElSKS9i
ci1jYXJnby1ob21lIHNvIEkgdGhpbmsgaXQgbWlnaHQgbWFrZSBzZW5zZSB0bwo+IHBhc3MsIG5v
PwoKSSBkaWRuJ3QgdmVyaWZ5IGlmIENBUkdPX0hPTUUgaXMgcmVhbGx5IG1pc3NpbmcuIEFsc28g
SE9TVF9QS0dfQ0FSR09fRU5WIGlzCmRlZmluZWQgYnkgdGhlIGNhcmdvIHBhY2thZ2UgaW5mcmEg
KHBrZy1jYXJnby5taykgd2hpbGUgaG9zdC1ydXN0IGlzIGEKaG9zdC1nZW5lcmljIHBhY2thZ2Uu
CgpPdGhlcndpc2UsIEknbSBhZ3JlZS4gV2Ugc2hvdWxkIHVzZSAkKEhPU1RfUEtHX0NBUkdPX0VO
VikKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4u
Cj4gCj4+ICsJCSQoSE9TVF9ESVIpL2Jpbi9weXRob24kKFBZVEhPTjNfVkVSU0lPTl9NQUpPUikg
eC5weSBidWlsZAo+PiAgZW5kZWYKPj4gIAo+PiAgSE9TVF9SVVNUX0lOU1RBTExfT1BUUyA9IFwK
Pj4gLS0gCj4+IDIuNDMuMgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
