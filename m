Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA92C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 09:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 898C84197A;
	Tue, 26 Jul 2022 09:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 898C84197A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Z3EFV-MTi5l; Tue, 26 Jul 2022 09:30:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20CB241997;
	Tue, 26 Jul 2022 09:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20CB241997
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D57D91BF5AE
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 09:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEC1560AEE
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 09:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEC1560AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OSpL5tJKxLNU for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 09:30:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2689260D7B
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2689260D7B
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 09:30:27 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id g2so11262144wru.3
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 02:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wFm82mIoK3XQ4bPNwtKLkEjMSzGUkdvmQZ7+//UaxmI=;
 b=uE3Utywre+QUNbBjOYTVOXvlHOxiSaLuDWtHZENJLVPegNsQW6RE6OWHdBPsujXr+e
 GWNik2ikKY1NMh1x2l3HYmt+N2Chv7TqDPmppyCWbOi8VCdqkEJDbKjM3a5QY/B+Deyq
 Hb96n18ZVTe2WwuSc40AteBj5GLqZYHUoJi7KzPzUyxDzv8RhCe20ZFjrBUN0ttZZgvw
 gr+u4H20t64WjVMrITzwxSDT6FGQSTe+devjsO2hR4Fwu2ZWw+RsFsWROtBEpp/sQVxc
 dLLkIGOF3DzU2n2WjksykyMmaa7MXAwNNaIziAQKX5YKFjhxNK/fui02XWm9aveMb8ZH
 khzw==
X-Gm-Message-State: AJIora+YuFuDVBoX3Y5i0QKIKMQRn/difEwe7ismSHeSeFeeMuaLI2jv
 fCRlX8JOXX+tMyfu43+AggnNvA==
X-Google-Smtp-Source: AGRyM1sMBDPvW3lT3Vm/zp7lQJTMpT9ShuhvlH3BeGL5qrKAXJSTTkhFkLq6EPUN+5PkfyJ1xFay3A==
X-Received: by 2002:a5d:64c8:0:b0:21e:841d:b4fa with SMTP id
 f8-20020a5d64c8000000b0021e841db4famr6636639wri.14.1658827824934; 
 Tue, 26 Jul 2022 02:30:24 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:86bb:8231:62d7:1874?
 ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 c23-20020a05600c4a1700b003a3170a7af9sm16087083wmp.4.2022.07.26.02.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 02:30:24 -0700 (PDT)
Message-ID: <ce677d88-8f8e-2d81-4e7b-69a35a99c6b9@smile.fr>
Date: Tue, 26 Jul 2022 11:30:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Damien Le Moal via buildroot <buildroot@buildroot.org>
References: <20220530033836.474926-1-damien.lemoal@opensource.wdc.com>
 <20220530033836.474926-3-damien.lemoal@opensource.wdc.com>
 <20220725164425.7316b2e3@windsurf>
 <493e8a12-f32a-0abe-7bb4-ecc4233f6fd6@opensource.wdc.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <493e8a12-f32a-0abe-7bb4-ecc4233f6fd6@opensource.wdc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wFm82mIoK3XQ4bPNwtKLkEjMSzGUkdvmQZ7+//UaxmI=;
 b=qG5nsjt2nSGTCfJc0DcdUsLucUE87yovdU64Qy9Be4RKOeEHXjmR33fMwo3Ginn0xt
 bHFVp/WD01XPKiEoMswLyFLtkj7YNK7Ve4NoUenRmhMMlxN0a4iHsLF4aWhekzSheBPR
 mF9DAUF0c2cWILxqV1hUfalGrdks+FdpRKDXSPYfrK8P3uCbV6z1CMu9j9kYofias+f+
 19ADVjL5rERCIkGBm6lfcr03EysJXuh365l3d5nZAMwWH+Y2FyYU5KWfch/IgCLmBD3s
 D6PRloGuZPidKlSOzgtVawfd9Tub5tIdL2kf4BOpILecB1MKxbozVpFdXzRCBNjd6QCO
 t/LA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=qG5nsjt2
Subject: Re: [Buildroot] [PATCH v2 02/11] package: elf2flt: Update RISC-V
 64-bits support
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
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAyNi8wNy8yMDIyIMOgIDA1OjQxLCBEYW1pZW4gTGUgTW9hbCB2aWEgYnVpbGRy
b290IGEgw6ljcml0wqA6Cj4gT24gNy8yNS8yMiAyMzo0NCwgVGhvbWFzIFBldGF6em9uaSB3cm90
ZToKPj4gSGVsbG8gRGFtaWVuLCBIZWxsbyBOaWtsYXMsCj4gCj4gK0dlZXJ0Cj4gCj4+Cj4+IE9u
IE1vbiwgMzAgTWF5IDIwMjIgMTI6Mzg6MjcgKzA5MDAKPj4gRGFtaWVuIExlIE1vYWwgdmlhIGJ1
aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+Pgo+Pj4gRnJvbTogRGFt
aWVuIExlIE1vYWwgPGRhbWllbi5sZW1vYWxAd2RjLmNvbT4KPj4+Cj4+PiBSZW1vdmUgdGhlIG9s
ZCBlbGYyZmx0IDAwMDItZWxmMmZsdC1hZGQtcmlzY3YtNjQtYml0cy1zdXBwb3J0LnBhdGNoCj4+
PiBwYXRjaCBmaWxlIGZvciByaXNjdjY0IGFyY2hpdGVjdHVyZSBhbmQgcmVwbGFjZSBpdCB3aXRo
IDMgcGF0Y2hlczoKPj4+Cj4+PiAoMSkgVGhlIGZpcnN0IHBhdGNoIGZpeGVzIHRoZSBkYXRhIHNl
Y3Rpb24gYWxpZ25tZW50Cj4+PiAoMikgVGhlIHNlY29uZCBwYXRjaCBmaXhlcyBhIGJ1ZyB3aXRo
IHRoZSBoYW5kbGluZyBvZiB0aGUgZWhfZnJhbWUKPj4+ICAgICBzZWN0aW9uIGNhdXNpbmcgdGV4
dCBhbmQgZGF0YSBzZWN0aW9uIG92ZXJsYXAgcHJvYmxlbXMuCj4+PiAoMykgVGhlIHRoaXJkIHBh
dGNoIGFkZHMgYSBzaW1wbGVyIHJpc2N2NjQgZmxhdCBiaW4gcmVsb2NhdGlvbiBzdXBwb3J0Lgo+
Pj4KPj4+IFRoZXNlIDMgcGF0Y2hlcyBhcmUgc3VibWl0dGVkIHRvIHRoZSB1cHN0cmVhbSBlbGYy
Zmx0IHByb2plY3QgYXMgcHVsbAo+Pj4gcmVxdWVzdCAjMjI6Cj4+Pgo+Pj4gaHR0cHM6Ly9naXRo
dWIuY29tL3VjbGludXgtZGV2L2VsZjJmbHQvcHVsbC8yMgo+Pgo+PiBXZSBhcmUgc2VlaW5nIGFu
IGlzc3VlIHdpdGggdGhpcyBwYXRjaCBhcHBsaWVkOiBpdCBzZWdmYXVsdHMgd2hlbgo+PiBsaW5r
aW5nIGJpbmFyaWVzIG9uIHRoZSBtNjhrIGFyY2hpdGVjdHVyZS4KPj4KPj4gVG8gYmUgZnVsbHkg
Y2xlYXIsIHdoZW4gd2UgdXNlIHRoZSBjdXJyZW50IHZlcnNpb24gb2YgZWxmMmZsdCBpbgo+PiBC
dWlsZHJvb3QgKDIwMjEuMDIpICsgcGF0Y2ggMDAwMS1lbGYyZmx0LWhhbmRsZS1iaW51dGlscy0y
LjM0LnBhdGNoICsKPj4gcGF0Y2ggMDAwMi1lbGYyZmx0LmxkLXJlaW5zdGF0ZS0zMi1ieXRlLWFs
aWdubWVudC1mb3ItLmRhdGEtc2VjLnBhdGNoLAo+PiB3ZSBoYXZlIHRoZSBmb2xsb3dpbmcgZmFp
bHVyZToKPj4KPj4gICAvaG9tZS90aG9tYXMvYnVpbGRyb290L291dHB1dHMvbTY4ay9ob3N0L202
OGstYnVpbGRyb290LXVjbGludXgtdWNsaWJjL2Jpbi9lbGYyZmx0OiBFUlJPUjogdGV4dD0weDdk
Yjc4IG92ZXJsYXBzIGRhdGE9MHg2Yjk0MCA/Cj4+Cj4+IHdoaWNoIGFscmVhZHkgZXhpc3RlZCAq
cHJpb3IqIHRvIGFwcGx5aW5nIHlvdXIgcGF0Y2guCj4+Cj4+IEhvd2V2ZXIsIGFzIHNvb24gYXMg
d2UgYWRkCj4+IDAwMDMtZWxmMmZsdC1maXgtLmVoX2ZyYW1lLXNlY3Rpb24taGFuZGxpbmcucGF0
Y2ggaW50byB0aGUgcGF0Y2ggc2VyaWVzCj4+IGFwcGxpZWQgdG8gZWxmMmZsdCwgd2UgZ2V0Ogo+
Pgo+PiAgIGxkIChsZC1lbGYyZmx0KTogL2hvbWUvdGhvbWFzL2J1aWxkcm9vdC9vdXRwdXRzL202
OGsvaG9zdC9tNjhrLWJ1aWxkcm9vdC11Y2xpbnV4LXVjbGliYy9iaW4vZWxmMmZsdCB0ZXJtaW5h
dGVkIHdpdGggc2lnbmFsIDExIFtTZWdtZW50YXRpb24gZmF1bHRdLCBjb3JlIGR1bXBlZAo+Pgo+
PiBPdXIgZnJpZW5kIGdkYiBnaXZlcyB1cyBzb21lIGhpbnQgb24gd2hlcmUgdGhlIHNlZ2ZhdWx0
IG9jY3VyczoKPj4KPj4gIzAgIDB4MDAwMDU1ZWJmYzc1MjRlMCBpbiBhZGRfY29tX3RvX2JzcyAo
YnNzX2xlbj0xOTExMiwgbnVtYmVyX29mX3N5bWJvbHM9Mzg2OSwgc3ltYm9sX3RhYmxlPTB4NTVl
YmZkNjAxZDUwKSBhdCBlbGYyZmx0LmM6MjczCj4+IDI3MyAgICAgICAgIGlmIChzdHJjbXAoIipD
T00qIiwgc3ltYm9sX3RhYmxlW2ldLT5zZWN0aW9uLT5uYW1lKSA9PSAwKSB7Cj4+Cj4+IE9mIGNv
dXJzZSwgd2UncmUgbm90IHN1cmUgaWYgdGhlIGVycm9yICJFUlJPUjogdGV4dD0weDdkYjc4IG92
ZXJsYXBzCj4+IGRhdGE9MHg2Yjk0MCA/IiBpcyBmaXhlZCBieSB5b3VyIHBhdGNoIGFuZCBhIGxh
dGVyIHByb2JsZW0gY2F1c2VzIHRoZQo+PiBzZWdmYXVsdCwgb3IgaWYgeW91ciBwYXRjaCBjYXVz
ZXMgdGhlIHNlZ2ZhdWx0IGluIHRoZSBmaXJzdCBwbGFjZS4KPj4KPj4gUGxlYXNlIG5vdGUgdGhh
dCBpZiB3ZSByZXZlcnQgYm90aAo+PiAzMmY5M2IwZWYyYzYwMmRmYTFmNWIyNDNiYTg2NWQ1YjE2
ZTJmYTMzIGFuZAo+PiA2NWQ3OGRjZmViOGIyZWFmYWViZTJkMGMzYzhjNDJlN2U4NWY0NmFjIGlu
IEJ1aWxkcm9vdCwgd2UgaGF2ZSBhCj4+IHdvcmtpbmcgZWxmMmZsdCBmb3IgbTY4ay4KPj4KPj4g
RG8geW91IGhhdmUgYW55IGlkZWE/CgpJIHNwZW50IHNvbWUgdGltZSBvbiB0aGUgbTY4ayBpc3N1
ZSBhbmQgSSdtIGFncmVlIHdpdGggeW91ciBhbmFseXNpcyBmcm9tIHlvdXIKcGF0Y2ggMDAwMy1l
bGYyZmx0LWZpeC0uZWhfZnJhbWUtc2VjdGlvbi1oYW5kbGluZy5wYXRjaCBbMV0sIHRoZSBjb21t
aXQgWzJdCmludHJvZHVjZSBhIHByb2JsZW0gb24gbTY4ayBhbmQgcmlzY3Y2NCB3aXRoIHRoZSBz
ZWN0aW9uIHNjYW5uaW5nIGxvb3Agb2YKZWxmMmZsdCBtYWluKCkuCgoiVGhlIHdheSB0aGF0IGVs
ZjJmbHQgaXMgd3JpdHRlbiwgd2UgY2Fubm90IGFwcGVuZCB0byB0aGUgdGV4dCBvdXRwdXQKIHNl
Y3Rpb24gYWZ0ZXIgYW4gaW5wdXQgc2VjdGlvbiBoYXMgYmVlbiBhZGRlZCB0byB0aGUgZGF0YSBv
dXRwdXQKIHNlY3Rpb24uIgoKV2l0aCB5b3VyIHBhdGNoIDAwMDMgcmV2ZXJ0ZWQgYW5kIGFkZGl0
aW9uYWwgZGVidWcgcHJpbnQgc2hvd3MgdGhhdCB3ZSBoYXZlIGEKc2VjdGlvbiB3aXRoIHRoZSBz
YW1lIGZsYWdzIHNldCBvbiBtNjhrIGFzIGZvciBBUk0gLkFSTS5leGlkeCBzZWN0aW9uOiAweDEy
ZgoKb3V0cHV0L2hvc3QvbTY4ay1idWlsZHJvb3QtdWNsaW51eC11Y2xpYmMvYmluL2VsZjJmbHQ6
IEVSUk9SOiB0ZXh0PTB4N2RiNzgKb3ZlcmxhcHMgZGF0YT0weDZiOTQwID8KClRFWFQgKGZsYWdz
IDExZiktPiB2bWE9MHhmZmZmZmZmZiBsZW49MHgwCkRBVEEgKGZsYWdzIDExZiktPiB2bWE9MHhm
ZmZmZmZmZiBsZW49MHgwCgpURVhUIChmbGFncyAxMjcpLT4gdm1hPTB4MCBsZW49MHg2YjkzYwpE
QVRBIChmbGFncyAxMjcpLT4gdm1hPTB4ZmZmZmZmZmYgbGVuPTB4MAoKVEVYVCAoZmxhZ3MgMTIz
KS0+IHZtYT0weDAgbGVuPTB4NmI5M2MKREFUQSAoZmxhZ3MgMTIzKS0+IHZtYT0weDZiOTQwIGxl
bj0weDEyMTYwCgpURVhUIChmbGFncyAxMmYpLT4gdm1hPTB4MCBsZW49MHg2YjkzYyAgICAgICAg
PDw8IHdhcyBBUk0uZXhpZHgKREFUQSAoZmxhZ3MgMTJmKS0+IHZtYT0weDZiOTQwIGxlbj0weDEy
MTYwCgpURVhUIChmbGFncyAxKS0+IHZtYT0weDAgbGVuPTB4N2RiNzggICAgICAgICAgPDwgYnNz
CkRBVEEgKGZsYWdzIDEpLT4gdm1hPTB4NmI5NDAgbGVuPTB4MTIxNjAKClRFWFQgLT4gdm1hPTB4
MCBsZW49MHg3ZGI3OApEQVRBIC0+IHZtYT0weDZiOTQwIGxlbj0weDEyMTYwCgpTaW5jZSBjb21t
aXRzIFsyXSBhbmQgWzNdIGFyZSByZWxhdGVkIHRvIEFSTS5leGlkeCBhbmQgd2UgaGF2ZSB0aGUg
InNhbWUiCnNlY3Rpb24gKHNhbWUgZmxhZ3MgMHgxMmYpIG9uIG02OGssIEknbSB3b25kZXJpbmcg
aWYgcGxhY2luZyByZWFkLW9ubHkKcmVsb2NhdGlvbiBkYXRhIHNlY3Rpb24gaW4gdGhlIC50ZXh0
IGZsYXQgb3V0cHV0IHNlY3Rpb24gaXMgcmVhbGx5IHN1cHBvcnRlZCBmb3IKbTY4ayBvciBzaG91
bGQgYmUgQVJNIHNwZWNpZmljPwoKQnV0IGZyb20gQmludXRpbHMgbWFpbnRhaW5lciBmZWVkYmFj
ayBbNF0gaXQgc2VlbXMgdGhlIGNvcnJlY3QgdGhpbmcgdG8gZG8uCgpCYXNlZCBvbiB3aGF0IHRo
ZSBtYWludGFpbmVyIHNhaWQsIEknbSBub3Qgc3VyZSBpZiB5b3VyIGZpeCAwMDAzIGlzIGNvcnJl
Y3QKc2luY2UgaXQgYWxsb3dzIHB1dHRpbmcgc29tZSByZWFkLW9ubHkgcmVsb2NhdGlvbiBkYXRh
IHNlY3Rpb24gaW4gdGhlIGRhdGEKb3V0cHV0IHNlY3Rpb24uCgpJIGhvcGUgaXQgaGVscC4uLgoK
WzFdCmh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9MzJmOTNi
MGVmMmM2MDJkZmExZjViMjQzYmE4NjVkNWIxNmUyZmEzMwoKWzJdCmh0dHBzOi8vZ2l0aHViLmNv
bS91Y2xpbnV4LWRldi9lbGYyZmx0L2NvbW1pdC9iYTM3OWQwOGJiNzhjOTMwMGU4NDM1MWMxMTA4
MGMyNmRkY2MzNmIzCgpbM10KaHR0cHM6Ly9naXRodWIuY29tL3VjbGludXgtZGV2L2VsZjJmbHQv
Y29tbWl0LzczMzI1YjdmMjA5ZTBmNjg4ODczMzMzODUxODRhZjI3NTUzMTQyN2QKCls0XSBodHRw
czovL3NvdXJjZXdhcmUub3JnL2xlZ2FjeS1tbC9iaW51dGlscy8yMDE5LTEwL21zZzAwMTMyLmh0
bWwKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPj4KPj4gVGhhbmtzIGEgbG90IQo+Pgo+PiBUaG9t
YXMKPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
