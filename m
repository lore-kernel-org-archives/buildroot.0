Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5657C55822
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 19:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FC9B405A1;
	Tue,  4 Aug 2026 19:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0ckFklz4k7G; Tue,  4 Aug 2026 19:54:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0E3440720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785873265;
	bh=RGz7BZ6vf8bzOEOr9g7mmsGpl1bQwpZJGyoGJpyEqgo=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hu5JCyebJgIZEmHU73QwEO6o2ICljsWGG4WYG+GcdjAhemEm+G5EfsYZIru7iYKYq
	 B1MylwwbiN7rM672IJAJGLeZkXBnyYA1XX/wcqyX8PAbKjMPvRABMeNgs9LpbdJfYq
	 9ytV5Ssu6wvz/IhQdt9SyqBAOpJTVHM4X4yP/v1zqhECsBU9fd931upGM04pEHBZ/Z
	 LeS29FLYvOtj8ap+jBKh08tQUVvFSKYdSfEvvaOSauz5HfbcW6k6yDQpll50h2c98i
	 VS0I6DgaRdFnCSAqH3lu1ek08Bof6e3GKPZPvgtlC0CxCHQKbuxc92MN/t0j7fY7YE
	 +3wwEQoYNv+yQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0E3440720;
	Tue,  4 Aug 2026 19:54:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5217E23F
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 19:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 443D440720
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 19:54:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sEL5GNaEIRYn for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 19:54:23 +0000 (UTC)
X-Greylist: delayed 327 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 04 Aug 2026 19:54:22 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D3DF7405A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3DF7405A1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.154.239.89;
 helo=forward204a.mail.yandex.net; envelope-from=stsp2@yandex.ru;
 receiver=<UNKNOWN> 
Received: from forward204a.mail.yandex.net (forward204a.mail.yandex.net
 [178.154.239.89])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3DF7405A1
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 19:54:22 +0000 (UTC)
Received: from forward102a.mail.yandex.net (forward102a.mail.yandex.net
 [IPv6:2a02:6b8:c0e:500:1:45:d181:d102])
 by forward204a.mail.yandex.net (postfix) with ESMTPS id 6D54F868CF
 for <buildroot@buildroot.org>; Tue, 04 Aug 2026 22:48:56 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-88.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-88.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:2801:0:640:eb7f:0])
 by forward102a.mail.yandex.net (postfix) with ESMTPS id C9E09C005B
 for <buildroot@buildroot.org>; Tue, 04 Aug 2026 22:48:47 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-88.iva.yp-c.yandex.net (smtp)
 with ESMTPSA id jmq4WurdTCg0-01RwG4qd; 
 Tue, 04 Aug 2026 22:48:47 +0300
X-Yandex-Fwd: 1
Message-ID: <5375e2f9-5bc8-4a87-8a2d-a7bdd3c5c0dc@yandex.ru>
Date: Tue, 4 Aug 2026 22:48:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
From: stsp <stsp2@yandex.ru>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yandex.ru; s=mail; 
 t=1785872927; bh=GhhUkCa+nOfEHx+yVB5kyFKwArJ+JJ6zbLFEZ/6Wkvg=;
 h=Subject:From:To:Date:Message-ID;
 b=T5z+r0CxgUgqzjeDwxsDa5LtlHxBB2e1SFazISPrFae729gRO8J9d9ySMidDZsdK1
 hsJEDwkmPHAJ8Zd1+4JIB5suj8hZ6OzBQFBczSDcjOGSmoA/IAcE64VE1rVPWA+z20
 clnv1EoVgFwnUN44MfAPkUE4831bU/huvDXPApKk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=yandex.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256
 header.s=mail header.b=T5z+r0Cx
X-Mailman-Original-Authentication-Results: mail-nwsmtp-smtp-production-main-88.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex.ru
Subject: [Buildroot] custom git repos stopped working
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

SGksIEkndmUgdXBkYXRlZCBidWlsZHJvb3QsIGFuZCBmb3VuZAp0aGF0IG15IGN1c3RvbSBnaXQg
cmVwb3Mgbm8gbG9uZ2VyIHdvcms6CgpgYGAKJCAuL21ha2Uuc2ggY29tY29tNjQtc291cmNlCi4u
LgpHSVRfRElSPS9ob21lL3N0YXMvc3JjL2ZkcHAtYnVpbGRyb290L2J1aWxkcm9vdC9kbC9jb21j
b202NC9naXQvLmdpdCBnaXQgCmZldGNoIG9yaWdpbgpyZW1vdGU6IEVudW1lcmF0aW5nIG9iamVj
dHM6IDM0NTQsIGRvbmUuCi4uLgpHSVRfRElSPS9ob21lL3N0YXMvc3JjL2ZkcHAtYnVpbGRyb290
L2J1aWxkcm9vdC9kbC9jb21jb202NC9naXQvLmdpdCBnaXQgCmZldGNoIG9yaWdpbiAtdCAtZgpD
b3VsZCBub3QgZmV0Y2ggc3BlY2lhbCByZWYgJ21hc3Rlcic7IGFzc3VtaW5nIGl0IGlzIG5vdCBz
cGVjaWFsLgpDb21taXQgJ21hc3RlcicgZG9lcyBub3QgZXhpc3QgaW4gdGhpcyByZXBvc2l0b3J5
LgpgYGAKClNvIHRoaXMgY3JlYXRlcyBhbiBlbXB0eSByZXBvOgokIGdpdCBicmFuY2ggLXIKIMKg
IG9yaWdpbi9IRUFEIC0+IG9yaWdpbi9tYXN0ZXIKIMKgIG9yaWdpbi9naC1wYWdlcwogwqAgb3Jp
Z2luL21hc3RlcgokIGdpdCBicmFuY2gKJAoKUmVtb3RlIGJyYW5jaGVzIGFyZSB0aGVyZSwgaW5j
bHVkaW5nIG1hc3Rlci4KQnV0IG5vIGxvY2FsIGJyYW5jaGVzLgoKVGhlbiBJIGRpZCB0aGlzIHBh
dGNoIHRvIGJ1aWxkcm9vdDoKYGBgCi0tLSBhL3N1cHBvcnQvZG93bmxvYWQvZ2l0CisrKyBiL3N1
cHBvcnQvZG93bmxvYWQvZ2l0CkBAIC0xNDMsNyArMTQzLDcgQEAgX2dpdCBmZXRjaCAiJHtAfSIg
b3JpZ2luIC10IC1mCiDCoCMgYmVsb3csIGlmIHRoZXJlIGlzIGFuIGlzc3VlIGFueXdheS4gU2lu
Y2UgbW9zdCBvZiB0aGUgY3NldCB3ZSdyZSBnb25uYQogwqAjIGhhdmUgdG8gY2xvbmUgYXJlIG5v
dCBzdWNoIHNwZWNpYWwgcmVmcywgY29uc2lnbiB0aGUgb3V0cHV0IHRvIG9ibGl2aW9uCiDCoCMg
c28gYXMgbm90IHRvIGFsYXJtIHVuc3VzcGVjdGluZyB1c2VycywgYnV0IHN0aWxsIHRyYWNlIGl0
IGFzIGEgd2FybmluZy4KLWlmICEgX2dpdCBmZXRjaCAiJHtAfSIgb3JpZ2luICInJHtjc2V0fTok
e2NzZXR9JyIgPi9kZXYvbnVsbCAyPiYxOyB0aGVuCitpZiAhIF9naXQgZmV0Y2ggLXUgIiR7QH0i
IG9yaWdpbiAiJyR7Y3NldH06JHtjc2V0fSciID4vZGV2L251bGwgMj4mMTsgdGhlbgogwqAgwqAg
wqBwcmludGYgIkNvdWxkIG5vdCBmZXRjaCBzcGVjaWFsIHJlZiAnJXMnOyBhc3N1bWluZyBpdCBp
cyBub3QgCnNwZWNpYWwuXG4iICIke2NzZXR9IgogwqBmaQogwqBgYGAKCkFuZCB0aGlzIHRpbWUg
aXQgd29ya2VkIGFzIGV4cGVjdGVkLgoocGF0Y2ggYWRkcyAtdSBhZnRlciBmZXRjaCkKVGhpcyBk
b2Vzbid0IG1ha2Ugc2Vuc2UgdG8gbWUsIGFzIC11IGlzIGRvY3VtZW50ZWQgYXM6CiDCoCDCoCDC
oCDCoCDCoCDCoEJ5IGRlZmF1bHQgZ2l0IGZldGNoIHJlZnVzZXMgdG8gdXBkYXRlIHRoZSBoZWFk
IHdoaWNoIApjb3JyZXNwb25kcyB0bwogwqAgwqAgwqAgwqAgwqAgwqB0aGUgY3VycmVudCBicmFu
Y2guIFRoaXMgZmxhZyBkaXNhYmxlcyB0aGUgY2hlY2suCgpCdXQgdGhlcmUgaXMgbm8gY3VycmVu
dCBicmFuY2gsIHRoZXJlIGlzIG5vCmFueSBicmFuY2ggYXQgYWxsISBTbyBtYXliZSBzb21ldGhp
bmcgY2hhbmdlZAppbiBnaXQ/CgokIGdpdCAtLXZlcnNpb24KZ2l0IHZlcnNpb24gMi41My4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
