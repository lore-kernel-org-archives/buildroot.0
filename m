Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83E2C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 13:16:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35D67610A3
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 13:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35D67610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1E2460747;
	Sun,  3 Oct 2021 13:16:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X8LLkhL9GFoX; Sun,  3 Oct 2021 13:16:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D0EC6078B;
	Sun,  3 Oct 2021 13:16:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D97BD1BF592
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 13:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5C826078B
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 13:16:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j-lYZs_aYT24 for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 13:16:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7854605D9
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 13:16:33 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v17so25066380wrv.9
 for <buildroot@buildroot.org>; Sun, 03 Oct 2021 06:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=w5RFfQ4eTEJ15V8IaSFmozNnfc5ZvyGcd7VpLntai74=;
 b=ku100TxT4er1YC6alM2sNDpkcAg8sKONtzLROnd6+ll9ejoBNEukHQTXN0wNTHBPty
 VFq5FuvM6X+mGoFqmNLTxwv0te8+zkeRXRYQ1F5FxPgRDV0ipFzPgroHURRL5ZseQD7h
 YIgtZb0Fm5iP1v/r7IAdq88XokfPNbPBMTsu5jiU9yhntJnThTqnN+uKmSmjAjooHYsl
 OHHbVVAc90bOuZcBxmZ5rRvFSs6SofpIvWn80nJ2tCHcHb/Spp887uawxWAz/rkibJYX
 lvPXvminHLdeM8deR6pShs/J6IpxID/z9vnEAD7cF7njj1mpD3I8monbUQAvRZvJCYJL
 8uhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=w5RFfQ4eTEJ15V8IaSFmozNnfc5ZvyGcd7VpLntai74=;
 b=WAiJ0EIfUNilRRV/3r/+8Ov9LbQtE4kYg+c1t6leWAdwxb3jGgGPqSG//yqOfJ/KbB
 vxLCaryrmGDWUgbHlcYm8w769zTPqpcXcJ+79x88fp9yqmfnQD4H+psyGuaI5nVEhAY8
 kk5g/X5ZcNeZvcG3TwObN8097DOy4OJYAAxVkwwpRDinvJ6vcEe5bh5+HA89WpSabCx7
 eW0OO8cJCB0g68IqotxGVk46OjXDmsHR95y0y5jvH1VonDa7LFqYiFOtJyBi89r/CHv9
 5zCA5my6JEjyLrNlpIuko2gqsCRw83MBjhzL3iBRxe7seliZN6M2UK8sbNMb0tHUvW54
 74jA==
X-Gm-Message-State: AOAM533XK8Y/uUaOqrptZuHB5G3pP3zfFgshRlS6CQIIlm3AVgCevseS
 GYKWtjRyTIIkKAa5dzuorLBjGexOjjQ=
X-Google-Smtp-Source: ABdhPJyEDatDIrrwGGjupkdYp9Ky8LDfOfVVNJP5/4jOlvzcEZTNFiH/ptQnAJ60qshU/JIiAeqwsA==
X-Received: by 2002:a5d:598c:: with SMTP id n12mr8307301wri.391.1633266992046; 
 Sun, 03 Oct 2021 06:16:32 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id f17sm11273530wrm.83.2021.10.03.06.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Oct 2021 06:16:31 -0700 (PDT)
Message-ID: <ccbea9df-a69b-8155-bdce-ad23b04f9f2b@gmail.com>
Date: Sun, 3 Oct 2021 15:16:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20210929220027.10505-1-romain.naour@gmail.com>
 <be59ca6e-1eee-a48b-809b-4dd815a7ac64@mind.be>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <be59ca6e-1eee-a48b-809b-4dd815a7ac64@mind.be>
Subject: Re: [Buildroot] [PATCH RFC] package/binutils: build deterministic
 archives by default
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXJub3V0LAoKTGUgMDMvMTAvMjAyMSDDoCAxMjoxNCwgQXJub3V0IFZhbmRlY2FwcGVs
bGUgYSDDqWNyaXTCoDoKPiAKPiAKPiBPbiAzMC8wOS8yMDIxIDAwOjAwLCBSb21haW4gTmFvdXIg
d3JvdGU6Cj4+IFRoZSBvcHRpb24gLS1lbmFibGUtZGV0ZXJtaW5pc3RpYy1hcmNoaXZlcyB0aGF0
IGJ1aWxkIGRldGVybWluaXN0aWMKPj4gYXJjaGl2ZXMgaXMgc3VwcG9ydGVkIGJ5IGJpbnV0aWxz
IHNpbmNlIGJpbnV0aWxzIDIuMjMgWzFdWzJdLgo+IAo+IMKgU2hvdWxkIHdlIG1ha2UgdGhpcyBk
ZXBlbmRlbnQgb24gQlIyX1JFUFJPRFVDSUJMRT8gQUZBSUNTIGl0IHNldHMgdGhlIGRhdGUKPiBm
aWVsZHMgaW4gc3RhdGljIGxpYnJhcmllcyB0byB6ZXJvLgoKSSdtIG5vdCBzdXJlIHNpbmNlIGl0
IGltcGFjdCBob3N0LWJpbnV0aWxzLCBpdCBjaGFuZ2UgdGhlIGRlZmF1bHQgYmVoYXZpb3Igb2YK
dGhlIGFyY2hpdmVyIChhcikuCgpJbnN0ZWFkIG9mIHRoaXMgcGF0Y2gsIHdlIGNvdWxkIHByb3Zp
ZGUgLUQgb3B0aW9uIHRvIGFyIHdoZW4gQlIyX1JFUFJPRFVDSUJMRSBpcwpzZXQuCgo+IAo+IMKg
SXMgdGhpcyBnb2luZyB0byBmaXggYSByZXByb2R1Y2liaWxpdHkgaXNzdWUgZGV0ZWN0ZWQgYnkg
dGhlIGF1dG9idWlsZGVycz8KCk5vLCBJIG5vdGljZWQgdGhpcyBvcHRpb24gd2hpbGUgbG9va2lu
ZyBhdCBiaW51dGlscyBnaXQgdHJlZS4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiDCoFJl
Z2FyZHMsCj4gwqBBcm5vdXQKPiAKPj4KPj4gU2VlICJTdGF0aWMgbGlicmFyaWVzIiBjaGFwdGVy
IFszXS4KPj4gaHR0cHM6Ly9yZXByb2R1Y2libGUtYnVpbGRzLm9yZy9kb2NzL2FyY2hpdmVzLwo+
Pgo+PiBFbmFibGUgdGhpcyBvcHRpb24gZm9yIHRhcmdldCBhbmQgaG9zdCB2YXJpYW50Lgo+Pgo+
PiBJdCB3YXMgYWRkZWQgdG8gWW9jdG8gTW9ydHkgKDIuMikgaW4gMjAxNiBbNF0uCj4+Cj4+IFsx
XQo+PiBodHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC9naXR3ZWIuY2dpP3A9YmludXRpbHMtZ2Ri
LmdpdDthPWNvbW1pdGRpZmY7aD0yZTMwY2I1NzVhMWQyYjFlYjhmNzc2MzU2ZWQ1OWIwNzIyYTk0
M2QxCj4+Cj4+IFsyXQo+PiBodHRwczovL3NvdXJjZXdhcmUub3JnL2dpdC9naXR3ZWIuY2dpP3A9
YmludXRpbHMtZ2RiLmdpdDthPWNvbW1pdGRpZmY7aD05Y2I4MGY3MmQ4YjhiMmY1OTU2MjY5MmQ5
Mzg1Y2Q1YTUzM2U5YjNmCj4+Cj4+IFszXSBodHRwczovL3JlcHJvZHVjaWJsZS1idWlsZHMub3Jn
L2RvY3MvYXJjaGl2ZXMKPj4gWzRdCj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuZW1iZWRkZWQv
b3BlbmVtYmVkZGVkLWNvcmUvY29tbWl0L2RmMGQ1MjVjMDI3ODBiNWEwYmQ3YTE3N2EyNDljNTVm
NDE3OTc0NzYKPj4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFv
dXJAZ21haWwuY29tPgo+PiAtLS0KPj4gwqAgcGFja2FnZS9iaW51dGlscy9iaW51dGlscy5tayB8
IDIgKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9iaW51dGlscy9iaW51dGlscy5tayBiL3BhY2thZ2UvYmludXRpbHMvYmlu
dXRpbHMubWsKPj4gaW5kZXggOGVjNzYxMzRiYy4uYzVjNjg1YWM4NSAxMDA2NDQKPj4gLS0tIGEv
cGFja2FnZS9iaW51dGlscy9iaW51dGlscy5tawo+PiArKysgYi9wYWNrYWdlL2JpbnV0aWxzL2Jp
bnV0aWxzLm1rCj4+IEBAIC01Nyw2ICs1Nyw3IEBAIEJJTlVUSUxTX0NPTkZfT1BUUyA9IFwKPj4g
wqDCoMKgwqDCoCAtLXRhcmdldD0kKEdOVV9UQVJHRVRfTkFNRSkgXAo+PiDCoMKgwqDCoMKgIC0t
ZW5hYmxlLWluc3RhbGwtbGliaWJlcnR5IFwKPj4gwqDCoMKgwqDCoCAtLWVuYWJsZS1idWlsZC13
YXJuaW5ncz1ubyBcCj4+ICvCoMKgwqAgLS1lbmFibGUtZGV0ZXJtaW5pc3RpYy1hcmNoaXZlcyBc
Cj4+IMKgwqDCoMKgwqAgJChCSU5VVElMU19ESVNBQkxFX0dEQl9DT05GX09QVFMpIFwKPj4gwqDC
oMKgwqDCoCAkKEJJTlVUSUxTX0VYVFJBX0NPTkZJR19PUFRJT05TKQo+PiDCoCBAQCAtOTMsNiAr
OTQsNyBAQCBIT1NUX0JJTlVUSUxTX0NPTkZfT1BUUyA9IFwKPj4gwqDCoMKgwqDCoCAtLWRpc2Fi
bGUtc2hhcmVkIFwKPj4gwqDCoMKgwqDCoCAtLWVuYWJsZS1zdGF0aWMgXAo+PiDCoMKgwqDCoMKg
IC0td2l0aC1zeXNyb290PSQoU1RBR0lOR19ESVIpIFwKPj4gK8KgwqDCoCAtLWVuYWJsZS1kZXRl
cm1pbmlzdGljLWFyY2hpdmVzIFwKPj4gwqDCoMKgwqDCoCAtLWVuYWJsZS1wb2lzb24tc3lzdGVt
LWRpcmVjdG9yaWVzIFwKPj4gwqDCoMKgwqDCoCAtLXdpdGhvdXQtZGVidWdpbmZvZCBcCj4+IMKg
wqDCoMKgwqAgJChCSU5VVElMU19ESVNBQkxFX0dEQl9DT05GX09QVFMpIFwKPj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
