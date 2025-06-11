Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFD1C61CE7
	for <buildroot@archiver.kernel.org>; Wed, 11 Jun 2025 07:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CD84811A5;
	Wed, 11 Jun 2025 07:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EtNh99RLL8K1; Wed, 11 Jun 2025 07:24:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FAC881152
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FAC881152;
	Wed, 11 Jun 2025 07:24:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CB2A183
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 07:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DCE5607E5
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 07:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xDRpM1T5F9BV for <buildroot@buildroot.org>;
 Wed, 11 Jun 2025 07:23:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2014C60797
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2014C60797
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2014C60797
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 07:23:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 9ECE31814B9; Wed, 11 Jun 2025 09:23:53 +0200 (CEST)
To: "Roy Kollen Svendsen" <roykollensvendsen@gmail.com>,
 buildroot@buildroot.org, "Julien Olivain" <ju.o@free.fr>
User-Agent: SOGoMail 5.12.0
MIME-Version: 1.0
Date: Wed, 11 Jun 2025 09:23:53 +0200
Message-ID: <c213a-68492f00-3-52193400@165140094>
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1749626635; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding; bh=xWKqi1XR2xMsfdIF5CmJMSvc/S7H1i1QceGu4A2RYGY=;
 b=mdIzIm9GBHbMbBPAWeMJN7JGhnyXG9JNGqHumUIspyVf8Fa2AK6MB21zy1nBM4TUew5vTG
 Ojf70qGQxixqmZZV/VBhqofRjrbaxSXpT2Afqj3qgR3ijyWg7D3v2gFHNXVS92ws/G1IDk
 UG517rbM1P3XewH3Sncm9IkTkaEFQz8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=mdIzIm9G
Subject: [Buildroot] Building with docker-run fails for mariadb
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpJJ20gY3VycmVudGx5IGxvb2tpbmcgaW50byBidW1waW5nIGZtdCBhbmQgZm9yIHRoaXMg
SSB3YW50IHRvIHRlc3QgYWdhaW5zdCBtYXJpYWRiIGFzIHRoaXMgaGFkIHRyb3VibGVzIHdpdGgg
dmVyc2lvbiBidW1wcyBvZiBmbXQgYmVmb3JlLgoKVG8gc3RhcnQgd2l0aCBhIGNsZWFuIHN0YXRl
IEkgdHJpZWQgdG8gcnVuIHRoZSBtYXJpYWRiIHRlc3RzIG9uIGEgY2xlYW4gMjAyNS4wNSBjaGVj
a291dC4gQnV0IHRoZSBidWlsZCBmYWlscyBvbiBteSBtYWNoaW5lIHdoZW4gY2hlY2tpbmcgSEFW
RV9TWVNURU1fTElCRk1ULgoKVG8gc2VlIGEgYml0IG1vcmUgY2xlYXIgSSBqdXN0IHRyaWdnZXJl
ZCBhIGNsZWFuIGJ1aWxkIGxpa2UgdGhpcyB3aXRob3V0IHRoZSB0ZXN0LXN1aXRlOgoKPiB1dGls
cy9kb2NrZXItcnVuIG1ha2UgTz0uL2J1aWxkLW91dHB1dC9tYXJpYWRiLWJlZm9yZS1idW1wIC1q
MjQgbWFyaWFkYgoKVGhlIHJlc3VsdCBpcyB0aGUgc2FtZToKCi0tIFBlcmZvcm1pbmcgVGVzdCBI
QVZFX1NZU1RFTV9MSUJGTVQKL2Jpbi9iYXNoOiBsaW5lIDE6ICAgNTgxIFNlZ21lbnRhdGlvbiBm
YXVsdCAgICAgIChjb3JlIGR1bXBlZCkgKCBta2RpciAtcCAvb3B0L252bS9tbm8vYnVpbGRyb290
LXVwc3RyZWFtL2J1aWxkLW91dHB1dC9tYXJpYWRiLWJlZm9yZS1idW1wL2J1aWxkL21hcmlhZGIt
MTAuMTEuMTEvICYmIGNkIC9vcHQvbnZtL21uby9idWlsZHJvb3QtdXBzdHJlYW0vYnVpbGQtb3V0
cHV0L21hcmlhZGItYmVmb3JlLWJ1bXAvYnVpbGQvbWFyaWFkYi0xMC4xMS4xMS8gJiYgcm0gLWYg
Q01ha2VDYWNoZS50eHQgJiYgUEFUSD0iL29wdC9udm0vbW5vL2J1aWxkcm9vdC11cHN0cmVhbS9i
dWlsZC1vdXRwdXQvbWFyaWFkYi1iZWZvcmUtYnVtcC9wZXItcGFja2FnZS9tYXJpYWRiL2hvc3Qv
YmluOi9vcHQvbnZtL21uby9idWlsZHJvb3QtdXBzdHJlYW0vYnVpbGQtb3V0cHV0L21hcmlhZGIt
YmVmb3JlLWJ1bXAvcGVyLXBhY2thZ2UvbWFyaWFkYi9ob3N0L3NiaW46L3Vzci9sb2NhbC9zYmlu
Oi91c3IvbG9jYWwvYmluOi91c3Ivc2JpbjovdXNyL2Jpbjovc2JpbjovYmluIiAvdXNyL2Jpbi9j
bWFrZSAvb3B0L252bS9tbm8vYnVpbGRyb290LXVwc3RyZWFtL2J1aWxkLW91dHB1dC9tYXJpYWRi
LWJlZm9yZS1idW1wL2J1aWxkL21hcmlhZGItMTAuMTEuMTEvIC1HIlVuaXggTWFrZWZpbGVzIiAt
RENNQUtFX01BS0VfUFJPR1JBTT0iL3Vzci9iaW4vbWFrZSIgLURDTUFLRV9UT09MQ0hBSU5fRklM
RT0iL29wdC9udm0vbW5vL2J1aWxkcm9vdC11cHN0cmVhbS9idWlsZC1vdXRwdXQvbWFyaWFkYi1i
ZWZvcmUtYnVtcC9wZXItcGFja2FnZS9tYXJpYWRiL2hvc3Qvc2hhcmUvYnVpbGRyb290L3Rvb2xj
aGFpbmZpbGUuY21ha2UiIC1EQ01BS0VfSU5TVEFMTF9QUkVGSVg9Ii91c3IiIC1EQ01BS0VfSU5T
VEFMTF9SVU5TVEFURURJUj0iL3J1biIgLURDTUFLRV9DT0xPUl9NQUtFRklMRT1PRkYgLURCVUlM
RF9ET0M9T0ZGIC1EQlVJTERfRE9DUz1PRkYgLURCVUlMRF9FWEFNUExFPU9GRiAtREJVSUxEX0VY
QU1QTEVTPU9GRiAtREJVSUxEX1RFU1Q9T0ZGIC1EQlVJTERfVEVTVFM9T0ZGIC1EQlVJTERfVEVT
VElORz1PRkYgLURCVUlMRF9TSEFSRURfTElCUz1PTiAtRFdJVEhfTElCRk1UPXN5c3RlbSAtRFdJ
VEhfUENSRT1zeXN0ZW0gLURIQVZFX1NZU1RFTV9MSUJGTVRfRVhJVENPREU9MCAtRENNQUtFX1NZ
U1RFTV9OQU1FPUJ1aWxkcm9vdCAtRFdJVEhfUkVBRExJTkU9T04gLURXSVRIX1VOSVRfVEVTVFM9
MCAtRFdJVEhPVVRfTVJPT05HQT0xIC1EU1RBQ0tfRElSRUNUSU9OPS0xIC1EV0lUSF9KRU1BTExP
Qz1ubyAtRFdJVEhPVVRfVE9LVURCPTEgLURXSVRIT1VUX1JPQ0tTREI9MSAtRENNQUtFX0NST1NT
Q09NUElMSU5HPTEgLURFTkFCTEVfRFRSQUNFPTAgLURXSVRIX1NZU1RFTUQ9bm8gLURXSVRIX0VN
QkVEREVEX1NFUlZFUj1PRkYgLURDTUFLRV9DWFhfRkxBR1M9Ii1EX0xBUkdFRklMRV9TT1VSQ0Ug
LURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgIC1PMiAtZzAgLURf
Rk9SVElGWV9TT1VSQ0U9MSAtbGF0b21pYyIgLURJTlNUQUxMX0RPQ0RJUj1zaGFyZS9kb2MvbWFy
aWFkYi0xMC4xMS4xMSAtRElOU1RBTExfRE9DUkVBRE1FRElSPXNoYXJlL2RvYy9tYXJpYWRiLTEw
LjExLjExIC1ESU5TVEFMTF9NQU5ESVI9c2hhcmUvbWFuIC1ESU5TVEFMTF9NWVNRTFNIQVJFRElS
PXNoYXJlL215c3FsIC1ESU5TVEFMTF9NWVNRTFRFU1RESVI9c2hhcmUvbXlzcWwvdGVzdCAtRElO
U1RBTExfUExVR0lORElSPWxpYi9teXNxbC9wbHVnaW4gLURJTlNUQUxMX1NCSU5ESVI9c2JpbiAt
RElOU1RBTExfU0NSSVBURElSPWJpbiAtRElOU1RBTExfU1FMQkVOQ0hESVI9c2hhcmUvbXlzcWwv
YmVuY2ggLURJTlNUQUxMX1NVUFBPUlRGSUxFU0RJUj1zaGFyZS9teXNxbCAtRE1ZU1FMX0RBVEFE
SVI9L3Zhci9saWIvbXlzcWwgLURNWVNRTF9VTklYX0FERFI9IC1ESU1QT1JUX0VYRUNVVEFCTEVT
PS9vcHQvbnZtL21uby9idWlsZHJvb3QtdXBzdHJlYW0vYnVpbGQtb3V0cHV0L21hcmlhZGItYmVm
b3JlLWJ1bXAvYnVpbGQvaG9zdC1tYXJpYWRiLTEwLjExLjExLy9pbXBvcnRfZXhlY3V0YWJsZXMu
Y21ha2UgKQptYWtlWzFdOiAqKiogW3BhY2thZ2UvcGtnLWdlbmVyaWMubWs6MjYzOiAvb3B0L252
bS9tbm8vYnVpbGRyb290LXVwc3RyZWFtL2J1aWxkLW91dHB1dC9tYXJpYWRiLWJlZm9yZS1idW1w
L2J1aWxkL21hcmlhZGItMTAuMTEuMTEvLnN0YW1wX2NvbmZpZ3VyZWRdIEVycm9yIDEzOQoKU28g
dG8gbWUgdGhpcyBzZWVtcyBsaWtlIHRoZSBtYXJpYWRiIGJ1aWxkIHRyaWVzIHRvIGV4ZWN1dGUg
dGhlIGNyb3NzLWNvbXBpbGVkIGNvZGUgc25pcHBlZCB0ZXN0aW5nIGZvciBmbXQgY29tcGF0aWJp
bGl0eSB3aGljaCBvYnZpb3VzbHkgZmFpbHMuCgpUaGUgaW50ZXJlc3RpbmcgdGhpbmcgaXM6IHdo
ZW4gSSBidWlsZCBkaXJlY3RseSBvbiBteSBtYWNoaW5lIChVYnVudHUgMjQuMDQuMiwgNjQtYml0
KSB3aXRob3V0IHRoZSBkb2NrZXIgY29udGFpbmVyIHRoZSBidWlsZCBwYXNzZXMuCgpTbyBteSBo
eXBvdGhlc2lzIGlzLCB0aGF0IGZvciBzb21lIHJlYXNvbiB0aGUgYnVpbGQgb2YgbWFyaWFkYiBp
bnNpZGUgdGhlIGRvY2tlciBjb250YWluZXIgZG9lc24ndCByZWFsaXplIGl0cyBjcm9zcy1jb21w
aWxpbmcuCgpNeSBxdWVzdGlvbiB3b3VsZCBiZTogSXMgdGhpcyBjb21tYW5kIGN1cnJlbnRseSAo
dGFnOiAyMDI1LjA1KSB3b3JraW5nIGZvciBhbnlvbmU/Cgp1dGlscy9kb2NrZXItcnVuIHN1cHBv
cnQvdGVzdGluZy9ydW4tdGVzdHMgXCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAg4pSA4pWvCiAgICAgICAgIC1rIC1kIGRsIC1vIG91dHB1dF9mb2xkZXIg
XAogICAgICAgICB0ZXN0cy5wYWNrYWdlLnRlc3RfbWFyaWFkYgoKQW5kIGRvIHlvdSBoYXZlIGFu
eSBpZGVhIHdoYXQgbWlnaHQgYmUgY2F1c2luZyB0aGlzIGlzc3VlPwoKUmVnYXJkcywKTWljaGFl
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
