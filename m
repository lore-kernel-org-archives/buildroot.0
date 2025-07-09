Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8980DC83F0A
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 15:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 387F84085F;
	Wed,  9 Jul 2025 15:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d9Dp0xPLHT2b; Wed,  9 Jul 2025 15:17:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 929324086C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 929324086C;
	Wed,  9 Jul 2025 15:17:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D48E715F
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D23F4606D3
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:17:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UbTO7xfPzsqS for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 15:17:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C88126062A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C88126062A
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C88126062A
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:17:32 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 95120580435
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 15:04:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19AB144289;
 Wed,  9 Jul 2025 15:04:23 +0000 (UTC)
Date: Wed, 09 Jul 2025 17:04:14 +0200
MIME-Version: 1.0
Message-Id: <20250709-perf_libtraceevent-v2-1-3ea54fbe6b5b@bootlin.com>
References: <20250709-perf_libtraceevent-v2-0-3ea54fbe6b5b@bootlin.com>
In-Reply-To: <20250709-perf_libtraceevent-v2-0-3ea54fbe6b5b@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Olivier Benjamin <olivier.benjamin@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefjeekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevgefhteffuefhheekkeelffffvdeugffgveejffdtvdffudehtedtieevteetnecukfhppedvrgdtvdemkeegvdekmeehvggsieemuddvtddumegrfhguieemfehfsggsmegrugdtkeemkehfleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemhegvsgeimeduvddtudemrghfugeimeeffhgssgemrggutdekmeekfheliedphhgvlhhopegludelvddrudeikedruddrgeejngdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlu
 ghrohhothdrohhrghdprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomh
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1752073463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ds5KtCzrdNQh6bokUMZb3aI6nXsEt39T3+WVgko8v2w=;
 b=MpoIdahWOR6nGkfox8yk7Z8TG8fCFyfCKxxOY0jBSLXrxSmaqyZWUV1iC5YxC+l5As7hH1
 WqRwRogkoAlxIMEWcUq3eVarmNEMYtRCCAchztqugi6P2PSMWQDKnCrY6J6XVeDYMKHtK8
 Cj8W/v69PqIxlHcDzx4ZgrIbepzocvNNsbYzN3pMhwxWbT4ZFHjBmq66wmhkolTlQnpaKT
 519RXwZTXj+IWOrfpOF19FiWTtdM7tRJ1+SvMBiOPCJDQqHfMmmypgvkoNvreuH3BwxaLs
 62YPn8tmePBmnWha2Yh1/HyEFLK6cKatFFMuTu4LJL05BLscV8ZKNV2Pje4jOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MpoIdahW
Subject: [Buildroot] [PATCH v2 1/2] package/linux-tools: perf: build with
 libtraceevent support when it is selected
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

V2hlbiB0cnlpbmcgdG8gcGVyZm9ybSBhIGN1c3RvbSB1cHJvYmUgcmVjb3JkaW5nIG9uIGEgdGFy
Z2V0IHdpdGggcGVyZgpidWlsdCBieSBidWlsZHJvb3QsIHRoZSByZWNvcmRpbmcgc3RlcCBmYWls
cyBhcyBwZXJmIGNhbiBub3QgcmVjb3JkCnVwcm9iZXMgd2l0aG91dCBsaWJ0cmFjZWV2ZW50IHN1
cHBvcnQ6CgogICQgcGVyZiBwcm9iZSAteCBsaW5rZWRfbGlzdCBpbnNlcnRfbmFtZSBpbmRleAog
IFRhcmdldCBwcm9ncmFtIGlzIGNvbXBpbGVkIHdpdGhvdXQgb3B0aW1pemF0aW9uLiBTa2lwcGlu
ZyBwcm9sb2d1ZS4KICBQcm9iZSBvbiBhZGRyZXNzIDB4ODA4IHRvIGZvcmNlIHByb2JpbmcgYXQg
dGhlIGZ1bmN0aW9uIGVudHJ5LgoKICBBZGRlZCBuZXcgZXZlbnQ6CiAgICBwcm9iZV9saW5rZWRf
bGlzdDppbnNlcnRfbmFtZSAob24gaW5zZXJ0X25hbWUgaW4gL3Jvb3QvZ2RiL2xpbmtlZF9saXN0
IHdpdGggaW5kZXgpCgogIHBlcmYgaXMgbm90IGxpbmtlZCB3aXRoIGxpYnRyYWNlZXZlbnQsIHRv
IHVzZSB0aGUgbmV3IHByb2JlIHlvdSBjYW4gdXNlIHRyYWNlZnM6CgogICAgICAgICAgY2QgL3N5
cy9rZXJuZWwvdHJhY2luZy8KICAgICAgICAgIGVjaG8gMSA+IGV2ZW50cy9wcm9iZV9saW5rZWRf
bGlzdC9pbnNlcnRfbmFtZS9lbmFibGUKICAgICAgICAgIGVjaG8gMSA+IHRyYWNpbmdfb24KICAg
ICAgICAgIGNhdCB0cmFjZV9waXBlCiAgICAgICAgICBCZWZvcmUgcmVtb3ZpbmcgdGhlIHByb2Jl
LCBlY2hvIDAgPiBldmVudHMvcHJvYmVfbGlua2VkX2xpc3QvaW5zZXJ0X25hbWUvZW5hYmxlCiAg
JCBwZXJmIHJlY29yZCAtZSBwcm9iZV9saW5rZWRfbGlzdDppbnNlcnRfbmFtZSAuL2xpbmtlZF9s
aXN0CiAgZXZlbnQgc3ludGF4IGVycm9yOiAncHJvYmVfbGlua2VkX2xpc3Q6aW5zZXJ0X25hbWUn
CiAgICAgICAgICAgICAgICAgICAgICAgXF9fXyB1bnN1cHBvcnRlZCB0cmFjZXBvaW50CgogIGxp
YnRyYWNlZXZlbnQgaXMgbmVjZXNzYXJ5IGZvciB0cmFjZXBvaW50IHN1cHBvcnQKICBSdW4gJ3Bl
cmYgbGlzdCcgZm9yIGEgbGlzdCBvZiB2YWxpZCBldmVudHMKCiAgIFVzYWdlOiBwZXJmIHJlY29y
ZCBbPG9wdGlvbnM+XSBbPGNvbW1hbmQ+XQogICAgICBvcjogcGVyZiByZWNvcmQgWzxvcHRpb25z
Pl0gLS0gPGNvbW1hbmQ+IFs8b3B0aW9ucz5dCgogICAgICAtZSwgLS1ldmVudCA8ZXZlbnQ+ICAg
ZXZlbnQgc2VsZWN0b3IuIHVzZSAncGVyZiBsaXN0JyB0byBsaXN0IGF2YWlsYWJsZSBldmVudHMK
CmxpYnRyYWNlZXZlbnQgc3VwcG9ydCBmb3IgcGVyZiBoYXMgYmVlbiBkaXNhYmxlZCB3aXRoIGNv
bW1pdApiNGFiNDVhNWMxZGIgKCJwYWNrYWdlL2xpbnV4LXRvb2xzOiBkaXNhYmxlIGxpYnRyYWNl
dmVudCBkZXRlY3Rpb24iKQpiZWNhdXNlIHRoZXJlIHdhcyBubyBsaWJ0cmFjZWV2ZW50IHBhY2th
Z2UgaW4gYnVpbGRyb290IHRvIHJlcGxhY2UgdGhlCmZvcm1lciBsaWJ0cmFjZWV2ZW50IHJlbW92
ZWQgZnJvbSB0aGUga2VybmVsIHNvdXJjZXMuIFNpbmNlIHRoZW4sIGNvbW1pdAoxNDc0ZjFiMzRi
MTcgKCJwYWNrYWdlL2xpYnRyYWNlZXZlbnQ6IG5ldyBwYWNrYWdlIikgaGFzIGludHJvZHVjZWQg
YQpsaWJ0cmFjZWV2ZW50IHBhY2thZ2UuIFdlIGNhbiB0aGVuIGV4cG9zZSBhZ2FpbiB0aGUgcG9z
c2liaWxpdHkgdG8gYnVpbGQKcGVyZiB3aXRoIGxpYnRyYWNlZXZlbnQgc3VwcG9ydC4KCk1ha2Ug
YnVpbGRyb290IHBlcmYgbWFrZWZpbGUgZGV0ZWN0IGlmIGxpYnRyYWNlZXZlbnQgcGFja2FnZSBo
YXMgYmVlbgplbmFibGVkLCBhbmQgaWYgc28sIGFsbG93IHRvIGJ1aWxkIHBlcmYgd2l0aCBsaWJ0
cmFjZWV2ZW50IHN1cHBvcnQuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhp
cy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBubyBjaGFuZ2UKLS0t
CiBwYWNrYWdlL2xpbnV4LXRvb2xzL2xpbnV4LXRvb2wtcGVyZi5tay5pbiB8IDcgKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbGludXgtdG9vbHMvbGludXgtdG9vbC1wZXJmLm1rLmluIGIvcGFja2FnZS9s
aW51eC10b29scy9saW51eC10b29sLXBlcmYubWsuaW4KaW5kZXggZDY3MzE4NTcxYWE0ZGVlZmRl
NWIzOGVmZmUxYWRlMGI4N2Y0NjI3Yi4uMWUxOWVlN2YxYzRlNDZkMjEwYzA3OWQ3OTZmOTQ2MWYy
YmZhYWUwOCAxMDA2NDQKLS0tIGEvcGFja2FnZS9saW51eC10b29scy9saW51eC10b29sLXBlcmYu
bWsuaW4KKysrIGIvcGFja2FnZS9saW51eC10b29scy9saW51eC10b29sLXBlcmYubWsuaW4KQEAg
LTI4LDcgKzI4LDYgQEAgUEVSRl9NQUtFX0ZMQUdTID0gXAogCU5PX0xJQlBFUkw9MSBcCiAJTk9f
TElCUFlUSE9OPTEgXAogCU5PX0xJQkJJT05JQz0xIFwKLQlOT19MSUJUUkFDRUVWRU5UPTEgXAog
CU5PX1NIRUxMQ0hFQ0s9MQogCiAjIFdlIG5lZWQgdG8gcGFzcyBhbiBhcmd1bWVudCB0byBsZCBm
b3Igc2V0dGluZyB0aGUgZW11bGF0aW9uIHdoZW4KQEAgLTEyOCw2ICsxMjcsMTIgQEAgUEVSRl9N
QUtFX0ZMQUdTICs9IENPUkVTSUdIVD0xCiAjIGJhcmUgImlmZGVmIENPUkVTSUdIVCIgY29uc3Ry
dWN0cy4KIGVuZGlmCiAKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfTElCVFJBQ0VFVkVOVCkseSkKK1BF
UkZfREVQRU5ERU5DSUVTICs9IGxpYnRyYWNlZXZlbnQKK2Vsc2UKK1BFUkZfTUFLRV9GTEFHUyAr
PSBOT19MSUJUUkFDRUVWRU5UPTEKK2VuZGlmCisKICMgV2UgcmVhbGx5IGRvIG5vdCB3YW50IHRv
IGJ1aWxkIHRoZSBwZXJmIGRvY3VtZW50YXRpb24sIGJlY2F1c2UgaXQKICMgaGFzIHN0cmluZ2Vu
dCByZXF1aXJlbWVudCBvbiB0aGUgZG9jdW1lbnRhdGlvbiBnZW5lcmF0aW9uIHRvb2xzLAogIyBs
aWtlIHhtbHRvIGFuZCBhc2NpaWRvYyksIHdoaWNoIG1heSBiZSBsYWdnaW5nIGJlaGluZCBvbiBz
b21lCgotLSAKMi41MC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
