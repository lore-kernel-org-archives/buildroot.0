Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C511EC02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 17:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F6E7406AD;
	Sun, 26 Jan 2025 17:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hopeeQ5Oct5A; Sun, 26 Jan 2025 17:33:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3131C406B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3131C406B1;
	Sun, 26 Jan 2025 17:33:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C6E0941
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 17:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A8D06063A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 17:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id APFGsSNlnzKs for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 17:33:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.108;
 helo=smtp-outgoing-2001.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4B5AD605FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B5AD605FC
Received: from smtp-outgoing-2001.laposte.net (smtp-outgoing-2001.laposte.net
 [160.92.124.108])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B5AD605FC
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 17:33:46 +0000 (UTC)
X-mail-filterd: {"version":"1.8.0","queueID":"4YgzDJ5gs2zdZLl","contextId":
 "da16bffb-6d85-4173-8885-700321e46e5c"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0106.laposte.net (SMTP Server) with ESMTP id 4YgzDJ5gs2zdZLl;
 Sun, 26 Jan 2025 18:33:36 +0100 (CET)
X-mail-filterd: {"version":"1.8.0","queueID":"4YgzDJ4pvXzdZLg","contextId":
 "a649765f-ce91-4d12-abbd-cee7dc309f4b"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mlpnf0106.laposte.net (SMTP Server) with ESMTPSA id 4YgzDJ4pvXzdZLg;
 Sun, 26 Jan 2025 18:33:36 +0100 (CET)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
 by romuald.bergerie (Postfix) with ESMTP id 30A7A6378E09;
 Sun, 26 Jan 2025 18:33:55 +0100 (CET)
Received: from vincent by radicelle with local (Exim 4.98)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1tc6WL-000000006Jm-1fdp; Sun, 26 Jan 2025 18:34:05 +0100
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>, Julien Olivain <ju.o@free.fr>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Sun, 26 Jan 2025 18:34:01 +0100
Message-ID: <20250126173402.24273-2-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250126173402.24273-1-vincent.stehle@laposte.net>
References: <20250126173402.24273-1-vincent.stehle@laposte.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1737912824;
 bh=sYjke9VwMLrDbGHEU6Nye08HRUYsXJsU/j4L8hsKBzA=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=eBUlHD8Zz8c5392fwkDHHES8bLvscISIdIeKjAhVlJuK3RlO1J4vmx051ubWCYKL+dd4kKFEG2Ew6Fyv6D3bNZgKowXUutIY8KhT6evMR/JEuXZJLxku1HhTYE5ckHHKY3FBv7X1E24I64nwi+5/BtpMnovPGBsTIIV/+MbmmlNhCQjzvYEX/wcMIyKCYtNZmPMwMtrlxp0UdZPMPEDbYXdazq+at93p+GRr8b50rq7ylmWDzm5Ro/HQaAojJAUXkNQRR3rHNpdIOeAbXJiyLqOBFGQgtWgv0ZPji/YNPyKjYz9MzC00tFS23spnwz2+1P3QkDGwee4Y/6ug9zo7eA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=eBUlHD8Z
Subject: [Buildroot] [PATCH v2 1/2] package/xen: xen tools needs bash at
 runtime
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

V2hlbiB0aGUgWGVuIHRvb2xzIGFyZSBidWlsdCwgYSBudW1iZXIgb2YgaW5pdCBzY3JpcHRzIGFy
ZSBpbnN0YWxsZWQgdG8KdGhlIHRhcmdldC4KClNvbWUgb2YgdGhvc2UgWGVuIHNjcmlwdHMgcmVx
dWlyZSBiYXNoIHRvIHJ1bjoKLSAvZXRjL2luaXQuZC9TNTB4ZW5jb21tb25zCi0gL2V0Yy9pbml0
LmQvUzUweGVuLXdhdGNoZG9nCi0gL2V0Yy9pbml0LmQvUzYweGVuZG9tYWlucwotIC9ldGMveGVu
L3NjcmlwdHMvbGF1bmNoLXhlbnN0b3JlCi0gL3Vzci9saWIveGVuL2Jpbi94ZW5kb21haW5zCgpN
YWtlIHN1cmUgdG8gc2VsZWN0IGJhc2ggd2hlbiB0aGUgWGVuIHRvb2xzIGFyZSBzZWxlY3RlZCAo
d2UgbmVlZCB0bwpzZWxlY3QgImJ1c3lib3ggc2hvdyBvdGhlcnMiIGZvciB0aGF0LCB0b28pLgoK
U3VnZ2VzdGVkLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgpTaWduZWQtb2ZmLWJ5
OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0PgpDYzogQWxpc3Rh
aXIgRnJhbmNpcyA8YWxpc3RhaXJAYWxpc3RhaXIyMy5tZT4KLS0tCiBwYWNrYWdlL3hlbi9Db25m
aWcuaW4gfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvcGFja2FnZS94ZW4vQ29uZmlnLmluIGIvcGFja2FnZS94ZW4vQ29uZmlnLmluCmluZGV4IDU3
NzA2NjY2NmQuLjcwYTA2ZjNjYmYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UveGVuL0NvbmZpZy5pbgor
KysgYi9wYWNrYWdlL3hlbi9Db25maWcuaW4KQEAgLTMzLDYgKzMzLDggQEAgY29uZmlnIEJSMl9Q
QUNLQUdFX1hFTl9UT09MUwogCXNlbGVjdCBCUjJfUEFDS0FHRV9VVElMX0xJTlVYX0xJQlVVSUQK
IAlzZWxlY3QgQlIyX1BBQ0tBR0VfWUFKTAogCXNlbGVjdCBCUjJfUEFDS0FHRV9BUkdQX1NUQU5E
QUxPTkUgaWYgIUJSMl9UT09MQ0hBSU5fVVNFU19HTElCQworCXNlbGVjdCBCUjJfUEFDS0FHRV9C
QVNIICMgcnVudGltZSAoc2NyaXB0cykKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfQlVTWUJPWF9TSE9X
X09USEVSUyBpZiBCUjJfUEFDS0FHRV9CVVNZQk9YICMgYmFzaAogCWhlbHAKIAkgIFRoZSBYZW4g
dG9vbHMgY2FuIGJlIGFjY2Vzc2VkIGJ5IHRoZSB4bCBjb21tYW5kLgogCi0tIAoyLjQ1LjIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
