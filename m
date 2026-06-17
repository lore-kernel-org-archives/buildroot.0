Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBAACD98F2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 17:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 938F94083F;
	Wed, 17 Jun 2026 17:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6YVd8jVySye; Wed, 17 Jun 2026 17:10:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9234340840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781716259;
	bh=FvPtMg6OSvXSIvr+bZSe3mt0yceOOYfiJMrv5M2Cl34=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HSuxdVaPvkAmQ3D9eAsPD/4otFI14sI22gtbWFp3wd7SLN/qoFfJMNRqf+iwiDRml
	 TA/nST8UBMnIGhtmoxAjOLdTDp0nDR3KGE4JFnppDu8mEta7Vq7ep43ATQPb8tkH8f
	 8btVZ1FcrWWluN0f8eQkCdDkgANk0yHa88Lshs+hiUBibbx4UPW/Byfqcdan6BSw33
	 Iw16VpUdA536LJVBqSt23hZ3pfi8sSe7B6VKMq9x6UU+GsFjRejbdl2kao8NZ03G1H
	 B+0ckYl5UWwQ+hZsapnrnjdzk5M1MeQEqI+HIVTsL6TAcGuqRC8AX4Vmcq2QbwjeD1
	 ueOVCezhtuVlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9234340840;
	Wed, 17 Jun 2026 17:10:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B019347
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 415F76065A
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:10:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RtFjQk6MeNy2 for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 17:10:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2AB4C60657
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AB4C60657
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AB4C60657
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:10:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 960E43316;
 Wed, 17 Jun 2026 10:10:50 -0700 (PDT)
Received: from [127.0.1.1] (X72Y076X74-2.nice.arm.com [10.34.125.15])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A82283F915;
 Wed, 17 Jun 2026 10:10:54 -0700 (PDT)
From: =?utf-8?q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Date: Wed, 17 Jun 2026 19:10:42 +0200
MIME-Version: 1.0
Message-Id: <20260617-pmem-v1-2-bac54881145c@arm.com>
References: <20260617-pmem-v1-0-bac54881145c@arm.com>
In-Reply-To: <20260617-pmem-v1-0-bac54881145c@arm.com>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, 
 =?utf-8?q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4692;
 i=vincent.stehle@arm.com; h=from:subject:message-id;
 bh=iZaZJmudb2oZFVGOd9bP81gzUf0aGKwqBD+/qYcIDCY=;
 b=owEBbQGS/pANAwAKActJ+FZ2owaUAcsmYgBqMtUcCbqk02SrCfsulmjzuT37/dYz5EkqFbYdU
 69hYNdrtFOJATMEAAEKAB0WIQTXYBSgjlpQEXB4KmzLSfhWdqMGlAUCajLVHAAKCRDLSfhWdqMG
 lMvfB/9+JA0qDN1PuGcGin1nRYUAzsTu0zqoEDnqc3xevYzcIZWhgMX3WMMAKrBR+sKDxua9RaZ
 hpyLhv1/uCVO8E56XlByl5TQYyHqIxA3OXTxdECu3elHRmqm3lOv7wPNevnJiM8AfYdJMz5qSdD
 2xhK1e/Qa48zzGj3zrM3ACrWQYnQFhNWzFaYAe8tSjuwT04PljowQPUZRiXeh07QkYsQ25QZPhG
 YTmUmKaJ4k/1pFpprlpnmEKH9ef9VoCzHwOilgN4Ai3YW97SOEvZvdkN5pr9DclZiFqXQ27X15r
 mrwAtLzhzekgZYla2aKTnAHyCnU7V9e4OND+LZ5kwOTDm0pV
X-Developer-Key: i=vincent.stehle@arm.com; a=openpgp;
 fpr=D76014A08E5A501170782A6CCB49F85676A30694
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=arm.com; s=foss; 
 t=1781716255; bh=iZaZJmudb2oZFVGOd9bP81gzUf0aGKwqBD+/qYcIDCY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=BZpI86NYqghYurjiS2G49UlRMMJnb2O5ZQORoxFnM8QYEDia2K61Ly2gporwEn18f
 rq5649/9ueQM/Tcj9FWMMbK2K3Ivr/u+80diPabWAboOOxqPwbWR9+G8dCuJs3SO37
 1fEB/YRREnfWc/qIkejJ4vxY6Q9KcuxKGOouY98I=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256
 header.s=foss header.b=BZpI86NY
Subject: [Buildroot] [PATCH 2/2] configs/aarch64_efi: support net boot with
 devicetree
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VUVGSSBwbGF0Zm9ybXMgd2l0aCBhIERldmljZXRyZWUgaGF2ZSByZWNlbnRseSBnYWluZWQgc3Vw
cG9ydCBmb3Igc29tZSBmb3JtCm9mIG5ldHdvcmsgYm9vdGluZy4gWzFdWzJdCgpPbiB0aG9zZSBw
bGF0Zm9ybXMsIHRoZSBVRUZJIGZpcm13YXJlIGRvd25sb2FkcyB0aGUgZGlzayBpbWFnZSBvdmVy
IHRoZQpuZXR3b3JrIGFuZCBwcmVzZW50cyBpdCB0byBVRUZJIGFwcGxpY2F0aW9ucyB1c2luZyB0
aGUgc2ltcGxlIGZpbGVzeXN0ZW0KcHJvdG9jb2wuIFRoaXMgaXMgc3VmZmljaWVudCBmb3IgT1Mg
bG9hZGVycyBzdWNoIGFzIGUuZy4gR1JVQiB0byBmaW5kIHRoZWlyCmNvbmZpZ3VyYXRpb24gYW5k
IGxvYWQgdGhlIGtlcm5lbCBpbWFnZS4KClRoZSBmaXJtd2FyZSBtdXN0IGFsc28gZGVzY3JpYmUg
dGhlIHJhbWRpc2sgdG8gdGhlIE9TLCBzbyB0aGF0IGl0IGZpbmRzIGl0cwpyb290IGZpbGVzeXN0
ZW0uIE9uIEFDUEkgYmFzZWQgcGxhdGZvcm1zIHRoaXMgaXMgZG9uZSB3aXRoIGFuIE5WRElNTQpG
aXJtd2FyZSBJbnRlcmZhY2UgVGFibGUgKE5GSVQpLiBPbiBEZXZpY2V0cmVlIGJhc2VkIHBsYXRm
b3JtcywgdGhpcyBjYW4gYmUKZG9uZSB3aXRoIGEgcG1lbSBub2RlLiBbM10KCkFkZCBhIGtlcm5l
bCBjb25maWcgZnJhZ21lbnQgdG8gYWRkIHBtZW0gc3VwcG9ydCwgd2hpY2ggZW5hYmxlcyBuZXR3
b3JrCmJvb3Qgb24gVUVGSSBwbGF0Zm9ybXMgd2l0aCBEZXZpY2V0cmVlLgpBbHNvLCBicmllZmx5
IG1lbnRpb24gdGhhdCB3ZSBzdXBwb3J0IHRoaXMgc2NlbmFyaW8gaW4gdGhlIHJlYWRtZS4KClRo
aXMgY2FuIGJlIHRlc3RlZCBvbiBRZW11LCB3aXRoIHRoZSBmb2xsb3dpbmcgcHJvY2VkdXJlOgoK
QnVpbGQgYWFyY2g2NF9lZmlfZGVmY29uZmlnIGluIGEgZm9sZGVyLCB0byBvYnRhaW4gb3V0cHV0
L2ltYWdlcy9kaXNrLmltZywKYW5kIHNlcnZlIHRoZSBpbWFnZSBvdmVyIEhUVFAgd2l0aCBweXRo
b246CgogICQgcHl0aG9uIC1tIGh0dHAuc2VydmVyIC1kIG91dHB1dC9pbWFnZXMvCgpJbiBhbm90
aGVyIHRlcm1pbmFsIGFuZCBhbm90aGVyIGZvbGRlciwgY29uZmlndXJlIGEgVS1Cb290IGJhc2Vk
IGZpcm13YXJlCnN0YXJ0aW5nIGZyb20gcWVtdV9hYXJjaDY0X2ViYnJfZGVmY29uZmlnLCBhbmQg
d2l0aCB0aGUgZm9sbG93aW5nCmFkZGl0aW9uYWwgY29uZmlndXJhdGlvbnM6CgogIEJSMl9UQVJH
RVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjYuMDQiCiAgQlIyX1RBUkdFVF9VQk9P
VF9ORUVEU19EVEM9eQoKQWRkIHRoZSBmb2xsb3dpbmcgVS1Cb290IGNvbmZpZ3VyYXRpb25zIHRv
CmJvYXJkL3FlbXUvYWFyY2g2NC1lYmJyL3UtYm9vdC5mcmFnbWVudDoKCiAgQ09ORklHX0VGSV9I
VFRQX0JPT1Q9eQogIENPTkZJR19ORVRfTFdJUD15CgpCdWlsZCBldmVyeXRoaW5nOyB5b3Ugc2hv
dWxkIG9idGFpbiBvdXRwdXQvaW1hZ2VzL2ZsYXNoLmJpbi4KClN0YXJ0IFFlbXUgYXMgcGVyIGJv
YXJkL3FlbXUvYWFyY2g2NC1lYmJyL3JlYWRtZS50eHQsIGJ1dCBvbWl0dGluZyB0aGUgaGQwCi1k
ZXZpY2UgYW5kIC1kcml2ZSBzdGFuemFzLgpVLUJvb3Qgc2hvdWxkIHN0YXJ0OyBpbnRlcnJ1cHQg
aXQgd2l0aCBlbnRlci4KCkF0IFUtQm9vdCBwcm9tcHQsIHR5cGUgdGhlIGZvbGxvd2luZyBjb21t
YW5kczoKCiAgPT4gc2V0ZW52IGxvYWRhZGRyIDB4NDMwMDAwMDAKICA9PiBlZmlkZWJ1ZyBib290
IHJtIDAKICA9PiBlZmlkZWJ1ZyBib290IGFkZCAtdSAwIG5ldCBodHRwOi8vMTAuMC4yLjI6ODAw
MC9kaXNrLmltZwogID0+IGVmaWRlYnVnIGJvb3Qgb3JkZXIgMAogID0+IGJvb3RlZmkgYm9vdG1n
cgoKVS1Cb290IHNob3VsZCBkb3dubG9hZCB0aGUgZGlzayBpbWFnZSBvdmVyIEhUVFAgYW5kIGJv
b3QgTGludXggd2l0aCBVRUZJLgpMb29rIGZvciB0aGUgZm9sbG93aW5nIG1lc3NhZ2UgaW4gTGlu
dXggYm9vdCBsb2csIHRvIGNvbmZpcm0gdGhhdCBpdCBkaWQKaW5kZWVkIG1vdW50IGl0cyByb290
ZnMgZnJvbSB0aGUgZG93bmxvYWRlZCBpbWFnZToKCiAgRVhUNC1mcyAocG1lbTBwMik6IG1vdW50
ZWQgZmlsZXN5c3RlbSAuLi4KCkxpbms6IGh0dHBzOi8vd3d3LmxpbmFyby5vcmcvYmxvZy9pbnN0
YWxsaW5nLWZlZG9yYS13aXRoLXVlZmktaHR0cC1ib290LyBbMV0KTGluazogaHR0cHM6Ly9kb2Nz
LnUtYm9vdC1wcm9qZWN0Lm9yZy9lbi9sYXRlc3QvZGV2ZWxvcC91ZWZpL3VlZmkuaHRtbCN1ZWZp
LWh0dHAtYm9vdC11c2luZy10aGUtbGVnYWN5LXRjcC1zdGFjayBbMl0KTGluazogaHR0cHM6Ly9n
aXRodWIuY29tL0FSTS1zb2Z0d2FyZS9lZGdlLWlvdC1hcmNoLWd1aWRlL2Jsb2IvbWFpbi9zb3Vy
Y2UvaHR0cC1ib290L3BtZW1fbm9kZS5tZCBbM10KU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVo
bMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgpDYzogRGljayBPbHNzb24gPGhpQHNlbnppbGxh
LmlvPgotLS0KIGJvYXJkL2FhcmNoNjQtZWZpL2xpbnV4LXBtZW0tbmV0Ym9vdC5mcmFnbWVudCB8
ICAzICsrKwogYm9hcmQvYWFyY2g2NC1lZmkvcmVhZG1lLnR4dCAgICAgICAgICAgICAgICAgIHwg
MTEgKysrKysrKysrKysKIGNvbmZpZ3MvYWFyY2g2NF9lZmlfZGVmY29uZmlnICAgICAgICAgICAg
ICAgICB8ICAxICsKIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2JvYXJkL2FhcmNoNjQtZWZpL2xpbnV4LXBtZW0tbmV0Ym9vdC5mcmFnbWVudCBiL2JvYXJk
L2FhcmNoNjQtZWZpL2xpbnV4LXBtZW0tbmV0Ym9vdC5mcmFnbWVudApuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwLi44YzNlOTEwOTE5Ci0tLSAvZGV2L251bGwKKysrIGIvYm9h
cmQvYWFyY2g2NC1lZmkvbGludXgtcG1lbS1uZXRib290LmZyYWdtZW50CkBAIC0wLDAgKzEsMyBA
QAorQ09ORklHX0JMS19ERVZfUE1FTT15CitDT05GSUdfTElCTlZESU1NPXkKK0NPTkZJR19PRl9Q
TUVNPXkKZGlmZiAtLWdpdCBhL2JvYXJkL2FhcmNoNjQtZWZpL3JlYWRtZS50eHQgYi9ib2FyZC9h
YXJjaDY0LWVmaS9yZWFkbWUudHh0CmluZGV4IDBlN2VhMGI1ZGQuLjI1OWViNWI4YzkgMTAwNjQ0
Ci0tLSBhL2JvYXJkL2FhcmNoNjQtZWZpL3JlYWRtZS50eHQKKysrIGIvYm9hcmQvYWFyY2g2NC1l
ZmkvcmVhZG1lLnR4dApAQCAtNDgsNiArNDgsMTcgQEAgYWx0ZXJuYXRpdmUgdG8gUUVNVV9FRkku
ZmQuIFlvdSB3aWxsIGFsc28gbmVlZCB0byBjaGFuZ2UgdGhlIG1hY2hpbmUKIHNwZWNpZmljYXRp
b24gdG8gIi1NIHZpcnQsc2VjdXJlPW9uIiBvbiBxZW11IGNvbW1hbmQgbGluZSwgdG8gZW5hYmxl
IFRydXN0Wm9uZQogc3VwcG9ydCwgYW5kIHlvdSB3aWxsIG5lZWQgdG8gaW5jcmVhc2UgdGhlIG1l
bW9yeSB3aXRoICItbSAxMDI0Ii4KIAorSFRUUCBib290CistLS0tLS0tLS0KKworU29tZSBVLUJv
b3QgYW5kIERldmljZXRyZWUgYmFzZWQgZmlybXdhcmVzIGFyZSBjYXBhYmxlIG9mIGJvb3Rpbmcg
d2l0aCBVRUZJIGZyb20KK0hUVFAocykuIFs0XQorCitUaGUgYWFyY2g2NF9lZmlfZGVmY29uZmln
IGhhcyBhcHByb3ByaWF0ZSBwZXJzaXN0ZW50IG1lbW9yeSBzdXBwb3J0IGNvbXBpbGVkIGluCit0
aGUgTGludXgga2VybmVsIHRvIHN1cHBvcnQgdGhpcyBzY2VuYXJpby4gWzVdCisKIFsxXTogaHR0
cHM6Ly9naXRodWIuY29tL0FSTS1zb2Z0d2FyZS9lYmJyCiBbMl06IGh0dHBzOi8vZGV2ZWxvcGVy
LmFybS5jb20vYXJjaGl0ZWN0dXJlcy9zeXN0ZW0tYXJjaGl0ZWN0dXJlcy9hcm0tc3lzdGVtcmVh
ZHkKIFszXTogaHR0cHM6Ly9naXRodWIuY29tL2dsaWtlbHkvdS1ib290LXRmYS1idWlsZAorWzRd
OiBodHRwczovL2RvY3MudS1ib290LXByb2plY3Qub3JnL2VuL2xhdGVzdC9kZXZlbG9wL3VlZmkv
dWVmaS5odG1sI3VlZmktaHR0cC1ib290LXVzaW5nLXRoZS1sZWdhY3ktdGNwLXN0YWNrCitbNV06
IGh0dHBzOi8vZ2l0aHViLmNvbS9BUk0tc29mdHdhcmUvZWRnZS1pb3QtYXJjaC1ndWlkZS9ibG9i
L21haW4vc291cmNlL2h0dHAtYm9vdC9wbWVtX25vZGUubWQKZGlmZiAtLWdpdCBhL2NvbmZpZ3Mv
YWFyY2g2NF9lZmlfZGVmY29uZmlnIGIvY29uZmlncy9hYXJjaDY0X2VmaV9kZWZjb25maWcKaW5k
ZXggMzkwZjNmYzZhYy4uNzgyOTJjMGNjNCAxMDA2NDQKLS0tIGEvY29uZmlncy9hYXJjaDY0X2Vm
aV9kZWZjb25maWcKKysrIGIvY29uZmlncy9hYXJjaDY0X2VmaV9kZWZjb25maWcKQEAgLTExLDYg
KzExLDcgQEAgQlIyX0xJTlVYX0tFUk5FTD15CiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJT
SU9OPXkKIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuMTguMTQiCiBC
UjJfTElOVVhfS0VSTkVMX1VTRV9BUkNIX0RFRkFVTFRfQ09ORklHPXkKK0JSMl9MSU5VWF9LRVJO
RUxfQ09ORklHX0ZSQUdNRU5UX0ZJTEVTPSJib2FyZC9hYXJjaDY0LWVmaS9saW51eC1wbWVtLW5l
dGJvb3QuZnJhZ21lbnQiCiBCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15CiBC
UjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfUFlUSE9OMz15CiBCUjJfVEFSR0VUX1JPT1RGU19F
WFQyPXkKCi0tIAoyLjUzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
