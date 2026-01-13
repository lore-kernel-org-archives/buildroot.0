Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EBFD2502E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 473318444F;
	Tue, 13 Jan 2026 19:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jEIl4xTKlSvF; Tue, 13 Jan 2026 19:48:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 476CD84449
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333701;
	bh=HrMV/B5K7r3x2n5QuytAOVyI+cX2mABV1bibIy0GRAc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OrFvQZ37a6FN/PM/xaA8YX/xkOGT5qFpFqVgFihG0fUVT8tG+01W3kzQrcRwyGia+
	 7bkbFMc4CyI4g6woKYNOhcPZJmHGKGq03aYv2S/efeBDnj2NDSAYlJ4giUOtN6N2tE
	 3jAiCnT1D6AUfgqW12HeAqdjzCVWSOKqyIm2uCkyxSUsUFGj2tolOBkAqRkMgVWkfR
	 TgLl7cwQyOscH89sIJafGAaERvCpmFy60yV4OHiax+xqSFa+h5uNU6/Rm5gWq22t8v
	 TZo/BoyYHMUvEefhI2ehBsm18C5Wmamt+f7cxzRmvJzVX0qCj6/75JyEofA97VR+r+
	 rv4dQW7D9CJmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 476CD84449;
	Tue, 13 Jan 2026 19:48:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BA42231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D51240E53
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uqyn1y3FUPwF for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:48:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1EDAF40E51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EDAF40E51
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1EDAF40E51
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:48:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 20DF3B97A863; Tue, 13 Jan 2026 20:48:12 +0100 (CET)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Tue, 13 Jan 2026 20:48:09 +0100
Message-ID: <20260113194810.100516-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228211045.3059593-2-thomas.petazzoni@bootlin.com>
References: <20251228211045.3059593-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1768333692; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=2tuUwMhryEmqo4mcvN5Rzd7mdOdfbec1cgQ8FnFYNFU=;
 b=Av6Fbj36A2eTsWfKD9+1frxBBQPVR+dWE0fpOlXGegnQyBmbIquBuEqvjiTfi7F969jHgn
 bwUQjpk9TV8nvtQY/8JkXAg+2Ufml+AIIH4aw/rl6a/y/yA2yU0CC1SREA0uHQZhNFjBR+
 On2xyOrxqhM7wznoyUE6nP37tQ6SSMpy9QI856NzkjdJbrW7ybRZxSfDWQPKNm+0HeATG1
 q2Oxp2xQbu4iweN+BgFAcq0dscdAKvulMz1cPkaJ8kLFmyRrUQOTB7MAmW8DkqZ4MHJnoo
 iw1SE+kJC+MBqlNqAnoFOB9sfD4t1jyaJqmw+e8R2f+VLTQyhMZcrhI5qLgHmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Av6Fbj36
Subject: Re: [Buildroot] [PATCH 2/5] package/qt5/qt5webkit: fix build with
 ICU >= 76
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gU2luY2UgdGhlIGJ1bXAgb2YgSUNVIGZyb20gSUNVIDczIHRvIElDVSA3
NyBpbiBjb21taXQKPiBkY2VlOTk1MDdjNjc2NzIzMGZkMWZhZWVlZmU5NWY1NjYyZWIwM2EzLCB0
aGUgYnVpbGQgb2YgcXQ1d2Via2l0IGZhaWxzCj4gd2l0aDoKPiAKPiAvaG9tZS90aG9tYXMvYnVp
bGRyb290L2JyL291dHB1dC1hbGwvaG9zdC9hYXJjaDY0LWJ1aWxkcm9vdC1saW51eC1nbnUvc3lz
cm9vdC91c3IvaW5jbHVkZS91bmljb2RlL2NoYXIxNnB0ci5oOjI3MTozODogZXJyb3I6IOKAmGVu
YWJsZV9pZl904oCZIGluIG5hbWVzcGFjZSDigJhzdGTigJkgZG9lcyBub3QgbmFtZSBhIHRlbXBs
YXRlIHR5cGUKPiAgIDI3MSB8IHRlbXBsYXRlPHR5cGVuYW1lIFQsIHR5cGVuYW1lID0gc3RkOjpl
bmFibGVfaWZfdDxzdGQ6OmlzX3NhbWVfdjxULCBVQ2hhcj4+Pgo+ICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+Cj4gCj4gV2UgdGFrZW4gdHdv
IHBhdGNoZXMgZnJvbSBBcmNoIExpbnV4LCBvbmUgd2hpY2ggaXMgYSBwYXJ0aWFsIHVwc3RyZWFt
Cj4gYmFja3BvcnQsIGFuZCBhbm90aGVyIHdoaWNoIHdhcyBzdWJtaXR0ZWQgdXBzdHJlYW0sIHRv
IGFkZHJlc3MgdGhpcwo+IGJ1aWxkIGlzc3VlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQ
ZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+CgpBcHBsaWVkIHRvIDIwMjUu
MTEueC4gVGhhbmtzCgo+IC0tLQo+ICAuLi5sYXRmb3JtLmgtZml4LWJ1aWxkLXdpdGgtbmV3ZXIt
dmVyc2kucGF0Y2ggfCA0MCArKysrKysrKysrKysrKysrKysrCj4gIC4uLmVhZGVyLW9ubHktQVBJ
cy1pbnRyb2R1Y2VkLWluLUlDVS03Ni5wYXRjaCB8IDI4ICsrKysrKysrKysrKysKPiAgMiBmaWxl
cyBjaGFuZ2VkLCA2OCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L3F0NS9xdDV3ZWJraXQvMDAxMC1Tb3VyY2UtV1RGLXd0Zi1QbGF0Zm9ybS5oLWZpeC1idWlsZC13
aXRoLW5ld2VyLXZlcnNpLnBhdGNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3F0NS9x
dDV3ZWJraXQvMDAxMS1EaXNhYmxlLUlDVS1DLWhlYWRlci1vbmx5LUFQSXMtaW50cm9kdWNlZC1p
bi1JQ1UtNzYucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xdDUvcXQ1d2Via2l0LzAw
MTAtU291cmNlLVdURi13dGYtUGxhdGZvcm0uaC1maXgtYnVpbGQtd2l0aC1uZXdlci12ZXJzaS5w
YXRjaCBiL3BhY2thZ2UvcXQ1L3F0NXdlYmtpdC8wMDEwLVNvdXJjZS1XVEYtd3RmLVBsYXRmb3Jt
LmgtZml4LWJ1aWxkLXdpdGgtbmV3ZXItdmVyc2kucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+IGluZGV4IDAwMDAwMDAwMDAuLjQ2NTYyODk4NzAKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIv
cGFja2FnZS9xdDUvcXQ1d2Via2l0LzAwMTAtU291cmNlLVdURi13dGYtUGxhdGZvcm0uaC1maXgt
YnVpbGQtd2l0aC1uZXdlci12ZXJzaS5wYXRjaAo+IEBAIC0wLDAgKzEsNDAgQEAKPiArRnJvbSAz
MGE5MjcwYTNmZTkxNTdhNTMyZTUyNDU4ZWU0N2IwZjNmY2MyZjk3IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQo+ICtGcm9tOiBLb25zdGFudGluIFRva2FyZXYgPGFubnVsZW5AeWFuZGV4LnJ1Pgo+
ICtEYXRlOiBNb24sIDI3IE1heSAyMDI0IDIzOjIzOjExICswMzAwCj4gK1N1YmplY3Q6IFtQQVRD
SF0gU291cmNlL1dURi93dGYvUGxhdGZvcm0uaDogZml4IGJ1aWxkIHdpdGggbmV3ZXIKPiArIHZl
cnNpb25zIG9mIElDVQo+ICsKPiArUGFydGlhbCBiYWNrcG9ydCBvZiByMjYwNTU0ICg3OWZlMTlj
YWYpCj4gKwo+ICtJbiBwYXJ0aWN1bGFyLCB3ZSBuZWVkIC1EVV9TSE9XX0NQTFVTUExVU19BUEk9
MCB0byBhdm9pZCBjb21waWxhdGlvbgo+ICtlcnJvcnMgaW4gQysrIHBhcnRzIG9mIElDVSBoZWFk
ZXJzIHdoaWNoIHdlIGFyZSBub3QgdXNpbmcgYW55d2F5Lgo+ICsKPiArQ2hhbmdlLUlkOiBJYjQ1
Yzc0ZTNjYWFkMTQ4ZmJkNzc4ZDBjMDczMzAxMjdmN2RhYjVlYwo+ICtUYWtlbiBmcm9tOiBodHRw
czovL2dpdGh1Yi5jb20vYXJjaGxpbnV4L2F1ci9ibG9iL3F0NS13ZWJraXQvcXQ1LXdlYmtpdC1p
Y3U3NS5wYXRjaAo+ICtVcHN0cmVhbTogcGFydCBvZiBodHRwczovL2dpdGh1Yi5jb20vcXR3ZWJr
aXQvcXR3ZWJraXQvY29tbWl0Lzc5ZmUxOWNhZgo+ICtTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0
YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgo+ICstLS0KPiArIFNvdXJjZS9X
VEYvd3RmL1BsYXRmb3JtLmggfCA3ICsrKysrKysKPiArIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKykKPiArCj4gK2RpZmYgLS1naXQgYS9Tb3VyY2UvV1RGL3d0Zi9QbGF0Zm9ybS5oIGIv
U291cmNlL1dURi93dGYvUGxhdGZvcm0uaAo+ICtpbmRleCA1NzE3ZjNlYTE2NjQuLmRmZWQ0YTEz
ZGQyYiAxMDA2NDQKPiArLS0tIGEvU291cmNlL1dURi93dGYvUGxhdGZvcm0uaAo+ICsrKysgYi9T
b3VyY2UvV1RGL3d0Zi9QbGF0Zm9ybS5oCj4gK0BAIC0xMTI1LDYgKzExMjUsMTMgQEAKPiArICNk
ZWZpbmUgRU5BQkxFX1BMQVRGT1JNX0ZPTlRfTE9PS1VQIDEKPiArICNlbmRpZgo+ICsgCj4gKysv
KiBGSVhNRTogVGhpcyBkb2VzIG5vdCBiZWxvbmcgaW4gUGxhdGZvcm0uaCBhbmQgc2hvdWxkIGlu
c3RlYWQgYmUgaW5jbHVkZWQgaW4gYW5vdGhlciBtZWNoYW5pc20gKGNvbXBpbGVyIG9wdGlvbiwg
cHJlZml4IGhlYWRlciwgY29uZmlnLmgsIGV0YykgKi8KPiArKy8qIElDVSBjb25maWd1cmF0aW9u
LiBTb21lIG9mIHRoZXNlIG1hdGNoIElDVSBkZWZhdWx0cyBvbiBzb21lIHBsYXRmb3JtcywgYnV0
IHdlIHdvdWxkIGxpa2UgdGhlbSBjb25zaXN0ZW50bHkgc2V0IGV2ZXJ5d2hlcmUgd2UgYnVpbGQg
V2ViS2l0LiAqLwo+ICsrI2RlZmluZSBVX1NIT1dfQ1BMVVNQTFVTX0FQSSAwCj4gKysjaWZkZWYg
X19jcGx1c3BsdXMKPiArKyNkZWZpbmUgVUNIQVJfVFlQRSBjaGFyMTZfdAo+ICsrI2VuZGlmCj4g
KysKPiArICNpZiBDT01QSUxFUihNU1ZDKQo+ICsgI3VuZGVmIF9fU1REQ19MSU1JVF9NQUNST1MK
PiArICNkZWZpbmUgX19TVERDX0xJTUlUX01BQ1JPUwo+ICstLSAKPiArMi41Mi4wCj4gKwo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3F0NS9xdDV3ZWJraXQvMDAxMS1EaXNhYmxlLUlDVS1DLWhlYWRl
ci1vbmx5LUFQSXMtaW50cm9kdWNlZC1pbi1JQ1UtNzYucGF0Y2ggYi9wYWNrYWdlL3F0NS9xdDV3
ZWJraXQvMDAxMS1EaXNhYmxlLUlDVS1DLWhlYWRlci1vbmx5LUFQSXMtaW50cm9kdWNlZC1pbi1J
Q1UtNzYucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjE3
ZGZjN2U3ZTAKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9xdDUvcXQ1d2Via2l0LzAw
MTEtRGlzYWJsZS1JQ1UtQy1oZWFkZXItb25seS1BUElzLWludHJvZHVjZWQtaW4tSUNVLTc2LnBh
dGNoCj4gQEAgLTAsMCArMSwyOCBAQAo+ICtGcm9tIGJmMjUzYjM3ZWJmM2ZkOTlmYTNjYzQ2YmQ3
MzdhODhkZWZhODkxNGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IERtaXRyeSBT
aGFjaG5ldiA8bWl0eWE1N0BnbWFpbC5jb20+Cj4gK0RhdGU6IFRodSwgOSBKYW4gMjAyNSAxNDox
ODozMSArMDMwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIERpc2FibGUgSUNVIEMrKyBoZWFkZXItb25s
eSBBUElzLCBpbnRyb2R1Y2VkIGluIElDVSA3Ngo+ICsKPiArVGhleSByZXF1aXJlIEMrKzE3IHdo
aWNoIHdlIGRvIG5vdCBoYXZlLCBidXQgd2UgZG8gbm90IG5lZWQgdGhlbSBhbnl3YXkuCj4gKwo+
ICtVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL3F0d2Via2l0L3F0d2Via2l0L3B1bGwvMTEw
Nwo+ICtTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJv
b3RsaW4uY29tPgo+ICstLS0KPiArIFNvdXJjZS9XVEYvd3RmL1BsYXRmb3JtLmggfCAxICsKPiAr
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ICsKPiArZGlmZiAtLWdpdCBhL1NvdXJj
ZS9XVEYvd3RmL1BsYXRmb3JtLmggYi9Tb3VyY2UvV1RGL3d0Zi9QbGF0Zm9ybS5oCj4gK2luZGV4
IGRmZWQ0YTEzZGQyYi4uNmJhNmMzOTcyYWVlIDEwMDY0NAo+ICstLS0gYS9Tb3VyY2UvV1RGL3d0
Zi9QbGF0Zm9ybS5oCj4gKysrKyBiL1NvdXJjZS9XVEYvd3RmL1BsYXRmb3JtLmgKPiArQEAgLTEx
MjgsNiArMTEyOCw3IEBACj4gKyAvKiBGSVhNRTogVGhpcyBkb2VzIG5vdCBiZWxvbmcgaW4gUGxh
dGZvcm0uaCBhbmQgc2hvdWxkIGluc3RlYWQgYmUgaW5jbHVkZWQgaW4gYW5vdGhlciBtZWNoYW5p
c20gKGNvbXBpbGVyIG9wdGlvbiwgcHJlZml4IGhlYWRlciwgY29uZmlnLmgsIGV0YykgKi8KPiAr
IC8qIElDVSBjb25maWd1cmF0aW9uLiBTb21lIG9mIHRoZXNlIG1hdGNoIElDVSBkZWZhdWx0cyBv
biBzb21lIHBsYXRmb3JtcywgYnV0IHdlIHdvdWxkIGxpa2UgdGhlbSBjb25zaXN0ZW50bHkgc2V0
IGV2ZXJ5d2hlcmUgd2UgYnVpbGQgV2ViS2l0LiAqLwo+ICsgI2RlZmluZSBVX1NIT1dfQ1BMVVNQ
TFVTX0FQSSAwCj4gKysjZGVmaW5lIFVfU0hPV19DUExVU1BMVVNfSEVBREVSX0FQSSAwCj4gKyAj
aWZkZWYgX19jcGx1c3BsdXMKPiArICNkZWZpbmUgVUNIQVJfVFlQRSBjaGFyMTZfdAo+ICsgI2Vu
ZGlmCj4gKy0tIAo+ICsyLjUyLjAKPiArCj4gLS0gCj4gMi41Mi4wCj4gCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBs
aXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
