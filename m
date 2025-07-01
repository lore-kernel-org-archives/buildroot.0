Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E12C83038
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 20:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4566B60792;
	Tue,  1 Jul 2025 20:42:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77FiByDAuFT2; Tue,  1 Jul 2025 20:42:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89C72611F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89C72611F6;
	Tue,  1 Jul 2025 20:42:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 65D88196
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57E0F418B0
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:42:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKVBVkPmhRut for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 20:41:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8058F418AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8058F418AF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8058F418AF
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:41:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7F3306012D;
 Tue,  1 Jul 2025 22:41:55 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 01 Jul 2025 22:41:55 +0200
MIME-Version: 1.0
Date: Tue, 01 Jul 2025 22:41:55 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250701161508.1622502-1-peter@korsgaard.com>
References: <20250701161508.1622502-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <2dd8987fe43ff772e6e99eb04aca8e29@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751402516;
 bh=p9Du3hnEjr2appYZEAeCYwhCz/Na1sCt7velsnWrkjY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hnJcf6nzVZK96kL0CF+vPx2uQaFTz30ajc9WLiEgcplGzJC00oLZtPB9dBU1YZJtk
 2DUGvbRLmGuwlNdFAfm9bnJunKc2pF4btu3D5g7nWn0yZYn/zxiMc8gC02064xrEtZ
 wNyf0DaPxAKLfxv+MOo3g5ycr4B4fWlMCO30EaV5Be4fMtl57UUAauEY4CFZ0naK8E
 h4pT+bXr93415p1CqsTmIZYKnaFRsRJ9WEMsE49ZyFxz0oEIxmy6onzcuCPAqsQpPT
 LvkdxNZ1TZCOvg3Ipe2Y0bU+A9IL3ZLZJugJP02A6nUT/YAvsIIqMJjpIbbthuY0nS
 Y06e+Q/KS8d4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hnJcf6nz
Subject: Re: [Buildroot] [PATCH] package/jose: security bump to version 14
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

On 01/07/2025 18:15, Peter Korsgaard wrote:
> Jose-13 fixed the following security issue:
> 
> - CVE-2023-50967: latchset jose through version 11 allows attackers to 
> cause
>   a denial of service (CPU consumption) via a large p2c (aka PBES2 
> Count)
>   value.
>   https://github.com/latchset/jose/issues/151
> 
> In addition, jose-14 worked around another DoS issue related to
> decompression:
> https://github.com/latchset/jose/pull/157
> 
> Drop now upstreamed patches:
> 
> - 0001-lib-hsh.c-rename-hsh-local-variable.patch: Upstream as of
>   
> https://github.com/latchset/jose/commit/3d5b287243f87ce0243b23abd690d86c41fc499c
> 
> - 0002-man-add-option-to-skip-building-man-pages.patch: Upstream after
>   getting reworked to use -Ddocs=disabled as of
>   
> https://github.com/latchset/jose/commit/786b426df018edf30a53e2d82155df20d13047c1
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

For info, I also removed the .checkpackageignore patch entries.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
