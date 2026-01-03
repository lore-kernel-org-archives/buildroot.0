Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04630FC617E
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 263B24075D;
	Sat,  3 Jan 2026 11:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fRzNAUktRnaN; Sat,  3 Jan 2026 11:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 481954072B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767439227;
	bh=OFopA7ou3cEmXyN44ByJRGqPisaE+VTFs6D+EpPV3gE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OnWWsHXVubA39qKLXeRp/85SqsNw+UGL8iPc5zQrTiHitoMkhkCV1NR24XgXZhHv6
	 gDKINpDct1plwfpFkhaURgTm9UhtmPfwiIgEljIzcCw582NfdfuSV7xiRBQFzjoCOk
	 B0rRaDSV0vlOCxmTdVJGt+0EkLz7isd9pyFW6I0LrJZTTmWJRI4x5b39M8W6LJ9lAA
	 RGPYz6inbrRP/BZLDLm3p262VUkDaelQ4hJAnMaIKA5+1As+Zhl5nCSqsEPW2UzbAO
	 9l3uh+UZo4T2Me1Ksf1mIE8OsScjUjtXmJDi1AamPvMQmSkx4s2LwY3euZM4w6zlXz
	 wWClFI40r516A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 481954072B;
	Sat,  3 Jan 2026 11:20:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C063440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 716B6400D6
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WE7ouhdj9vlo for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:20:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 606804013B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 606804013B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 606804013B
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:20:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 501E2B0057C;
 Sat,  3 Jan 2026 12:20:20 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 03 Jan 2026 12:20:20 +0100
MIME-Version: 1.0
Date: Sat, 03 Jan 2026 12:20:20 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260103004622.690344-1-james.hilliard1@gmail.com>
References: <20260103004622.690344-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <00171a921a15a4fcaa90b1dfac1244b2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767439221;
 bh=bAFZMi15HrV9uzWcUCZTOillxaOZRbpp83U8QDwdbBs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q1sqV7DmEpdjT+SHJYvhf/f14eFHTvV916n8mm4UhO+huCV2V4CLwGPfGPN5zEmeL
 HVrgFmWVy3P0FnHPAHM2MXojU5zWsJ9KV2XdLedcE3zVdwKFRTJxsalzm6qUKzQUyp
 V8q4gdDPToCoaTLZ57jrSJDwznN8tn5igOIK3+hXhZmUQ+oxtrjHfoRzFVK4J3vaBA
 ChY99LpNfwKtnJrD4R24WhyT+s+/4LhXj5HVNTzHVKD79U9aRkV+SfEJ+1cQNDfb0k
 Z3GH5yAVyoAt4Ehjlff6yrPxoCvN4xMchDz1a4WOFMiM9iOvdiEhi+x0kaHfREWT68
 jqgT6vmVNPcog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=q1sqV7Dm
Subject: Re: [Buildroot] [PATCH 1/1] package/python-gobject: bump to version
 3.54.5
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

On 03/01/2026 01:46, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
