Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E694CC4321E
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 23:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B8A3823E0;
	Tue,  5 Apr 2022 23:41:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qkx3FuUXUJKl; Tue,  5 Apr 2022 23:41:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B80681240;
	Tue,  5 Apr 2022 23:41:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 98BED1BF834
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 23:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84E1560B08
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 23:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=corrigendum.ru
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XHJkGgfTS6DT for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 23:41:43 +0000 (UTC)
X-Greylist: delayed 00:06:42 by SQLgrey-1.8.0
Received: from forward102j.mail.yandex.net (forward102j.mail.yandex.net
 [IPv6:2a02:6b8:0:801:2::102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E824B60AF0
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 23:41:42 +0000 (UTC)
Received: from sas8-92c98be93b4d.qloud-c.yandex.net
 (sas8-92c98be93b4d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c1b:2a0f:0:640:92c9:8be9])
 by forward102j.mail.yandex.net (Yandex) with ESMTP id 500B74BE8088;
 Wed,  6 Apr 2022 02:34:39 +0300 (MSK)
Received: from sas2-1cbd504aaa99.qloud-c.yandex.net
 (sas2-1cbd504aaa99.qloud-c.yandex.net [2a02:6b8:c14:7101:0:640:1cbd:504a])
 by sas8-92c98be93b4d.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 xq6VdbcTry-YcfWr7x8; Wed, 06 Apr 2022 02:34:39 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=corrigendum.ru; s=mail;
 t=1649201679; bh=rwu1TJ6+3hILKES0XYIehoVCK6RgnCzXllXR78Vr5LM=;
 h=Date:Subject:Cc:To:From:Message-Id;
 b=XjNcrjbeA4DBlMwHfQ4LhdV9wm+PsGm7NpLKnDdUaac7pMqR0TvgG4FbPlgoRFofh
 lhSPz1L7AOq5oPY3gOzsc/w0bv+Y5vMX1qRbL7ylw03Ca66xiFpD785Mgl1cB1hj1H
 d+A1/NEixFssSzcl4vsU9dYLyQr/A/kuKeDKKX5w=
Authentication-Results: sas8-92c98be93b4d.qloud-c.yandex.net;
 dkim=pass header.i=@corrigendum.ru
Received: by sas2-1cbd504aaa99.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id 6V777l4v19-YcqKTxQx; Wed, 06 Apr 2022 02:34:38 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: =?UTF-8?q?=D0=A0=D0=BE=D0=BC=D0=B0=D0=BD=20=D0=94=D0=BE=D0=BD=D1=87=D0=B5=D0=BD=D0=BA=D0=BE?=
 <dpb@corrigendum.ru>
To: buildroot@buildroot.org
Date: Wed,  6 Apr 2022 02:34:11 +0300
Message-Id: <20220405233412.4701-1-dpb@corrigendum.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pkg-python.mk: remove hardcoded
 paths for host Python
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
Cc: =?UTF-8?q?=D0=A0=D0=BE=D0=BC=D0=B0=D0=BD=20=D0=94=D0=BE=D0=BD=D1=87?=
 =?UTF-8?q?=D0=B5=D0=BD=D0=BA=D0=BE?= <dpb@corrigendum.ru>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiBpbnN0YWxsZXIgaXMgdXNlZCB0byBpbnN0YWxsIHBhY2thZ2VzIGZvciBob3N0IFB5dGhv
biwgaXQgY2FuIGZpZ3VyZQpvdXQgYnkgaXRzZWxmIHdoaWNoIHBhdGhzIHRvIHVzZS4gV2UganVz
dCBuZWVkIHRvIHVzZSB0aGUgaW5zdGFsbGVyIENMSQppbnN0ZWFkIG9mIG91ciB3cmFwcGVyIHNj
cmlwdC4KClNpZ25lZC1vZmYtYnk6INCg0L7QvNCw0L0g0JTQvtC90YfQtdC90LrQviA8ZHBiQGNv
cnJpZ2VuZHVtLnJ1PgotLS0KIHBhY2thZ2UvcGtnLXB5dGhvbi5tayB8IDEwICstLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL3BrZy1weXRob24ubWsgYi9wYWNrYWdlL3BrZy1weXRob24ubWsKaW5kZXgg
ODY3MzQxZmM3Yi4uYWNkNTYyOGYzYiAxMDA2NDQKLS0tIGEvcGFja2FnZS9wa2ctcHl0aG9uLm1r
CisrKyBiL3BhY2thZ2UvcGtnLXB5dGhvbi5tawpAQCAtMTQ2LDE0ICsxNDYsNiBAQCBIT1NUX1BL
R19QWVRIT05fUEVQNTE3X0VOViA9IFwKIAlQWVRIT05OT1VTRVJTSVRFPTEgXAogCSQoSE9TVF9D
T05GSUdVUkVfT1BUUykKIAotSE9TVF9QS0dfUFlUSE9OX1BFUDUxN19JTlNUQUxMX09QVFMgPSBc
Ci0JLS1pbnRlcnByZXRlcj0vYmluL3B5dGhvbiBcCi0JLS1zY3JpcHQta2luZD1wb3NpeCBcCi0J
LS1wdXJlbGliPSQoSE9TVF9ESVIpL2xpYi9weXRob24kKFBZVEhPTjNfVkVSU0lPTl9NQUpPUikv
c2l0ZS1wYWNrYWdlcyBcCi0JLS1oZWFkZXJzPSQoSE9TVF9ESVIpL2luY2x1ZGUvcHl0aG9uJChQ
WVRIT04zX1ZFUlNJT05fTUFKT1IpIFwKLQktLXNjcmlwdHM9JChIT1NUX0RJUikvYmluIFwKLQkt
LWRhdGE9JChIT1NUX0RJUikKLQogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKICMgaW5uZXItcHl0
aG9uLXBhY2thZ2UgLS0gZGVmaW5lcyBob3cgdGhlIGNvbmZpZ3VyYXRpb24sIGNvbXBpbGF0aW9u
CiAjIGFuZCBpbnN0YWxsYXRpb24gb2YgYSBQeXRob24gcGFja2FnZSBzaG91bGQgYmUgZG9uZSwg
aW1wbGVtZW50cyBhCkBAIC0yMTIsNyArMjA0LDcgQEAgJCgyKV9CQVNFX0lOU1RBTExfU1RBR0lO
R19DTUQgPSAkKFRPUERJUikvc3VwcG9ydC9zY3JpcHRzL3B5aW5zdGFsbGVyLnB5IGRpc3QvKgog
ZWxzZQogJCgyKV9CQVNFX0VOViA9ICQkKEhPU1RfUEtHX1BZVEhPTl9QRVA1MTdfRU5WKQogJCgy
KV9CQVNFX0JVSUxEX0NNRCA9IC1tIGJ1aWxkIC1uIC13Ci0kKDIpX0JBU0VfSU5TVEFMTF9DTUQg
PSAkKFRPUERJUikvc3VwcG9ydC9zY3JpcHRzL3B5aW5zdGFsbGVyLnB5IGRpc3QvKiAkJChIT1NU
X1BLR19QWVRIT05fUEVQNTE3X0lOU1RBTExfT1BUUykKKyQoMilfQkFTRV9JTlNUQUxMX0NNRCA9
IC1tIGluc3RhbGxlciBkaXN0LyoKIGVuZGlmCiBlbHNlCiAkJChlcnJvciAiSW52YWxpZCAkKDIp
X1NFVFVQX1RZUEUuIFZhbGlkIG9wdGlvbnMgYXJlICdkaXN0dXRpbHMnLCAnc2V0dXB0b29scycs
ICdwZXA1MTcnIG9yICdmbGl0Jy4iKQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
