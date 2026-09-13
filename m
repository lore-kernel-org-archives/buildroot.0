Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC7DC88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 12:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C85880C3D;
	Sun, 13 Sep 2026 12:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Bor_NY7K2nc; Sun, 13 Sep 2026 12:35:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B5D2880BF1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789302911;
	b=WoTm2I9A3hyFdCQDZGqBwAohpw58i2IOlnYoD1qDaLr3ag6X7AGOzL4yz6rjzeaoRCyG
	 uvHdJ9V8o93vaG2A9emIXmYEcVJgybAl3RmV9p/px96XGf1Ur7EF+x9QJUf1cNZXPOWFD
	 APXCj5kzGUEemYfk33HRuPK5BVrjzkttbLzdJKz6LMvkJ/zsCbIa0ZhijI4dLZPA0VzW1
	 VFazJ7BecPZJblyOOYfZQ29ZC6tkZLJMdAGvRb7Cf1GI6h9MMuUt9pTbMilyWf+orMBiI
	 VZLFRaUPVyR8v6hWjVE7rKRIFGgedhVwOg2LDG++ckyk5a4lPBBd6eluSNg+LvJcTyg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789302911;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ztjZ3QrEx4xnWYlMwH8ZAXI7XKtlbq8r0mpZPXTfg5A=;
	b=IKiKbJtGTQxyXR+SccYFVIZ4N7fTAIvWvKqYckYjVYxvSfxv5IJhGlxU73nwCwGrDOCW
	 FGAySrQDTF/+BZcL1D9hhFLgSoBtse9gFSM62gCPQOLFxXiCLLPL+s4qSQXUuc/4am7nJ
	 DhqRDp1+dCwCBjT3O17/KOHGr/vjml4rscv6NlFiCM9pqXuoZ2J8KvSarKWSHkNUYdggC
	 5wCXV81JYX915nxeaGlDzySIb4udc1oNq4tQR0vBdxOVDEjJg3l9MnJK3pacWGFbQ4EZJ
	 sG1FbXow5h75BGrEBFr+nsPLy9y5oRnY80bpiq5aMm8V5UAJtUtu1ty44x3RS34Gd+w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=IqQfIW1T;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789302911;
	bh=ztjZ3QrEx4xnWYlMwH8ZAXI7XKtlbq8r0mpZPXTfg5A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mf2sE6fZ6TiiZwAZpX2ajI1QJYCxiRoYfcn+QbYWL9rg4LiEkdTROAKM43PYVV5UG
	 BxcpbOfMEpVMP7Ime4B2q7J4U++YUzM8xeyJbEGaRPprFBzoJckt6WKtKa+w1GSK+j
	 Hakx1tGiA6pFyP7J6sRaofSKh9c3esvfXLrDcqevL8B8s1a0y7lUKhbsUTvDvJGcB8
	 7fCKxyVkEre/oqKOh7ivYSiz3RZmQFKzf7VTkmDDy1zCWdrQgBn0xNo7v9QiUYzkoK
	 RUn2tvWzVjkJBh6gT4A3ZWHiVIfcoZoAMzgCqgzY1gDMMzDl9w0djdwk/QaFjQhz9Y
	 kzAACaM/FNdsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5D2880BF1;
	Sun, 13 Sep 2026 12:35:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3425A24D
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 252F180BF1
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJS8zuPlVvyu for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 12:35:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6750880BEA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789302908;
 b=ioTHS8Aei64fgTQlK7D9PBA7VCboska5A6qR2ctjY1/99zEkrAuQLlSCQ8Ku810eNAPS
 dom0RotiylG0Ldtae7aUWrb5IYVTMVf76MQt4ZpO2cFQ0OcoJVHhil4bo1AO2jcZO41oh
 3Hc/t1SwvL21d1vFFaSqL3b3n3Ol9CWWo+tjP7Op0L+AqXCjASFaah758ta7pXBuQToNP
 FqqoGEpOWumia3V3YQSCnTNrmPkuQmpXa0cYYUe9xcQiK4hw9foe/cyDUxAyRRysrA0bW
 o6KwG0zeYfR6Xyx1IVPow69L15iK5ONgGZtKPFMH5VVOAxENY5EBWJ2X5Sk5PxIMqPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789302908;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=87tFvmQZFHbzDUG0vLHctcR6dwF70RmL5AMEAoYmzUE=;
 b=U5jY7bVG3/muBFO7GvWQ3g1ew8ANOI2t91z3j9YxfHuRiYIiiL0rmEff2vzOwKfEAe2y
 eSI85cKYqpw1mH0DvB20HB8o4Cmq1+A028iMUzyM+nhR8O16VRNR0Q/2ivRvza7CpCcaD
 s0k7u769cn3MFRW1pGcAlgRmGLbvtKq9RxTxOZMbLmTILkqGgPmBFvWk/y2q6eOpmdX3j
 4iHyjD4XPjKkfePnzWATt+eDAO3cfUq5JhVEe/ZYE1ME/CK0vGpV/zSAA+wlcb7TI8DyC
 MH5oETpkpsXVAsNh8t7+ryzYuAqjIMc1Qb3lCnlhQU1KClFTdZcWRy6VwukASdeer0g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=IqQfIW1T; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=IqQfIW1T
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6750880BEA
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 12:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789302903;
 bh=87tFvmQZFHbzDUG0vLHctcR6dwF70RmL5AMEAoYmzUE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=IqQfIW1T99OtM23tV2hSNETYTKp0bU1dCRxFgxzaM2WJq+mQxnKRkPA1L0SxUVb2h
 rxKLpWPtb7iYw/fjfHiNKQXw3Hpd2UN/0yEJqu/y6Cms6xSKMlnhepFe8dGNWWe90U
 w7HEnYGtMdsFETHP9fmjrXGt+jIbmdJdC4fqVfs11nH6K72Uk8ejyaE4M4UomSpCcS
 gss5rX47p0nFGq5/HTycBEaC+us+grwxEvG40G1xNjUIpnr1gSciuV/PLi2hHfpoCC
 DBVLlOaR3mY37l77M5DVk/taAJn7S+NmE8OxFsOGDe+Gu0ZFmuFDNWdxP39w54fbNT
 Igu3yk6LZNcPg==
Received: from fli4l.lan.fli4l (p54a1b732.dip0.t-ipconnect.de [84.161.183.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EBE2EA4C4130;
 Sun, 13 Sep 2026 14:35:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45812)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x5jQE-000000000Db-2vBG;
 Sun, 13 Sep 2026 12:35:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 14:35:02 +0200
Message-ID: <20260913123502.1315716-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913123502.1315716-1-bernd@kuhls.net>
References: <20260913123502.1315716-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 2/2] package/asterisk: bump version to 22.11.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://community.asterisk.org/t/asterisk-release-22-11-0/114073

https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.11.0.html
Security Advisories Resolved: 0

Switched to tarball provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/886f17de375f8b5e23d012054e90d79ff4e49493

with the exception of
bootlin-x86-64-glibc/build/asterisk-22.11.0/.stamp_built
https://gitlab.com/bkuhls/buildroot/-/jobs/16469877767

caused by the well-known menuselect bug:
https://lists.buildroot.org/pipermail/buildroot/2026-May/801432.html

menuselect/menuselect: error while loading shared libraries:
 libxml2.so.16: cannot open shared object file:
 No such file or directory

No new build errors are introduced by this series.

 package/asterisk/asterisk.hash | 4 ++--
 package/asterisk/asterisk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 1bd76ef865..de4da24559 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
-# Locally computed
-sha256  373c98f4d4a1b923b42def0aee03f4e36aca9d1c244a8eeda646da8a97f89663  asterisk-22.10.1.tar.gz
+# From https://github.com/asterisk/asterisk/releases/download/22.11.0/asterisk-22.11.0.sha256
+sha256  3bd5ee040509a3d3cd9b1ba9520c18e6ec0a7e7981ca68c457dcd36ba3c54d94  asterisk-22.11.0.tar.gz
 
 # Locally computed
 sha256  04b2eb1f0f01aa0ad1945b167171843448a51aa6b7c3e806496d434f13a112b7  pjproject-2.17.tar.bz2
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 8d03f2bdde..7c5fdbaaa4 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 22.10.1
+ASTERISK_VERSION = 22.11.0
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
-ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
+ASTERISK_SITE = https://github.com/asterisk/asterisk/releases/download/$(ASTERISK_VERSION)
 
 # compilation with the external pjsip produces a non-working asterisk, which
 # segfaults. The reason behind this is unclear.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
