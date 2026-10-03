Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15EBCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9E7D40F63;
	Sat,  3 Oct 2026 07:13:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63uCUY6y54YC; Sat,  3 Oct 2026 07:13:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D0A6640F5B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011629;
	b=nwDO2+plgmKKJxNgQaYqhRISmj3Si7Lq3LmcCR41vldBtGxN9DZJr3+jCyUZD1NdblyJ
	 fIhgXblgnd3oXw7Reh7h2c4YOrOmA1f5L2ugzy+JzzB4OvUje2mhebUAtiuqBqJrLSb4C
	 Dpa36MVzZzGmCU2gfBkxPeLZjSg9pEXBtCXVRuH5ULKvoPYgVQoG7h2kUOlL4a9O4/bmz
	 rT8DrJMacuHpIY1o2NMAQBPowbYEncvbDC2wO5H/OxU2ZMfO3m1/5HaLkTb0TfU3cuarf
	 B2Rz1VKE10TaEJOow+ZIzRabt/9ULYOeX5F4GbfEX+UKP/y+Vz0D2uc2venQuUyH3Eg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011629;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nMTq20p2Ns71i5VTCIyOurEPjhGMenzyg8+tUF86+9s=;
	b=SE4tBIizGCv9OTd1I6W/w7Mi0DZM5B4T7utFuHKKv7KXJOWxzAfH7QGHU9BRxVCA5+fU
	 Vk769uwfwIuXU7PuT5ohLUD2up97Y8bqiENP/xNihb3N/tdKdWItAPM8w3SaJrvGcGWpp
	 L1wQ0bo/JK7UKp1Hw7TBJbi70F7gy8ceW4r85HhXcwD+9Se0Npn56AfZ6lBRDCceLY1ng
	 oDrhKUDJ/je1m5p+zT9V/JsjSk7jMEIHqP56uPXDvaGPt87JuKF1AL8gc+gBBuWdokYRH
	 WNWZBzQ+MGe2uW+ZB1m1XQf87hxzfyeCi7gm9FDaFXhnEDzMXxwSrcAJK+nA5orCPYQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011629;
	bh=nMTq20p2Ns71i5VTCIyOurEPjhGMenzyg8+tUF86+9s=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=riwcBHaR/gqjn0NINqfkCyrDpo3CFSgJOoWdIagUeBiDDcasPRggj7IXC7qLrnCA4
	 CjDXDNl6q2Lw9QbtD1GmOXeKLkuoiYU+680xpgtwYBPP+bFG6JY8p/8MRy+Boua/GW
	 oJOTzI+VqKIJ6BO/5sZm9RuvcUvtmKhDgNeY2iaXocKAl5+LZHsEBVydkUzUDhjBeQ
	 rnwaD7jbfkDtrJHz4yc2m3169L71faes62e/qRu/M3cQXUi2BGlUVMkjn/KQuc1/W/
	 cqDMcqmmKq1SkublYUoA2IdAp/rJDJesKMgiiffpsh+4kloQpqaH0CHVrUqxntt282
	 GNxRdnwZEUtmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0A6640F5B;
	Sat,  3 Oct 2026 07:13:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EBFB34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1537D40059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:13:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mlk10NRBWdg9 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:13:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 1F5E740050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011628;
 b=J0EWauehKOn1fHrvwtoBtrvoglFnMA+aG5aCr3urEvORy0HOc1meCpyC+62C9Zs6z46b
 GRVK3PEjXE2ETyr0DzmN9BZCAh813oL/zWIZqesnpLqbaKV7vS1RosvGn6E8kdPKm7g8t
 5CSjzoY/+u1h4G7q2IBkrHXosPFTEMp+xsXRnTIBqgE8wJ9z5g/ssLzSU28qr7qtUpgad
 m7qhT8DETurbY5LEJ/M5r1EACdWuMVc9sqA1BGPsVpPo5fA5puuj04Q2ATJMnvGk+ojkp
 kKNQDXZNW8foYazyOe5j/cPM3h0pwccP3yT3sc1Pl36u/oGZspyNZTXdEaCMUQHGjiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011628;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=sB5Syc5fa9QcV0hJOWOdJPPCcX3ysh2rYclC0bbpRAQ=;
 b=k856m6RH1cMqpbjrXEOq3+VWLfaumuBq2hIL1+AXZBY7+zTMWaSWrHSDkePB85b+fkti
 WCTooipiNMUdvBHfGdyLD60XUjjuwCcZBSv1EAz1dyVlXJUEM5N863cwaF2EoxHdVYZNL
 fzqdI6IkKv2lfNQ0k8zTIClsnOXvWwJP3Q9ieLEWXaxp+nlHpReDPBUZSx8Zwv96IvNHx
 wmvIUk94YyDPNuRU1hPLem5DxXYqruooz9QveQnyLDAwd/xcEF02xUvR9IkLzAbIY94zH
 1sZcGH87lwJgufEXitABfY/5Pir99gNPRNJpr9bIovthN9on5OtDZf1tt3BSZw1NipQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=IWDAt6pa; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=IWDAt6pa
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F5E740050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010932;
 bh=sB5Syc5fa9QcV0hJOWOdJPPCcX3ysh2rYclC0bbpRAQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=IWDAt6pa+mQa7K0PUEKDP1sAkGlWNsbiPlZf9N5yIKc079l6m+xLPholhjdcJdRKN
 8gNLNEVuH/g/5bv5deD7r3e7xh7hAdPhhhlXUxv6wUsjJyT2+8///YwvqmQ0lDPnLS
 R7mcwQsgGn6MhjP92lvod9xq/6mAL/3jcmb1uFdxttmo18xq0Th6+OcUyQaLpTEtQ2
 ZsX6Cq3xWMWy8xZx6owa8xMxRiC4wjmHabEuRdsHGxGV3pfnBJhN60C+VOyTcbnOTN
 dWInYYPdrvrrut3S1IbjqYjPuvSHxZQLB0o6dZJmuqdxfE42rkKjZVwJTN+EIvJL6B
 D6L+UVE43LLMw==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 BJmp5JG6mkQlzupjvPlg6UWv73jQ+ofH6SXKOYYI7tpMJK+o/YcLZi0J/lo5Bix0Ak0UIvB084Y
 bz0qTruEJ4gP173bJPTLoKKs7jT235M17+84VQqV/Cd/ynICno4/O9aV+idO5tWmk3kPlsv9Z3l
 3cpnlYPxn+3QM8K/r7OoZNY91n4f0z3JWHwkXhgQsYUrt/ePHQxRJX2r6Pqmzjr7tnZL8Pk8adS
 /3w+owkmT8bLquLOTVBiPmSGEoDCiIqdyv/GbWr0cbjskjGKbUZhNRT2RLqxtoqWcRPg1X+gX0H
 y6H1Vn0kzolgFXa+7s9OOAw6Z8EX2QxdlYsub+hRRc+KvA0v96Da3fPSk7e6g6c3yqxgW4iAPlQ
 BElPQW/duWyez0fpQaPV33lBplwIVr6WKpSmK6T3zYZ1vbA92Q0cA+9R++2gDtYdcTLUArI1D6M
 lNKFFmJPnOBLV4HVk5rXqE/iHEpzbHM0z4PMnAjuJzx6yFMe5dzcN1CAfB2x4jx80Ya+hRr8Uw5
 OzoqOm/AzxJxeKm9ffQVhBm7Vjjl8GYRYYQc2UzdoVMIdJTEINj6JJGdZD2CCmgZbmQbtTN8uOw
 Spe2ZUh7B6P8k9I+NG3swMmD1KK/ZCXQ9aGBZ7asdMYHbDFjv5S2TXqX2lLWOLMi
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DEFFDA4C5446;
 Sat,  3 Oct 2026 09:02:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtki-000000007Zo-2fsD;
 Sat, 03 Oct 2026 07:01:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:09 +0200
Message-ID: <20261003070128.1295458-97-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 097/114] package/python-txaio: bump version to
 26.6.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-txaio/python-txaio.hash | 4 ++--
 package/python-txaio/python-txaio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-txaio/python-txaio.hash b/package/python-txaio/python-txaio.hash
index 7e729e969f..ea3d8fdc62 100644
--- a/package/python-txaio/python-txaio.hash
+++ b/package/python-txaio/python-txaio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/txaio/json
-md5  86e8dd45a2ef07583fd85006cebd90e3  txaio-25.12.2.tar.gz
-sha256  9f232c21e12aa1ff52690e365b5a0ecfd42cc27a6ec86e1b92ece88f763f4b78  txaio-25.12.2.tar.gz
+md5  e0146234551659a952c33e04019b08a1  txaio-26.6.1.tar.gz
+sha256  3ee900b2331c93457530fddbccc1a320c4e2d7ac8f9073d01c3fbe87762ccb35  txaio-26.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  e7b0171093d8d2cec2db922db6d7634b5ddbb0338de111b38857d3160a7ea770  LICENSE
diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
index cb29609254..af996ac3be 100644
--- a/package/python-txaio/python-txaio.mk
+++ b/package/python-txaio/python-txaio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXAIO_VERSION = 25.12.2
+PYTHON_TXAIO_VERSION = 26.6.1
 PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
-PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/7f/67/ea9c9ddbaa3e0b4d53c91f8778a33e42045be352dc7200ed2b9aaa7dc229
+PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/49/de/52729cab9d2c8de679ad015e87f11f69e092d6fb3084eb9a39735df09ce7
 PYTHON_TXAIO_LICENSE = MIT
 PYTHON_TXAIO_LICENSE_FILES = LICENSE
 PYTHON_TXAIO_SETUP_TYPE = hatch
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
