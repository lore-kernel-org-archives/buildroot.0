Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906BACAC5A7
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 13:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C2D68120E;
	Tue, 23 Sep 2025 13:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xdx0XNWQSguH; Tue, 23 Sep 2025 13:52:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73E2381179
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73E2381179;
	Tue, 23 Sep 2025 13:52:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 217F2E7
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 13:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0741960AAC
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 13:52:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k-WMOnO_04rs for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 13:52:39 +0000 (UTC)
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=205.139.111.44;
 helo=us-smtp-delivery-44.mimecast.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 80AEA60C13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80AEA60C13
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80AEA60C13
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 13:52:39 +0000 (UTC)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-368-8dzqsl0cNPqqAxVItmuOVQ-1; Tue,
 23 Sep 2025 09:52:34 -0400
X-MC-Unique: 8dzqsl0cNPqqAxVItmuOVQ-1
X-Mimecast-MFC-AGG-ID: 8dzqsl0cNPqqAxVItmuOVQ_1758635553
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E97901956095; Tue, 23 Sep 2025 13:52:32 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.33.218])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2E2D41955F21; Tue, 23 Sep 2025 13:52:30 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Date: Tue, 23 Sep 2025 15:52:21 +0200
Message-ID: <20250923135223.1062683-2-clg@kaod.org>
In-Reply-To: <20250923135223.1062683-1-clg@kaod.org>
References: <20250923135223.1062683-1-clg@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m4E7BkOU6AUI7gPLc-tZ3D3iHDf3C9DOc7yEQZ003zY_1758635553
X-Mimecast-Originator: kaod.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=kaod.org
Subject: [Buildroot] [PATCH 2/4] configs/aspeed_ast2500evb: increase kernel
 partition size
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW5jcmVhc2UgYWdhaW4gdGhlIHBhcnRpdGlvbiBzaXplIHRvIGFjY29tbW9kYXRlIGxhdGVzdCBr
ZXJuZWwuCgpTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgot
LS0KIGJvYXJkL2FzcGVlZC9hc3QyNTAwLWV2Yi9nZW5pbWFnZS5jZmcgfCA2ICsrKy0tLQogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9ib2FyZC9hc3BlZWQvYXN0MjUwMC1ldmIvZ2VuaW1hZ2UuY2ZnIGIvYm9hcmQvYXNwZWVkL2Fz
dDI1MDAtZXZiL2dlbmltYWdlLmNmZwppbmRleCA1NGYyMGVmNmU3YjQuLjk1MmE3Yjc4MjAwYSAx
MDA2NDQKLS0tIGEvYm9hcmQvYXNwZWVkL2FzdDI1MDAtZXZiL2dlbmltYWdlLmNmZworKysgYi9i
b2FyZC9hc3BlZWQvYXN0MjUwMC1ldmIvZ2VuaW1hZ2UuY2ZnCkBAIC0zMCwxMSArMzAsMTEgQEAg
aW1hZ2UgZmxhc2guaW1nIHsKIAlwYXJ0aXRpb24gZml0aW1hZ2UgewogCQlpbWFnZSA9ICJpbWFn
ZS5pdGIiCiAJCW9mZnNldCA9IDUxMksKLQkJc2l6ZSA9IDYwMDBLCisJCXNpemUgPSA3MDAwSwog
CX0KIAogCXBhcnRpdGlvbiBzcGFyZSB7Ci0JCW9mZnNldCA9IDY1MTJLCi0JCXNpemUgPSAgMjYy
NTZLCisJCW9mZnNldCA9IDc1MTJLCisJCXNpemUgPSAgMjUyNTZLCiAJfQogfQotLSAKMi41MS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
