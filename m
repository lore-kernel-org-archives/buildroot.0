Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C2B10398B2
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 21:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E71FB82771;
	Fri, 27 Feb 2026 21:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZ16fmA8E0Be; Fri, 27 Feb 2026 21:22:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0D1B81FA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772227355;
	bh=Ohdgg4R7kTKhRx6PaLYhgsH2JzP9Sce7at8IzX4AEf0=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AJy9RI4X/3x9ffSh5P22SnW+c0pGHyrwAlmb2RcqQO/8KTVcu2K61/q6GHEL3qonN
	 mu1yk1BtRMARiJBJfpCJzt+d9N1ep544AM2wugBD63c1Y2CJEhYT3YR4/RyZIys8pb
	 3zF7sAJYvs75+QbUdYMJ/tENp2teuZz+0MT2Qrd7QC/Ojyv5jyYNrwRHstwj52wWo9
	 8eVZ6YrafggAXvsY63a14QfqJYY5ggm1gvbyfsHOurhrO8XEbDnH2lrQXvcmNunuv4
	 2n2h6Kw3xAS6xi9FxhQnljd6vAU2fXkyw0qG/lbaQUQjfTl69QoJLwh6qc4nG/ahy4
	 UW0HDAptbli5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0D1B81FA8;
	Fri, 27 Feb 2026 21:22:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B4BC4204
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 21:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5EFF411F2
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 21:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxCIcKeeuann for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 21:22:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.117;
 helo=smtpcmd03117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 64F1341053
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64F1341053
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64F1341053
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 21:22:30 +0000 (UTC)
Received: from [192.168.50.134] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id w5I4vLkKt5gYjw5I4vx04o; Fri, 27 Feb 2026 22:22:28 +0100
Message-ID: <f13f8187-66b1-46ba-b7c4-3f92ceacedb6@benettiengineering.com>
Date: Fri, 27 Feb 2026 22:22:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, Fabio Estevam <festevam@gmail.com>
References: <20260210000739.3810940-1-giulio.benetti@benettiengineering.com>
 <20260210000739.3810940-7-giulio.benetti@benettiengineering.com>
 <08470d05a339900538f80591ca4b2aae@free.fr>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <08470d05a339900538f80591ca4b2aae@free.fr>
X-CMAE-Envelope: MS4xfLH76DCqCFf8c4dvh5kSD5wd+pTEDwu40a6BhbkX8iZUX74TTa93zfLGqAN0pXhEJ5bognzoez4cF9gjpD2e3AXqmrbxLyHABBcXgJDC9EAFlf0RHD2C
 UG9qGrY76Q7E9jsj4MSgVdrnAQTaUEy49o+3uaEcUZNcUKxgxN4aTb4qiEZEUhVsjqheb/hhhoUehj3Sy59o9iTgqD1xhPplVqTTVWuV7gG8Jg3v7bOH6rn5
 2dzp7fpHR3KEEoFDci72i1IqOQTuDhufiLSCuLTATWiLdE8DuiQzpBV1WXLr5Vkf4q4jlIDrTzulAyT1F1xXJAF44KmsCCjE5QBxkmeOSZGKkdzCwcVW5ozC
 p05Qj1hHHJi7G5yI/OAyGoc7ebSmpdOmf2mRYe7ISYXRg0DsWe8PFz2Tp5L/MeXzBvMSr0br8Z75Da5ZBAIa1rrtA7BT3jiK3+6h2JKDZ0ZMkDOfQyza5j2k
 L5QWkZK5EbPkGlqmBzXtGAcqnicVMo8GjRNoVA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1772227348; bh=rlIIsZwrxxKqwJmNCA5R4rMEE6bM5+VV9Nrn0Ivnebk=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Lbzn62RguvL4CeT9Qumg1uByzwNzAIm+PPzYlatAbmfsqEUV9S11uPH43ziaxOHza
 CvMljYv7C3ltFzck5t9DNp4BXowFB1EMW8c5wfPkKr2TdBxbiZgGgni1dj0amnq00N
 BmcRfpNRUI7hjoFVdQg95bFOPwOs2uvOrrhZmBI8g4eBob6wpeqI9DlRmS9q6RBZDm
 dg7BY7unGDKialwPhtO2LsRYsLd6dR8LAg+Bxt7Gaot4Iyzvk2j4baz+24tVV3+ylF
 7nQV1f3GXEWBkEVDikGf3+ynolLae7wijinv0dHf8tjJydOqHkMa8Y8wycNDRTGS9w
 zzS1j44Bms8HQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Lbzn62Rg
Subject: Re: [Buildroot] [PATCH v2 06/13] configs/imx6ullevk: bump Linux to
 6.18.8 and U-Boot to 2026.01
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKSSd2ZSBzZW50IGEgVjMgb2YgdGhpcyBwYXRjaDoKaHR0cHM6Ly9wYXRjaHdv
cmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI2MDIyNjE3MzUyNC4yNzAy
NjIxLTEtZ2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbS8KCmJ1dCBmb3Jnb3R0
ZW4gdG8gYWRkIFYzIGFuZCBjaGFuZ2VzIGJldHdlZW4gdmVyc2lvbnMuCkxldCBtZSBrbm93IGlm
IGl0J3Mgc3VmZmljaWVudCBmb3IgeW91IG9yIGlmIHlvdSB3YW50IG1lIHRvIHNlbmQgaXQgYXMK
VjMgd2l0aCBjaGFuZ2VzLgoKVGhhbmsgeW91IQpCZXN0IHJlZ2FyZHMKR2l1bGlvCgpPbiAxNC8w
Mi8yMDI2IDIwOjU2LCBKdWxpZW4gT2xpdmFpbiB3cm90ZToKPiBIaSBHaXVsaW8sIEFsbCwKPiAK
PiBUaGFua3MgZm9yIHRoZSBwYXRjaC4gSSBoYXZlIGEgY29tbWVudCwgc2VlIGJlbG93Lgo+IAo+
IE9uIDEwLzAyLzIwMjYgMDE6MDcsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+PiBUaGUgcGF0Y2g6
Cj4+ICogYnVtcHMgTGludXgga2VybmVsIHRvIHZlcnNpb24gNi4xOC44Cj4+ICogYnVtcHMgVS1C
b290IHRvIHZlcnNpb24gMjAyNi4wMQo+PiAqIGZvcmNlcyBjaGVjayBoYXNoZXMKPj4KPj4gU2ln
bmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVl
cmluZy5jb20+Cj4+IC0tLQo+PiDCoC5jaGVja3BhY2thZ2VpZ25vcmXCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+
IMKgYm9hcmQvZnJlZXNjYWxlL2lteDZ1bGxldmsvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoIHwg
MSArCj4+IMKgYm9hcmQvZnJlZXNjYWxlL2lteDZ1bGxldmsvcGF0Y2hlcy91Ym9vdC91Ym9vdC5o
YXNoIHwgMSArCj4+IMKgY29uZmlncy9pbXg2dWxsZXZrX2RlZmNvbmZpZ8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA5ICsrKysrKy0tLQo+PiDCoDQgZmls
ZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IFsuLi5dCj4+IGRp
ZmYgLS1naXQgYS9ib2FyZC9mcmVlc2NhbGUvaW14NnVsbGV2ay9wYXRjaGVzL2xpbnV4L2xpbnV4
Lmhhc2ggYi8gCj4+IGJvYXJkL2ZyZWVzY2FsZS9pbXg2dWxsZXZrL3BhdGNoZXMvbGludXgvbGlu
dXguaGFzaAo+PiBpbmRleCBiMTM4NjQyNjMzLi44OGYyMTZmYzVlIDEwMDY0NAo+PiAtLS0gYS9i
b2FyZC9mcmVlc2NhbGUvaW14NnVsbGV2ay9wYXRjaGVzL2xpbnV4L2xpbnV4Lmhhc2gKPj4gKysr
IGIvYm9hcmQvZnJlZXNjYWxlL2lteDZ1bGxldmsvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoCj4+
IEBAIC0xLDIgKzEsMyBAQAo+PiDCoCMgTG9jYWxseSBjYWxjdWxhdGVkCj4+IMKgc2hhMjU2IAo+
PiAyMTY2ZDkyZTU2MzFlZTExYmQyNDlkNDkyYTFmNDAwOWM3NjM1ZWUzNmI4MzVmYTU1Mzg0YjRj
ZTQxZThhNjNmIAo+PiBsaW51eC1pbXgtbGYtNi4xMi40OS0yLjIuMC50YXIuZ3oKPj4gK3NoYTI1
NiAKPj4gMzdmMGM1ZDVjMjQyYzFkNjA0ZTg3ZDQ4ZjA4Nzk1ZTg2MWE1YTg1ZjcyNWI0Y2ExMWQw
YTUzOGYxMmZmOGNmZiAKPj4gbGludXgtNi4xOC44LnRhci54ego+IAo+IEkgd291bGQgbGlrZSB0
byBhdm9pZCBoYXZpbmcgdHdvIGRlZmNvbmZpZ3MgKG9uZSB2ZW5kb3IgYW5kIG9uZQo+IHVwc3Ry
ZWFtKSBzaGFyaW5nIHRoZSBzYW1lIGJvYXJkIGdsb2JhbCBwYXRjaCBkaXJlY3RvcnkuIFRoaXMg
Y291bGQKPiBiZWNvbWUgbW9yZSBkaWZmaWN1bHQgdG8gbWFpbnRhaW4sIGFzIHdlIG1heSB3YW50
IGluIHRoZSBmdXR1cmUgdG8KPiBhZGQgYSBwYXRjaCBmb3Igb25lIGJ1dCBub3QgdGhlIG90aGVy
Lgo+IAo+IFRoZSBjdXJyZW50IChhbmQgdW5mb3J0dW5hdGUpIHN0YXRlIGlzIHRoYXQgaS5NWCBk
ZWZjb25maWdzIHVzaW5nCj4gdmVuZG9yIEJTUCBjb21wb25lbnRzIGFyZSB1c2luZyBhIGJvYXJk
IGRpcmVjdG9yeSBsaWtlCj4gImJvYXJkL2ZyZWVzY2FsZS9pbXg2dWxsZXZrIiAod2l0aG91dCBh
IGRhc2gpIHdoZXJlYXMgZGVmY29uZmlnIGZvcgo+IHRoZSBzYW1lIGJvYXJkIHVzaW5nIHVwc3Ry
ZWFtIEJTUCBjb21wb25lbnRzIGFyZSB1c2luZyBzb21ldGhpbmcKPiBsaWtlICJib2FyZC9mcmVl
c2NhbGUvaW14NnVsbC1ldmsiICh3aXRoIGEgZGFzaCkuIFNlZToKPiBodHRwczovL2dpdGxhYi5j
b20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS90cmVlL21hc3Rlci9ib2FyZC9mcmVlc2NhbGUv
Cj4gCj4gU28sIGV2ZW4gaWYgdGhlIGRpc3RpbmN0aW9uIGlzIG5vdCB2ZXJ5IGNsZWFyIGF0IHRo
ZSBtb21lbnQsIEkKPiBzdWdnZXN0IHRvIGNvbnRpbnVlIHRvIGRvIHRoZSBzYW1lLCBmb3Igbm93
Lgo+IAo+IFRoZSBsb25nZXIgdGVybSBwbGFuIHdvdWxkIGJlIHRvIGZvbGxvdyB0aGUgZ3VpZGVs
aW5lcyBwcm9wb3NlZCBpbjoKPiBodHRwczovL2VsaW51eC5vcmcvQnVpbGRyb290OkRldmVsb3Bl
ckRheXNFTENFMjAyNCNSdWxlc19mb3JfZGVmY29uZmlncwo+IHRoYXQgaXMsIGRlZmNvbmZpZyB1
c2luZyB2ZW5kb3IgQlNQIGNvbXBvbmVudCB3b3VsZCBnbyBpbjoKPiAiYm9hcmQvZnJlZXNjYWxl
L2lteDZ1bGxldmtfdmVuZG9yIgo+IGFuZCBkZWZjb25maWdzIHVzaW5nIHVwc3RyZWFtIGNvbXBv
bmVudHMgd291bGQgZ28gaW46Cj4gImJvYXJkL2ZyZWVzY2FsZS9pbXg2dWxsZXZrIi4KPiAKPj4g
ZGlmZiAtLWdpdCBhL2NvbmZpZ3MvaW14NnVsbGV2a19kZWZjb25maWcgYi9jb25maWdzL2lteDZ1
bGxldmtfZGVmY29uZmlnCj4+IGluZGV4IDM4ZWE4ZjY5NDAuLjI3OWZiODliOWQgMTAwNjQ0Cj4+
IC0tLSBhL2NvbmZpZ3MvaW14NnVsbGV2a19kZWZjb25maWcKPj4gKysrIGIvY29uZmlncy9pbXg2
dWxsZXZrX2RlZmNvbmZpZwo+PiBAQCAtMSwxMyArMSwxNSBAQAo+PiDCoEJSMl9hcm09eQo+PiDC
oEJSMl9jb3J0ZXhfYTc9eQo+PiDCoEJSMl9BUk1fRlBVX05FT05fVkZQVjQ9eQo+PiAtQlIyX1BB
Q0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzY9eQo+PiArQlIyX1BBQ0tBR0VfSE9T
VF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzE4PXkKPj4gK0JSMl9HTE9CQUxfUEFUQ0hfRElSPSJi
b2FyZC9mcmVlc2NhbGUvaW14NnVsbGV2ay9wYXRjaGVzIgo+IAo+IENvdWxkIHlvdSBzZW5kIGFu
IHVwZGF0ZWQgcGF0Y2ggdXNpbmcgaW5zdGVhZDoKPiBCUjJfR0xPQkFMX1BBVENIX0RJUj0iYm9h
cmQvZnJlZXNjYWxlL2lteDZ1bGwtZXZrL3BhdGNoZXMiCj4gYW5kIHB1dHRpbmcgZGVkaWNhdGVk
IGhhc2ggZmlsZXMgaW4gdGhpcyBkaXJlY3RvcnksIHBsZWFzZT8KPiAKPj4gK0JSMl9ET1dOTE9B
RF9GT1JDRV9DSEVDS19IQVNIRVM9eQo+PiDCoEJSMl9ST09URlNfREVWSUNFX0NSRUFUSU9OX0RZ
TkFNSUNfRVVERVY9eQo+PiDCoEJSMl9UQVJHRVRfR0VORVJJQ19HRVRUWV9QT1JUPSJ0dHlteGMw
Igo+Pgo+PiBCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJib2FyZC9mcmVlc2NhbGUvY29t
bW9uL2lteC9wb3N0LWltYWdlLnNoIgo+PiDCoEJSMl9MSU5VWF9LRVJORUw9eQo+PiDCoEJSMl9M
SU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQo+PiAtQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01f
VkVSU0lPTl9WQUxVRT0iNi42LjQiCj4+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9O
X1ZBTFVFPSI2LjE4LjgiCj4+IMKgQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9ImlteF92Nl92
NyIKPj4gwqBCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKPj4gwqBCUjJfTElOVVhfS0VS
TkVMX0lOVFJFRV9EVFNfTkFNRT0ibnhwL2lteC9pbXg2dWxsLTE0eDE0LWV2ayIKPiAKPiBCZXN0
IHJlZ2FyZHMsCj4gCj4gSnVsaWVuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
