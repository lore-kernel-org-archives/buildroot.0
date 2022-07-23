Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12651C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 13:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C47E41690;
	Sat, 23 Jul 2022 13:00:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C47E41690
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YTfKedh3HcJF; Sat, 23 Jul 2022 13:00:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E946941619;
	Sat, 23 Jul 2022 13:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E946941619
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 68ACF1BF36E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4474E41619
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 13:00:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4474E41619
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id anD7tiL8imI3 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 13:00:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D96E41599
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D96E41599
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 13:00:43 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 v67-20020a1cac46000000b003a1888b9d36so6682213wme.0
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 06:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QYa4okTI9rxMoCOF7GZPBFONLtXwdQ9G81mEBawjhGA=;
 b=1j2IAcfrD7e71xWWX0SMbBTB9srRvTWQMaROu2GFfZCnopOxiYV/IlMVIcWG8JzcI0
 ZIQ3sZqlAVhggy4kpYDTogF41z/osEkiMvi4TQoNNDYaG8JRDPOEf5bbSmJ/5mT981H4
 t8/eaKo39WsgrD+7Aznbi1uyw9P7RN7dkI8zZTtzoxUSgHxhLs/ukuNrjqBFfetbtAih
 C2S7pzh65IUsr6O8+TfgL/Ka8emPNQrYTnEQCvjCveC3OXEhNOxk0RooBq+W+cdIHrSL
 XKGP6sgAqim7iqd1aNliMnPVYjDicfyfzyHCLAyQxLHxyS+7kXUGgEiBn2zbWp+DTfar
 BozQ==
X-Gm-Message-State: AJIora8CIn8g+aGhypvbuqChYvw8uMwlErnL22uqwecw4TT3b3NKAB1l
 M6IHvMQlXsSWUHNL3KwUO03gCmSUl+1Zvg==
X-Google-Smtp-Source: AGRyM1tuHBNxTGbo0NIP69HfjIL0+UKmdCnUDAEWnl6RI6U08pMdlbMXu3nFtOIRCC5KNUHK8JZf1A==
X-Received: by 2002:a7b:c417:0:b0:3a3:236f:9f98 with SMTP id
 k23-20020a7bc417000000b003a3236f9f98mr2821567wmi.48.1658581241230; 
 Sat, 23 Jul 2022 06:00:41 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 f11-20020adfe90b000000b0021e43650e6asm7067629wrm.86.2022.07.23.06.00.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 06:00:40 -0700 (PDT)
Message-ID: <5fd9249b-0815-0b8a-9cb5-a301d04ec5d3@smile.fr>
Date: Sat, 23 Jul 2022 15:00:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20220529131811.481017-1-romain.naour@gmail.com>
 <20220723143921.1e89b49f@windsurf>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220723143921.1e89b49f@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QYa4okTI9rxMoCOF7GZPBFONLtXwdQ9G81mEBawjhGA=;
 b=aFSUykSTRgk8DHdLXL7bT8e3VFMX+1DR+TbaN4nZadwWcZbOkJIgE+l/9M0fel3QL/
 Rc7GXgLkICROv5bO9UaQ9II+TxMfnZ24BbTju5vhtC+BqpbLsw/+/xjwn63p5qKlIkc9
 6DlMW3ojUddxp8SrbdHVntMiK/TFOl66vx0cPzwlrQVjHeBHoIKumtNX/TGNmB4PvA+v
 kpzVbAhh4vH/C6HhrHj5h9ftvBps/2g7nCbPMsLS1mTQPJaRrKE1/YMxWFhqZ//o0zCS
 MM9QLONr7zpH1gK6s0cljCDPo9+80tnFKv9SBCno5l0xFydO1H9y70Yec6cTJbHNk4R7
 ccLw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=aFSUykST
Subject: Re: [Buildroot] [PATCH for-next 01/11] arch/Config.in.riscv: add
 Zicsr and Zifencei standalone extensions
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
Cc: Mark Corbin <mark@dibsco.co.uk>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgMjMvMDcvMjAyMiDDoCAxNDozOSwgVGhvbWFzIFBldGF6em9uaSB2
aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gSGVsbG8gUm9tYWluLAo+IAo+IE9uIFN1biwgMjkg
TWF5IDIwMjIgMTU6MTg6MDEgKzAyMDAKPiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFp
bC5jb20+IHdyb3RlOgo+IAo+PiBTaW5jZSBnY2MgMTIsIGRlZmF1bHQgUmlzY3YgSVNBIHNwZWMg
dmVyc2lvbiB3YXMgYnVtcCB0byAyMDE5MTIxMyBbMV0uCj4+Cj4+IFRoaXMgaW50cm9kdWNlIGEg
bWFqb3IgaW5jb21wYXRpYmlsaXR5IGlzc3VlIGlzIHRoZSBjc3IgcmVhZC93cml0ZQo+PiAoY3Ny
ciovY3NydyopIGluc3RydWN0aW9ucyBhbmQgZmVuY2UuaSBpbnN0cnVjdGlvbiBoYXMgc2VwYXJh
dGVkIGZyb20KPj4gdGhlICJJIiBleHRlbnNpb24sIGJlY29tZSB0d28gc3RhbmRhbG9uZSBleHRl
bnNpb25zOiBaaWNzciBhbmQKPj4gWmlmZW5jZWk7IHNvIHlvdSBtaWdodCBnZXQgZXJyb3IgbWVz
c2FnZXMgbGlrZSB0aGF0OiB1bnJlY29nbml6ZWQKPj4gb3Bjb2RlICJjc3JyIiAob3IgImZlbmNl
LmkiKS4KPj4KPj4gSW5kZWVkLCB3aXRob3V0IFppZmVuY2VpIHdlIGNhbid0IGJ1aWxkIG9wZW5z
YmkgYm9vdGxvYWRlciBbM106Cj4+Cj4+IG9wZW5zYmktMS4wL2xpYi9zYmkvc2JpX3RsYi5jOiBB
c3NlbWJsZXIgbWVzc2FnZXM6Cj4+IG9wZW5zYmktMS4wL2xpYi9zYmkvc2JpX3RsYi5jOjE5MDog
RXJyb3I6IHVucmVjb2duaXplZCBvcGNvZGUgYGZlbmNlLmknLCBleHRlbnNpb24gYHppZmVuY2Vp
JyByZXF1aXJlZAo+Pgo+PiBBcyBhIHdvcmthcm91bmQsIG9wZW5zYmkgYnVpbGQgc3lzdGVtIGhh
cyBiZWVuIHBhdGNoZWQgWzRdIHRvIHVzZQo+PiAtbWFyY2g9cnY2NGltYWZkY196aWNzcl96aWZl
bmNlaSB3aGVuIG5lZWRlZC4KPj4gVGhpcyB3b3JrYXJvdW5kIGRvZXNuJ3Qgd29yayBpbiBCdWls
ZHJvb3QgZHVlIHRvIHRoZSBsb2NhbCBwYXRjaAo+PiAwMDAxLU1ha2VmaWxlLURvbi10LXNwZWNp
ZnktbWFiaS1vci1tYXJjaC5wYXRjaCByZW1vdmluZyAtbWFyY2gKPj4gZnJvbSBDRkxBR1MuCj4+
Cj4+IEZpeCB0aGlzIGlzc3VlIGJ5IGludHJvZHVjaW5nIHR3byBhZGRpdGlvbmFsIEtjb25maWcg
b3B0aW9uCj4+IGVuYWJsaW5nIFppY3NyIGFuZCBaaWZlbmNlaSBzdGFuZGFsb25lIGV4dGVuc2lv
bnMgZm9yIGdjYyA+PSAxMgo+PiBhcyByZWNvbW1hbmRlZCBieSBbMl0uCj4+Cj4+IFNlbGVjdCBa
aWNzciBhbmQgWmlmZW5jZWkgZm9yIEdlbmVyYWwgcHVycG9zZSAoRykgYXJjaGl0ZWN0dXJlIHZh
cmlhbnQKPj4gKEJSMl9yaXNjdl9nKSBzaW5jZSB0aGVzZXMgZXh0ZW50aW9ucyB3ZXJlIGltcGxp
Y2l0ZWx5IGVuYWJsZWQKPj4gcHJldmlvdXNseS4KPj4KPj4gWzFdIGh0dHBzOi8vZ2NjLmdudS5v
cmcvZ2NjLTEyL2NoYW5nZXMuaHRtbAo+PiBbMl0gaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9h
L2dyb3Vwcy5yaXNjdi5vcmcvZy9zdy1kZXYvYy9hRTFaZUhIQ1lmNAo+PiBbM10gaHR0cHM6Ly9n
aXRodWIuY29tL3Jpc2N2LXNvZnR3YXJlLXNyYy9vcGVuc2JpL2Jsb2IvdjAuOS9saWIvc2JpL3Ni
aV90bGIuYyNMMTczCj4+IFs0XSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytc29mdHdhcmUtc3Jj
L29wZW5zYmkvY29tbWl0LzVkNTNiNTVhYTc3ZmZlZWZkNDAxMjQ0NWRmYTZhZDM1MzVlMWZmMmMK
Pj4KPj4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29t
Pgo+PiBDYzogTWFyayBDb3JiaW4gPG1hcmtAZGlic2NvLmNvLnVrPgo+IAo+IFRoYW5rcyBmb3Ig
dGhlIHBhdGNoIGFuZCBleHBsYW5hdGlvbiwgYnV0IEknbSB3b25kZXJpbmcgaWYgdGhpcyBpc24n
dAo+IHBlcmhhcHMgdG9vIGNvbXBsaWNhdGVkLgo+IAo+IAo+PiArCXNlbGVjdCBCUjJfUklTQ1Zf
SVNBX1JWWmljc3IgaWYgQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfMTIKPj4gKwlzZWxlY3Qg
QlIyX1JJU0NWX0lTQV9SVlppZmVuY2VpIGlmIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzEy
Cj4gCj4gWy4uLl0KPiAKPj4gIAloZWxwCj4+IC0JICBHZW5lcmFsIHB1cnBvc2UgKEcpIGlzIGVx
dWl2YWxlbnQgdG8gSU1BRkQuCj4+ICsJICBHZW5lcmFsIHB1cnBvc2UgKEcpIGlzIGVxdWl2YWxl
bnQgdG8gSU1BRkQKPj4gKwkgICh3aXRoIFppY3NyIGFuZCBaaWZlbmNlaSBzaW5jZSBnY2MgPj0g
MTIpLgo+PiAgCj4+ICBjb25maWcgQlIyX3Jpc2N2X2N1c3RvbQo+PiAgCWJvb2wgIkN1c3RvbSBh
cmNoaXRlY3R1cmUiCj4+IEBAIC02Myw2ICs3MiwxNiBAQCBjb25maWcgQlIyX1JJU0NWX0lTQV9D
VVNUT01fUlZECj4+ICBjb25maWcgQlIyX1JJU0NWX0lTQV9DVVNUT01fUlZDCj4+ICAJYm9vbCAi
Q29tcHJlc3NlZCBJbnN0cnVjdGlvbnMgKEMpIgo+PiAgCXNlbGVjdCBCUjJfUklTQ1ZfSVNBX1JW
Qwo+PiArCj4+ICtpZiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF8xMgo+IAo+IFRoZSBwcm9i
bGVtIHdpdGggdGhpcyBpcyB0aGF0IG9wdGlvbnMgaW4gYXJjaC8gbm93IGRlcGVuZCBvbiB0aGUg
Z2NjCj4gdmVyc2lvbiB0aGF0IGlzIHNlbGVjdGVkLCB3aGljaCBpcyBzb21ldGhpbmcgd2UgaGF2
ZSB0cmllZCB0byBhdm9pZC4KPiAKPiBEbyBhIGdpdCBncmVwIEdDQ19BVF9MRUFTVCBpbiBhcmNo
LywgeW91IHdpbGwgc2VlIHRoYXQgd2Ugb25seSB1c2UKPiAic2VsZWN0IEJSMl9BUkNIX05FRURT
X0dDQ19BVF9MRUFTVF94eXoiLCBpLmUgdGhlIGNob2ljZSBvZiB0aGUKPiBhcmNoaXRlY3R1cmUv
dmFyaWFudC9BQkkgaXMgd2hhdCBkcml2ZXMgdGhlIGF2YWlsYWJsZSBnY2MgdmVyc2lvbnMuCj4g
Cj4gQW5kIGhlcmUgeW91IGFyZSBkb2luZyBleGFjdGx5IHRoZSBvcHBvc2l0ZTogaXQncyB0aGUg
c2VsZWN0ZWQgZ2NjCj4gdmVyc2lvbiB0aGF0IGRyaXZlcyB0aGUgYXJjaGl0ZWN0dXJlL3Zhcmlh
bnQvQUJJIG9wdGlvbnMgdGhhdCBhcmUKPiBhdmFpbGFibGUuCj4gCj4gQXQgdGhpcyBwb2ludCwg
SSBkb24ndCByZWFsbHkgc2VlIHRoZSBuZWVkIGZyb20gYSBCdWlsZHJvb3QgcGVyc3BlY3RpdmUK
PiB0byBzZXBhcmF0ZSBpY3NyIGFuZCBpZmVuY2VpIGZyb20gdGhlIGJhc2UgQlIyX1JJU0NWX0lT
QV9SVkkKPiBpbnN0cnVjdGlvbiBzZXQuCj4gCj4gU28gd2hhdCBJIHdvdWxkIGRvIGlzIGV4YWN0
bHkgd2hhdCBPcGVuU0JJIGhhcyBkb25lIGluCj4gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LXNv
ZnR3YXJlLXNyYy9vcGVuc2JpL2NvbW1pdC81ZDUzYjU1YWE3N2ZmZWVmZDQwMTI0NDVkZmE2YWQz
NTM1ZTFmZjJjOgo+IHdoZW4gZ2NjID49IDEyIGlzIHVzZWQsIHdlIHNpbXBseSB1c2UgLW1hcmNo
IHdpdGggYSBfemljc3JfemlmZW5jZWkKPiBzdWZmaXgsIGFuZCB0aGF0J3MgaXQuCj4gCj4gSS5l
IHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJjaC5tay5yaXNj
diBiL2FyY2gvYXJjaC5tay5yaXNjdgo+IGluZGV4IGYzYmYyYjM0NjcuLmQ3N2Y4OGRkNzAgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9hcmNoLm1rLnJpc2N2Cj4gKysrIGIvYXJjaC9hcmNoLm1rLnJpc2N2
Cj4gQEAgLTI3LDQgKzI3LDggQEAgaWZlcSAoJChCUjJfUklTQ1ZfSVNBX1JWQykseSkKPiAgR0ND
X1RBUkdFVF9BUkNIIDo9ICQoR0NDX1RBUkdFVF9BUkNIKWMKPiAgZW5kaWYKPiAgCj4gK2lmZXEg
KCQoQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfMTIpLHkpCj4gK0dDQ19UQVJHRVRfQVJDSCA6
PSAkKEdDQ19UQVJHRVRfQVJDSClfemljc3JfemlmZW5jZWkKPiArZW5kaWYKPiArCj4gIGVuZGlm
Cj4gCj4gSSBkb24ndCB0aGluayB3ZSB3aWxsIHNlZSBSSVNDLVYgY29yZXMgcnVubmluZyBMaW51
eCB0aGF0IHN1cHBvcnQgdGhlCj4gYmFzZSBJIGluc3RydWN0aW9uLCBidXQgbm90IHRoZSBjc3Ig
YW5kIGZlbmNlIGV4dGVuc2lvbnMuLi4gYXMgZXZlbgo+IE9wZW5TQkkgYXNzdW1lcyB0aGUgUklT
Qy1WIGNvcmUgc3VwcG9ydHMgdGhlbSEKPiAKPiBXaGF0IGRvIHlvdSB0aGluaz8KClRoYW5rcyBm
b3IgdGhlIHJldmlldyEKCkknbSBub3QgZmFtaWxpYXIgd2l0aCB0aGUgcmlzY3YgaW5zdHJ1Y3Rp
b24gc2V0LCBzbyBJIHdhcyBub3Qgc3VyZSBpZiB3ZSBzaG91bGQKc3VwcG9ydCB0aGUgcG9zc2li
aWxpdHkgdG8gZGlzYWJsZSBaaWNzciBhbmQgWmlmZW5jZWkgc3RhbmRhbG9uZSBleHRlbnNpb25z
IHdpdGgKZ2NjIDEyLiBBRklVLCB0aGV5IGFyZSB1bmNvbmRpdGlvbmFsbHkgZW5hYmxlZCBpbiBw
cmV2aW91cyBnY2MgcmVsZWFzZXMuCgpBZGRpdGlvbmFsbHkgd2UgaGF2ZSByZWNlaXZlZCB0d28g
cGF0Y2hlcyB0byBhZGQgInZlY3RvciBvcGVyYXRpb25zIGV4dGVuc2lvbiIKCmh0dHA6Ly9wYXRj
aHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMDcwNDA4NTU1Mi4z
NDk5MjQzLTItYWJlbEB4LXNpbGljb24uY29tLwoKaHR0cDovL3BhdGNod29yay5vemxhYnMub3Jn
L3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIwNjI3MTM1MzU5LjIyMzIyMjItMS1maHVubGV0
aEB0cm9vZG9uLXNvZnR3YXJlLmNvbS8KCkJ1dCB0aGlzIHJlcXVpcmVzIGdjYy0xMgoKaHR0cDov
L3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIwNjI3MTM1
MzU5LjIyMzIyMjItMS1maHVubGV0aEB0cm9vZG9uLXNvZnR3YXJlLmNvbS8jMjkzMzczNgoKRG8g
eW91IHRoaW5rICJWZWN0b3IgSW5zdHJ1Y3Rpb25zIChWKSIgZGVzZXJ2ZSBhbiBvcHRpb24gPyAo
SSB3b3VsZCBzYXkgeWVzKS4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBUaG9tYXMKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
