Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CC2D26D75
	for <buildroot@archiver.kernel.org>; Fri,  9 Jan 2026 16:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 167D860ED0;
	Fri,  9 Jan 2026 16:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h41bA2pS7slb; Fri,  9 Jan 2026 16:38:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BCD760ECC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767976711;
	bh=X+ROkBGIGvb9VCL7yWAKC/jrb0bMn7jEFx6bbKbQnSM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qptaGw27MSUWEGnE+SEAQRlCIq7MLvB4lCcJ+a6Cyuqe7Oh7EBVK3om/14gjCc8nb
	 HUWit/zvs2/SbUw9P0eoNudj1eVoHlatxWoEz0RrUzogx8rx97wEidXKO4DfYv/RG5
	 O5xt0fZLNegZKwuYNEfSByXf4/gtsrlGsexD6BhXIO+qSSNH+lQNHtWF2H5qcS398j
	 WOrvKmUbN9sGrsF4H6Khrql0Naskt/cjFg6mBjQoubo9Ch1WXpZImnNYd6rquOx+2s
	 /6ilbX3aBrJwR8xzmL3lHP7QlFvEv5CJ4ScuhaC0fOR1R63t5JHosE0tviT/7wFgZI
	 lX3OSGZE5YLPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BCD760ECC;
	Fri,  9 Jan 2026 16:38:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DED3B12E
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 16:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C63CD40BEA
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 16:38:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l6jd2yXUGQ9P for <buildroot@buildroot.org>;
 Fri,  9 Jan 2026 16:38:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B5DF940B11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5DF940B11
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5DF940B11
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 16:38:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78856FEC;
 Fri,  9 Jan 2026 08:38:20 -0800 (PST)
Received: from debian (unknown [10.57.11.52])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4AFE93F5A1;
 Fri,  9 Jan 2026 08:38:26 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>, Julien Olivain <ju.o@free.fr>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Date: Fri,  9 Jan 2026 17:38:14 +0100
Message-ID: <20260109163816.131696-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH 0/2] Add block to Xen test
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

SGksCgpIZXJlIGlzIGEgY291cGxlIG9mIHBhdGNoZXMgdG8gYWRkIGJsb2NrIGRldmljZXMgdG8g
dGhlIFhlbiB0ZXN0LgoKVGhlIGZpcnN0IHBhdGNoIGFkZHMgYSBtaXNzaW5nIGRlcGVuZGVuY3kg
b24gY29yZXV0aWxzIChmb3Igc3RhdCksIHdoaWNoCmhhcyBiZWVuIGZvdW5kIGR1cmluZyB0ZXN0
IGRldmVsb3BtZW50LgoKQWxzbywgd2UgbmVlZCB0byBidWlsZCBob3N0LXFlbXUgaW4gdGhlIDMy
YiBBcm0gdjcgY2FzZSwgdG8gd29ya2Fyb3VuZAphbiBpc3N1ZSBoYXBwZW5pbmcgb24gQ0kuCgpC
ZXN0IHJlZ2FyZHMsClZpbmNlbnQuCgpWaW5jZW50IFN0ZWhsw6kgKDIpOgogIHBhY2thZ2UveGVu
OiB4ZW4gdG9vbHMgbmVlZCBjb3JldXRpbHMgc3RhdCBhdCBydW50aW1lCiAgc3VwcG9ydC90ZXN0
aW5nOiB0ZXN0X3hlbjogYWRkIGJsb2NrCgogcGFja2FnZS94ZW4vQ29uZmlnLmluICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgKwogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVz
dF94ZW4ucHkgICAgIHwgMzYgKysrKysrKysrKysrKysrKy0tLQogLi4uL3BhY2thZ2UvdGVzdF94
ZW4vYWFyY2g2NC9nZW5pbWFnZS5jZmcgICAgIHwgMTQgKysrKysrLS0KIC4uLi9wYWNrYWdlL3Rl
c3RfeGVuL2FhcmNoNjQvbGludXguY29uZmlnICAgICB8ICAzICsrCiAuLi4vdGVzdF94ZW4vYWFy
Y2g2NC9vdmVybGF5L2V0Yy94ZW4vZG9tMS5jZmcgfCAgNCArLS0KIC4uLi90ZXN0cy9wYWNrYWdl
L3Rlc3RfeGVuL2FhcmNoNjQveGVuLmNmZyAgICB8ICAzICstCiAuLi4vdGVzdHMvcGFja2FnZS90
ZXN0X3hlbi9hcm0vYm9vdC5jbWQgICAgICAgfCAgNyArLS0tCiAuLi4vdGVzdHMvcGFja2FnZS90
ZXN0X3hlbi9hcm0vZ2VuaW1hZ2UuY2ZnICAgfCAxNCArKysrKystLQogLi4uL3Rlc3RzL3BhY2th
Z2UvdGVzdF94ZW4vYXJtL2xpbnV4LmNvbmZpZyAgIHwgIDMgKysKIC4uLi90ZXN0X3hlbi9hcm0v
b3ZlcmxheS9ldGMveGVuL2RvbTEuY2ZnICAgICB8ICA0ICstLQogMTAgZmlsZXMgY2hhbmdlZCwg
NjggaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCgotLSAKMi41MS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
