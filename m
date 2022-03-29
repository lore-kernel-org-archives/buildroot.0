Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAD0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 20:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F4FB843BE;
	Tue, 29 Mar 2022 20:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yw06Ir8QKFZH; Tue, 29 Mar 2022 20:51:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 918B8843AD;
	Tue, 29 Mar 2022 20:51:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A14271BF2E3
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 852F661120
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 20:51:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=laposte.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BFYR0JhgW_Mb for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 20:51:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-outgoing-2003.laposte.net (smtp-outgoing-2003.laposte.net
 [160.92.124.110])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0799D6111E
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 20:51:48 +0000 (UTC)
X-mail-filterd: {"version":"1.4.2", "queueID":"4KShZB0jfxzqSH9",
 "contextId":"6028b536-aa67-48be-81a1-814608fc488b"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0108.laposte.net (SMTP Server) with ESMTP id 4KShZB0jfxzqSH9;
 Tue, 29 Mar 2022 22:51:46 +0200 (CEST)
X-mail-filterd: {"version":"1.4.2", "queueID":"4KShZ96w6hzqSH8",
 "contextId":"381f252c-30c9-4fb1-8abe-11fbcf60a7c8"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 46
X-lpn-spamlevel: not-spam
X-lpn-spamcause: OK,
 (-100)(0000)gggruggvucftvghtrhhoucdtuddrgedvvddrudeitddguddvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfntefrqffuvffgpdggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeggihhntggvnhhtucfuthgvhhhlrocuoehvihhntggvnhhtrdhsthgvhhhlvgeslhgrphhoshhtvgdrnhgvtheqnecuggftrfgrthhtvghrnhepgedvueelhfehkedtueefleduueeiveefhfektdduudetvefhueejtdekieejgfelnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepkeekrdduieelrdduvdelrddvvdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepkeekrdduieelrdduvdelrddvvdehpdhhvghloheprhhomhhurghlugdrsggvrhhgvghrihgvpdhmrghilhhfrhhomhepvhhinhgtvghnthdrshhtvghhlhgvsehlrghpohhsthgvrdhnvghtpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesghhmrghilhdrtghomhdprhgtphhtthhopehvihhntggvnhhtrdhsthgvhhhlvgeslhgrphhoshhtvgdrnhgvthdprhgtphhtthhopehgvghrohhmvgdrsghur
 hhlrghtshesshhmihhlvgdrfhhrpdhmohguvgepshhmthhpohhuth
Received: from romuald.bergerie (unknown [88.169.129.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mlpnf0108.laposte.net (SMTP Server) with ESMTPSA id 4KShZ96w6hzqSH8;
 Tue, 29 Mar 2022 22:51:45 +0200 (CEST)
Received: from radicelle.bergerie (radicelle.bergerie [192.168.124.12])
 by romuald.bergerie (Postfix) with ESMTP id A8A37489D046;
 Tue, 29 Mar 2022 22:51:45 +0200 (CEST)
Received: from vincent by radicelle.bergerie with local (Exim 4.95)
 (envelope-from <vincent@radicelle.bergerie>) id 1nZIob-00009Q-Hy;
 Tue, 29 Mar 2022 22:51:45 +0200
To: buildroot@buildroot.org
Date: Tue, 29 Mar 2022 22:51:36 +0200
Message-Id: <20220329205136.32435-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=laposte.net; s=lpn-wlmd;
 t=1648587106; bh=O7C9WQl3mGj38lVvs11R7fMJ20fCP4Vz//0mCReApUU=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=RB9jrKgH4n3Pq0zqaNwtPe6HAoqW/N74ZsUef2mIlNLvFBpmVI2FSePCPFQNSUnA30lLIl+UJooxUkpkPnFRSm4mNBj9FOMO2GUJC9GJQNkVc1KDbDMDCSB67UPb1Qbp67ytKJ9lh39z0WhSuHS4e0HvewAYVre2v+3fxZATnZ+nyglqChMZ8WrfxTO6l7u8ntuRoqQCnIfaRqtCm7biZith+8pmseZuuWH0/kCs4je39PBzJk+yFVKs1YcWaPdNEueCbnacgEneKXZnTgGOJ3xZVSD00oYkesshUozjXnlIA09fLOOIT7qYiMG1ymqMXtJZV+ygtmTL5VMqGjOqmQ==;
Subject: [Buildroot] [PATCH] configs/qemu_xtensa_lx60_nommu: use busybox
 minimal config
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VXBkYXRlIHRoZSBxZW11X3h0ZW5zYV9seDYwX25vbW11X2RlZmNvbmZpZyB0byB1c2UgdGhlCmJ1
c3lib3gtbWluaW1hbC5jb25maWcsIHRvIG1ha2UgaXQgbW9yZSBjb25zaXN0ZW50IHdpdGggdGhl
IG90aGVyIG5vLU1NVQpkZWZjb25maWdzLgoKQWZ0ZXIgY29tbWl0IDNkZTQ4NmY4YjA1MiAoInBh
Y2thZ2UvYnVzeWJveDogZml4IHVkaGNwYyBvcHRpb25zIGluIG1pbmltYWwKY29uZmlnIiksIHRo
aXMgaGFzIHRoZSBiZW5lZml0IG9mIGZpeGluZyB0aGUgZm9sbG93aW5nIG5ldHdvcmsKaW5pdGlh
bGl6YXRpb24gZmFpbHVyZToKCiAgdWRoY3BjOiBpbnZhbGlkIG9wdGlvbiAtLSBiCgpTaWduZWQt
b2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0PgpDYzog
Um9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgpDYzogR2Vyb21lIEJ1cmxhdHMg
PGdlcm9tZS5idXJsYXRzQHNtaWxlLmZyPgotLS0KIGNvbmZpZ3MvcWVtdV94dGVuc2FfbHg2MF9u
b21tdV9kZWZjb25maWcgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcWVtdV94dGVuc2FfbHg2MF9ub21tdV9kZWZjb25maWcgYi9j
b25maWdzL3FlbXVfeHRlbnNhX2x4NjBfbm9tbXVfZGVmY29uZmlnCmluZGV4IGM0NDczZmIzMmEu
LjQ0ZmI4MWJkNzQgMTAwNjQ0Ci0tLSBhL2NvbmZpZ3MvcWVtdV94dGVuc2FfbHg2MF9ub21tdV9k
ZWZjb25maWcKKysrIGIvY29uZmlncy9xZW11X3h0ZW5zYV9seDYwX25vbW11X2RlZmNvbmZpZwpA
QCAtNyw2ICs3LDkgQEAgQlIyX1hURU5TQV9PVkVSTEFZX0ZJTEU9Imh0dHBzOi8vZ2l0aHViLmNv
bS9qY212YmtiYy94dGVuc2EtdG9vbGNoYWluLWJ1aWxkL3Jhdy8KIEJSMl9QQUNLQUdFX0hPU1Rf
RUxGMkZMVD15CiAjIEJSMl9VU0VfTU1VIGlzIG5vdCBzZXQKIAorIyBVc2UgbWluaW1hbCBidXN5
Ym94IHdpdGggaHVzaCBhbmQgbmV0d29ya2luZyB0b29scworQlIyX1BBQ0tBR0VfQlVTWUJPWF9D
T05GSUc9InBhY2thZ2UvYnVzeWJveC9idXN5Ym94LW1pbmltYWwuY29uZmlnIgorCiAjIFN5c3Rl
bQogQlIyX1NZU1RFTV9ESENQPSJldGgwIgogQlIyX1RBUkdFVF9HRU5FUklDX0dFVFRZX1BPUlQ9
InR0eVMwIgotLSAKMi4zNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
