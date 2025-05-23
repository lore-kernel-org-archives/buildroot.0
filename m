Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56AFC54ED1
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 17:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D26E80F5D;
	Fri, 23 May 2025 17:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z4fmJk0CYXaq; Fri, 23 May 2025 17:42:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30AD280E88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30AD280E88;
	Fri, 23 May 2025 17:42:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 508EE68
 for <buildroot@buildroot.org>; Fri, 23 May 2025 17:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36B9940588
 for <buildroot@buildroot.org>; Fri, 23 May 2025 17:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K31S8otupfGW for <buildroot@buildroot.org>;
 Fri, 23 May 2025 17:42:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.97;
 helo=smtp-outgoing-1602.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 12E1F40571
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12E1F40571
Received: from smtp-outgoing-1602.laposte.net (smtp-outgoing-1602.laposte.net
 [160.92.124.97])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 12E1F40571
 for <buildroot@buildroot.org>; Fri, 23 May 2025 17:42:25 +0000 (UTC)
X-mail-filterd: {"version":"1.9.1","queueID":"4b3stQ0bq6zKm49","contextId":
 "1e38c9f6-e412-4f28-a938-b8e2fae678a5"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0115.laposte.net (SMTP Server) with ESMTP id 4b3stQ0bq6zKm49;
 Fri, 23 May 2025 19:42:22 +0200 (CEST)
X-mail-filterd: {"version":"1.9.1","queueID":"4b3stP6S3SzKm45","contextId":
 "9777ce86-039e-4513-95e0-d4c5e2aa5379"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mlpnf0115.laposte.net (SMTP Server) with ESMTPSA id 4b3stP6S3SzKm45;
 Fri, 23 May 2025 19:42:21 +0200 (CEST)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
 by romuald.bergerie (Postfix) with ESMTP id D03E0670D665;
 Fri, 23 May 2025 19:42:30 +0200 (CEST)
Received: from vincent by radicelle with local (Exim 4.98.1)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1uIWQN-0000000022U-0TW0; Fri, 23 May 2025 19:43:15 +0200
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Fri, 23 May 2025 19:43:08 +0200
Message-ID: <20250523174313.7056-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1748022142;
 bh=EXga4vmyaY3mhvQJENIpG6C+UcyRvzyjagOW5MNHSQI=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=bLQbdEjajEYqEs4tITbWlpXJ0IIj4upM+5fEQOs6J5gi/yZLfkxhmJR4yCT93Imy3C6Wmhe41jelnwmgpIbiazVERB8rHPB30La3GwAjW4+V5JF/f76A4cqIkpct48u0jqP4qoU/sSFWJeEGUo7CA4YOXFWDcSu7uL7FTrLdFhuTC+iCyrncoIoXR4uUXXJ0kd/bWiJKi1/OLPphpaPmHD+gb7t0AXLm7LF6lcEwyLXpu6rb7WuapJ3a8kO2/ySK5eXL8MJVSNyTC4ZzxZhX+274z7exKz/vIkjEWs4O1Kq4VX0sHsXKwqLEfS4E3dT6EiEbP0uBtysRK9pu3DmOQw==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=bLQbdEja
Subject: [Buildroot] [PATCH 0/5] Add support for HPPA (PA-RISC)
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

SGVsbG8sCgpUaGlzIHBhdGNoIHNlcmllcyBhZGRzIG1pbmltYWwgc3VwcG9ydCBmb3IgYSAibmV3
IiBhcmNoaXRlY3R1cmU6IEhQL1BBCihhLmsuYS4gUEEtUklTQyk7IG9uZSBvZiB0aGUgUklTQyBh
cmNoaXRlY3R1cmVzIG9mIHRoZSBsYXRlIDgwaWVzLgoKVGhpcyBhcmNoaXRlY3R1cmUgaXMgc3Rp
bGwgd2VsbCBzdXBwb3J0ZWQgYnkgZ2NjLCBMaW51eCBhbmQgc29tZSBvdGhlcgpkaXN0cm9zOyB0
aGVyZWZvcmUgaXQgc2hvdWxkIG5vdCBiZSB0b28gbXVjaCBvZiBhIGJ1cmRlbiB0byBzdXBwb3J0
IGluCkJ1aWxkcm9vdC4KCldpdGggdGhvc2UgcGF0Y2hlcyB3ZSBoYXZlIGVub3VnaCB0byBidWls
ZCBhbmQgcnVuIGEgTGludXgga2VybmVsIHdpdGgKYnVzeWJveCBvbiBRZW11LCB3aGljaCBtYWtl
cyBpdCBlYXNpbHkgdGVzdGFibGUuIAoKSSBwbGFuIHRvIGFkZCBzdXBwb3J0IGxhdGVyIG9uIGZv
ciBydW5uaW5nIG9uIGFjdHVhbCBoYXJkd2FyZTsgdGhlIEhQCjkwMDAgNzEyIFBBLVJJU0MgV29y
a3N0YXRpb24uCgpCZXN0IHJlZ2FyZHMsClZpbmNlbnQuCgoKVmluY2VudCBTdGVobMOpICg1KToK
ICBocHBhOiBBZGQgbmV3IGFyY2hpdGVjdHVyZQogIHBhY2thZ2UvZ2NjOiBlbmFibGUgaHBwYSBz
dXBwb3J0CiAgcGFja2FnZS9nbGliYzogZW5hYmxlIGhwcGEgc3VwcG9ydAogIHBhY2thZ2UvcWVt
dTogZW5hYmxlIGhvc3QtcWVtdSBocHBhIHN1cHBvcnQKICBjb25maWdzL3FlbXVfaHBwYV9iMTYw
bDogbmV3IGRlZmNvbmZpZwoKIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICB8ICA0
ICsrKysKIGFyY2gvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICB8IDEyICsrKysrKysrKysr
KwogYXJjaC9Db25maWcuaW4uaHBwYSAgICAgICAgICAgICAgIHwgMjIgKysrKysrKysrKysrKysr
KysrKysrKwogYXJjaC9hcmNoLm1rLmhwcGEgICAgICAgICAgICAgICAgIHwgMTMgKysrKysrKysr
KysrKwogYm9hcmQvcWVtdS9ocHBhLWIxNjBsL3JlYWRtZS50eHQgIHwgMzEgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwogY29uZmlncy9xZW11X2hwcGFfYjE2MGxfZGVmY29uZmlnIHwg
MTggKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL2djYy9Db25maWcuaW4uaG9zdCAgICAgICAg
fCAgMSArCiBwYWNrYWdlL2dsaWJjL0NvbmZpZy5pbiAgICAgICAgICAgfCAgMSArCiBwYWNrYWdl
L3FlbXUvQ29uZmlnLmluLmhvc3QgICAgICAgfCAgMSArCiA5IGZpbGVzIGNoYW5nZWQsIDEwMyBp
bnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9Db25maWcuaW4uaHBwYQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJjaC5tay5ocHBhCiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9h
cmQvcWVtdS9ocHBhLWIxNjBsL3JlYWRtZS50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdz
L3FlbXVfaHBwYV9iMTYwbF9kZWZjb25maWcKCi0tIAoyLjQ3LjIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
