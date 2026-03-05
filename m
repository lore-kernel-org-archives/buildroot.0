Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F641F47CDA
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 21:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D645406F0;
	Thu,  5 Mar 2026 21:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wSzL0v1ZWJGm; Thu,  5 Mar 2026 21:11:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D88F4066F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772745104;
	bh=WfV9giX+CoKOSCbkSrZC8a5P+BXtrcDyE4k2EG4D3d8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cUfxlWm3gMhSLpS1pE1l9zkZP5SXlNQ+1KIjV2gflxsAaAqpfGV15V9HmFKtk3qBj
	 azECV9MHQD6/yuqELfUE4Bz5RG1bX2gGoAdgwFysmPhnJBygmsycdyFLIEh19xXe5c
	 TScE/1tYwrY85DYAlhKdYM86H1TRD5u3PB7CxtE5sxStCtrhHJhpPTCfTui+/62r0a
	 Ic2O4ojLxkqU4F8zz+M7+Clbv/MQd8ddENnh2vbvELjJOaoa0VBkI8ervXXRlIDArR
	 3sbZgqJw0Sxg7AJPW3XVEK/NAxDcmaymbG9F9g6rU+1shVJJoT2dcOV6+ZECyldbX6
	 q9u5bWR+nagEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D88F4066F;
	Thu,  5 Mar 2026 21:11:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06327223
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E07C0418E5
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sBrfQs78eTKR for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 21:11:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DB395418DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB395418DF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DB395418DF
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 21:11:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BB513A4C373B;
 Thu,  5 Mar 2026 22:09:57 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47648)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vyFxA-000000003FD-0QKr;
 Thu, 05 Mar 2026 21:09:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  5 Mar 2026 22:09:44 +0100
Message-ID: <20260305210950.3471974-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305210950.3471974-1-bernd@kuhls.net>
References: <20260305210950.3471974-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772744997;
 bh=URAWfsQLDHfsWgPCiy56r4cLxRLu1H+n6Qk35HDM1tI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=NdhX2hykwzBmnwyJgSN6s67z7Fv4K0040HgRgP22rwxCuRAaaYXjKZgmGckjGhdpX
 wVwLCq68QsZqOehxKJ36fSY8RgVXAr+8azZvTZaeL5GH7Mi3TALzVlW4XqMnFd1C8l
 QCjkAbdJbgKlm/Sh0V1/gAmiL3WPQVTZRvsdFZx16EzOudbAoSUADRmPjt4g37QKgC
 ngDNIbiaHihDMlv2TIEPm27IsidAloSmBc5B/kFW0qRekKbRkMwV0PVTSheW2xlxCm
 lLIp19+6BZtresvMoB99ipUrx4MtKWp1q/W5AItUex0MsN8j0dfBfgh21nkBFVPVyr
 8A1DdoVv/5vFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=NdhX2hyk
Subject: [Buildroot] [PATCH v2 09/14] package/ltp-testsuite: fix build with
 glibc 2.43
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Pieter De Gendt <pieter.degendt@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tCiAuLi5maW5l
LV9HTlVfU09VUkNFLWFuZC1pbmNsdWRlLWZjbnRsLmgucGF0Y2ggfCA4NCArKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgODQgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvbHRwLXRlc3RzdWl0ZS8wMDAxLW9wZW5hdDItZGVmaW5lLV9HTlVfU09VUkNF
LWFuZC1pbmNsdWRlLWZjbnRsLmgucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2x0cC10ZXN0
c3VpdGUvMDAwMS1vcGVuYXQyLWRlZmluZS1fR05VX1NPVVJDRS1hbmQtaW5jbHVkZS1mY250bC5o
LnBhdGNoIGIvcGFja2FnZS9sdHAtdGVzdHN1aXRlLzAwMDEtb3BlbmF0Mi1kZWZpbmUtX0dOVV9T
T1VSQ0UtYW5kLWluY2x1ZGUtZmNudGwuaC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwLi5lNGI2NTRiMzE5Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9sdHAt
dGVzdHN1aXRlLzAwMDEtb3BlbmF0Mi1kZWZpbmUtX0dOVV9TT1VSQ0UtYW5kLWluY2x1ZGUtZmNu
dGwuaC5wYXRjaApAQCAtMCwwICsxLDg0IEBACitGcm9tIDc2N2IzZTUxOWU4NTA5NWRmZWUzYTQ3
ZDE1YTM3M2E0MDNmZTNkYWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBMaSBXYW5n
IDxsaXdhbmdAcmVkaGF0LmNvbT4KK0RhdGU6IFR1ZSwgMyBGZWIgMjAyNiAxMDo0MzoxOSArMDgw
MAorU3ViamVjdDogW1BBVENIXSBvcGVuYXQyOiBkZWZpbmUgX0dOVV9TT1VSQ0UgYW5kIGluY2x1
ZGUgPGZjbnRsLmg+CitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWlu
OyBjaGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK09uIEZl
ZG9yYSBSYXdoaWRlIChnbGliYyAyLjQzKyksIGxpYmMgZXhwb3NlcyBvcGVuYXQyKCkgYW5kIHN0
cnVjdCBvcGVuX2hvdywKK3NvIG91ciBjb25maWd1cmUgc2NyaXB0IGRlZmluZXMgSEFWRV9PUEVO
QVQyIGFuZCB0aGUgZmFsbGJhY2sgZGVmaW5pdGlvbiBpbgorbGFwaS9vcGVuYXQyLmggZ2V0cyBz
a2lwcGVkLiBCdXQgb3BlbmF0MjAqLmMgbmV2ZXIgaW5jbHVkZWQgPGZjbnRsLmg+IChhbmQKK2xh
Y2tlZCBfR05VX1NPVVJDRSksIHNvIHRoZSBsaWJjLXByb3ZpZGVkIHByb3RvdHlwZSBhbmQgc3Ry
dWN0IHN0YXllZCBoaWRkZW4sCitzbyBjb21waWxhdGlvbiBmYWlsZWQ6CisKKyAgIyB1bmFtZSAt
cgorICA2LjE4LjAtNjUuZmM0NC54ODZfNjQKKworICAjIHJwbSAtcWYgL3Vzci9pbmNsdWRlL2Zj
bnRsLmgKKyAgZ2xpYmMtZGV2ZWwtMi40My0xLmZjNDQueDg2XzY0CisKKyAgIyBubSAtRCAvdXNy
L2xpYjY0L2xpYmMuc28uNiB8IGdyZXAgLXcgb3BlbmF0MgorICAwMDAwMDAwMDAwMGViODkwIFcg
b3BlbmF0MkBAR0xJQkNfMi40MworCisgICMgbWFrZSAtQyB0ZXN0Y2FzZS9rZXJuZWwvc3lzY2Fs
bHMvb3BlbmF0MgorICBvcGVuYXQyMDEuYzoyNzo2MjogZXJyb3I6IGludmFsaWQgYXBwbGljYXRp
b24gb2Yg4oCYc2l6ZW9m4oCZIHRvIGluY29tcGxldGUgdHlwZSDigJhzdHJ1Y3Qgb3Blbl9ob3fi
gJkKKyAgICAyNyB8ICAgICAgICAgeyZkaXJfZmQsIFRFU1RfRklMRSwgT19SRFdSLCBTX0lSV1hV
LCAwLCAmaG93LCBzaXplb2YoKmhvdyl9LAorCitEZWZpbmUgX0dOVV9TT1VSQ0UgYW5kIGluY2x1
ZGUgPGZjbnRsLmg+IGluIG9wZW5hdDIgdGVzdHMgdG8gbWFrZSB0aGUKK3Byb3RvdHlwZSBhdmFp
bGFibGUgYW5kIGZpeCB0aGUgYnVpbGQuCisKK1NpZ25lZC1vZmYtYnk6IExpIFdhbmcgPGxpd2Fu
Z0ByZWRoYXQuY29tPgorUmV2aWV3ZWQtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6Pgor
CitVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXRlc3QtcHJvamVjdC9sdHAvY29t
bWl0Lzc2N2IzZTUxOWU4NTA5NWRmZWUzYTQ3ZDE1YTM3M2E0MDNmZTNkYWIKKworU2lnbmVkLW9m
Zi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KKy0tLQorIHRlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvb3BlbmF0Mi9vcGVuYXQyMDEuYyB8IDMgKysrCisgdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9vcGVuYXQyL29wZW5hdDIwMi5jIHwgMyArKysKKyB0ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL29wZW5hdDIvb3BlbmF0MjAzLmMgfCAzICsrKworIDMgZmlsZXMgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspCisKK2RpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L29wZW5hdDIvb3BlbmF0MjAxLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL29wZW5hdDIv
b3BlbmF0MjAxLmMKK2luZGV4IGVjZDYzYjE1MGU0Li40MGFjMmY2ZDlhZCAxMDA2NDQKKy0tLSBh
L3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvb3BlbmF0Mi9vcGVuYXQyMDEuYworKysrIGIvdGVz
dGNhc2VzL2tlcm5lbC9zeXNjYWxscy9vcGVuYXQyL29wZW5hdDIwMS5jCitAQCAtNCw2ICs0LDkg
QEAKKyAgKgorICAqIEJhc2ljIG9wZW5hdDIoKSB0ZXN0LgorICAqLworKyNkZWZpbmUgX0dOVV9T
T1VSQ0UKKysjaW5jbHVkZSA8ZmNudGwuaD4KKysKKyAjaW5jbHVkZSAidHN0X3Rlc3QuaCIKKyAj
aW5jbHVkZSAibGFwaS9vcGVuYXQyLmgiCisgCitkaWZmIC0tZ2l0IGEvdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9vcGVuYXQyL29wZW5hdDIwMi5jIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9vcGVuYXQyL29wZW5hdDIwMi5jCitpbmRleCA2ZDFiNWE2N2M3ZC4uMzI5YzZhNGE1Y2IgMTAw
NjQ0CistLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL29wZW5hdDIvb3BlbmF0MjAyLmMK
KysrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvb3BlbmF0Mi9vcGVuYXQyMDIuYworQEAg
LTQsNiArNCw5IEBACisgICoKKyAgKiBvcGVuYXQyKCkgdGVzdHMgd2l0aCB2YXJpb3VzIHJlc29s
dmUgZmxhZ3MuCisgICovCisrI2RlZmluZSBfR05VX1NPVVJDRQorKyNpbmNsdWRlIDxmY250bC5o
PgorKworICNpbmNsdWRlICJ0c3RfdGVzdC5oIgorICNpbmNsdWRlICJsYXBpL29wZW5hdDIuaCIK
KyAKK2RpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL29wZW5hdDIvb3BlbmF0
MjAzLmMgYi90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL29wZW5hdDIvb3BlbmF0MjAzLmMKK2lu
ZGV4IDZhYzQ5ZWY0YzllLi5jZDBjMDBkNzUyMyAxMDA2NDQKKy0tLSBhL3Rlc3RjYXNlcy9rZXJu
ZWwvc3lzY2FsbHMvb3BlbmF0Mi9vcGVuYXQyMDMuYworKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9vcGVuYXQyL29wZW5hdDIwMy5jCitAQCAtNCw2ICs0LDkgQEAKKyAgKgorICAqIEJh
c2ljIG9wZW5hdDIoKSB0ZXN0IHRvIGNoZWNrIHZhcmlvdXMgZmFpbHVyZXMuCisgICovCisrI2Rl
ZmluZSBfR05VX1NPVVJDRQorKyNpbmNsdWRlIDxmY250bC5oPgorKworICNpbmNsdWRlICJ0c3Rf
dGVzdC5oIgorICNpbmNsdWRlICJsYXBpL29wZW5hdDIuaCIKKyAKLS0gCjIuNDcuMwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
