Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B7FCCA476
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 18:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8424960B0C;
	Sat, 11 Oct 2025 18:13:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3MgngTUkINh7; Sat, 11 Oct 2025 18:12:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F259C60B02
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F259C60B02;
	Sat, 11 Oct 2025 18:12:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 59FCCBC
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 18:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85C924071C
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 18:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VMI833BQ8M3x for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 18:12:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A39E40726
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A39E40726
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A39E40726
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 18:12:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 22ABEB0051E;
 Sat, 11 Oct 2025 20:12:51 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Oct 2025 20:12:51 +0200
MIME-Version: 1.0
Date: Sat, 11 Oct 2025 20:12:51 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Antoine Tenart <atenart@kernel.org>
In-Reply-To: <20251010222122.1911651-2-fiona.klute@gmx.de>
References: <20251010222122.1911651-1-fiona.klute@gmx.de>
 <20251010222122.1911651-2-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <68c8664cd23b5f5fa1c386474d387052@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760206373;
 bh=DMOpYggkOAxzUClvbPVBwxcGP9qmf9CF9q4b7ArCn4E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eZ8Jk8U7Ix+lOpjdfSZH/qmVDRVLax0BkW9NdT5xdWu1wBNxvlYl0Sg3+83wAg3e2
 cYMqqcSRGKmUPjxpOSyrc/F9NzlCu0ABWfGL398fn7lambFTauOF8RdQCyQHxoZeeO
 r2gYe4RJHAN0FbD2CxGvpz8GQAPS3Sn4ri1PQ6Jbo4YeMTmNwm/l4tY97DpPhPfU08
 QADcaUUAOrmbJlGAWUcE8TD3hnB+xDl0I5xzQT4lloOv3Z0rpbz831kDX2r8gQkVQC
 EDwZsTbrPk62obM8DDqBhhFE8X3RwJQXn4z+60SPYaJVLCEHBEYY+qrWyRgy+yzpML
 XQHxeDa3wE/YQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=eZ8Jk8U7
Subject: Re: [Buildroot] [PATCH 2/2] package/refpolicy: bump version to
 2.20250923
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

On 11/10/2025 00:21, Fiona Klute via buildroot wrote:
> The update makes some warnings about unknown classes and permissions
> during boot with current kernels go away.
> 
> Upstream changelogs [1, 2] list as "notable changes":
> 
> * Updates to support screen 5.0.
> * Add labeling for bcachefs.
> * Various systemd updates and fixes.
> * Several updates and fixes for systemd
> * Add new permissions and policy capabilities
> * Drop reiserfs support (it was removed in kernel 6.13)
> 
> Plus a number of new modules.
> 
> [1] 
> https://github.com/SELinuxProject/refpolicy/releases/tag/RELEASE_2_20250618
> [2] 
> https://github.com/SELinuxProject/refpolicy/releases/tag/RELEASE_2_20250923
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
