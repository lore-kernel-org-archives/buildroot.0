Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CE3FEE4E9
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 12:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 456D660655;
	Sat, 28 Feb 2026 12:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dJlUWk1ADg9u; Sat, 28 Feb 2026 12:11:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7442E60618
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772280714;
	bh=RtKrojWkvCV+o4mE6yfvADTc4ccNUnrIOJji3fqwppU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dO8Jj+B8AgCxae36sp95HK95tR+HIV3ehG1nTwp6EQYtJTEQo5MNkLElTA6r5eQk6
	 BnGw3oA7aE4jzw0epbFroCxxpws9xjUfKPjXo+LhqoIIx8bl6onq/D0aQ5ImsH1eOU
	 XnvtF6BPV3QNLVWJ2i9E/+HEGZ1OifZZVljiy0IyYlpwdbmA32xyuRje6qsg5hMQqH
	 m7lcJnoGLhYpdjxDw1HDTR2gB3wNNUcRR/cyyFP+Y5IKUbTY5Pnp32tHrIA4kLHn12
	 Z2vuXVx5UGhUGoKjtNcgTXuEZM/PYWAElytyWhioCrLsMtuNer3kWpfrCFRwvRVR+z
	 vi9F4P5AYQufA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7442E60618;
	Sat, 28 Feb 2026 12:11:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C6C518D
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 12:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DD0F4009A
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 12:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2CCA9iJH_BBZ for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 12:11:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 55D734006B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55D734006B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55D734006B
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 12:11:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4DE0E13F8A7;
 Sat, 28 Feb 2026 13:11:47 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Feb 2026 13:11:46 +0100
MIME-Version: 1.0
Date: Sat, 28 Feb 2026 13:11:46 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260228110352.2521276-1-bernd@kuhls.net>
References: <20260228110352.2521276-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <77655f9660cd7d36b69a3f47ab392056@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772280708;
 bh=aI1R6qq1KAkEw+WmX61R//ZK1QuRT4UgEA4363XPQjY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VAvGL8NpKI6ru1muW5mvRivD+9tBjINHm/jMZgnS8kbaftySgTAzE2Zdf3tQLKpJC
 dZ1cKo99UGCyL0qn98lvezkK28pVi4f91D7ASGTACRYWDZ1oNmDYCAeQE+Y/HLpL80
 mrZaQOmGgG2MXs9iZDeArhYh0uU3asloylnsbutpXu2IsOvsu5XHpX6ZXCqPACZLDE
 YNLHexDYC6VyKmiW3iPD1WSfhh4SrwpgTEoQCAI0ArylJaifynBWqf3T1FWkmEVpVX
 R226fbmgzaf4lqi5N2tRqoBSlgdochUdYNLvySxrtRJk+jL2hL8dtmErCXg61TBnOc
 2Tto8m4maABuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VAvGL8Np
Subject: Re: [Buildroot] [PATCH 1/1] package/nano: bump to version 8.7.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 28/02/2026 12:03, Bernd Kuhls wrote:
> Changelog:
> https://www.nano-editor.org/dist/v8/ChangeLog
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
