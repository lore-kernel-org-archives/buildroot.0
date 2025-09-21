Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60468CAC59A
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 14:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 158BE60AB7;
	Sun, 21 Sep 2025 14:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXRbWdAxWqvo; Sun, 21 Sep 2025 14:53:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CBA260A73
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CBA260A73;
	Sun, 21 Sep 2025 14:53:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F000FBF
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 14:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45899400E0
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 14:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUvUNFQ_LJFX for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 14:53:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.97;
 helo=smtp-outgoing-1602.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3F81740071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F81740071
Received: from smtp-outgoing-1602.laposte.net (smtp-outgoing-1602.laposte.net
 [160.92.124.97])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F81740071
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 14:53:48 +0000 (UTC)
X-mail-filterd: {"version":"1.9.4","queueID":"4cV5lP5xbCzdZLZ","contextId":
 "196d88b9-4472-4951-9a95-110772e73024"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0106.laposte.net (SMTP Server) with ESMTP id 4cV5lP5xbCzdZLZ;
 Sun, 21 Sep 2025 14:53:37 +0200 (CEST)
X-mail-filterd: {"version":"1.9.4","queueID":"4cV5lP5497zdZLM","contextId":
 "b8d65b2f-db7c-4004-bce1-99a4e337075e"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mlpnf0106.laposte.net (SMTP Server) with ESMTPSA id 4cV5lP5497zdZLM;
 Sun, 21 Sep 2025 14:53:37 +0200 (CEST)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
 by romuald.bergerie (Postfix) with ESMTP id ED4786A1890E;
 Sun, 21 Sep 2025 14:53:42 +0200 (CEST)
Received: from vincent by radicelle with local (Exim 4.98.2)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1v0Jaa-000000002U3-1TPD; Sun, 21 Sep 2025 14:54:48 +0200
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 21 Sep 2025 14:54:20 +0200
Message-ID: <20250921125422.7944-5-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921125422.7944-1-vincent.stehle@laposte.net>
References: <20250921125422.7944-1-vincent.stehle@laposte.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1758466426;
 bh=x2+Wbzur9dcvRXsXy8D8QuyGU2KhlcPM/3ThednK9Lw=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=CT31dyyLHL7gWwjvUe+fnwqk7nm+35/ma4LCZ4JI1vB6DZmKSXCV7dm4Fq7IaqiDXp9bXROdB+68bhV59fJKzCVVlftMmJBZE4ABH52wQm/oO5CPSQC8hb8hh+6WiCODsMwC9se1XkhcHw9BKzY8csiaq3qJshz6c/Km6GgOYV4/mnQOGzkXI8aUwUTMrKWTcG/pkvK5RKhyFUMZYMBOg8Tp41lcXaIerKTmhsKAmqvd5Wby0D4G+aBzBuo2hh1pLmMN+QnhghcYkl23OUxZyDBKzlDsoXi3rFEOa0CBvX6WZ5hB+biGqYQ1+vWIchALld2TNZfWxJN5p7Uhwix8Fw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=CT31dyyL
Subject: [Buildroot] [PATCH 4/6 v2] configs/qemu_hppa_b160l: new defconfig
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGEgZGVmY29uZmlnIHRvIHJ1biBMaW51eCBvbiBhIEhQIFZpc3VhbGl6ZSBCMTYwTCBQQS1S
SVNDCldvcmtzdGF0aW9uLCBlbXVsYXRlZCB3aXRoIFFlbXUuCgpXaGlsZSBhdCBpdCwgYWRkIHRo
aXMgZGVmY29uZmlnIHRvIG15c2VsZiBpbiBERVZFTE9QRVJTLgoKU2lnbmVkLW9mZi1ieTogVmlu
Y2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBsYXBvc3RlLm5ldD4KQ2M6IFJvbWFpbiBOYW91
ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KLS0tCgpDaGFuZ2VzIHYxIC0+IHYyOgogIC0gQWRk
IGEgbGluayB0byBPcGVuUEEgaW4gdGhlIFJFQURNRQogIC0gRm9sbG93IExpbnV4IHZlcnNpb24g
b2YgYWxsIFFlbXUgZGVmY29uZmlncywgd2hpY2ggaGFzIGJlZW4gYnVtcGVkCiAgICBzaW5jZQoK
IERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsrCiBib2FyZC9xZW11L2hw
cGEtYjE2MGwvcmVhZG1lLnR4dCAgfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiBjb25maWdzL3FlbXVfaHBwYV9iMTYwbF9kZWZjb25maWcgfCAxOCArKysrKysrKysrKysrKysr
KwogMyBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
Ym9hcmQvcWVtdS9ocHBhLWIxNjBsL3JlYWRtZS50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25m
aWdzL3FlbXVfaHBwYV9iMTYwbF9kZWZjb25maWcKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIv
REVWRUxPUEVSUwppbmRleCBmNDY0ODcxZGE0Li4wZDhhMjUzMDhhIDEwMDY0NAotLS0gYS9ERVZF
TE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTMzNjQsOCArMzM2NCwxMCBAQCBGOglhcmNoL0Nv
bmZpZy5pbi5ocHBhCiBGOglhcmNoL2FyY2gubWsuaHBwYQogRjoJYm9hcmQvYXJtL2ZvdW5kYXRp
b24tdjgvCiBGOglib2FyZC9iYW5hbmFwaS9iYW5hbmFwaS1tMi16ZXJvLworRjoJYm9hcmQvcWVt
dS9ocHBhLWIxNjBsLwogRjoJY29uZmlncy9hcm1fZm91bmRhdGlvbnY4X2RlZmNvbmZpZwogRjoJ
Y29uZmlncy9iYW5hbmFwaV9tMl96ZXJvX2RlZmNvbmZpZworRjoJY29uZmlncy9xZW11X2hwcGFf
YjE2MGxfZGVmY29uZmlnCiBGOgljb25maWdzL3Vldm01NDMyX2RlZmNvbmZpZwogRjoJcGFja2Fn
ZS9pN3ovCiBGOglwYWNrYWdlL21zci10b29scy8KZGlmZiAtLWdpdCBhL2JvYXJkL3FlbXUvaHBw
YS1iMTYwbC9yZWFkbWUudHh0IGIvYm9hcmQvcWVtdS9ocHBhLWIxNjBsL3JlYWRtZS50eHQKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMDUyY2E5Yjg0OAotLS0gL2Rldi9u
dWxsCisrKyBiL2JvYXJkL3FlbXUvaHBwYS1iMTYwbC9yZWFkbWUudHh0CkBAIC0wLDAgKzEsMzMg
QEAKK0ludHJvZHVjdGlvbgorPT09PT09PT09PT09CisKK1RoZSBxZW11X2hwcGFfYjE2MGxfZGVm
Y29uZmlnIGlzIG1lYW50IHRvIHJ1biBMaW51eCBvbiBhIEhQIFZpc3VhbGl6ZSBCMTYwTAorUEEt
UklTQyBXb3Jrc3RhdGlvblsxXSwgZW11bGF0ZWQgd2l0aCBRZW11LgorCitCdWlsZGluZworPT09
PT09PT0KKworICAkIG1ha2UgcWVtdV9ocHBhX2IxNjBsX2RlZmNvbmZpZworICAkIG1ha2UKKwor
R2VuZXJhdGVkIGZpbGVzIHVuZGVyIG91dHB1dC9pbWFnZXM6CisKKyogcm9vdGZzLmV4dDQ6IHRo
ZSByb290IGZpbGVzeXN0ZW0uCisqIHZtbGludXg6IHRoZSBMaW51eCBrZXJuZWwuCisKK1J1bm5p
bmcgdW5kZXIgUWVtdQorPT09PT09PT09PT09PT09PT09CisKK1J1biB0aGUgZW11bGF0aW9uIHdp
dGg6CisKKyAgcWVtdS1zeXN0ZW0taHBwYSBcCisgICAgICAtbWFjaGluZSBCMTYwTCBcCisgICAg
ICAtYXBwZW5kICJyb290d2FpdCByb290PS9kZXYvc2RhIiBcCisgICAgICAtaGRhIG91dHB1dC9p
bWFnZXMvcm9vdGZzLmV4dDQgXAorICAgICAgLWtlcm5lbCBvdXRwdXQvaW1hZ2VzL3ZtbGludXgg
XAorICAgICAgLW5vZ3JhcGhpYyBcCisgICAgICAtc21wIDIgIyBxZW11X2hwcGFfYjE2MGxfZGVm
Y29uZmlnCisKK1RoZSBsb2dpbiBwcm9tcHQgd2lsbCBhcHBlYXIgaW4gdGhlIHRlcm1pbmFsIHRo
YXQgc3RhcnRlZCBRZW11LgorCitbMV0gaHR0cHM6Ly93d3cub3BlbnBhLm5ldC9zeXN0ZW1zL2hw
LXZpc3VhbGl6ZV9iMTMybF9iMTYwbF9iMTgwbC5odG1sCmRpZmYgLS1naXQgYS9jb25maWdzL3Fl
bXVfaHBwYV9iMTYwbF9kZWZjb25maWcgYi9jb25maWdzL3FlbXVfaHBwYV9iMTYwbF9kZWZjb25m
aWcKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMjIyYjE0MTFmNgotLS0g
L2Rldi9udWxsCisrKyBiL2NvbmZpZ3MvcWVtdV9ocHBhX2IxNjBsX2RlZmNvbmZpZwpAQCAtMCww
ICsxLDE4IEBACitCUjJfaHBwYT15CitCUjJfcGFyaXNjMTE9eQorQlIyX1BBQ0tBR0VfSE9TVF9M
SU5VWF9IRUFERVJTX0NVU1RPTV82XzEyPXkKK0JSMl9HTE9CQUxfUEFUQ0hfRElSPSJib2FyZC9x
ZW11L3BhdGNoZXMiCitCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTPXkKK0JSMl9TWVNU
RU1fREhDUD0iZXRoMCIKK0JSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9ImJvYXJkL3FlbXUv
cG9zdC1pbWFnZS5zaCIKK0JSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iJChCUjJfREVGQ09O
RklHKSIKK0JSMl9MSU5VWF9LRVJORUw9eQorQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lP
Tj15CitCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjEyLjQ3IgorQlIy
X0xJTlVYX0tFUk5FTF9VU0VfQVJDSF9ERUZBVUxUX0NPTkZJRz15CitCUjJfTElOVVhfS0VSTkVM
X05FRURTX0hPU1RfT1BFTlNTTD15CitCUjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKK0JSMl9UQVJH
RVRfUk9PVEZTX0VYVDJfND15CisjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0CitC
UjJfUEFDS0FHRV9IT1NUX1FFTVU9eQorQlIyX1BBQ0tBR0VfSE9TVF9RRU1VX1NZU1RFTV9NT0RF
PXkKLS0gCjIuNTEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
