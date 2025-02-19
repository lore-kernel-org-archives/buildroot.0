Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54401C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 019C76178C;
	Wed, 19 Feb 2025 08:14:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AH4ycwDK6QjO; Wed, 19 Feb 2025 08:14:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2734B7077D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2734B7077D;
	Wed, 19 Feb 2025 08:14:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2340FC8
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06F366178C
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Dmw0oZs9EV1 for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:14:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.110;
 helo=smtp-outgoing-2003.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 52A45611DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52A45611DE
Received: from smtp-outgoing-2003.laposte.net (smtp-outgoing-2003.laposte.net
 [160.92.124.110])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52A45611DE
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:14:20 +0000 (UTC)
X-mail-filterd: {"version":"1.8.0","queueID":"4YyTgn28dvzWf0T","contextId":
 "04fb1362-d42c-47f1-a608-8668833c268f"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0107.laposte.net (SMTP Server) with ESMTP id 4YyTgn28dvzWf0T;
 Wed, 19 Feb 2025 09:14:13 +0100 (CET)
X-mail-filterd: {"version":"1.8.0","queueID":"4YyTgm5ntRzWf0M","contextId":
 "1e01bdea-eb37-44ba-913c-e2781c6040ce"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mlpnf0107.laposte.net (SMTP Server) with ESMTPSA id 4YyTgm5ntRzWf0M;
 Wed, 19 Feb 2025 09:14:12 +0100 (CET)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
 by romuald.bergerie (Postfix) with ESMTP id C7A3964048EF;
 Wed, 19 Feb 2025 09:14:31 +0100 (CET)
Received: from vincent by radicelle with local (Exim 4.98)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1tkfED-0000000024s-4Asq; Wed, 19 Feb 2025 09:14:45 +0100
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Feb 2025 09:14:44 +0100
Message-ID: <20250219081444.7981-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1739952858;
 bh=3UEkPqGwS3NwgIwkB585WBJxxcjTD2TqDbWthCDJERM=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=EZwKwD++BvMW1y+NEUZ0yuB1igUjfQ9dgPdN9B67F1tYOILzxeN/dAbRoaUpMjuZKzAg/AKpI2NlP/6+HJcmKEZstbBtoqoKZzeth1fwoQjUjh+4Mu0Kp5Q5gJgH/jNwltZOMsrlJAVPFiqmS1gqZBnaO97F7V7jUvtucu7kvMeI4dKz+dMJlgkFC8RCywjeenn48IT+sm8vVNWgV+q1dH9pykrjIgAFbLLAcG8USHAizwv4GfZwpnyH8rraZOwStxIbbN+bu2muvpUBG28Ubneo2MTU2alAV4PGPuFuYj8YZemgZMkl6RY3+MvDG+H0013pJtN/V1KEU8QR5FflNg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=EZwKwD++
Subject: [Buildroot] [PATCH] boot/boot-wrapper-aarch64: bump version
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

QnVtcCBib290LXdyYXBwZXIgdG8gdGhlIGxhdGVzdCB2ZXJzaW9uLgoKU2lnbmVkLW9mZi1ieTog
VmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBsYXBvc3RlLm5ldD4KQ2M6IFRob21hcyBQ
ZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Ci0tLQoKCkhpLAoKVGhpcyB3
YXMgdGVzdGVkIHdpdGggYXJtX2ZvdW5kYXRpb252OF9kZWZjb25maWcuCgpCZXN0IHJlZ2FyZHMs
ClZpbmNlbnQuCgoKIGJvb3QvYm9vdC13cmFwcGVyLWFhcmNoNjQvYm9vdC13cmFwcGVyLWFhcmNo
NjQubWsgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9ib290L2Jvb3Qtd3JhcHBlci1hYXJjaDY0L2Jvb3Qtd3JhcHBlci1h
YXJjaDY0Lm1rIGIvYm9vdC9ib290LXdyYXBwZXItYWFyY2g2NC9ib290LXdyYXBwZXItYWFyY2g2
NC5tawppbmRleCA5NWY3ZTIyNzYwLi4wZjQxZDBkNjdmIDEwMDY0NAotLS0gYS9ib290L2Jvb3Qt
d3JhcHBlci1hYXJjaDY0L2Jvb3Qtd3JhcHBlci1hYXJjaDY0Lm1rCisrKyBiL2Jvb3QvYm9vdC13
cmFwcGVyLWFhcmNoNjQvYm9vdC13cmFwcGVyLWFhcmNoNjQubWsKQEAgLTQsNyArNCw3IEBACiAj
CiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1CT09UX1dSQVBQRVJfQUFSQ0g2NF9WRVJTSU9O
ID0gOWYyNmExYzFmMjdiZDZiNWI2NmMyNjUxMTQ4NDgwMDdmYzIyZTRhYQorQk9PVF9XUkFQUEVS
X0FBUkNINjRfVkVSU0lPTiA9IGFjNjc0MjUyMGRlZDFkYTMwZDUwMGY3NGU4YWZmZTg2ZTI3Y2Fi
ZDUKIEJPT1RfV1JBUFBFUl9BQVJDSDY0X1NJVEUgPSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9tYXJrL2Jvb3Qtd3JhcHBlci1hYXJjaDY0LmdpdAogQk9P
VF9XUkFQUEVSX0FBUkNINjRfU0lURV9NRVRIT0QgPSBnaXQKIEJPT1RfV1JBUFBFUl9BQVJDSDY0
X0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UKLS0gCjIuNDUuMgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
