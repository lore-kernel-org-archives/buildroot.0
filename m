Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A55106ACE4
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 20:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6D4D4076F;
	Thu, 12 Mar 2026 20:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GDvVh0XWMzVq; Thu, 12 Mar 2026 20:08:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1793B40768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773346109;
	bh=nZuJEQHCiflnlUZL7YypMgGS5YURGWXv6v92CCOQaqE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ggLj1rbZ3g8H62mwI/S4GXLNCV4qgL5a0BrvUNQWZ0rrjLFivOG8F9Mv5yd5Yf0ec
	 +2UKbJ3UazCvGMrv1AWcGsiDoznQfQzaX3yoj56dPPRkFyAFuFosLsRiBj/ropnVt/
	 F16PFQZjc/ri58Qk+pwEVHOZD6L1NLSLgjg9QMGUWQJTAEJ3yH/m7ygtH119ff08iX
	 DeNbxPb7yIDlRvIBW+GbA4l3Z5aAquC0LZYbmsEFB59j25/X7nLd3/jR0xFpMQPQDC
	 9BG08RDkcnLB9zGvu6ndw8D/AdNvN+GXdTsn33d1wi3ORO0KnItdstwQL8CHq28wVn
	 KazU1SvShsaJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1793B40768;
	Thu, 12 Mar 2026 20:08:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 19754282
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B2CD80CED
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:08:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UABJgY0Pb8_u for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 20:08:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8CC4580CDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CC4580CDC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CC4580CDC
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:08:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 75CDB780511;
 Thu, 12 Mar 2026 21:08:22 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 12 Mar 2026 21:08:22 +0100
MIME-Version: 1.0
Date: Thu, 12 Mar 2026 21:08:22 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Andreas Ziegler <br025@umbiko.net>
In-Reply-To: <20260312164456.3185719-1-bernd@kuhls.net>
References: <20260312164456.3185719-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <bff755cf04f500e7bb606ed5bf4fd850@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773346104;
 bh=HK9futT3DhUAS2Vy9i9V9cfRSLyN1mMhnis3iBbyKWQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Dye41Mc2Qpt9r9jPv2zju2dgl4KIUzbfFuPvreu+JrYe4JHMSdJd2kVeU+jOGzkh9
 E3xYB31wBZaKeLLtOQGVEx/pwXTNN54hF+ZpVkvLDYqbgzMZElwZaFkNQM47D+YEhu
 atuXsGHp//KP2mEe4eAgDNZKKuJCEsjUyruud9hpwQFuI0RR87r+l0mfZlz32dVyhm
 vAXWopR1MH1YvDlMj953YvicTg+YBDdNOFC3GgUuKCziLFSJ1cWNuXw2DOEBs/uObS
 /X38n8Zy1ZjHDrsE6WXdCU8rv7fUM3uhNImtfJ6qdnHAam+J8GguwcGRVNpgPp9BY8
 REGGBPr9rC7vw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Dye41Mc2
Subject: Re: [Buildroot] [PATCH 1/2] package/mpd: bump version to 0.24.9
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

On 12/03/2026 17:44, Bernd Kuhls wrote:
> https://www.musicpd.org/news/2026/03/mpd-0-24-9-released/
> 
> https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.24.9/NEWS
> "  - curl: fix build failure after CURL 8.19 API change"
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.

I would like to keep pgp signature info in Buildroot hash
files, when they are published upstream. So I put them
back in the libcurl patch #2.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
