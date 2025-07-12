Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1AEC83F20
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 11:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACCCA8209A;
	Sat, 12 Jul 2025 11:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ol0PJKz4_3kr; Sat, 12 Jul 2025 11:14:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1B1B80EB1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1B1B80EB1;
	Sat, 12 Jul 2025 11:14:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A3A5C106
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A1C760856
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:14:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mu6UqO1uyLIW for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 11:14:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C4160607EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4160607EC
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4160607EC
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:14:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1170919F5B2;
 Sat, 12 Jul 2025 13:14:04 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Jul 2025 13:14:04 +0200
MIME-Version: 1.0
Date: Sat, 12 Jul 2025 13:14:04 +0200
To: Tim Soubry <tim.soubry@mind.be>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250711143224.2114003-1-tim.soubry@mind.be>
References: <20250711143224.2114003-1-tim.soubry@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <e49dc17201ce9fff6848a71bdab4f2e4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752318847;
 bh=4p4oEz/Zvg0ALxTdaWvOuT43TzxuciiqYWqfd3hTyfc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Fe7/0t2GCa+gKJiW9ELEoNVh3HLIUwMYI3GcBEZBDXRUvS18ThZ80p74QRvF+DD6G
 ay4X3VBzWnRUqmvjK4bfa+hmtlx7ZFPLE4DyLuTE/0Oh+8f3Hmgpr++vxuBrt/YRUE
 Bp2RDkL6TFX0bEQCOa6wUxQ9dcmEUHV2fssjSLl3IzCi4Z9Bn/S/BTK/4I4FkMKuBi
 1YsEasLTROoxcnlddYtqYEwM7cRxN4hB2HNoDBURxgflxV2BCL3yNuOfmhmDshXGW/
 tXCLTXai3o1G2kv14TJ3zQIZq8kwbfV6euLfYbotit8JTNndmFlLv3x74lw0hzU6nI
 hqHEkqeM55DlQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Fe7/0t2G
Subject: Re: [Buildroot] [PATCH 1/1 v3] package/ncmpc: bump version to 0.52
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

On 11/07/2025 16:32, Tim Soubry via buildroot wrote:
> Applying version bump of ncmpc to version 0.52 as proposed in [1].
> As from version 0.50 of ncmpc, fmt got added as a dependency [2]. This 
> was
> also added to package/ncmpc/Config.in and package/ncmpc/ncmpc.mk.
> 
> For release notes, see:
> https://github.com/MusicPlayerDaemon/ncmpc/blob/master/NEWS
> 
> Comparision between version 0.49 and 0.52:
> https://github.com/MusicPlayerDaemon/ncmpc/compare/v0.49..v0.52
> 
> [1] 
> https://lore.kernel.org/buildroot/20250707112536.1644236-1-tim.soubry@mind.be/T/#rb3b968fff23bac0298e33f473d63a1ad470d38e3
> [2] 
> https://github.com/MusicPlayerDaemon/ncmpc/commit/c3b0055d06f8e8efab7f388646beb7645b90d063
> 
> Signed-off-by: Tim Soubry <tim.soubry@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
