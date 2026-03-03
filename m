Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F9CEDEBEB
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A246280733;
	Tue,  3 Mar 2026 20:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ry3kQZW-ws_L; Tue,  3 Mar 2026 20:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3B33810F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772568161;
	bh=WfV9giX+CoKOSCbkSrZC8a5P+BXtrcDyE4k2EG4D3d8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CM2XXaQmXZTVYrvca7W93znB6i1dM930RFwT3Af0oe6QMH6bkDBL/JBS0DJTbgWcV
	 gzczffZK9dD/GSXJM6bvVyiXPO3cyfoxx/+Y9b+NKMWY7FZJnyfvDu6FFeXsY5D/Hs
	 LWTtSCG9ab8ZPDOuuNQNk/9rrGrTfksRGZyxsPN3r1r1bF5jcPKsp/17IfZ8XLI0FF
	 rWL1gP2HgMqZSeS/uq3Lqm8nRZhWtH8GkfXJhRE1ZUAm6OoBGbjB2JLswycGirUdc2
	 FNlk7lGszyx5AW62LTyZD7FLxRISiUB6CrCEmbPkfbpw1c2zQhMCS8VtjFZxYCZpEe
	 Gg9Q4LYcf8eAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3B33810F1;
	Tue,  3 Mar 2026 20:02:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 277AA1EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25123407A1
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:02:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MgvSCHAv3LRW for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:02:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 142D84079D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 142D84079D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 142D84079D
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:02:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04ca.dip0.t-ipconnect.de [91.58.4.202])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8D4A4A4C3411;
 Tue,  3 Mar 2026 21:01:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53148)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxVvM-000000003gI-0NV6;
 Tue, 03 Mar 2026 20:00:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 21:00:48 +0100
Message-ID: <20260303200054.784253-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303200054.784253-1-bernd@kuhls.net>
References: <20260303200054.784253-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772568062;
 bh=URAWfsQLDHfsWgPCiy56r4cLxRLu1H+n6Qk35HDM1tI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=lxS0gkr7ezLKylb6d5u7q2Q5MlpnzdIjIEbUrN50YfrpSWgPF8op01wmjSboYwhxh
 Poox+aita0nLycSAnMW3KBDHYDTgQ5e912PgtJh4LCNXqTmj6SZSVOg+bKm6aqcBHz
 JPsZVR+1PDH3ZshRtfHpqVAgfTQPubo7UFSP4DZ7P8PAV3SOUV8o/l0+rL6pfMG50a
 +WYrGB1gphBJqwvo5URpfVz1J7IusUpxxda0iVjQo0L9EQbAeIVWjd2wKP5hO0HhWm
 KxmTXiKx3dsX+m1Ye93owPN2/eVO7mvm/GT7hb69nvJWPM3RBBIN22q+adXKJYKK/a
 Eomvu4O7rOuEw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=lxS0gkr7
Subject: [Buildroot] [PATCH/next 09/14] package/ltp-testsuite: fix build
 with glibc 2.43
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
