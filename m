Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72E3C7115A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 10:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 633E08145A;
	Thu, 19 Jun 2025 10:27:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TU-_cSWlV-yM; Thu, 19 Jun 2025 10:27:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A11E481418
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A11E481418;
	Thu, 19 Jun 2025 10:27:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 81E7AE2
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 10:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6817C40531
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 10:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qz1NKseMPSZg for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 10:27:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a07:ae80:100:0:185:158:164:11; helo=linux2410.webawere.nl;
 envelope-from=dev@bybram.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 265FE4045F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 265FE4045F
Received: from linux2410.webawere.nl (linux2410.webawere.nl
 [IPv6:2a07:ae80:100:0:185:158:164:11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 265FE4045F
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 10:27:17 +0000 (UTC)
Received: from 185-047-134-076.jonaz.nl ([185.47.134.76]
 helo=bram-MS-7D25.bybram.com)
 by linux2410.webawere.nl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <dev@bybram.com>)
 id 1uSCUH-00000007xQE-11Oy; Thu, 19 Jun 2025 12:27:17 +0200
From: Bram Oosterhuis <dev@bybram.com>
To: buildroot@buildroot.org
Cc: Bram Oosterhuis <dev@bybram.com>
Date: Thu, 19 Jun 2025 12:27:12 +0200
Message-Id: <20250619102712.619955-1-dev@bybram.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Authenticated-Id: dev@bybram.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=bybram.com; 
 s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mF71Zo9HpTbsCWDhVviB74HP5nm+6LMBbn5ub+JO7/Q=; b=U
 FcTIANz/R/w1SY8AK6AfNA0oo9FLxMyqYnURpE1bn9mGK2rPCOY7sT29eZW9aqcYJhT2yDlnSHdzr
 PBmDFfeov8FgJ13hPCQLtWLXhQLnZxTPcQPdkcu40OjUPkxCzWmkcpaH1UMwno4dJvSNFWFxoytek
 pZOyVuyU4eO/PLO9zxzJ/BA5TKVawzstcWRcnrKf70JjevTC/v5eOP5Bu6H5o1ynN71w+zwoyonzH
 CNsS2HQmPlBqaAtsdnRaMG+KvA+vpX8RmgHtuDfcq9y9lKFZMdqoDOugVuJqWKRZi85+2jBNRL5Xo
 CK3keb5UHonj5xya0QADW19yopXx978Xw==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=bybram.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bybram.com header.i=@bybram.com header.a=rsa-sha256
 header.s=x header.b=UFcTIANz
Subject: [Buildroot] [PATCH 1/1] package/libgcrypt: bump to v1.11.1
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

VGhpcyBmaXhlcyAiZXJyb3I6IOKAmGFzbeKAmSBvcGVyYW5kIGhhcyBpbXBvc3NpYmxlIGNvbnN0
cmFpbnRzIG9yIHRoZXJlIGFyZSBub3QgZW5vdWdoIHJlZ2lzdGVycyIgaWYgYnVpbGQgZm9yIGFy
bWhmIHdpdGggR0NDMTQuCgpEZXRhaWxzOiBodHRwczovL2Rldi5nbnVwZy5vcmcvVDcyMjYKU2ln
bmVkLW9mZi1ieTogQnJhbSBPb3N0ZXJodWlzIDxkZXZAYnlicmFtLmNvbT4KLS0tCkJhY2twb3J0
IHRvOiAyMDI1LjAyLngsIDIwMjUuMDUueAogcGFja2FnZS9saWJnY3J5cHQvbGliZ2NyeXB0Lmhh
c2ggfCA0ICsrLS0KIHBhY2thZ2UvbGliZ2NyeXB0L2xpYmdjcnlwdC5tayAgIHwgMiArLQogMiBm
aWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9saWJnY3J5cHQvbGliZ2NyeXB0Lmhhc2ggYi9wYWNrYWdlL2xpYmdjcnlwdC9s
aWJnY3J5cHQuaGFzaAppbmRleCBjZWQ4MDg3Y2E5Li40ODZhMjlkZmMwIDEwMDY0NAotLS0gYS9w
YWNrYWdlL2xpYmdjcnlwdC9saWJnY3J5cHQuaGFzaAorKysgYi9wYWNrYWdlL2xpYmdjcnlwdC9s
aWJnY3J5cHQuaGFzaApAQCAtMSw1ICsxLDUgQEAKICMgRnJvbSBodHRwczovL3d3dy5nbnVwZy5v
cmcvZG93bmxvYWQvaW50ZWdyaXR5X2NoZWNrLmh0bWwKLXNoYTEgIGRkMmM2OGUwNjg1YmI5OTI0
OWVmZWViMDYwNDZmYWUxNWI1MjE0YmEgIGxpYmdjcnlwdC0xLjExLjAudGFyLmJ6Mgotc2hhMjU2
ICAwOTEyMGM5ODY3Y2U3ZjIwODFkNmFhYTE3NzUzODZiOThjMmYyZjI0NjEzNTc2MWFhZTQ3ZDgx
ZjU4Njg1YjljICBsaWJnY3J5cHQtMS4xMS4wLnRhci5iejIKK3NoYTEgIGQzM2ViMjcwY2Q3NGU4
YzIzZTI2M2ViNWNkYjhmN2RlNzQwZjdiNDkgIGxpYmdjcnlwdC0xLjExLjEudGFyLmJ6Mgorc2hh
MjU2ICAyNGU5MWM5MTIzYTQ2YzU0ZTgzNzFmM2EzYTI1MDJmMTE5OGYyODkzZmJmYmY1OWFmOTVi
YzFjMjE0OTliMDBlICBsaWJnY3J5cHQtMS4xMS4xLnRhci5iejIKICMgTG9jYWxseSBjYWxjdWxh
dGVkCiBzaGEyNTYgIGRjNjI2NTIwZGNkNTNhMjJmNzI3YWYzZWU0MmM3NzBlNTZjOTdhNjRmZTNh
ZGIwNjM3OTlkOGFiMDMyZmU1NTEgIENPUFlJTkcuTElCCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xp
YmdjcnlwdC9saWJnY3J5cHQubWsgYi9wYWNrYWdlL2xpYmdjcnlwdC9saWJnY3J5cHQubWsKaW5k
ZXggNTdlY2E1MDdiMy4uNWY1NmU0MGFjMiAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJnY3J5cHQv
bGliZ2NyeXB0Lm1rCisrKyBiL3BhY2thZ2UvbGliZ2NyeXB0L2xpYmdjcnlwdC5tawpAQCAtNCw3
ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUxJQkdDUllQVF9WRVJTSU9O
ID0gMS4xMS4wCitMSUJHQ1JZUFRfVkVSU0lPTiA9IDEuMTEuMQogTElCR0NSWVBUX1NPVVJDRSA9
IGxpYmdjcnlwdC0kKExJQkdDUllQVF9WRVJTSU9OKS50YXIuYnoyCiBMSUJHQ1JZUFRfTElDRU5T
RSA9IExHUEwtMi4xKwogTElCR0NSWVBUX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HLkxJQgotLSAK
Mi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
