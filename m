Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF8BD12692
	for <buildroot@archiver.kernel.org>; Sat,  6 Dec 2025 04:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4CDF608D6;
	Sat,  6 Dec 2025 04:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U6u_wMvguzIx; Sat,  6 Dec 2025 04:59:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8176F607F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764997153;
	bh=6+i4KObR3fgaz5/4UetUqypi4+kB0tKeK78p2ssTNgc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fUxfGRu6J5dc4QKi8kXYC0vPxleSLGR8EBJIyT7fmDxYYKKrID9zKVYZ2ocQTbuuC
	 4BpZ4NHK3LhIW8UEsq+uMAmnkXt8hy96nvoVvwTD1lL+OERdbSyaNm3jXPnA7sQVFq
	 NXbFa/HhK3Kf3gIlmYWKtazEXqxFCEUIkw9kQsChJZhpl2bfzzZPQA6ob1h8YzR/OP
	 LY6kAAxKlIgDSlnj54eFRmzp0pwAdSKkyrr9z/37Fbvha3KawNOQ/tY86th5sYQmCE
	 yx3fmgoIvc94L6lYOcQMPL4aUuBTSXGa8UeZdmZRYRep/8fuX1yFB0YD/2+7QKcGSG
	 BQsSsGXbf/ByQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8176F607F3;
	Sat,  6 Dec 2025 04:59:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C82AE7
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 04:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F5A240B82
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 04:59:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxgMfZ2ICmru for <buildroot@buildroot.org>;
 Sat,  6 Dec 2025 04:59:10 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C796F40B7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C796F40B7A
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C796F40B7A
 for <buildroot@buildroot.org>; Sat,  6 Dec 2025 04:59:09 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 73EDABDE01DC;
 Sat, 06 Dec 2025 05:51:23 +0100 (CET)
MIME-Version: 1.0
Date: Sat, 06 Dec 2025 04:51:23 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251205193057.1884663-2-bernd@kuhls.net>
References: <20251205193057.1884663-1-bernd@kuhls.net>
 <20251205193057.1884663-2-bernd@kuhls.net>
Message-ID: <1092ac849d9efd9b70aa6c5922fc8d9b@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1764996683; bh=mYfnrZLxAuPMNbHgyslKLKdteEd0N5mJxSjxjgdtw5U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=bLPT4mqAs9froHQTlont2O64LVFlwyBZpjrQWKbDQv7Ev4Zp45mK4Q+vhkx9vqfTj
 HB0DHcu47eyUBnS+JtsErZK+m49C8oaPwAm9yA7gcPwUCcuv+FZ+ouNqfXQPY26+rF
 B5/cTOELvMvnrtGdCOV3DmaSg0mJ33tI1SA/71n4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=bLPT4mqA
Subject: Re: [Buildroot] [PATCH/next 2/2] package/mpd: switch from
 libsidplay2 to libsidplayfp
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

Hi Bernd,

Thank you for fixing this; it completely escaped my notice.

On 2025-12-05 19:30, Bernd Kuhls wrote:
> Buildroot commit 25af5a3b3aa3480ee10158e55c280d675430442a bumped mpd to
> 0.24 which switched C64 SID support from libsidplay2 to libsidplayfp:
> https://github.com/MusicPlayerDaemon/MPD/blob/v0.24.6/NEWS#L125
> https://github.com/MusicPlayerDaemon/MPD/commit/7e2538e07a80bd12baf2e7c328e7d1a64eb434f9
> 
> Fixes a build error not recorded by autobuilders:
> 
> Run-time dependency libsidplayfp found: NO (tried pkgconfig and cmake)
> 
> output/build/mpd-0.24.6/src/decoder/plugins/meson.build:161:17: ERROR:
>  Dependency "libsidplayfp" not found, tried pkgconfig and cmake
> 
Acked-by: Andreas Ziegler <br025@umbiko.net>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/mpd/Config.in | 2 +-
>  package/mpd/mpd.mk    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> index 48b8c914fa..066f53c24b 100644
> --- a/package/mpd/Config.in
> +++ b/package/mpd/Config.in

<...>

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
