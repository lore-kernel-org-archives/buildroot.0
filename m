Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F66FC004D4
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 12:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4D6E8140A;
	Thu, 19 Jan 2023 12:38:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4D6E8140A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k1nfCpGvEH2M; Thu, 19 Jan 2023 12:38:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B5DE813CC;
	Thu, 19 Jan 2023 12:38:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B5DE813CC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C6BC1BF2C8
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 12:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5896B813C0
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 12:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5896B813C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S8HNa2pbn2jB for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 12:38:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22202813CC
Received: from mail.xogium.me (mail.xogium.me [107.167.81.91])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22202813CC
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 12:38:55 +0000 (UTC)
Received: from ganimede.. (2a02-8428-324d-2201-5ccf-c338-3098-6959.rev.sfr.net
 [IPv6:2a02:8428:324d:2201:5ccf:c338:3098:6959])
 by mail.xogium.me (Postfix) with ESMTPSA id DB8A6F40214;
 Thu, 19 Jan 2023 07:38:53 -0500 (EST)
From: Casey Reeves <casey@xogium.me>
To: buildroot@buildroot.org
Date: Thu, 19 Jan 2023 13:10:03 +0100
Message-Id: <20230119121004.3416962-2-casey@xogium.me>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119121004.3416962-1-casey@xogium.me>
References: <20230119121004.3416962-1-casey@xogium.me>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=xogium.me; s=xogium-mail; t=1674131934;
 bh=KG6AHFXDLLy+4rDbwlwTT5muthfiPeRLEvKJ1/qZXI8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=2MbiNUE8CQJvMCoYFg08j4HTPcmYTWVYhlIpAlPhaIPqD7UOAldzdj51y4BK1yy1E
 sVtMGkTgjJbmufax78r894Jl8EiB1iG1hk5pEM2zdsQTT/j7aaqOREqlVPRvsrAbNJ
 ADFlUMXBooJmW8J4TzR9mIHp13glJMplR8SNK/LbMZJGsMdGIgM72B7sIeQRIrQe4J
 Unj8Iavv6xaWV7N2I3/H/0AisAFsJPMBahLL1g4P9W0UVMfRx0wxPgfmvhQCGwccfN
 KOlObqVWO0249yI4jMLHKapQjIoFa5/l9SJ1iR0V9xlmh08XiS/63qWrwyZSRqJqPB
 sN/0F9TAM+dzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=xogium.me header.i=@xogium.me
 header.a=rsa-sha256 header.s=xogium-mail header.b=2MbiNUE8
Subject: [Buildroot] [PATCH 1/2] package/lzop: provide a patch to allow
 overriding of modification time
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

VGhpcyBwYXRjaCBhbGxvd3MgbHpvcCB0byBvdmVycmlkZSB0aGUgbW9kaWZpY2F0aW9uIHRpbWUg
dXNpbmcKJFNPVVJDRV9EQVRFX0VQT0NILgpUaGUgb3JpZ2luYWwgcGF0Y2ggd3JpdHRlbiBieSBG
bG9yaWFuIELDpHVlcmxlIGlzIGZvciBsem9wIDEuMDQsIGFuZApoZW5jZSBuZWVkZWQgdG8gYmUg
YmFja3BvcnRlZCB0byB0aGUgMS4wMyByZWxlYXNlIGJ1aWxkcm9vdCBpcyBtYWtpbmcKdXNlIG9m
LgoKSXQgaXMgbmVjZXNzYXJ5IHRvIGNhcnJ5IHRoaXMgcGF0Y2ggaW4gYnVpbGRyb290LCBhcyBp
dCBhcHBlYXJzIHRoYXQKbHpvcCBzb2Z0d2FyZSBoYXMgc3RhZ25hdGVkIHNpbmNlIHRoZSBsYXN0
IHJlbGVhc2UuCgpodHRwczovL2dpdC5wZW5ndXRyb25peC5kZS9jZ2l0L3B0eGRpc3QvdHJlZS9w
YXRjaGVzL2x6b3AtMS4wNC8wMDAyLWFsbG93LW92ZXJyaWRpbmctbW9kaWZpY2F0aW9uLXRpbWUu
cGF0Y2gKClNpZ25lZC1vZmYtYnk6IENhc2V5IFJlZXZlcyA8Y2FzZXlAeG9naXVtLm1lPgotLS0K
IC4uLjMtYWxsb3ctb3ZlcnJpZGluZy1tb2RpZmljYXRpb24tdGltZS5wYXRjaCB8IDQ2ICsrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9sem9wLzAwMDMtYWxsb3ctb3ZlcnJpZGluZy1tb2RpZmljYXRp
b24tdGltZS5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHpvcC8wMDAzLWFsbG93LW92ZXJy
aWRpbmctbW9kaWZpY2F0aW9uLXRpbWUucGF0Y2ggYi9wYWNrYWdlL2x6b3AvMDAwMy1hbGxvdy1v
dmVycmlkaW5nLW1vZGlmaWNhdGlvbi10aW1lLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLjE3YWQ0MmRhMDQKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2x6
b3AvMDAwMy1hbGxvdy1vdmVycmlkaW5nLW1vZGlmaWNhdGlvbi10aW1lLnBhdGNoCkBAIC0wLDAg
KzEsNDYgQEAKK0Zyb20gZDM3MTcwNjVkNGI0ZGQ3ZGZhODhlYmMxNTQxODVjZTc1MjEyN2U5MyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IENhc2V5IFJlZXZlcyA8Y2FzZXlAeG9naXVt
Lm1lPgorRGF0ZTogVGh1LCAxOSBKYW4gMjAyMyAxMDowNjozMSArMDEwMAorU3ViamVjdDogW1BB
VENIXSBhbGxvdyBvdmVycmlkaW5nIG1vZGlmaWNhdGlvbiB0aW1lCitNSU1FLVZlcnNpb246IDEu
MAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5z
ZmVyLUVuY29kaW5nOiA4Yml0CisKK1RoaXMgcGF0Y2ggaXMgYmFzZWQgb24gdGhlIHdvcmsgZnJv
bSBGbG9yaWFuIELDpHVlcmxlIGF0IEFsbGVnaW9uIGFuZAorZW5hYmxlcyBsem9wIHRvIGFsbG93
IG92ZXJyaWRpbmcgbW9kaWZpY2F0aW9uIHRpbWUuCisKK1NpZ25lZC1vZmYtYnk6IENhc2V5IFJl
ZXZlcyA8Y2FzZXlAeG9naXVtLm1lPgorLS0tCisgc3JjL2x6b3AuYyB8IDkgKysrKysrKystCisg
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQorCitkaWZmIC0t
Z2l0IGEvc3JjL2x6b3AuYyBiL3NyYy9sem9wLmMKK2luZGV4IDU1NzFlODkuLjk0ZWVjOTkgMTAw
NjQ0CistLS0gYS9zcmMvbHpvcC5jCisrKysgYi9zcmMvbHpvcC5jCitAQCAtNzA2LDYgKzcwNiw3
IEBAIHZvaWQgaW5pdF9jb21wcmVzc19oZWFkZXIoaGVhZGVyX3QgKmgsIGNvbnN0IGZpbGVfdCAq
ZmlwLCBjb25zdCBmaWxlX3QgKmZvcCkKKyAgICAgYXNzZXJ0KG9wdF9tZXRob2QgPiAwKTsKKyAg
ICAgYXNzZXJ0KG9wdF9sZXZlbCA+IDApOworICAgICBhc3NlcnQoZmlwLT5zdC5zdF9tb2RlID09
IDAgfHwgU19JU1JFRyhmaXAtPnN0LnN0X21vZGUpKTsKKysgICAgY29uc3QgY2hhciAqc291cmNl
X2RhdGVfZXBvY2ggPSBnZXRlbnYoIlNPVVJDRV9EQVRFX0VQT0NIIik7CisgCisgICAgIG1lbXNl
dChoLDAsc2l6ZW9mKGhlYWRlcl90KSk7CisgCitAQCAtNzQyLDcgKzc0MywxMyBAQCB2b2lkIGlu
aXRfY29tcHJlc3NfaGVhZGVyKGhlYWRlcl90ICpoLCBjb25zdCBmaWxlX3QgKmZpcCwgY29uc3Qg
ZmlsZV90ICpmb3ApCisgCisgICAgIGgtPm1vZGUgPSBmaXhfbW9kZV9mb3JfaGVhZGVyKGZpcC0+
c3Quc3RfbW9kZSk7CisgCistICAgIGlmIChmaXAtPnN0LnN0X210aW1lKQorKyAgICBpZiAoc291
cmNlX2RhdGVfZXBvY2gpCisrICAgIHsKKysgICAgICAgIHRpbWVfdCBtdGltZSA9IHN0cnRvdWwo
c291cmNlX2RhdGVfZXBvY2gsIE5VTEwsIDApOworKyAgICAgICAgaC0+bXRpbWVfbG93ICA9IChs
em9fdWludDMyKSAobXRpbWUpOworKyAgICAgICAgaC0+bXRpbWVfaGlnaCA9IChsem9fdWludDMy
KSAoKG10aW1lID4+IDE2KSA+PiAxNik7CisrICAgIH0KKysgICAgZWxzZSBpZiAoZmlwLT5zdC5z
dF9tdGltZSkKKyAgICAgeworICAgICAgICAgaC0+bXRpbWVfbG93ID0gKGx6b191aW50MzIpIChm
aXAtPnN0LnN0X210aW1lKTsKKyAgICAgICAgIGgtPm10aW1lX2hpZ2ggPSAobHpvX3VpbnQzMikg
KGZpcC0+c3Quc3RfbXRpbWUgPj4gMTYgPj4gMTYpOworLS0gCisyLjM5LjAKKwotLSAKMi4zOS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
