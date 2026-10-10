Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEBECA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 14:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA949608E9;
	Sat, 10 Oct 2026 14:37:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cITZhy-E3mVx; Sat, 10 Oct 2026 14:37:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F1F3B6064D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791643044;
	b=fYxuZpPCX7v3WFgF0BujhWJTlqeY4MQ4wT1mJp2nVSzSy5vXcUgD04Aw2Nvy4p8wy6hp
	 ShBcHtUHPANT+X9nUZeRCC4HAzCdnMe9ko3tJCyKMWYl1s6ccvWt7mWg1qTCpX3nRP6Rq
	 hmdF9jqVFHwO2acpCGoQ3HvqOWyAFfJfELpeobf0BRzAk0QLnw34v2F+otA8E3scdMmyJ
	 9vuGe9ybQcT9gscfxi+YIt7ZPbBQun+syT7Hx+mlEeuZic2dNYDUPL5LT14i9zzoms02x
	 fGErsqOl5scj/mbz3gyWloX8kZEJREx6q38G25e58n9Q7C59/38qKgyJPgXEklIlFyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791643044;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-MIME-Autoconverted:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bM5HX7JknA4rTrBgWMKJOAYrpVzQdcUTXI+Gxx5jsoE=;
	b=Vrb0bIMNWfRR0XA5ApyCkYsygCzA1Zwo250qhEMYS93I+MdiO2evbnVf9n0PbcAwPHp6
	 0k9syRGx2zpaGg3By2uIGbXIPFi/YH9Oi60q2azkimv0Aax/5HMWM6t5RfAa8BsUP9GNV
	 3G+I+ah3nDwYA19+b8Qa8/AeLTrOyeSIbRGpvzpenT+GeoUJu95Zy/pkiRdRc5Wxiaxkp
	 WKQyU+KvHKcoZ7iB7B8B8s9NpBq2UQ5lY1nO9PEk3r8vYUlaUzDNpw+QarC1oo3+YmPf5
	 brc3+zYYZa4yhn6tu2NWX3KIxUJnLJkRdxXwUXP5rKQ/3KNlUl5V5oC8gqW2FheSK6w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791643044;
	bh=bM5HX7JknA4rTrBgWMKJOAYrpVzQdcUTXI+Gxx5jsoE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=epzMgu4nI0X4VLMTjudYf51nseWhNYCmG7oGmFgNBNiluBbCwDizk6h4W7PIRO5C+
	 19uUC+DaR4C5Jh7YRkK8V4h6QnLdWCSt1TQYL1iSoxCEHfazr7ar6iKEjLBRSNs3LP
	 +osbCfhYbIFIJYts75Jvf9WCQ68bHRP/6TXSNYkRXZTsbHnZRjR6GH5xNbXHC3nBf4
	 3LaPEUk9D1Bdedo9m5QxoD2YVHcHFodUMdDLNcfVR6DYin1/XLt9Pu7WKwssyGq0dW
	 AciFENL31UbjIJ9wxwDdhF1QycD3tpEDNK2nV5DDfcQaLiqlolLQmTaId/rN/9KMy9
	 ShNn2KhrGSMCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1F3B6064D;
	Sat, 10 Oct 2026 14:37:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D7AF9D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E45F2400F8
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBVIuqkmjhxW for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 14:37:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9C03240071
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791643038;
 b=kG0OaeRepOmgZnrhjXk2h2aygPRx1VlSopvBH86kgzFBjWPBYUmd7033Af1/kXdFXVml
 Novvx66sKFtrt3WN1QAjj7+hdOrc0zdMBcuFYbzUJjLbTEetcbnY1iJYQ9d6hxDyf3fAG
 Muiotpl74kN9GDhS6J0za45Mli9mE00WGRF+MMMfCClZG8nVKVk/TVGmpT5Y3OKryUHDv
 LLWb5PKMsvy7DFz/vlbcLqQUHMeXOpJcxU1wwm97Hivbh2gkACk496UXju4B5Xhy7nt09
 1J4yGyxYMFXnOq12bgd6+f/L57ZMGeRrjl2MWI1eYCqG4rA4+RpaNx0p+sLht39F5ZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791643038;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-MIME-Autoconverted:Content-Type;
 bh=1blT7pQgv1lsCRZA5rydoMNq8AFBwqGg2yw+Tv58PwE=;
 b=i3eSwjH4lMt+KTgR/CQS6enXsDqHDkfaVlju0i1kj7kb2m+2iCNyGBrzFdjscvfSp6BY
 dCSyO5B2P4iw8mnnpKQq9o/fkMqEbLXnmAF4JILbSUJa+NEx4zuonXQhnYfIhgEnFzoI0
 ZAhB69ER9JBJGrzR6iqtyxiKNB6BFf4Ay1W9SEnGNH3T5aC1FjjQvttU8kwh4I8lWAIAJ
 WJU51812yRlDIWeQ2ixlLWCXG8KWHinhWdKyJWvNi73IV0vNC3vf66Opm3WUE5G3VzjrE
 e2uosm+n0bZVOA19lxkJ5c0kLZSUwWg8tI1YhtlL969REZbAYxcNcIqcks1sVrDKz/w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=M6PvXCnc; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=M6PvXCnc
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C03240071
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:37:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=M6PvXCncjh/LSRrWjS3wV3Nzjtgp46jqY4KimC0Hcm2M9/XxDmfjcam5axqwtCzclVlwO0eCI/4nwjVNWXNjCRsn6nmQ7J3BvDhF1p/M07gd9CCq5l1N44TArTQAkQeYJ2FJpWR9/KqYasuZk3P/mb6zbP8bbRGFS6444UXD/qyJ0zp8OtRG/gg+NPgKT2SEAe3R0tOJprbRkgvNuQ2XLBnCI+I9yqDmcMGBPYrc12YmtyKyvG5Ou2Wm1xGPePfAP28RrjqSOyGfG5wKRfcl2JGL0TXkG7OGJmT/LhdhqS8FOJKWMEw7/paNcIKgVgkNpw25uX9aGfqFs+sFZTEHaQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=1blT7pQgv1lsCRZA5rydoMNq8AFBwqGg2yw+Tv58PwE=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -861076102; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 10 Oct 2026 14:37:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xFYCF-00000001lXq-2PTT;
 Sat, 10 Oct 2026 16:37:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 16:37:04 +0200
Message-ID: <20261010143708.421070-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH 1/3] package/pkg-generic.mk: drop RAWNAME
 variable
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This was added in commit 7a41cbf938 ("package: fix patching procedure for
host packages") to figure out where to find patches, but this was reworked
in commit 99d4180eda ("package/pkg-generic.mk: factor out patch
directories") to instead use <FOO>_RAWNAME, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 09d6e5b20b..f8ffaa21c7 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1085,7 +1085,6 @@ $$($(2)_TARGET_CONFIGURE):		NAME=$(1)
 $$($(2)_TARGET_RSYNC):			SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
 $$($(2)_TARGET_RSYNC):			PKG=$(2)
 $$($(2)_TARGET_PATCH):			PKG=$(2)
-$$($(2)_TARGET_PATCH):			RAWNAME=$$(patsubst host-%,%,$(1))
 $$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
