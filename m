Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45244D26D75
	for <buildroot@archiver.kernel.org>; Fri,  9 Jan 2026 16:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1183260ECC;
	Fri,  9 Jan 2026 16:38:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1F0yshjbzfKP; Fri,  9 Jan 2026 16:38:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37AC160ED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767976719;
	bh=tvRk5deKWx2Ytmhl7dLujfOo358obCB27rqlsKpsqQs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uju8aznQTZE38rk+Jw8IkrsnlGhfY2/RDt8L3KW1Y+Ja26EctehSJpHAuMC3/F7Cn
	 D/5OvREFJgTEJbObiWayluRfBF9wu8NOIdk5tHFbLkbv0j+LQEE3wgpT5fTxTlRu7Z
	 gJa1LumE0j3UUXfoIJBF0nrjY987zCCNf5TCr5Wpvy0GqgVPh2X8bXwEwUYJ5pIhfM
	 CXP1GCtrRmuNmg1AMNXLm/qn2n6uzsmReoojqH7Y/aZZZnpehdP48eN0S6V/DEQtMI
	 UIEnJWUibjgesnIzz/Eee39SAlXOiQMvlqXc+F46moT0aBzE+34+a7D2yjMqcUjiou
	 4WVQWGFNuaRTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37AC160ED1;
	Fri,  9 Jan 2026 16:38:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E2365278
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 16:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4B3683B7E
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 16:38:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1h6-zFTA1VvP for <buildroot@buildroot.org>;
 Fri,  9 Jan 2026 16:38:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C56A183B7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C56A183B7A
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id C56A183B7A
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 16:38:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F065EFEC;
 Fri,  9 Jan 2026 08:38:28 -0800 (PST)
Received: from debian (unknown [10.57.11.52])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BE2B73F5A1;
 Fri,  9 Jan 2026 08:38:34 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>, Julien Olivain <ju.o@free.fr>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Date: Fri,  9 Jan 2026 17:38:15 +0100
Message-ID: <20260109163816.131696-2-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260109163816.131696-1-vincent.stehle@arm.com>
References: <20260109163816.131696-1-vincent.stehle@arm.com>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
Subject: [Buildroot] [PATCH 1/2] package/xen: xen tools need coreutils stat
 at runtime
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

WGVuIHRvb2xzIHNjcmlwdHMgbmVlZCB0aGUgc3RhdCBwcm9ncmFtIGZyb20gY29yZXV0aWxzIHRv
IHdvcmsKY29ycmVjdGx5LCBhbmQgbm90IHRoZSBvbmUgZnJvbSBidXN5Ym94LgpPbmUgc3VjaCBl
eGFtcGxlIGlzIHRoZSAvZXRjL3hlbi9zY3JpcHRzL2xvY2tpbmcuc2ggc2NyaXB0LCB3aGljaCB3
aWxsCmNhdXNlIHRpbWVvdXRzIGZvciBvcGVyYXRpb25zIHN1Y2ggYXMgInhsIGJsb2NrLWF0dGFj
aCIsIG9yIHdoZW4Kc3RhcnRpbmcgYSBEb21VIHdpdGggYSBkaXNrLgoKQWRkIHRoZSBkZXBlbmRl
bmN5IG9uIGNvcmV1dGlscyB0byBmaXggdGhpcy4KClNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3Rl
aGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KQ2M6IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0
YWlyQGFsaXN0YWlyMjMubWU+Ci0tLQogcGFja2FnZS94ZW4vQ29uZmlnLmluIHwgMSArCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3hlbi9Db25m
aWcuaW4gYi9wYWNrYWdlL3hlbi9Db25maWcuaW4KaW5kZXggNzBhMDZmM2NiZi4uZTgxNjhjYThj
OCAxMDA2NDQKLS0tIGEvcGFja2FnZS94ZW4vQ29uZmlnLmluCisrKyBiL3BhY2thZ2UveGVuL0Nv
bmZpZy5pbgpAQCAtMzUsNiArMzUsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfWEVOX1RPT0xTCiAJ
c2VsZWN0IEJSMl9QQUNLQUdFX0FSR1BfU1RBTkRBTE9ORSBpZiAhQlIyX1RPT0xDSEFJTl9VU0VT
X0dMSUJDCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0JBU0ggIyBydW50aW1lIChzY3JpcHRzKQogCXNl
bGVjdCBCUjJfUEFDS0FHRV9CVVNZQk9YX1NIT1dfT1RIRVJTIGlmIEJSMl9QQUNLQUdFX0JVU1lC
T1ggIyBiYXNoCisJc2VsZWN0IEJSMl9QQUNLQUdFX0NPUkVVVElMUyAjIHJ1bnRpbWUgKHN0YXQp
CiAJaGVscAogCSAgVGhlIFhlbiB0b29scyBjYW4gYmUgYWNjZXNzZWQgYnkgdGhlIHhsIGNvbW1h
bmQuCiAKLS0gCjIuNTEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
