Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0B2C43334
	for <buildroot@archiver.kernel.org>; Tue, 21 Jun 2022 12:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D8DD40BB6;
	Tue, 21 Jun 2022 12:02:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D8DD40BB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wZKUFxo0C6do; Tue, 21 Jun 2022 12:02:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0D3C40BAF;
	Tue, 21 Jun 2022 12:02:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0D3C40BAF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67C7C1BF2A1
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 12:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F1B983F44
 for <buildroot@lists.busybox.net>; Tue, 21 Jun 2022 12:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F1B983F44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4t0byJ5ZMVpz for <buildroot@lists.busybox.net>;
 Tue, 21 Jun 2022 12:02:02 +0000 (UTC)
X-Greylist: delayed 00:20:34 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 120E783F2D
Received: from 2.mo548.mail-out.ovh.net (2.mo548.mail-out.ovh.net
 [178.33.255.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 120E783F2D
 for <buildroot@buildroot.org>; Tue, 21 Jun 2022 12:02:02 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.47])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 527852179B;
 Tue, 21 Jun 2022 11:23:37 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 21 Jun
 2022 13:23:36 +0200
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c53e813e-0fed-e2bd-2999-3d425c6b7fcd@kaod.org>
Date: Tue, 21 Jun 2022 13:23:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, <buildroot@buildroot.org>
References: <20220606135756.2264709-1-clg@kaod.org>
 <2cf39f4d-39ce-78e8-427e-17b48de387c0@mind.be>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <2cf39f4d-39ce-78e8-427e-17b48de387c0@mind.be>
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ecf258cf-1824-491a-b368-58d8be3e587d
X-Ovh-Tracer-Id: 12265553585722592163
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeffedgfeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejgefggffgheejgfdufeeiueffveehteejgfelueekgfegtefgffejhedtgfejgfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdfovfetjfhoshhtpehmohehgeek
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004910bbf2c-6430-4ab5-943f-fa3eea5f0a2b,
 968046EEA762EFF7637E46B232C9329570CD0A04) smtp.auth=clg@kaod.org
Subject: Re: [Buildroot] [PATCH v2 1/2] configs/aspeed_ast2600evb: new
 defconfig
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
Cc: chin-ting_kuo@aspeedtech.com, troy_lee@aspeedtech.com,
 Joel Stanley <joel@jms.id.au>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gNi8yMC8yMiAyMjowMCwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4gCj4gCj4gT24g
MDYvMDYvMjAyMiAxNTo1NywgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6Cj4+IFRoZSBrZXJuZWwg
aXMgZnJvbSB1cHN0cmVhbSBhbmQgVS1Cb290IGlzIGZyb20gdGhlIE9wZW5CTUMgYnJhbmNoCj4+
IHdoZXJlIG1vc3Qgb2YgZGV2ZWxvcG1lbnQgaXMgZG9uZS4gTWFpbmxpbmUgZG9lc24ndCBoYXZl
IHRoZSByZXF1aXJlZAo+PiBzdXBwb3J0IGZvciBIVy4KPj4KPj4gVGhlIG1haW4gcmVzdWx0aW5n
IGZpbGUgZnJvbSB0aGUgYnVpbGQgaXMgYSBmbGFzaCBpbWFnZS4gVGhlIHBhcnRpdGlvbgo+PiBs
YXlvdXQgbWF0Y2hlcyB0aGUgT3BlbkJNQyBvbmUgZm9yIDY0TSBjaGlwcy4gSXQgbWFrZXMgaXQg
ZWFzaWVyIHRvCj4+IHVwZGF0ZSB0aGUgZGlmZmVyZW50IHBhcnRpdGlvbnMgZnJvbSBMaW51eC4g
SW50ZXJtZWRpYXRlIGZpbGVzIGNhbiBiZQo+PiB1c2VkIHRvIGJvb3QgZnJvbSBVLWJvb3Qgb3Zl
ciB0aGUgbmV0d29yayBvciB0byBib290IFFFTVUgdXNpbmcKPj4gLWtlcm5lbC8taW5pdHJkLy1k
dGIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+
Cj4gCj4gW3NuaXBdCj4+IGRpZmYgLS1naXQgYS9jb25maWdzL2FzcGVlZF9hc3QyNjAwZXZiX2Rl
ZmNvbmZpZyBiL2NvbmZpZ3MvYXNwZWVkX2FzdDI2MDBldmJfZGVmY29uZmlnCj4+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uMTllNDZhNzUyZjNjCj4+IC0tLSAv
ZGV2L251bGwKPj4gKysrIGIvY29uZmlncy9hc3BlZWRfYXN0MjYwMGV2Yl9kZWZjb25maWcKPj4g
QEAgLTAsMCArMSw1NiBAQAo+PiArIyBBcmNoaXRlY3R1cmUKPj4gK0JSMl9hcm09eQo+IAo+ICDC
oEkgd291bGQgaGF2ZSBleHBlY3RlZAo+IAo+IEJSMl9jb3J0ZXhfYTc9eQo+IAo+IE5vdyBpdCdz
IGJ1aWxkaW5nIGZvciBhcm05MjZ0Li4uCgpUaGlzIGxvb2tzIGJldHRlciA6CgogICBCUjJfY29y
dGV4X2E3PXkKICAgQlIyX0FSTV9GUFVfVkZQVjQ9eQoKPj4gKwo+PiArIyBTeXN0ZW0KPj4gK0JS
Ml9UQVJHRVRfR0VORVJJQ19IT1NUTkFNRT0iYXNwZWVkLWV2YiIKPj4gK0JSMl9UQVJHRVRfR0VO
RVJJQ19JU1NVRT0iQXNwZWVkIEVWQiIKPj4gK0JSMl9UQVJHRVRfR0VORVJJQ19HRVRUWV9QT1JU
PSJ0dHlTNCIKPiAKPiAgwqBEb2Vzbid0IHRoZSBkZWZhdWx0IGNvbnNvbGUgd29yaz8KCml0IGRv
ZXMuCgo+PiArQlIyX1NZU1RFTV9ESENQPSJldGgwIgo+PiArCj4+ICsjIEZpbGVzeXN0ZW0KPj4g
K0JSMl9UQVJHRVRfUk9PVEZTX0NQSU89eQo+PiArQlIyX1RBUkdFVF9ST09URlNfQ1BJT19YWj15
Cj4+ICsKPj4gKyMgSW1hZ2UKPj4gK0JSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9ImJvYXJk
L2FzcGVlZC9jb21tb24vcG9zdC1pbWFnZS5zaCIKPj4gK0JSMl9ST09URlNfUE9TVF9TQ1JJUFRf
QVJHUz0iJChCUjJfREVGQ09ORklHKSIKPiAKPiAgwqBJIHRoaW5rIHRoaXMgYXJndW1lbnQgaXNu
J3QgdXNlZCwgaXMgaXQ/Cj4KPj4gKwo+PiArIyBMaW51eCBoZWFkZXJzIHNhbWUgYXMga2VybmVs
Cj4+ICtCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVfMTc9eQo+PiArCj4+
ICsjIEtlcm5lbAo+PiArQlIyX0xJTlVYX0tFUk5FTD15Cj4+ICtCUjJfTElOVVhfS0VSTkVMX0NV
U1RPTV9WRVJTSU9OPXkKPj4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9
IjUuMTcuNyIKPj4gK0JSMl9MSU5VWF9LRVJORUxfREVGQ09ORklHPSJhc3BlZWRfZzUiCj4+ICtC
UjJfTElOVVhfS0VSTkVMX0NPTkZJR19GUkFHTUVOVF9GSUxFUz0iYm9hcmQvYXNwZWVkL2FzdDI2
MDAtZXZiL2xpbnV4LmZyYWdtZW50Igo+PiArQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15
Cj4+ICtCUjJfTElOVVhfS0VSTkVMX0lOVFJFRV9EVFNfTkFNRT0iYXNwZWVkLWFzdDI2MDAtZXZi
Igo+PiArCj4+ICsjIEJvb3QKPj4gK0JSMl9UQVJHRVRfVUJPT1Q9eQo+PiArQlIyX1RBUkdFVF9V
Qk9PVF9CVUlMRF9TWVNURU1fS0NPTkZJRz15Cj4+ICtCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9H
SVQ9eQo+PiArQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fUkVQT19VUkw9Imh0dHBzOi8vZ2l0aHVi
LmNvbS9vcGVuYm1jL3UtYm9vdC5naXQiCj4+ICtCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9SRVBP
X1ZFUlNJT049ImYyYjgyZmE0YmExN2VkODA5MWZlNzZjMjg0MjIwMDA2NjQ1YTI5M2IiCj4+ICtC
UjJfVEFSR0VUX1VCT09UX0JPQVJEX0RFRkNPTkZJRz0iZXZiLWFzdDI2MDAiCj4+ICtCUjJfVEFS
R0VUX1VCT09UX05FRURTX0RUQz15Cj4+ICtCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9NQUtFT1BU
Uz0iREVWSUNFX1RSRUU9YXN0MjYwMGExLWV2YiIKPj4gKwo+PiArQlIyX1BBQ0tBR0VfSE9TVF9V
Qk9PVF9UT09MUz15Cj4+ICtCUjJfUEFDS0FHRV9IT1NUX1VCT09UX1RPT0xTX0ZJVF9TVVBQT1JU
PXkKPj4gK0JSMl9QQUNLQUdFX0hPU1RfR0VOSU1BR0U9eQo+PiArCj4+ICsjIFRhcmdldCB0b29s
cwo+PiArQlIyX1BBQ0tBR0VfTVREPXkKPiAKPiAgwqBPSywgZmFpciBlbm91Z2gsIHNpbmNlIGZs
YXNoY3AgaXMgbWVudGlvbmVkIGluIHRoZSByZWFkbWUuCj4gCj4+ICtCUjJfUEFDS0FHRV9VQk9P
VF9UT09MUz15Cj4+ICtCUjJfUEFDS0FHRV9MSUJHUElPRD15Cj4+ICtCUjJfUEFDS0FHRV9MSUJH
UElPRF9UT09MUz15Cj4+ICtCUjJfUEFDS0FHRV9MSUJDVVJMPXkKPj4gK0JSMl9QQUNLQUdFX0xJ
QkNVUkxfQ1VSTD15Cj4+ICtCUjJfUEFDS0FHRV9MSUJDVVJMX1ZFUkJPU0U9eQo+PiArQlIyX1BB
Q0tBR0VfTElCRkZJPXkKPj4gK0JSMl9QQUNLQUdFX0RST1BCRUFSPXkKPj4gK0JSMl9QQUNLQUdF
X0RST1BCRUFSX0RJU0FCTEVfUkVWRVJTRUROUz15Cj4+ICtCUjJfUEFDS0FHRV9MUlpTWj15Cj4g
Cj4gIMKgQnV0IHdoeSBhcmUgYWxsIHRoZXNlIG5lZWRlZD8gRGVmY29uZmlncyBzaG91bGQgYmUg
bWluaW1hbCAtIHRoZSBvbmx5IHRoaW5nIHRvIGFkZCBpcyBzdHVmZiB0aGF0IHlvdSBuZWVkIHRv
IG1ha2UgdGhlIGhhcmR3YXJlIHdvcms7IHR5cGljYWxseSBsaW51eC1maXJtd2FyZSwgZm9yIGV4
YW1wbGUsIG9yIHdwYV9zdXBwbGljYW50IGZvciBib2FyZHMgdGhhdCBoYXZlIG9ubHkgd2lmaS4g
SSBkb24ndCB0aGluayB0aGF0IHRoYXQncyB0aGUgY2FzZSBoZXJlLgo+IAo+PiArQlIyX1BBQ0tB
R0VfSE9TVF9NS1BBU1NXRD15Cj4gCj4gIMKgVGhpcyBvbmUgaXMgZGVmaW5pdGVseSBub3QgbmVl
ZGVkLCBpdCdzIG5vdCB1c2VkIGFueXdoZXJlIGR1cmluZyB0aGUgYnVpbGQuCgoKWWVzLiBUaGVz
ZSBhcmUgbGVmdG92ZXJzIGZvciB0aGUgY29uZmlncyB3ZSB1c2UgZm9yIGRldi4gVGhleSBhcmUg
bm90CnJlcXVpcmVkLgoKVGhhbmtzLAoKQy4KCj4gIMKgUmVnYXJkcywKPiAgwqBBcm5vdXQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
