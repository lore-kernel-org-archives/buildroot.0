Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261EFCAC59A
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 14:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7FB9840B4;
	Sun, 21 Sep 2025 14:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z91ZIlATQ3ak; Sun, 21 Sep 2025 14:53:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A78C883FC6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A78C883FC6;
	Sun, 21 Sep 2025 14:53:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FB57E7
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 14:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 418514091D
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 14:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FexXf_WgN6nh for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 14:53:50 +0000 (UTC)
X-Greylist: delayed 7223 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 21 Sep 2025 14:53:48 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3F99D408DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F99D408DE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.107;
 helo=smtp-outgoing-1903.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
Received: from smtp-outgoing-1903.laposte.net (smtp-outgoing-1903.laposte.net
 [160.92.124.107])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F99D408DE
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 14:53:48 +0000 (UTC)
X-mail-filterd: {"version":"1.9.4","queueID":"4cV5l56hZSzdZLg","contextId":
 "9d47d9ae-88bf-466f-ae08-7c023b52b1c7"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0106.laposte.net (SMTP Server) with ESMTP id 4cV5l56hZSzdZLg;
 Sun, 21 Sep 2025 14:53:21 +0200 (CEST)
X-mail-filterd: {"version":"1.9.4","queueID":"4cV5l55nhTzdZLZ","contextId":
 "43e5532b-b630-4448-b1db-8e4476858d84"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mlpnf0106.laposte.net (SMTP Server) with ESMTPSA id 4cV5l55nhTzdZLZ;
 Sun, 21 Sep 2025 14:53:21 +0200 (CEST)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
 by romuald.bergerie (Postfix) with ESMTP id E9C6D6A1890A;
 Sun, 21 Sep 2025 14:53:26 +0200 (CEST)
Received: from vincent by radicelle with local (Exim 4.98.2)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1v0JaK-000000002H4-13dX; Sun, 21 Sep 2025 14:54:32 +0200
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 21 Sep 2025 14:54:16 +0200
Message-ID: <20250921125422.7944-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1758466426;
 bh=OfCPn8ul9PZpVU4SAfBKjS9tu+aZj/w1f66MAlef53o=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=fBpKdXHYAShr6RNEtzUw03fhdSdX5e9xjhli+4C/GuhT+HMPWZB2yZRsMq0P+ZNTCUXLddKh4o4zyQzfrNqguJNQJt4p8Zc465Oe7jqUBzhCEaRu+ZaxP7zUaAjCyHgQlsmR7egNUGD8csUUi+bjHNmo7D8hXeW8L/a+aO5i13Ry3EKwPsAbD/0LSyISBVcKl5Clu0ABEFQz9/u/IUB/e011Fj0De2zRqfOT+o2wTM8feFKZPA8da/n3xmpeK1ydBdp3TniRaMxQ2rqsSsThRNY8H1GSKDwkt/fb79KLoEugmx2b1Q83vdrTTJ23KG6wl64ZEaoPjSHAIThZRUP7WQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=fBpKdXHY
Subject: [Buildroot] [PATCH 0/6 v2] Add support for HPPA (PA-RISC)
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

SGVsbG8sCgpUaGFuayB5b3UgdG8gYWxsIHRob3NlIHdobyBoYXZlIHJldmlld2VkIG9yIHRlc3Rl
ZCB2MSBvZiB0aGlzIHNlcmllcyBhbmQKaGF2ZSBzZW50IGZlZWRiYWNrLgoKVGhpcyBpcyBsb25n
LWR1ZSB2MiBvZiB0aGUgcGF0Y2ggc2VyaWVzIHRvIGFkZCBtaW5pbWFsIHN1cHBvcnQgZm9yIGEK
Im5ldyIgYXJjaGl0ZWN0dXJlOiBIUC9QQSAoYS5rLmEuIFBBLVJJU0MpOyBvbmUgb2YgdGhlIFJJ
U0MKYXJjaGl0ZWN0dXJlcyBvZiB0aGUgbGF0ZSA4MGllcy4KClRoaXMgYXJjaGl0ZWN0dXJlIGlz
IHN0aWxsIHdlbGwgc3VwcG9ydGVkIGJ5IGdjYywgTGludXggYW5kIHNvbWUgb3RoZXIKZGlzdHJv
czsgdGhlcmVmb3JlIGl0IHNob3VsZCBub3QgYmUgdG9vIG11Y2ggb2YgYSBidXJkZW4gdG8gc3Vw
cG9ydCBpbgpCdWlsZHJvb3QuCgpXaXRoIHRob3NlIHBhdGNoZXMgd2UgaGF2ZSBlbm91Z2ggdG8g
YnVpbGQgYW5kIHJ1biBhIExpbnV4IGtlcm5lbCB3aXRoCmJ1c3lib3ggb24gUWVtdSwgd2hpY2gg
bWFrZXMgaXQgZWFzaWx5IHRlc3RhYmxlLiAKClNpbmNlIHYxLCBJIGhhdmUgYWRkZWQgc3VwcG9y
dCBmb3IgcnVubmluZyBvbiBhY3R1YWwgaGFyZHdhcmUgYW5kIHRoaXMKaGFzIGJlZW4gdGVzdGVk
IHN1Y2Nlc3NmdWxseSBvbiBIUCA5MDAwIDcxMiBhbmQgSFAgVmlzdWFsaXplIEoyMTBYQywKYm9v
dGluZyBmcm9tIEhERCBhbmQgZnJvbSB0aGUgbmV0d29yay4KClJ1bm5pbmcgb24gYWN0dWFsIGhh
cmR3YXJlIG5lY2Vzc2l0YXRlcyBhIG5ldyBib290IHBhY2thZ2U6IHBhbG8sIHRoZQpQQS1SSVND
IExpbnV4IGxvYWRlci4KCk90aGVyIGNoYW5nZXMgc2luY2UgdjEsIGluY2x1ZGluZyBhbGwgdGhl
IGNvcnJlY3Rpb25zIGFmdGVyIHRoZQpmZWVkYmFja3MgYXJlIGRvY3VtZW50ZWQgaW4gZWFjaCBw
YXRjaC4KClRoYW5rIHlvdSBmb3IgYW55IGZlZWRiYWNrIQoKQmVzdCByZWdhcmRzLApWaW5jZW50
LgoKTGluazogaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWlsZHJvb3Qv
MjAyNS1NYXkvNzgwMDI1Lmh0bWwKClZpbmNlbnQgU3RlaGzDqSAoNik6CiAgaHBwYTogQWRkIG5l
dyBhcmNoaXRlY3R1cmUKICBwYWNrYWdlL2dsaWJjOiBlbmFibGUgaHBwYSBzdXBwb3J0CiAgcGFj
a2FnZS9xZW11OiBlbmFibGUgaG9zdC1xZW11IGhwcGEgc3VwcG9ydAogIGNvbmZpZ3MvcWVtdV9o
cHBhX2IxNjBsOiBuZXcgZGVmY29uZmlnCiAgYm9vdC9wYWxvOiBuZXcgYm9vdCBwYWNrYWdlCiAg
Y29uZmlncy9ocF85MDAwOiBuZXcgZGVmY29uZmlnCgogREVWRUxPUEVSUyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDcgKysrCiBhcmNoL0NvbmZpZy5pbiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAxMiArKysrCiBhcmNoL0NvbmZpZy5pbi5ocHBhICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAyMiArKysrKysrCiBhcmNoL2FyY2gubWsuaHBwYSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAxMyArKysrKwogYm9hcmQvaHAvOTAwMC9nZW5pbWFn
ZS5jZmcuaW4gICAgICAgICAgICAgICAgIHwgMTYgKysrKysrCiBib2FyZC9ocC85MDAwL3BhbG8u
c2guaW4gICAgICAgICAgICAgICAgICAgICAgfCAyMSArKysrKysrCiAuLi4vcGF0Y2hlcy9saW51
eC1oZWFkZXJzL2xpbnV4LWhlYWRlcnMuaGFzaCAgfCAgMSArCiBib2FyZC9ocC85MDAwL3BhdGNo
ZXMvbGludXgvbGludXguaGFzaCAgICAgICAgfCAgMiArCiBib2FyZC9ocC85MDAwL3Bvc3QtaW1h
Z2Uuc2ggICAgICAgICAgICAgICAgICAgfCAxNiArKysrKysKIGJvYXJkL2hwLzkwMDAvcmVhZG1l
LnR4dCAgICAgICAgICAgICAgICAgICAgICB8IDU3ICsrKysrKysrKysrKysrKysrKysKIGJvYXJk
L3FlbXUvaHBwYS1iMTYwbC9yZWFkbWUudHh0ICAgICAgICAgICAgICB8IDMzICsrKysrKysrKysr
CiBib290L0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBi
b290L3BhbG8vQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMyArKysrKwog
Ym9vdC9wYWxvL3BhbG8uaGFzaCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKwogYm9v
dC9wYWxvL3BhbG8ubWsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjUgKysrKysrKysK
IGNvbmZpZ3MvaHBfOTAwMF9kZWZjb25maWcgICAgICAgICAgICAgICAgICAgICB8IDIwICsrKysr
KysKIGNvbmZpZ3MvcWVtdV9ocHBhX2IxNjBsX2RlZmNvbmZpZyAgICAgICAgICAgICB8IDE4ICsr
KysrKwogcGFja2FnZS9nbGliYy9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgIHwgIDEg
KwogcGFja2FnZS9xZW11L0NvbmZpZy5pbi5ob3N0ICAgICAgICAgICAgICAgICAgIHwgIDEgKwog
cGFja2FnZS9xZW11L3FlbXUubWsgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogMjAg
ZmlsZXMgY2hhbmdlZCwgMjgzIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L0NvbmZpZy5pbi5ocHBhCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcmNoLm1rLmhwcGEKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9ocC85MDAwL2dlbmltYWdlLmNmZy5pbgogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGJvYXJkL2hwLzkwMDAvcGFsby5zaC5pbgogY3JlYXRlIG1vZGUgMTIwMDAwIGJv
YXJkL2hwLzkwMDAvcGF0Y2hlcy9saW51eC1oZWFkZXJzL2xpbnV4LWhlYWRlcnMuaGFzaAogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGJvYXJkL2hwLzkwMDAvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoCiBj
cmVhdGUgbW9kZSAxMDA3NTUgYm9hcmQvaHAvOTAwMC9wb3N0LWltYWdlLnNoCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgYm9hcmQvaHAvOTAwMC9yZWFkbWUudHh0CiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9h
cmQvcWVtdS9ocHBhLWIxNjBsL3JlYWRtZS50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L3Bh
bG8vQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9vdC9wYWxvL3BhbG8uaGFzaAogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGJvb3QvcGFsby9wYWxvLm1rCiBjcmVhdGUgbW9kZSAxMDA2NDQgY29u
Zmlncy9ocF85MDAwX2RlZmNvbmZpZwogY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmZpZ3MvcWVtdV9o
cHBhX2IxNjBsX2RlZmNvbmZpZwoKLS0gCjIuNTEuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
