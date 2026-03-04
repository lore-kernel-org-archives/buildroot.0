Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052D9EFCE3C
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 19:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B75D5811F7;
	Wed,  4 Mar 2026 19:31:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5K19e0Ys8jf1; Wed,  4 Mar 2026 19:31:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1D6C811FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772652681;
	bh=j0sse/Mg/0nu/rKJ1zjAWGdKtqGnT6JOQgIYlAez2RI=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TitpIs4s3mW6TC8I/XlZF7Qshqz0z4usPCtS3b/IcAUNj7fKvoZg2Vg+oI7u5JnWU
	 EQM+snK20swUp6/ycy4zdNAwaE5U7g9XQm31wPjzpGcxu7AimNq94cw83LFKi/4UBA
	 Fi9AmNnoZYMDpLrpBW0aPvRPqY7qJHGSx8Cr7dqvCDhW4fPVEjSLeqGrBJDezJ9ts0
	 OsxW1Z0j5/Qi+46O5UN7cWgiq38R2Ifdt46kwUJFy4s2llW7aCzGo5I1MR2BRBrDBq
	 Np8W+PPpEwCXsfXoRxo17a+nlTOWa3Vp02Atsfr/d9oCkq4TO8dorR3f3E9rIszlYd
	 cqpbT4fT2TL9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1D6C811FC;
	Wed,  4 Mar 2026 19:31:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F18A1EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0508760801
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nrO4OTPqPZn5 for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 19:31:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 260B2607F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 260B2607F8
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 260B2607F8
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:31:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B4140C143FC
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:31:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5C7895FF5C
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:31:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0048510369684; Wed,  4 Mar 2026 20:31:14 +0100 (CET)
Mime-Version: 1.0
Date: Wed, 04 Mar 2026 20:31:14 +0100
Message-Id: <DGU8XGEFCC7Q.20TBZADJK2NOV@bootlin.com>
Cc: <buildroot@buildroot.org>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260304-openscap_nptl_threads-v1-0-9dff92cc37e0@bootlin.com>
 <20260304-openscap_nptl_threads-v1-1-9dff92cc37e0@bootlin.com>
 <aahz7zuui_SfAImd@windsurf>
In-Reply-To: <aahz7zuui_SfAImd@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1772652675; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EOCKn3WRE+d4eVF3SmWOy4XgTQ35eEwDsPlyr4rnR0g=;
 b=Ui2v7PUT+73QuV9SIzUYTP8IXgjGMEcf3qmAF/9v33FVXP/lsH15DwqtXxK8w7AwYwnIxM
 0YaNyZw/3WFEY6OYQ7YtS/SjkWLBaMdkZ8btNVp0LuEUIt5rmvrW2lQ69s7BDB8J1TfX5L
 wmZbInjcipfurQxSLsXcppfV7bW4nFURc+po+t3vjpx9udff4NTJ+rIdq2qClFPxiqIfX5
 LqpoQ/pLc+Ey0LKzH+CmZYcQlzzbObL5fdNmWhteiLtCHYe0ruLaJ3CI09xRYgUQqqMrHJ
 3hAWMnLMf5zTBPEKZerWT8yWztDGIvDN4FzBBbMdQsRrF21inBMieDMj3qLeAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Ui2v7PUT
Subject: Re: [Buildroot] [PATCH 1/2] package/openscap: fix dependencies doc
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gV2VkIE1hciA0LCAyMDI2IGF0IDc6MDQgUE0gQ0VULCBUaG9tYXMgUGV0
YXp6b25pIHdyb3RlOgo+IE9uIFdlZCwgTWFyIDA0LCAyMDI2IGF0IDA5OjIyOjM5QU0gKzAxMDAs
IEFsZXhpcyBMb3Rob3LDqSB3cm90ZToKPj4gVGhlIGNvbW1lbnQgZGlzcGxheWVkIGluIG1lbnVj
b25maWcgZm9yIG9wZW5zY2FwIHdoZW4gd2UgYXJlIGxhY2tpbmcKPj4gZGVwZW5kZW5jaWVzIGlz
IGN1cnJlbnRseSBicm9rZW46IGl0IHNob3VsZCBiZSBhbiBvciBvZiBpbnZlcnRlZAo+PiBleHBl
Y3RlZCB2YWx1ZXMuCj4+IAo+PiBVcGRhdGUgdGhlIGNvbW1lbnQgZm9yIG9wZW5zY2FwIHdoZW4g
aXQgaXMgbWlzc2luZyBzb21lIGRlcGVuZGVuY3kuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBBbGV4
aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgo+PiAtLS0KPj4gIHBhY2th
Z2Uvb3BlbnNjYXAvQ29uZmlnLmluIHwgNSArKy0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL29w
ZW5zY2FwL0NvbmZpZy5pbiBiL3BhY2thZ2Uvb3BlbnNjYXAvQ29uZmlnLmluCj4+IGluZGV4IDMx
NzA1NWM3NTMyNy4uYjVmODA5MzE1YzkxIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL29wZW5zY2Fw
L0NvbmZpZy5pbgo+PiArKysgYi9wYWNrYWdlL29wZW5zY2FwL0NvbmZpZy5pbgo+PiBAQCAtMTks
NiArMTksNSBAQCBjb25maWcgQlIyX1BBQ0tBR0VfT1BFTlNDQVAKPj4gIAkgIGh0dHBzOi8vd3d3
Lm9wZW4tc2NhcC5vcmcvCj4+ICAJICBodHRwczovL2dpdGh1Yi5jb20vT3BlblNDQVAvb3BlbnNj
YXAKPj4gIAo+PiAtY29tbWVudCAib3BlbnNjYXAgbmVlZHMgYSB0b29sY2hhaW4gdy8gZHluYW1p
YyBsaWJyYXJ5Igo+PiAtCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTElCR1BHX0VSUk9SX0FSQ0hf
U1VQUE9SVFMKPj4gLQlkZXBlbmRzIG9uIEJSMl9TVEFUSUNfTElCUwo+PiArY29tbWVudCAib3Bl
bnNjYXAgbmVlZHMgbGliZ3BnLWVycm9yIGFuZCBhIHRvb2xjaGFpbiB3LyBkeW5hbWljIGxpYnJh
cnkiCj4+ICsJZGVwZW5kcyBvbiAhQlIyX1BBQ0tBR0VfTElCR1BHX0VSUk9SX0FSQ0hfU1VQUE9S
VFMgfHwgQlIyX1NUQVRJQ19MSUJTCj4KPiBTb3JyeSwgYnV0IHRoZSBleGlzdGluZyBjb21tZW50
IGlzIGNvcnJlY3QuIFdlIHdhbnQgdG8gc2hvdyB0aGUKPiBjb21tZW50IHdoZW4gd2UncmUgb24g
YW4gYXJjaGl0ZWN0dXJlIHRoYXQgd2UgY2FuIHN1cHBvcnQsIGJ1dCB0aGUKPiB0b29sY2hhaW4g
bGFja3Mgc29tZSBmZWF0dXJlcy4KPgo+IFNvIGFzIGZhciBhcyBJIGNhbiBzZWUgdGhlIGV4aXN0
aW5nIGNvZGUgaXMgY29ycmVjdCwgYW5kIHlvdXIgcGF0Y2gKPiBjaGFuZ2VzIGl0IHRvIGJlIGlu
Y29ycmVjdCA6LS8KCkkgZ3Vlc3MgSSd2ZSBiZWVuIG1pc3NpbmcgdGhpcyBzdWJ0bGV0eSBiZXR3
ZWVuIHRvb2xjaGFpbiBkZXBlbmRlbmN5IGFuZApub24tdG9vbGNoYWluIGRlcGVuZGVuY3ksIGFu
ZCBzbyAgSSB0aG91Z2ggdGhhdCBpdCB3YXMgYSBtaXN0YWtlIHRoYXQKc2xpcHBlZCB0aHJvdWdo
IDspIEkndmUgZWR1Y2F0ZWQgbXlzZWxmIGJ5IHJlLXJlYWRpbmcgdGhlIGNvcnJlc3BvbmRpbmcK
c2VjdGlvbiBpbiBCUiBtYW51YWwsIGFuZCBpbmRlZWQgaXQgaXMgcGxhaW4gd3JvbmcsIG15IGJh
ZCBmb3IgdGhlCm5vaXNlLgoKVjIgaW5jb21pbmcsIHdpdGggdGhpcyBwYXRjaCBkcm9wcGVkLCBh
bmQgdGhlIHNlY29uZCBvbmUgdXBkYXRlZAphY2NvcmRpbmdseS4KCkFsZXhpcwoKPiBUaG9tYXMK
CgoKCi0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5l
bCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
