Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCA3C433FE
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 00:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14D1E60B2F;
	Wed, 23 Nov 2022 00:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14D1E60B2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mhRlYLqZSRAx; Wed, 23 Nov 2022 00:17:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FB7F60AD8;
	Wed, 23 Nov 2022 00:17:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FB7F60AD8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 403EE1BF403
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 00:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B23740A15
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 00:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B23740A15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3FLjED9Obn7n for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 00:17:08 +0000 (UTC)
X-Greylist: delayed 00:34:57 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE52A40105
Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch
 [83.166.143.170])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE52A40105
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 00:17:07 +0000 (UTC)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4NGxx21lY6zMqHLH;
 Tue, 22 Nov 2022 22:20:06 +0100 (CET)
Received: from localhost.localdomain (unknown [81.221.82.85])
 by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4NGxx16QMHz3k;
 Tue, 22 Nov 2022 22:20:05 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 22 Nov 2022 22:20:02 +0100
Message-Id: <20221122212002.139494-1-pge@ik.me>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ik.me;
 s=20200325; 
 t=1669152006; bh=msgIruvEmfj34JbTMgWSu4QHW7T/GO2wvKgltc9hnPM=;
 h=From:To:Cc:Subject:Date:From;
 b=K/Jp/7N52AC1OSiR3wEhEK56AX7ywWcytv3z0ZaoCFrlxV/McGCvYumwlPQZ9f68m
 1MWHVVUbtPEdlSWEUb0HZ/mBZmFn88q5N0n6N+OdkukJlM2vlVGIcEfB/EGDnHVyve
 T9M2PP53xB3HFkkkSyGTdnh99fNSlCOxelIIZ36A=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.a=rsa-sha256
 header.s=20200325 header.b=K/Jp/7N5
Subject: [Buildroot] [PATCH] package/pkg-golang: enable pkg specific go env
 also for download step
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: PGE via buildroot <buildroot@buildroot.org>
Reply-To: PGE <pge@ik.me>
Cc: PGE <pge@ik.me>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q3VycmVudGx5IHBhY2thZ2Ugc2VjaWZpYyBnbyBlbnYgaXMgdXNlZCBvbmx5IGR1cmluZyBwYWNr
YWdlIGJ1aWxkIHN0ZXAuCgpHbyB2ZW5kZXJpbmcgaXMgZG9uZSBkdXJpbmcgdGhlIGRvd25sb2Fk
IHN0ZXAgYW5kIGl0J3Mgc29tZXRpbWVzIHJlcXVpcmVkCnRvIHNwZWNpZnkgcGFja2FnZSBzZWNp
ZmljIGdvIGVudiBhbHNvIGZvciB0aGlzIHN0ZXAuCgpGb3IgZXhhbXBsZSwgd2hlbiBpbXBvcnRp
bmcgY3VzdG9tIGdvIG1vZHVsZXMgd2hvIGFyZSBob3N0ZWQgb24gYSBwcml2YXRlCmhvc3QsIGl0
4oCZcyByZXF1aXJlZCB0byBzZXQgR09QUklWQVRFIHRvIGF2b2lkIHB1YmxpYyBzdW0gY2hlY2tp
bmcuCi0tLQogcGFja2FnZS9wa2ctZ29sYW5nLm1rIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3BrZy1n
b2xhbmcubWsgYi9wYWNrYWdlL3BrZy1nb2xhbmcubWsKaW5kZXggMGIzZGMzZDMyZi4uY2RjNjdi
MzJjMCAxMDA2NDQKLS0tIGEvcGFja2FnZS9wa2ctZ29sYW5nLm1rCisrKyBiL3BhY2thZ2UvcGtn
LWdvbGFuZy5tawpAQCAtODcsNyArODcsOCBAQCAkKDIpX1BPU1RfUEFUQ0hfSE9PS1MgKz0gJCgy
KV9HRU5fR09NT0QKICQoMilfRE9XTkxPQURfUE9TVF9QUk9DRVNTID0gZ28KICQoMilfRExfRU5W
ICs9IFwKIAkkJChIT1NUX0dPX0NPTU1PTl9FTlYpIFwKLQlHT1BST1hZPWRpcmVjdAorCUdPUFJP
WFk9ZGlyZWN0IFwKKwkkJCgkKDIpX0dPX0VOVikKIAogIyBEdWUgdG8gdmVuZG9yaW5nLCBpdCBp
cyBwcmV0dHkgbGlrZWx5IHRoYXQgbm90IGFsbCBsaWNlbnNlcyBhcmUKICMgbGlzdGVkIGluIDxw
a2c+X0xJQ0VOU0UuCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
