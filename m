Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B31C3ABC0
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 17:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1F4A60B1A;
	Thu,  8 May 2025 17:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGL1RUtzTYbm; Thu,  8 May 2025 17:36:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E941F60EE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E941F60EE4;
	Thu,  8 May 2025 17:36:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EAD5015A
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC7A460EE4
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0qgEl4C63HBL for <buildroot@buildroot.org>;
 Thu,  8 May 2025 17:36:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 42E5960D66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42E5960D66
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 42E5960D66
 for <buildroot@buildroot.org>; Thu,  8 May 2025 17:36:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 7740713F854;
 Thu,  8 May 2025 19:36:50 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 08 May 2025 19:36:50 +0200
MIME-Version: 1.0
Date: Thu, 08 May 2025 19:36:50 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250507201428.1506040-1-thomas.petazzoni@bootlin.com>
References: <20250507201428.1506040-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <ffba6a4d44f51dfab5ae4c81acf2be85@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746725811;
 bh=8CfynhMhqvWXACzXvVsf9PiJ+WuTG4AzADkhWGepG08=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SLpEpeEpJyl0CPMxj63h58ucLS0IxKj9rQN+L3Y4jLfJqp+qp4tjafvICoAAxbk5P
 mFXCwWz316us3hHPHM8PEhJnu2LnXAOjo1gB6o17SPxTLl4svQ6euT8+MciYhhu+oV
 JJ38pK4eI9QNnrIx/hwQRhV/f5dMWQqGc99cTl1y0QugqyIakB5UHkCqo5I2KZpqE6
 tirhEnJug4By5LdPG9Dl5Vg0ObgegbrT8vgDbZ5l7OrW5nwXlGXu8s48xcgvt6FL3A
 dLd48jeBBzI+fTZtZYKFVl6N/3I86GsrqNb4UihJmUtsb0y3Hl2U5xaSJibqdnLeDS
 2hDeUfu7FeP1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SLpEpeEp
Subject: Re: [Buildroot] [PATCH] package/gdb: bump 15.x series to 15.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07/05/2025 22:14, Thomas Petazzoni via buildroot wrote:
> Changes:
> 
>  Set GDB version number to 15.2.
>  [gdb/python] Make sure python sys.exit makes gdb exit
>  [gdb/symtab] Revert "Change handling of DW_TAG_enumeration_type in 
> DWARF scanner"
>  [gdb/testsuite] Add regression test for PR32158
>  [gdb/testsuite] Add gdb.dwarf2/enum-type-c++.exp, regression test for 
> PR31900.
>  gdb-15-branch: Clear the X86_XSTATE_MPX bit in XCRO for x32
>  Recognize -2 as a tombstone value in .debug_line
>  [gdb] Handle ^C during disassembly
>  Mark unavailable bytes of limited-length arrays when allocating 
> contents
>  gdb/solib-frv: move lm_info object to solib
>  Fix loading a saved recording
>  Bump GDB's version number to 15.1.90.DATE-git.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
