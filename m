Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71A3D2502D
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 21:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C42540657;
	Sun, 11 Jan 2026 21:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iGu8OZYGAyTn; Sun, 11 Jan 2026 21:35:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B211240639
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768167324;
	bh=/rJtRf2OZUAO7JNSlyXrSzmNmEbb0qINv1SNIL0Kx7w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Dc4avOlCGzKzMvGpV+33pagMm9NQdwLuojiLL3gNXLQq41qEWDHYdc3WforQVxI9F
	 XNV6Htf/N4batVM/3V2RJhT7FLVbGH5BJozd5LQL0zYF0NZ1KGOd5r1kXy6E/01IH6
	 4jPnYxg+/+1K24z7vxKpyi89ph17saW15g/ltg4IMDELSJ8oo3qjQRWEv+DK6jbU6v
	 eoLQZaenqAjanFtTSIWgAfM27s3wthRLITBNhTiI4TFX7wcoZ4Wr88nYjX/nC2f1ij
	 WEq5smKx7czOi9DZSJ2QaAWbl53i6i7JgHdloawftRpfvJOMKwttP1WcqC0vxx8WqO
	 q2iys2ZSkwRJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B211240639;
	Sun, 11 Jan 2026 21:35:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B53761CC
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 21:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2F1640639
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 21:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WikAhEbFUt3 for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 21:35:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A548040633
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A548040633
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A548040633
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 21:35:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E9C63780371;
 Sun, 11 Jan 2026 22:35:19 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 11 Jan 2026 22:35:19 +0100
MIME-Version: 1.0
Date: Sun, 11 Jan 2026 22:35:19 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260102233343.324019-1-bernd@kuhls.net>
References: <20260102233343.324019-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <6e0bd761248a1e62ac045b1854136437@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768167321;
 bh=Ly2KrEz7NyGV1/ixccDbGYMSU0d10YF2/jlrER7Hobc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tcYYMJI5c4+zdcamibeBO4eOUXoh0A0nM0SifalAcVZkwaxxGuD/Y9M/3aO2vCzaB
 dS454KXiYWAshUhUnaCT2Q1usjlawdOKFrMn+cUSMU6lQU8CRGFi7bdqI6z0McO3GQ
 uE1bZUrFoW4elerSjljrcPjOY8+nozOSDgYSVMyAzmSqlR5Pe7nRwRT4LguZKEsrf5
 +LW7q3Ij/0Lp4YfRMcTfono1aBCG3nauy0v1QlfK3buDCZx4ACZ8dEX+MvDbg0uepf
 8PZhdX03ve8A3UDYJsyjvLwbZHzZ0gyX85C2CebwKYlWldov598g8J3SA/i0/foXic
 62RL5vkDEM9pg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tcYYMJI5
Subject: Re: [Buildroot] [PATCH 1/1] package/alsa-utils: fix systemd install
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

On 03/01/2026 00:33, Bernd Kuhls wrote:
> Buildroot commit e859686460a30af0868d68810645c2208562039f bumped alsa-
> utils to 1.2.15.1 including upstream commit
> https://github.com/alsa-project/alsa-utils/commit/f047a8a66917960ef5a9ff0e41de507f0e58f381
> which moved the systemd files to alsactl/conf subdirectory.
> 
> Adjust ALSA_UTILS_INSTALL_INIT_SYSTEMD accordingly to fix build error.
> 
> Fixes:
> https://autobuild.buildroot.net/results/31a/31a409308924fd7f60dd94db3c10e2a25c73020a/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
