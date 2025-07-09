Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488DFC83F0A
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 15:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBE15408FF;
	Wed,  9 Jul 2025 15:04:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pw1viG9AwFYZ; Wed,  9 Jul 2025 15:04:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 389EC4085E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 389EC4085E;
	Wed,  9 Jul 2025 15:04:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04A1D12E
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0228560A7C
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:04:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZN_1ictCDl9 for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 15:04:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::235;
 helo=relay15.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C89F6608FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C89F6608FB
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C89F6608FB
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:04:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A02AD44292;
 Wed,  9 Jul 2025 15:04:22 +0000 (UTC)
Date: Wed, 09 Jul 2025 17:04:13 +0200
Message-Id: <20250709-perf_libtraceevent-v2-0-3ea54fbe6b5b@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO2EbmgC/32NQQrCMBBFr1JmbSQJNrWuvIcUaeLEDtSkTEJQS
 u9u7AFcvgf//RUSMmGCS7MCY6FEMVTQhwbcNIYnCnpUBi11K41uxYLs7zPZzKNDLBiyUB2eDKI
 ++15CHS6Mnt579DZUnijlyJ/9o6if/ZsrSighre+MltYZ119tjHmmcHTxBcO2bV+Xq1pTtgAAA
 A==
X-Change-ID: 20250625-perf_libtraceevent-17e46ee28f90
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Olivier Benjamin <olivier.benjamin@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjeekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepuedtvdejjeeitefftdelkeettdefheffjeekteekfeeuheeuteeitdeggfekvdeknecuffhomhgrihhnpegsohhothhlihhnrdgtohhmpdhkvghrnhgvlhdrohhrghenucfkphepvdgrtddvmeekgedvkeemhegvsgeimeduvddtudemrghfugeimeeffhgssgemrggutdekmeekfhelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmeehvggsieemuddvtddumegrfhguieemfehfsggsmegrugdtkeemkehfleeipdhhvghloheplgduledvrdduieekrddurdegjegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtl
 hhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhm
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1752073463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sN3eG8kkubD5fiVXtlb5p9RMDB+nEsXEEWWSwoqs/Ms=;
 b=Am8JCyXKdE+Xhysb+1IcYNflR0ApCwb6Rz/aOFURZi4A8Xnt8ktGbScJO10QXTmzRbPe7D
 /s4Dc4eQbN7RL3QCi66EW0EK4VrGzushI/c8PUbX2XapHCfiNEq8gHTq3nsR0DsUB5MYuS
 176lhXXqA5VOJs5OPnOVxZRO7NkyCZ8dy5O3Wvd62vyjJOvE8FqvXM6Lqh3w5nsV+B2v9o
 8I+RCooLLryWYMtI2MbqRSVSGBYDjifCg70x/F5vn1oatVbOShvWSlZhBet64Phu9GafU8
 v3DYcpqi4/+tMs9ntGikV0hLTw4yPLkiJEB2HBITk9sTMmWfHKTS2F1QleK6yQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Am8JCyXK
Subject: [Buildroot] [PATCH v2 0/2] packages/linux-tools: perf: allow
 building perf with libtraceevent
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

SGVsbG8sCnRoaXMgc2VyaWVzIGlzIHRoZSB2MiBhaW1pbmcgdG8gYWxsb3cgYnVpbGRpbmcgcGVy
ZiB3aXRoIGxpYnRyYWNlZXZlbnQKc3VwcG9ydCwgaW4gb3JkZXIgdG8gYmUgYWJsZSBmb3IgZXhh
bXBsZSB0byBtYW5pcHVsYXRlIGFuZCByZWNvcmQKdXByb2JlcyB3aXRoIHBlcmYuCgpUaGlzIG5l
dyByZXZpc2lvbiBnZXRzIGEgbmV3IGNvbW1pdCBlbmZvcmNpbmcgUEtHX0NPTkZJR19MSUJESVIg
Zm9yIHRoZQpwZXJmIG1ha2VmaWxlLiBJIGFtIG5vdCBzdXJlIGhvdyBJIGRpZCBub3QgZ2V0IHRo
ZSBjb3JyZXNwb25kaW5nIGVycm9yCnRoZSBmaXJzdCB0aW1lIChtYXliZSBpdCBuZWVkZWQgc29t
ZSBmdWxsIHJlYnVpbGQgdG8gdHJpZ2dlciksIGJ1dCBJIG5vdwpzZWUgdGhhdCBJIGZhaWwgdG8g
YnVpbGQgcGVyZiB3aXRoIG11bHRpcGxlIHN0YWJsZSBrZXJuZWxzIGlmIEkgZG8gbm90CmVuZm9y
Y2UgdGhpcyB2YXJpYWJsZSAoaWYgaXQgaXMgbm90IGRlZmluZWQsIHRoZSBwZXJmIG1ha2VmaWxl
IHdpbGwgc2V0Cml0IHRvIGEgdmFsdWUgdGhhdCBpcyB3cm9uZyBpbiBhIGJ1aWxkcm9vdCBidWls
ZCwgc2VlIFsxXSkuIEkgZm91bmQgYQpzaW1pbGFyIHRocmVhZCBhbmQgYXR0ZW1wdCAoc2VlIFsy
XSksIHRoaXMgc2VyaWVzIHByb3Bvc2VzIHRvIGltcGxlbWVudAp0aGUgc2Vjb25kIG9wdGlvbiBt
ZW50aW9uZWQgaW4gdGhlcmUuCgpBbHNvLCBhcyBtZW50aW9uZWQgaW4gdGhlIHByZXZpb3VzIHJl
dmlzaW9uLCBwZXJmIG1heSBmYWlsIHRvIGJ1aWxkIG9uCnNvbWUgb2xkZXIga2VybmVscyBiZWNh
dXNlIHRoZSBwYXRjaCBjb3JyZWN0bHkgc2V0dGluZyBwa2ctY29uZmlnIGJpbmFyeQpuYW1lIGhh
cyBub3QgYmVlbiBiYWNrcG9ydGVkLiBJIGhhdmUgaWRlbnRpZmllZCB0aGF0IG9ubHkgNi42IG5l
ZWRlZCBpdAooYXMgcGVyZiBidWlsZHMgc3RhcnQgdG8gZmFpbCBmcm9tIDYuMywgYW5kIGFyZSBm
aXhlZCBpbiA2LjExKS4gVGhlCmNvcnJlc3BvbmRpbmcgc3RhYmxlIGJhY2twb3J0IHJlcXVlc3Qg
YXMgYmVlbiBzZW50IChzZWUgWzNdKQoKQEx1Y2E6IHNpbmNlIGFsbCBzdGFibGUga2VybmVscyBz
aG91bGQgZ2V0IHRoZSByZWxldmFudCBmaXggYW5kIHRoZW4KYWxsb3cgdG8gYnVpbGQgcGVyZiB3
aXRoIGxpYnRyYWNlZXZlbnQgc3VwcG9ydCwgSSBldmVudHVhbGx5IGNob3NlIF9ub3RfCnRvIG1l
bnRpb24gYW55IGlzc3VlIGluIHRoZSBLY29uZmlnLgoKWzFdIGh0dHBzOi8vZWxpeGlyLmJvb3Rs
aW4uY29tL2xpbnV4L3Y2LjEyLjM2L3NvdXJjZS90b29scy9wZXJmL01ha2VmaWxlLnBlcmYjTDIx
MQpbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290L2FCazRhdTRyUXBaSk1yVFFA
dmFtb2lyaWQtbGFwdG9wLwpbM10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvc3RhYmxlLzIwMjUw
NzA5NTUtZGlzY292ZXItdHJlZS02NDRjQGdyZWdraC9ULyNtMzk0ZjJjOTM5MmRhN2NmZDNjYTEz
MGFmNmE3ZWM4ZmY2ZWU0YjZiZgoKVG86IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCkNjOiBUaG9t
YXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgpDYzogTHVjYSBDZXJl
c29saSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4KQ2M6IE9saXZpZXIgQmVuamFtaW4gPG9s
aXZpZXIuYmVuamFtaW5AYm9vdGxpbi5jb20+CgpTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9y
w6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBlbmZv
cmNlIFBLR19DT05GSUdfTElCRElSCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI1MDYyNS1wZXJmX2xpYnRyYWNlZXZlbnQtdjEtMS0wYmY3NjIwYmM2YzlAYm9vdGxp
bi5jb20KCi0tLQpBbGV4aXMgTG90aG9yw6kgKDIpOgogICAgICBwYWNrYWdlL2xpbnV4LXRvb2xz
OiBwZXJmOiBidWlsZCB3aXRoIGxpYnRyYWNlZXZlbnQgc3VwcG9ydCB3aGVuIGl0IGlzIHNlbGVj
dGVkCiAgICAgIHBhY2thZ2VzL2xpbnV4LXRvb2xzOiBwZXJmOiBlbmZvcmNlIFBLR19DT05GSUdf
TElCRElSCgogcGFja2FnZS9saW51eC10b29scy9saW51eC10b29sLXBlcmYubWsuaW4gfCA4ICsr
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCi0t
LQpiYXNlLWNvbW1pdDogZjI4ZjM0ZTIwMGJiYWRmMGFlYTMyMTEwYzcyZjcxOTllNjVmYjBiOQpj
aGFuZ2UtaWQ6IDIwMjUwNjI1LXBlcmZfbGlidHJhY2VldmVudC0xN2U0NmVlMjhmOTAKCkJlc3Qg
cmVnYXJkcywKLS0gCkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQg
S2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
