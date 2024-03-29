Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD0EC6FD1F
	for <buildroot@archiver.kernel.org>; Fri, 29 Mar 2024 14:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04A0241607;
	Fri, 29 Mar 2024 14:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 559YLcbQCfg9; Fri, 29 Mar 2024 14:39:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC8714167F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC8714167F;
	Fri, 29 Mar 2024 14:39:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95F6C1BF39E
 for <buildroot@lists.busybox.net>; Fri, 29 Mar 2024 14:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 902FB825C3
 for <buildroot@lists.busybox.net>; Fri, 29 Mar 2024 14:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5JXOldeElYUG for <buildroot@lists.busybox.net>;
 Fri, 29 Mar 2024 14:39:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F1F738258D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1F738258D
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1F738258D
 for <buildroot@buildroot.org>; Fri, 29 Mar 2024 14:39:22 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id DD114C3D13
 for <buildroot@buildroot.org>; Fri, 29 Mar 2024 14:33:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2991424000A;
 Fri, 29 Mar 2024 14:33:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Mar 2024 15:31:38 +0100
Message-ID: <20240329143138.214780-4-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240329143138.214780-1-alexis.lothore@bootlin.com>
References: <20240329143138.214780-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1711722782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Xmyw1Vnz8c64ZkhxO7Pa3q6Y9A24osuGL0eAD9l7rA=;
 b=DQRNOCDDZheTnldLovjDYYI7JobpA6Zh0r6ivHvRVMHfaC1JkFp5Yj0656spv/IMoTEOzS
 nOsZvK9J31yi1FQP3kjSoRHny3FN3c0EMYmd+x8lejDRjFr1akElcNO9o6AZat9TD3opiA
 odf0ZDo1P8aKpwOlkxtcV1/xl3e842FozejJxUQ4L3fx8MaDms57HAPfJ/1PU6ix8nArTe
 1loGEQiyUZHeuk9kF7ICtLnGwWlaRp44h4iR0lCrMvbvfpdMCsxkDA/6UhkuNmpG0pjJIM
 7K4Jjfj1RqZVcNdzw10rF06lh7Z8WHf39Js/iBa5dGBKRLCXn8GpD04l3Aodcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DQRNOCDD
Subject: [Buildroot] [PATCH 3/3] package/pppd: create rundir when it is
 missing
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KCnBwcGQg
ZmFpbHMgdG8gc3RhcnQgb24gYnVpbGRyb290IDIwMjQuMDIsIGJlY2F1c2Ugb2Ygbm9uLWV4aXN0
aW5nIGRpcmVjdG9yeQpwcHBkIGluIC92YXIvcnVuCgpVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIu
Y29tL3BwcC1wcm9qZWN0L3BwcC9jb21taXQvM2E0ZmVjOTY4MTc0ZmQ2ZjM4N2Q1ZWM4NzJhNTYz
NDNmMjU2ZjY0NQpTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3Jl
QGJvb3RsaW4uY29tPgotLS0KQmFja3BvcnQgdG86IDIwMjQuMDIueAotLS0KIC4uLjAwMDctdHJ5
LXRvLWNyZWF0ZS1ydW5kaXItaWYtbWlzc2luZy5wYXRjaCB8IDUwICsrKysrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9wcHBkLzAwMDctdHJ5LXRvLWNyZWF0ZS1ydW5kaXItaWYtbWlzc2luZy5wYXRjaAoK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHBwZC8wMDA3LXRyeS10by1jcmVhdGUtcnVuZGlyLWlmLW1p
c3NpbmcucGF0Y2ggYi9wYWNrYWdlL3BwcGQvMDAwNy10cnktdG8tY3JlYXRlLXJ1bmRpci1pZi1t
aXNzaW5nLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uNGM0
YzYxZWMyYjMzCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9wcHBkLzAwMDctdHJ5LXRvLWNy
ZWF0ZS1ydW5kaXItaWYtbWlzc2luZy5wYXRjaApAQCAtMCwwICsxLDUwIEBACitGcm9tIDNhNGZl
Yzk2ODE3NGZkNmYzODdkNWVjODcyYTU2MzQzZjI1NmY2NDUgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tOiA9P1VURi04P3E/QWxleGlzPTIwTG90aG9yPUMzPUE5Pz0gPGFsZXhpcy5sb3Ro
b3JlQGJvb3RsaW4uY29tPgorRGF0ZTogVGh1LCAzIEF1ZyAyMDIzIDE2OjM3OjI3ICswOTAwCitT
dWJqZWN0OiBbUEFUQ0ggMy8zXSB0cnkgdG8gY3JlYXRlIHJ1bmRpciBpZiBtaXNzaW5nCisKK0Zy
b206IERvbWluaXF1ZSBNYXJ0aW5ldCA8ZG9taW5pcXVlLm1hcnRpbmV0QGF0bWFyay10ZWNobm8u
Y29tPgorCitSdW50aW1lIGRpciBjaGFuZ2VkIGZyb20gL3J1biB0byAvcnVuL3BwcGQgaW4gY29t
bWl0IDY2YThjNzRjM2Y3MyAoIkxldAorLi9jb25maWd1cmUgY29udHJvbCB0aGUgcGF0aHMgZm9y
IHBwcGQiKSBhbmQgaXMgbGlrZWx5IHRvIG5vdCBleGlzdCBvbgorc29tZSBkaXN0cm9zLCBpbiB3
aGljaCBjYXNlIHRoZSBwcHBkYiB3aWxsIG5vdCBiZSBjcmVhdGVkLgorCitTZWU6ICM0MTkgKGxv
Y2sgZGlyZWN0b3J5IG1vdmVkIGluIHBwcC0yLjUuMCkKK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1
Yi5jb20vcHBwLXByb2plY3QvcHBwL2NvbW1pdC8zYTRmZWM5NjgxNzRmZDZmMzg3ZDVlYzg3MmE1
NjM0M2YyNTZmNjQ1CitTaWduZWQtb2ZmLWJ5OiBEb21pbmlxdWUgTWFydGluZXQgPGRvbWluaXF1
ZS5tYXJ0aW5ldEBhdG1hcmstdGVjaG5vLmNvbT4KKy0tLQorIHBwcGQvdGRiLmMgfCA4ICsrKysr
KysrCisgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQorCitkaWZmIC0tZ2l0IGEvcHBw
ZC90ZGIuYyBiL3BwcGQvdGRiLmMKK2luZGV4IDhhNTYzZjg4YjlhNi4uNjI2NDQxNzFhYTZlIDEw
MDY0NAorLS0tIGEvcHBwZC90ZGIuYworKysrIGIvcHBwZC90ZGIuYworQEAgLTYwLDggKzYwLDEx
IEBACisgI2luY2x1ZGUgPHN5cy9tbWFuLmg+CisgI2luY2x1ZGUgPHN5cy9zdGF0Lmg+CisgI2lu
Y2x1ZGUgPHNpZ25hbC5oPgorKworKyNpbmNsdWRlICJwcHBkLXByaXZhdGUuaCIKKyAjaW5jbHVk
ZSAidGRiLmgiCisgI2luY2x1ZGUgInNwaW5sb2NrLmgiCisrI2luY2x1ZGUgInBhdGhuYW1lcy5o
IgorIAorICNkZWZpbmUgVERCX01BR0lDX0ZPT0QgIlREQiBmaWxlXG4iCisgI2RlZmluZSBUREJf
VkVSU0lPTiAoMHgyNjAxMTk2NyArIDYpCitAQCAtMTcyOCw3ICsxNzMxLDEyIEBAIFREQl9DT05U
RVhUICp0ZGJfb3Blbl9leChjb25zdCBjaGFyICpuYW1lLCBpbnQgaGFzaF9zaXplLCBpbnQgdGRi
X2ZsYWdzLAorIAkJZ290byBpbnRlcm5hbDsKKyAJfQorIAorK2FnYWluOgorIAlpZiAoKHRkYi0+
ZmQgPSBvcGVuKG5hbWUsIG9wZW5fZmxhZ3MsIG1vZGUpKSA9PSAtMSkgeworKwkJaWYgKChvcGVu
X2ZsYWdzICYgT19DUkVBVCkgJiYgZXJybm8gPT0gRU5PRU5UICYmCisrCQkJbWtkaXJfcmVjdXJz
aXZlKFBQUF9QQVRIX1ZBUlJVTikgPT0gMCkKKysJCQlnb3RvIGFnYWluOworKworIAkJVERCX0xP
RygodGRiLCA1LCAidGRiX29wZW5fZXg6IGNvdWxkIG5vdCBvcGVuIGZpbGUgJXM6ICVzXG4iLAor
IAkJCSBuYW1lLCBzdHJlcnJvcihlcnJubykpKTsKKyAJCWdvdG8gZmFpbDsJLyogZXJybm8gc2V0
IGJ5IG9wZW4oMikgKi8KKy0tIAorMi40My4xCisKLS0gCjIuNDMuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
