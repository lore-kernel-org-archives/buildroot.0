Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5D4C61DC2
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 13:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35FEB6079B;
	Thu, 27 Aug 2026 13:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8B27lYqc3CV; Thu, 27 Aug 2026 13:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787835624;
	bh=9yTm6XC0kkfwifDqTp4L2uMAhlJy06jMWpRtjoaYRZE=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=tBNrl4qRPNY2hWxszYbUAn8guoQ8y5Dcn26p030KPlK1/Kj7KnnJc8ICxB++sHOon
	 zqqLniKE9LcmAFZ9KM+r7Jo7RW8kswUoNFy6exwax00S11FhHy/B8hkLGWeiiqIRxS
	 X7o4mRUZPKEydVNaHFQXSFlm/CwOA4V6UHSzn8VssxxKY4FHrhWv4glVyrG8pssuw2
	 xtu9j+NuHyTHewak+VkQLC8+mrPD6awzMBWczTODH4w7NMNoPkUNJ7guqPE3Oep1o9
	 +FXaaKaPMx+G/0qh5cD9yUqfKcb/kWnUDytUsDk7wgybGQHqtAGbBoVORYk/64osbm
	 gHckSA1WqXljQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6215C606CC;
	Thu, 27 Aug 2026 13:00:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C50212FD
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 13:00:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6296F606CC
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 13:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UcqMY5qFvEHb for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 13:00:21 +0000 (UTC)
X-Greylist: delayed 599 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 27 Aug 2026 13:00:21 UTC
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:918:ff23:197:30::1; helo=mail.hostpark.net;
 envelope-from=christian@klarinett.li; receiver=<UNKNOWN> 
Received: from mail.hostpark.net (mail.hostpark.net
 [IPv6:2001:918:ff23:197:30::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74D0E60643
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 13:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id EECEC1006E8;
 Thu, 27 Aug 2026 14:44:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.hostpark.net EECEC1006E8
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail1.hostpark.net [127.0.0.1]) (amavis, port 10124) with ESMTP
 id RC_mWVhg8nlT; Thu, 27 Aug 2026 14:44:14 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id 8680D100694;
 Thu, 27 Aug 2026 14:44:14 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Christian Hitz <christian.hitz@bbv.ch>
Date: Thu, 27 Aug 2026 14:43:45 +0200
Message-ID: <20260827124346.582739-1-christian@klarinett.li>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pkg-cmake: observe jobserver with
 top-level parallel build
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
From: Christian Hitz via buildroot <buildroot@buildroot.org>
Reply-To: Christian Hitz <christian@klarinett.li>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogQ2hyaXN0aWFuIEhpdHogPGNocmlzdGlhbi5oaXR6QGJidi5jaD4KCldoZW4gdXNpbmcg
YSB0b3AtbGV2ZWwgcGFyYWxsZWwgYnVpbGQsIHBhc3NpbmcgIi1qJChQQVJBTExFTF9KT0JTKSIK
cHJldmVudHMgbWFrZS9uaW5qYSBmcm9tIGNvbm5lY3RpbmcgdG8gdGhlIGpvYnNlcnZlci4gSW4g
dGhlIHdvcnN0CmNhc2UgdGhpcyBjYW4gcmVzdWx0IGluICh0b3AtbGV2ZWwgam9icyDDlyBQQVJB
TExFTF9KT0JTKSBydW5uaW5nCmNvbmN1cnJlbnRseS4KCkRyb3AgdGhlIGV4cGxpY2l0ICItaiIg
b3B0aW9uIGluIHRoaXMgY2FzZSBzbyB0aGF0IG1ha2UvbmluamEgY2FuIGNvbm5lY3QKdG8gdGhl
IHRvcC1sZXZlbCBqb2JzZXJ2ZXIgYW5kIHJlc3BlY3QgaXRzIGNvbmN1cnJlbmN5IGxpbWl0LgoK
U2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEhpdHogPGNocmlzdGlhbi5oaXR6QGJidi5jaD4KLS0t
CiBwYWNrYWdlL3BrZy1jbWFrZS5tayB8IDggKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9wa2ctY21h
a2UubWsgYi9wYWNrYWdlL3BrZy1jbWFrZS5tawppbmRleCBmNTcyYmRlYmIzLi5kZDVmMmYxODE1
IDEwMDY0NAotLS0gYS9wYWNrYWdlL3BrZy1jbWFrZS5taworKysgYi9wYWNrYWdlL3BrZy1jbWFr
ZS5tawpAQCAtMTc2LDYgKzE3NiwxMCBAQCAkKDIpX0RFUEVOREVOQ0lFUyArPSBob3N0LXBrZ2Nv
bmYKIAogJCgyKV9ERVBFTkRFTkNJRVMgKz0gJChCUjJfQ01BS0VfSE9TVF9ERVBFTkRFTkNZKQog
CisjIFdoZW4gcGVyLXBhY2thZ2UgZGlyZWN0b3JpZXMgYXJlIGVuYWJsZWQsIHRvcC1sZXZlbCBw
YXJhbGxlbCBidWlsZCB1c2VzCisjIEdOVSBtYWtlIGpvYnNlcnZlcjsgYXZvaWQgZm9yY2luZyBh
IGZpeGVkIC1qIHZhbHVlIGZvciBiYWNrZW5kIHRvb2xzLgorJCgyKV9CVUlMRF9KTEVWRUwgPz0g
JChpZiAkKEJSMl9QRVJfUEFDS0FHRV9ESVJFQ1RPUklFUyksLC1qJChQQVJBTExFTF9KT0JTKSkK
KwogIwogIyBCdWlsZCBzdGVwLiBPbmx5IGRlZmluZSBpdCBpZiBub3QgYWxyZWFkeSBkZWZpbmVk
IGJ5IHRoZSBwYWNrYWdlIC5tawogIyBmaWxlLgpAQCAtMTgzLDExICsxODcsMTEgQEAgJCgyKV9E
RVBFTkRFTkNJRVMgKz0gJChCUjJfQ01BS0VfSE9TVF9ERVBFTkRFTkNZKQogaWZuZGVmICQoMilf
QlVJTERfQ01EUwogaWZlcSAoJCg0KSx0YXJnZXQpCiBkZWZpbmUgJCgyKV9CVUlMRF9DTURTCi0J
JCQoVEFSR0VUX01BS0VfRU5WKSAkJCgkJChQS0cpX0JVSUxEX0VOVikgJCQoQlIyX0NNQUtFKSAt
LWJ1aWxkICQkKCQkKFBLRylfQlVJTERESVIpIC1qJChQQVJBTExFTF9KT0JTKSAkJCgkJChQS0cp
X0JVSUxEX09QVFMpCisJJCQoVEFSR0VUX01BS0VfRU5WKSAkJCgkJChQS0cpX0JVSUxEX0VOVikg
JCQoQlIyX0NNQUtFKSAtLWJ1aWxkICQkKCQkKFBLRylfQlVJTERESVIpICQkKCQkKFBLRylfQlVJ
TERfSkxFVkVMKSAkJCgkJChQS0cpX0JVSUxEX09QVFMpCiBlbmRlZgogZWxzZQogZGVmaW5lICQo
MilfQlVJTERfQ01EUwotCSQkKEhPU1RfTUFLRV9FTlYpICQkKCQkKFBLRylfQlVJTERfRU5WKSAk
JChCUjJfQ01BS0UpIC0tYnVpbGQgJCQoJCQoUEtHKV9CVUlMRERJUikgLWokKFBBUkFMTEVMX0pP
QlMpICQkKCQkKFBLRylfQlVJTERfT1BUUykKKwkkJChIT1NUX01BS0VfRU5WKSAkJCgkJChQS0cp
X0JVSUxEX0VOVikgJCQoQlIyX0NNQUtFKSAtLWJ1aWxkICQkKCQkKFBLRylfQlVJTERESVIpICQk
KCQkKFBLRylfQlVJTERfSkxFVkVMKSAkJCgkJChQS0cpX0JVSUxEX09QVFMpCiBlbmRlZgogZW5k
aWYKIGVuZGlmCi0tIAoyLjU1LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
