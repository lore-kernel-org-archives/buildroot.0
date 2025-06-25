Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E975C7EE2A
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 21:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C4E56165F;
	Wed, 25 Jun 2025 21:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OiDbkQuGhxLT; Wed, 25 Jun 2025 21:21:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BF4361657
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BF4361657;
	Wed, 25 Jun 2025 21:21:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FE8043F
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 21:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 718CD84EF0
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 21:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RtBvA6hRAGFU for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 21:21:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0829384EEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0829384EEB
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0829384EEB
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 21:21:18 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id B4E20583736
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 20:54:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17B2444A51;
 Wed, 25 Jun 2025 20:54:13 +0000 (UTC)
Date: Wed, 25 Jun 2025 22:54:01 +0200
MIME-Version: 1.0
Message-Id: <20250625-perf_libtraceevent-v1-1-0bf7620bc6c9@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOhhXGgC/x3MSQqAMBAF0atIrw3E4HwVEXH40QaJ0gkiiHc3u
 HyLqoc8hOGpTR4SXOz5cBFZmtC8jW6F4iWajDaFLk2hTogddp6CjDNwwQWVVchLwNS20RTDU2D
 5/qdd/74f04T7XWQAAAA=
X-Change-ID: 20250625-perf_libtraceevent-17e46ee28f90
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Olivier Benjamin <olivier.benjamin@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfeejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptedukedvffeiheeuuefgudejgfdtvdegkedvtdeiffffleevtdegffejkeejlefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopegludelvddrudeikedruddrudeljegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpr
 hgtphhtthhopehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhm
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1750884854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5Yj8xLv0qy6B9wUJVcNFPVL2T8hEPpJOWakj55gs3gc=;
 b=FjOnhGi6MSTb0tD9ePIL6PSPi5Z73gJozAJUQXVV35kPS9L/zxDxs70rbpNqaFGtErRGKh
 koyIdUynE3bIMVkfLY9lFVNYhNudwsskBtO1sV/hY2dKrdDNb2ui3trWdvVns0ct3giWSH
 al/iNz0uYaSzTEhrF6vc1uMykhpuk++O6UBA90D5aJ/7dRLHQ39rqyCIK/2bC9fRbS2pVH
 NglEZPov4Wnv1PxtcgQ6ZkgqLBXGgynb9GZxdKcGYILzEsbSCXSZo9p5Xdm+2JqjKYGLSB
 2V8ys/oRUNS+j4GpRqeBmxVyU4lSgxP0XKwS/8vHxQiBsh5cdGR9oQKsV2zDtw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FjOnhGi6
Subject: [Buildroot] [PATCH] package/linux-tools: perf: build with
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
cy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0KVG86IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCkNj
OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgpDYzogTHVj
YSBDZXJlc29saSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4KQ2M6IE9saXZpZXIgQmVuamFt
aW4gPG9saXZpZXIuYmVuamFtaW5AYm9vdGxpbi5jb20+Ci0tLQpJdCBpcyB3b3J0aCBub3Rpbmcg
dGhhdCB0aGVyZSBpcyBhIGJ1ZyBpbiBwZXJmIG1ha2VmaWxlIGtlcm5lbCB0aGF0CmFmZmVjdHMg
bWFueSBrZXJuZWwgdmVyc2lvbnMgKHVwIHRvIDYuMTApIGFuZCB0aGF0IHByZXZlbnRzIHBlcmYg
ZnJvbQpidWlsZGluZyBjb3JyZWN0bHkgd2hlbiBlbmFibGluZyBsaWJ0cmFjZWV2ZW50IHN1cHBv
cnQgKHNlZSA0NDBjZjc3NjI1ZTMKKCJwZXJmOiBidWlsZDogU2V0dXAgUEtHX0NPTkZJR19MSUJE
SVIgZm9yIGNyb3NzIGNvbXBpbGF0aW9uIikgaW4KbGludXgpLiBTaG91bGQgdGhlIGxpYnRyYWNl
ZXZlbnQgdGhlbiBiZSBleHBsaWNpdGVseSBlbmFibGVkIGJ5IHRoZQp1c2VyLCByYXRoZXIgdGhh
biBhdXRvbWF0aWNhbGx5IGVuYWJsaW5nIGl0IHdoZW4gbGlidHJhY2VldmVudCBwYWNrYWdlCmlz
IHNlbGVjdGVkID8KLS0tCiBwYWNrYWdlL2xpbnV4LXRvb2xzL2xpbnV4LXRvb2wtcGVyZi5tay5p
biB8IDcgKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGludXgtdG9vbHMvbGludXgtdG9vbC1wZXJmLm1r
LmluIGIvcGFja2FnZS9saW51eC10b29scy9saW51eC10b29sLXBlcmYubWsuaW4KaW5kZXggZDY3
MzE4NTcxYWE0ZGVlZmRlNWIzOGVmZmUxYWRlMGI4N2Y0NjI3Yi4uMWUxOWVlN2YxYzRlNDZkMjEw
YzA3OWQ3OTZmOTQ2MWYyYmZhYWUwOCAxMDA2NDQKLS0tIGEvcGFja2FnZS9saW51eC10b29scy9s
aW51eC10b29sLXBlcmYubWsuaW4KKysrIGIvcGFja2FnZS9saW51eC10b29scy9saW51eC10b29s
LXBlcmYubWsuaW4KQEAgLTI4LDcgKzI4LDYgQEAgUEVSRl9NQUtFX0ZMQUdTID0gXAogCU5PX0xJ
QlBFUkw9MSBcCiAJTk9fTElCUFlUSE9OPTEgXAogCU5PX0xJQkJJT05JQz0xIFwKLQlOT19MSUJU
UkFDRUVWRU5UPTEgXAogCU5PX1NIRUxMQ0hFQ0s9MQogCiAjIFdlIG5lZWQgdG8gcGFzcyBhbiBh
cmd1bWVudCB0byBsZCBmb3Igc2V0dGluZyB0aGUgZW11bGF0aW9uIHdoZW4KQEAgLTEyOCw2ICsx
MjcsMTIgQEAgUEVSRl9NQUtFX0ZMQUdTICs9IENPUkVTSUdIVD0xCiAjIGJhcmUgImlmZGVmIENP
UkVTSUdIVCIgY29uc3RydWN0cy4KIGVuZGlmCiAKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfTElCVFJB
Q0VFVkVOVCkseSkKK1BFUkZfREVQRU5ERU5DSUVTICs9IGxpYnRyYWNlZXZlbnQKK2Vsc2UKK1BF
UkZfTUFLRV9GTEFHUyArPSBOT19MSUJUUkFDRUVWRU5UPTEKK2VuZGlmCisKICMgV2UgcmVhbGx5
IGRvIG5vdCB3YW50IHRvIGJ1aWxkIHRoZSBwZXJmIGRvY3VtZW50YXRpb24sIGJlY2F1c2UgaXQK
ICMgaGFzIHN0cmluZ2VudCByZXF1aXJlbWVudCBvbiB0aGUgZG9jdW1lbnRhdGlvbiBnZW5lcmF0
aW9uIHRvb2xzLAogIyBsaWtlIHhtbHRvIGFuZCBhc2NpaWRvYyksIHdoaWNoIG1heSBiZSBsYWdn
aW5nIGJlaGluZCBvbiBzb21lCgotLS0KYmFzZS1jb21taXQ6IGYyOGYzNGUyMDBiYmFkZjBhZWEz
MjExMGM3MmY3MTk5ZTY1ZmIwYjkKY2hhbmdlLWlkOiAyMDI1MDYyNS1wZXJmX2xpYnRyYWNlZXZl
bnQtMTdlNDZlZTI4ZjkwCgpCZXN0IHJlZ2FyZHMsCi0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3Rs
aW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4u
Y29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
