Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1736C61DBD
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 14:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9241B605EE;
	Wed, 26 Aug 2026 14:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2c5z60ui46d7; Wed, 26 Aug 2026 14:13:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787753631;
	bh=gofe6T0APrt59Z3/4apzveUCSFmJl+foQ+IBYjYp700=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=jkXeTI0Bj3Clt9XELyoiTCIZMIxlIeIrvyV65NSC/av8T38xg9BMI8W/CTPsKlR0N
	 Cw4LUh4tTh/0MBTSfpdayDTPdfGDpor5rsSgWO91VLa8kXgM/txzazsnhxu7jDwFdF
	 AlMUwjo9CKelzxJnVy224dM0H4STaIOaDprH7QYhkesiyPoon7eeu9k8lSfGcqanLa
	 PJyMWb1o5rx6gqTthVrkoHNiy6PjQf1KoS/eMJYDTVaTqanGlUcxeJL6pJX+N59OyA
	 uwB9vCtJZe3XY8kVrN37uN2cqyyOakGnZlNYZdWWfPIVRpLylH722jCcZip5W/vABs
	 HIMTg+I6GzzlQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACB626067B;
	Wed, 26 Aug 2026 14:13:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C62EE230
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 14:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3EB540532
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 14:13:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfgKOMpIDkIC for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 14:13:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0D2B4046C
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 14:13:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 49F094E413C2;
 Wed, 26 Aug 2026 14:13:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1250E604EC;
 Wed, 26 Aug 2026 14:13:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 805F011C78320; 
 Wed, 26 Aug 2026 16:13:39 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Wed, 26 Aug 2026 16:13:36 +0200
Message-ID: <20260826141337.4035888-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/mesa3d: fix build issue with gcc < 13
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2luY2UgdXBzdHJlYW0gY29tbWl0CmU0MmUzMTkzMTM3ZDFiMjFlODRiNDk5MzM2ZTdhODg4N2I4
YTg2ODkgKCJpbnRlbDogYWRkIEpheSIpLCBhIEMyMwpjb25zdHJ1Y3QgaXMgdXNlZCBpbiB0aGUg
aW50ZWwgZHJpdmVyIGNvZGU6CgplbnVtIGpheV9wcmVkaWNhdGlvbiA6IHVpbnQ4X3QKClRoaXMg
Y2F1c2VzIGEgYnVpbGQgaXNzdWUgd2l0aCBHQ0MgPCAxMzoKCkluIGZpbGUgaW5jbHVkZWQgZnJv
bSAuLi9zcmMvaW50ZWwvY29tcGlsZXIvamF5L2pheV9idWlsZGVyLmg6MTIsCiAgICAgICAgICAg
ICAgICAgZnJvbSAuLi9zcmMvaW50ZWwvY29tcGlsZXIvamF5L2pheV9mcm9tX25pci5jOjIzOgou
Li9zcmMvaW50ZWwvY29tcGlsZXIvamF5L2pheV9pci5oOjU4MjoyMjogZXJyb3I6IGV4cGVjdGVk
IGlkZW50aWZpZXIgb3Ig4oCYKOKAmSBiZWZvcmUg4oCYOuKAmSB0b2tlbgogIDU4MiB8IGVudW0g
amF5X3ByZWRpY2F0aW9uIDogdWludDhfdCB7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
XgouLi9zcmMvaW50ZWwvY29tcGlsZXIvamF5L2pheV9pci5oOjYzNzoyNTogZXJyb3I6IGZpZWxk
IOKAmHByZWRpY2F0aW9u4oCZIGhhcyBpbmNvbXBsZXRlIHR5cGUKICA2MzcgfCAgICBlbnVtIGph
eV9wcmVkaWNhdGlvbiBwcmVkaWNhdGlvbjsKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICBefn5+fn5+fn5+fgoKV2UgZml4IHRoYXQgYnkgaW50ZWdyYXRpbmcgYSBwYXRjaCBhbHJlYWR5
IGF2YWlsYWJsZSBpbgpPcGVuRW1iZWRkZWQuIEl0IGNoYW5nZXMgdGhlIGNvZGUgdG8gbm90IHVz
ZSB0aGUgQzIzIGNvbnN0cnVjdC4KClRoaXMgYnVpbGQgaXNzdWUgd2FzIGVuY291bnRlcmVkIG9u
IGhvc3QtbWVzYTNkIHdoaWxlIGJ1aWxkaW5nIGFuCmFsbHllc3BhY2thZ2Vjb25maWcgY29uZmln
dXJhdGlvbiBpbnNpZGUgb3VyIHN0YW5kYXJkIERvY2tlcgpjb250YWluZXIuCgpCdWlsZHJvb3Qg
Y29tbWl0CmMwNzNjOTc2MTc5MDIxYzg0ZTBjODRmNmYyM2U5MzhiNDM3ODNlNzUgKCJwYWNrYWdl
L3ttZXNhM2QsCm1lc2EzZC1oZWFkZXJzfTogYnVtcCB2ZXJzaW9uIHRvIDI2LjEuMCIpIHRoYXQg
c3dpdGNoZWQgdG8gbWVzYTNkCjI2LjEuMCwgd2hpY2ggY29udGFpbnMgdGhlIHByb2JsZW1hdGlj
IGNvbW1pdC4gVGhlcmVmb3JlIDIwMjYuMDUgaXMKYWZmZWN0ZWQsIGJ1dCBub3QgZWFybGllciBC
dWlsZHJvb3QgdmVyc2lvbnMuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgotLS0KIC4uLmVyLWpheS1qYXlfaXIuaC1kby1ub3Qt
dXNlZC10eXBlZC1lbi5wYXRjaCB8IDQxICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA0MSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9tZXNhM2Qv
MDAwNS1zcmMtaW50ZWwtY29tcGlsZXItamF5LWpheV9pci5oLWRvLW5vdC11c2VkLXR5cGVkLWVu
LnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9tZXNhM2QvMDAwNS1zcmMtaW50ZWwtY29tcGls
ZXItamF5LWpheV9pci5oLWRvLW5vdC11c2VkLXR5cGVkLWVuLnBhdGNoIGIvcGFja2FnZS9tZXNh
M2QvMDAwNS1zcmMtaW50ZWwtY29tcGlsZXItamF5LWpheV9pci5oLWRvLW5vdC11c2VkLXR5cGVk
LWVuLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmFmMDY2Mjg3
ZTIKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL21lc2EzZC8wMDA1LXNyYy1pbnRlbC1jb21w
aWxlci1qYXktamF5X2lyLmgtZG8tbm90LXVzZWQtdHlwZWQtZW4ucGF0Y2gKQEAgLTAsMCArMSw0
MSBAQAorRnJvbSAzNDVjY2Y5M2U5ZDAwZGZkMGY3MTA4NTgzMmE3ZGYwMTcwYjc0Zjc0IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRy
b25peC5kZT4KK0RhdGU6IFN1biwgMTQgSnVuIDIwMjYgMTc6NDI6MTkgKzAyMDAKK1N1YmplY3Q6
IFtQQVRDSF0gc3JjL2ludGVsL2NvbXBpbGVyL2pheS9qYXlfaXIuaDogZG8gbm90IHVzZWQgdHlw
ZWQgZW51bQorCitUaGlzIGlzIGEgQzIzIGZlYXR1cmUgYW5kIG5vdCBzdXBwb3J0ZWQgYnkgZ2Nj
IDwgMTMsIHdoaWNoCittYW55IGhvc3QgZGlzdHJvcyBzdGlsbCBoYXZlIChlLmcuIERlYmlhbiAx
MikuCisKK1Vwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbeW9jdG8gaG9zdCBkaXN0cm8g
cmVxdWlyZW1lbnRzXQorU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGlu
dXRyb25peC5kZT4KK1Vwc3RyZWFtOiBOL0EsIGNvZGUgY29tcGxldGVseSBjaGFuZ2VkIHVwc3Ry
ZWFtCitTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJv
b3RsaW4uY29tPgorLS0tCisgc3JjL2ludGVsL2NvbXBpbGVyL2pheS9qYXlfaXIuaCB8IDQgKyst
LQorIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCisKK2Rp
ZmYgLS1naXQgYS9zcmMvaW50ZWwvY29tcGlsZXIvamF5L2pheV9pci5oIGIvc3JjL2ludGVsL2Nv
bXBpbGVyL2pheS9qYXlfaXIuaAoraW5kZXggODMwNzA0NGVmOGEuLmFiZjE3NWE3MWJmIDEwMDY0
NAorLS0tIGEvc3JjL2ludGVsL2NvbXBpbGVyL2pheS9qYXlfaXIuaAorKysrIGIvc3JjL2ludGVs
L2NvbXBpbGVyL2pheS9qYXlfaXIuaAorQEAgLTU3OSw3ICs1NzksNyBAQCBqYXlfdHlwZV9pc19h
bnlfZmxvYXQoZW51bSBqYXlfdHlwZSB0KQorICAgIHJldHVybiBqYXlfYmFzZV90eXBlKHQpID09
IEpBWV9UWVBFX0YgfHwgamF5X2Jhc2VfdHlwZSh0KSA9PSBKQVlfVFlQRV9CRjsKKyB9CisgCist
ZW51bSBqYXlfcHJlZGljYXRpb24gOiB1aW50OF90IHsKKytlbnVtIGpheV9wcmVkaWNhdGlvbiB7
CisgICAgLyoqIE5vIHByZWRpY2F0aW9uLiAqLworICAgIEpBWV9OT1RfUFJFRElDQVRFRCA9IDAs
CisgCitAQCAtNjM0LDcgKzYzNCw3IEBAIHR5cGVkZWYgc3RydWN0IGpheV9pbnN0IHsKKyAgICBi
b29sIGRlY3JlbWVudF9kZXA6MTsKKyAgICB1bnNpZ25lZCBwYWRkaW5nICA6MTI7CisgCistICAg
ZW51bSBqYXlfcHJlZGljYXRpb24gcHJlZGljYXRpb247CisrICAgdWludDhfdCBwcmVkaWNhdGlv
bjsKKyAgICBlbnVtIGpheV9jb25kaXRpb25hbF9tb2QgY29uZGl0aW9uYWxfbW9kOworIAorICAg
IGpheV9kZWYgY29uZF9mbGFnOyAvKio8IGNvbmRpdGlvbmFsIGZsYWcgKi8KKy0tIAorMi41NS4w
CisKLS0gCjIuNTUuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
