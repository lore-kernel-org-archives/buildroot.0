Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADADC0218E
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 17:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83C4681095;
	Sun, 26 Jan 2025 17:33:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuYTwcsWnBSJ; Sun, 26 Jan 2025 17:33:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C062810BB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C062810BB;
	Sun, 26 Jan 2025 17:33:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E436AF10
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 17:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D28E9810B0
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 17:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fOfuNv7z4RIN for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 17:33:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.96;
 helo=smtp-outgoing-1601.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4C21A81095
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C21A81095
Received: from smtp-outgoing-1601.laposte.net (smtp-outgoing-1601.laposte.net
 [160.92.124.96])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C21A81095
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 17:33:46 +0000 (UTC)
X-mail-filterd: {"version":"1.8.0","queueID":"4YgzDJ5lr6zdZLm","contextId":
 "85bc3a52-197d-4b1a-b2f8-f6f63835d310"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0106.laposte.net (SMTP Server) with ESMTP id 4YgzDJ5lr6zdZLm;
 Sun, 26 Jan 2025 18:33:36 +0100 (CET)
X-mail-filterd: {"version":"1.8.0","queueID":"4YgzDJ54fnzdZLj","contextId":
 "e0b9a1c5-0270-4d45-be8c-ca8ac289bddf"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mlpnf0106.laposte.net (SMTP Server) with ESMTPSA id 4YgzDJ54fnzdZLj;
 Sun, 26 Jan 2025 18:33:36 +0100 (CET)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
 by romuald.bergerie (Postfix) with ESMTP id 2F46E6378E08;
 Sun, 26 Jan 2025 18:33:55 +0100 (CET)
Received: from vincent by radicelle with local (Exim 4.98)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1tc6WL-000000006Jj-1aYO; Sun, 26 Jan 2025 18:34:05 +0100
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>, Julien Olivain <ju.o@free.fr>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Sun, 26 Jan 2025 18:34:00 +0100
Message-ID: <20250126173402.24273-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1737912824;
 bh=fKA1M1HTgasU0GnAv0AQlJ4+CFMjXGkK6cVv+bK5LGM=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=hYBD3h4Y/0+L5C6MfX2LWA+Id7y5BJ01t5P90HoLRC/2NbQVcHbzasONfGZW+PtaOzh12Nrq+7x0lrORlc2JCygVT68TXGkw9AMKe/vC9UJc+Hz0+usqYfHI18zkcsKwRjbvflA79OPqePXOdRHm+01a4VRyZU/hjLA/sUF+EOmLzXEaLdIT0uEDEiS0tp3ZhvK4g8vhQ3LBoCXlY1rLwJzAG7QytRARefhnNae3EQ6W+EF37qWdWDQcomC0mGqNcG5yThdBN1pSlo5Eu96NmyyxfkStYLDiRJisGw8QveLjfg1XiWuzB+cMj4wwzVx1b6smbErxO/QQb4FpedWl1g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=hYBD3h4Y
Subject: [Buildroot] [PATCH v2 0/2] xen tools and test_xen changes
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

VGhpcyBwYXRjaCBzZXJpZXMgYWltcyBhdCB1c2luZyB0aGUgWGVuIHRvb2xzIGluIHRoZSBYZW4g
dW5pdCB0ZXN0LgoKV2l0aCBjdXJyZW50IHRlc3QncyBzZXR1cCB0aGUgWGVuIHRvb2xzIGFyZSBu
b3QgZnVuY3Rpb25hbC4gV2UgbmVlZCB0d28KY2hhbmdlcyB0byByZXBhaXIgdGhlIHRvb2xzOgoK
MS4gQnVpbGQgYmFzaCB0byByZXBhaXIgWGVuIHN0YXJ0dXAgc2NyaXB0cy4KMi4gQWRkIGJhY2sg
bmV0d29ya2luZyB0byB0aGUgdGVzdCdzIHN0cmlwcGVkLWRvd24ga2VybmVsIGNvbmZpZy4KCkFz
IHBlciBKdWxpZW4ncyBmZWVkYmFja3MgWzFdIHdlIHNob3VsZCByYXRoZXIgc2VsZWN0IGJhc2gg
aW4gdGhlIHhlbgpwYWNrYWdlIHdoZW4gYnVpbGRpbmcgdGhlIFhlbiB0b29scy4gVGhpcyBpcyBk
b25lIGluIHRoZSBmaXJzdCBwYXRjaC4KClRoZSBzZWNvbmQgcGF0Y2ggY29udGFpbnMgdGhlIHRl
c3QncyBjaGFuZ2VzLCBpbmNsdWRpbmcgdGhlIGtlcm5lbApjb25maWcgY2hhbmdlcy4KCkJlc3Qg
cmVnYXJkcywKVmluY2VudC4KClsxXSBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJt
YWlsL2J1aWxkcm9vdC8yMDI1LUphbnVhcnkvNzcxMjAxLmh0bWwKClZpbmNlbnQgU3RlaGzDqSAo
Mik6CiAgcGFja2FnZS94ZW46IHhlbiB0b29scyBuZWVkcyBiYXNoIGF0IHJ1bnRpbWUKICBzdXBw
b3J0L3Rlc3Rpbmc6IHRlc3RfeGVuOiByZXBhaXIgYW5kIGxldmVyYWdlIHhlbiB0b29scwoKIHBh
Y2thZ2UveGVuL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsKIHN1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfeGVuLnB5ICAgICB8IDY0ICsrKysrKysrKysr
KysrKysrLS0KIC4uLi90ZXN0cy9wYWNrYWdlL3Rlc3RfeGVuL2dlbmltYWdlLmNmZyAgICAgICB8
ICA4ICstLQogLi4uL3Rlc3RzL3BhY2thZ2UvdGVzdF94ZW4vbGludXguY29uZmlnICAgICAgIHwg
IDMgKwogLi4uL3Rlc3RfeGVuL292ZXJsYXkvZXRjL2luaXQuZC9TOTljdXN0b20gICAgIHwgNDMg
KysrKysrKysrKysrKwogLi4uL3BhY2thZ2UvdGVzdF94ZW4vb3ZlcmxheS9ldGMveGVuL2RvbTEu
Y2ZnIHwgIDUgKysKIC4uLi90ZXN0cy9wYWNrYWdlL3Rlc3RfeGVuL3Bvc3QtYnVpbGQuc2ggICAg
ICB8ICA3ICsrCiAuLi4vdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfeGVuL3hlbi5jZmcgICAg
fCAgNSArLQogOCBmaWxlcyBjaGFuZ2VkLCAxMjIgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25z
KC0pCiBjcmVhdGUgbW9kZSAxMDA3NTUgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVz
dF94ZW4vb3ZlcmxheS9ldGMvaW5pdC5kL1M5OWN1c3RvbQogY3JlYXRlIG1vZGUgMTAwNjQ0IHN1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfeGVuL292ZXJsYXkvZXRjL3hlbi9kb20x
LmNmZwogY3JlYXRlIG1vZGUgMTAwNzU1IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfeGVuL3Bvc3QtYnVpbGQuc2gKCi0tIAoyLjQ1LjIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
