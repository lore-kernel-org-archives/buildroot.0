Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C887CC88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 21:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8778406E8;
	Sat, 12 Sep 2026 21:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6GmgIORrthyL; Sat, 12 Sep 2026 21:09:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CB294406E3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789247368;
	b=B6Q13/5Vzy1lagBmQHZObYSbZH8nsRfD6LCodUX9kl+U3T8Rl6AyBWBi0myyHGmKolMW
	 uiZImtPMLPpgUCpiTEp1hDjU6x/O/J5lfVLfDxnp71yF4DGaH9mnAgykRy6triD+rXlRl
	 8k9zoXbjnSel2YMC3koX+Y0aYbU2tLG+dpR5kmV9Emqp1g9iuFPkt5vdo1TByMJmTn4RQ
	 pxMfTCnO/Lm8TnbMFoHT6ZQ/tGYB3MZ7JQfTQEiDfIXs3c72oiM3ONW/lBPYI6TA1FwVf
	 Xov2bTyw2+XKMTt4oQfzAIOs8rkcRvQBiMSAa7e/SLH20M6QJcZvy3CrAdKgwYWP+oA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789247368;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:X-Last-TLS-Session-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=t3+3cmYaODufxqTK3SzlvTkhFRAgxKR8MJYXcQdyDhc=;
	b=UyQ1GXa1y/y4gBSk40CfUEkqyc1RsHye0bpvDUG7bFjz/UrHFwb3pxRSc5U9umzSRBtw
	 MxsP6H/qgsrVA08NOclVtGsl7Bw8R6EmApIFgp40GygGhQWdLC+Ctt/B12RWiJ5mqiSrW
	 6bgaFabBgN0QJY4Tm1ZZ2WRDj6pTPg91RnBN6u3oCSVU2C7ICUSj2aR6Zqk1i3l23psLf
	 ljgkUB+C3VnYsblfymvhE8WuvAV8etT/MwOY5nDkkOPJaKGwgurIk3tJye6z0VwIPk68m
	 fRqIw4r7pSKBGPRR7HlPh9wzmVEqj5LZ01nvgRbY5f/lD/YZjT86OOzzIQoAPmPFWxg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789247368;
	bh=t3+3cmYaODufxqTK3SzlvTkhFRAgxKR8MJYXcQdyDhc=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=BF8quHDxSVln+KsACU7+JraZA0cAQCBCehJ5vljV3G2PGcA+ven6tAL6qm4U4aie1
	 flRelOWVM5wU3i/Pp9exdWP48pIqOr+zXwC7rNqxXeritRYkqR1YtXkMAaKTqK6bx2
	 Bq2bf/+oq2LBbpoZXcinWup7UU3Ag8JZdmxrP39nhGxid0MdWwXysPliIVHWMwLkS6
	 9EgYLYc7DeI5mm+jUOXQUiljOpHX9PhZ/+IxmwLjQZteXScZgCtOfBLDpc6Kgpim3H
	 dBFrpJfp7GcSXEB2Tm57qrySP4bkKOqf/hIJc7wyIE2hLRVARMwrF5t+Nu3NzjXAff
	 DVvujC6GcBU2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB294406E3;
	Sat, 12 Sep 2026 21:09:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 631C423F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 612BD40698
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:09:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y_ohjkK5qFyx for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 21:09:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A2F5E4068E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789247365;
 b=BAVc8o9dO7Kgt11LgBmt5pCu1polJlgXsTJOjMekXHv5/1M8USD2Gul+M/vKMkuC//9h
 cZdTPrzfbQJnAzyzuZ9TQiHawXcdddVD8SDA8kPbQWsOz9tVUPH7L+ZJkmN5f6J9oNbfs
 1gQbpyLLDHjDYC6si8z42Ppuz1CRHPov2SIFP+btxQXOQ6YnlopWpBUkrkV117gj3Dpz7
 g+TZ9yxXNJSNxAdOPyvhXHkTa/uXQqYFJgalgSITapqwXlZoxhY7S7KaInkVo/iM5otrC
 AwHVXDRRAIYzT/aAGtPtUGWqHXk3EKlweZyZesS7Q/nzkr6t5WFZ45YCrAbmYaeorXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789247365;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=5+ABiEYceZC2593Bl4d9bSjFZZcB2eCMCw8zoYd5Gjg=;
 b=I88WOOAQhB0+ns8TF/3ArbtFudR4gI2FG2F5HZ5GWAxNEde1Tm0i+V4FQRGz+pWt1R0z
 vPsBDtTYi+pY3lm+Iog+P86DZB8eupZtVJuhOuaXbY8xs22z5x+EG4EztMjxdaPPnPX8H
 Ac0RsAKMOy2TQf0XzdV6tIp2HVSQ+G/gj3r9+zzG6dd416rdKjBopM6ZLX5xsEwNSbsvn
 4AvEymw3rI8Vu0JbnSAxho64ECl3EAMFePkkd1UadMcU0HBJ4w76ZItNsY6nRlhIyNs4C
 sV1fF5Qnc7Jc+FWOh5VND0sS8pIHZHMMQcCTsvpx846n6e2zkS8zHTPVqr7dq1OzMPA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=UbAMs57h; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2F5E4068E
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:09:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3E93B4E402E0;
 Sat, 12 Sep 2026 21:09:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 13E3F60580;
 Sat, 12 Sep 2026 21:09:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 45AA011C7AFB3; 
 Sat, 12 Sep 2026 23:09:18 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 23:09:09 +0200
Message-ID: <20260912210910.1553765-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912210910.1553765-1-thomas.petazzoni@bootlin.com>
References: <20260912210910.1553765-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 2/2] package/python-grpcio-reflection: add
 missing BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION selects
BR2_PACKAGE_PYTHON_PROTOBUF, but forgot to replicate "depends on
BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS".

Fixes: 3217fedcb8c8006809c1a3d214c97597677a07fd ("package/python-grpcio-reflection: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-grpcio-reflection/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-grpcio-reflection/Config.in b/package/python-grpcio-reflection/Config.in
index a0ca35c286..1e35c82a9d 100644
--- a/package/python-grpcio-reflection/Config.in
+++ b/package/python-grpcio-reflection/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION
 	bool "python-grpcio-reflection"
 	depends on BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS # python-grpcio
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # python-protobuf
 	depends on BR2_INSTALL_LIBSTDCPP # python-grpcio
 	select BR2_PACKAGE_PYTHON_GRPCIO # runtime
 	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
