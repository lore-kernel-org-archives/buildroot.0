Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1476C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 801BD81097;
	Fri,  4 Sep 2026 16:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EAlVJDPbF_xv; Fri,  4 Sep 2026 16:54:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9A3AF81099
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788540892;
	b=qqN1Dg+xOh5mdbt165BJNZCRoQ40C0NcLd72YQ6yie2x0ieXOhnoglz6rG+SYrNPvE9P
	 4tCw6yKpleuXh358/jlFDzCBNegoZMSI/MWJA10+0I0IgDT7/oxF7qT3pjpGAgy1kLvLZ
	 cdY3D3grNxWOEhfrVFEjY7nUxe3Y0lCX5msor+xW9pevxBNogwy1/9tNwXzsgD+Q+72S4
	 XlBpdvUUQj0Bpt8Fh1HlnUNcRRz8IzweP4fFFlxujimV/pquLFxmH8v0yj2az2EbFa4c7
	 xrXKKjlfzrZAdJN4/+bSFglyAwACLVbnEcaXZOOGRlLV5K/KrHWEPcE4dsMRo5skhhw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788540892;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=u1NWKC89t+4GXSzlLDzw1iYclRVPo8nNW2t/WYfukAc=;
	b=fVxjinNozsu7ICWY5tKr1kA0ThYXdO7ZjFXNc8yy2f5yBO8KytutqL1Y1uDisaJDtmsa
	 m8TeOMdW5kILau+NERQn4DixSC0nlGLsy9DtGcNKCaNCO3zcMYEBvmhEFpzCKu3aVLaED
	 xKcHIebKVqyvdjxCAPPOjJZeHuZj0zSP1wQLdFwz507N8b/3/0A2ehAcpuAcy4Mpfa4/i
	 ROEUnCPzotLIWaTKA6xLBDkew2qZ1en+Ch3WBHSSDQekVv1RzPKx2kOTtkG9vN28ClV6G
	 bJD9IHbY+faY1dTTX1TqVgNFJrsGOsBj75I1l1liqMiTDWW2RPkozjmnBGbvHw3Htpw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788540892;
	bh=u1NWKC89t+4GXSzlLDzw1iYclRVPo8nNW2t/WYfukAc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Rpv3Sqa887yQLEPuUqUHH0UHq3SQSQy+zyzqoFjLXl00/YihDs8wOMa/7Vct+oh0x
	 ug8qr/8S0Cj+d8mhiwSLXSkXF+AjKlIHNwxwFX/sS39j6JQBh5icXoqt1l1lL+8H7x
	 tEf7Y4VNQbScVd1/T5N+eDJMx4c1DAEQJ/wO06gJX7/reCFVJLtQxXGO+zd1Fj6y2D
	 q8EYV+DR5SXihZ2jcgBhmszHTPFnqMGRiXt7NCgTZl7AodxlQANyF2Ix0FIq2cKGHg
	 JKJdu1I3CyZpe/3DJ/Eu12t5Qui9qe+S1ZJAFryPBUWLxBA1JKpAmwRwBpr8QQTlfm
	 y5OpAWC8hHzzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A3AF81099;
	Fri,  4 Sep 2026 16:54:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 63F48388
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 559F140A84
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8FAybINUY_ev for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:54:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CDF2640A7B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788540890;
 b=G2FT5Vq1k5L8cNCRdo/WgB7zxIZy8tSNgUaSLitPPqfwM84F0fPhDReiwT9tb8zaj33u
 Z+9CnmBdzl4zptnDWcYhJ1IIb+M2zhp4QAvUrHvGPDp8xYVsxJIrbUOka00oCs7ry0Xt/
 Lfj26Fw3QhOugUJFC/dDCldNhyNYNEepRkUiLMQUewsT6IlCmiSdTfT1R5M9LDX4gJWAP
 WhbLWy0fwjsKpbNNuDqaN5qMB+6JAZlZQx5cHqw/RZBBvJBv0/D/UZoSK4H69n5GJYhWE
 UGVBiUtr6oSnmelzZvqCCY/5k8ZcRF4JfIbgcOg/SfxqpMJZ3jbCMSLNFl11zDqEjoA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788540890;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=exs+VVeGkOSnmRyUG4uEPlXDZmuGasv6yZR8BgZaVfY=;
 b=AQtJ1yIZHpHWOiZN1XDpWa60cDw45yzE74k/I22cVFVP++TJxynOTHqHVhmjoX3cvwod
 8pEsDeChXJFefbVPrfTQq4LPpLvfSn31CUJ2V4oEOzyq/4hGJu98gEN6eO4MkiujYVDvs
 TW5Uk/b3JX/kqQQ3W8DtxsRPoVAasd0e/+FQtdMHBG+0lmJJqpCstYXFWZ9MgvXTZuyit
 kQ4XyF/NpBKmzkJZB5OW1/jStoFtXC015gPPPZwnyOijRlwwqlM5CsEQVg7fe9ca5s72Z
 oaDuWjbkmOnd8hG/SfioPE3NVx5Ok3YYUp/v560H5UK+QWQEPE2X82sHef2zxdwLOZQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Rpscg1lr; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CDF2640A7B
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:54:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHXFx-1x79l80GnJ-00Cmol; Fri, 04
 Sep 2026 18:54:47 +0200
To: buildroot@buildroot.org
Cc: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Fri,  4 Sep 2026 18:54:27 +0200
Message-ID: <20260904165427.1893579-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:M62aSt9I0TWu/8p1/vxquQyezo3kSC+cV0qmyIpt/thsOjE0jYu
 vFPtDb5j1CEpG/M7SeJkIP+YqvGgsPcFWr/E1g1Jp9188V1rS+r/us9B/NoTaKSDQxSddnn
 IHb13kGNHyZL9jUHdm+mTIMT06IFgubas9ZxTOAC4FdNPZEoqG61OxzYSHdKnkvHv9IdPAW
 pGGNp8K86MNuYEoQu7qAw==
UI-OutboundReport: notjunk:1;M01:P0:8aTaxj0slbc=;umbljR0UdhRnohBj3NSIWPCks8n
 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
Subject: [Buildroot] [PATCH 1/1] package/e2fsprogs: enable libarchive for
 host package
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

mke2fs need libarchive to populate a newly created filesystem from a
tarball with "-d tarball|-". Enable it in HOST_E2FSPROGS_CONF_OPTS,
and add a dependency on host-libarchive.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
I need "mke2fs -d" in a post-image script. I could add a config option
for host-libarchive, but it's not a heavy package, so simplicity is
probably better. :-)

 package/e2fsprogs/e2fsprogs.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index d9ebf4c73d..e9dd367ce9 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -16,7 +16,7 @@ E2FSPROGS_INSTALL_STAGING = YES
 # This prevents overriding them with e2fsprogs' ones, which may cause
 # problems for other packages.
 E2FSPROGS_DEPENDENCIES = host-pkgconf util-linux
-HOST_E2FSPROGS_DEPENDENCIES = host-pkgconf host-util-linux
+HOST_E2FSPROGS_DEPENDENCIES = host-libarchive host-pkgconf host-util-linux
 
 E2FSPROGS_SELINUX_MODULES = fstools
 
@@ -34,6 +34,7 @@ HOST_E2FSPROGS_CONF_OPTS = \
 	--enable-symlink-install \
 	--enable-elf-shlibs \
 	--with-crond-dir=no \
+	--with-libarchive=yes \
 	--with-udev-rules-dir=no \
 	--with-systemd-unit-dir=no
 
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
