Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E332AC5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 17:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A9A760614;
	Fri,  7 Aug 2026 17:26:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JJSjQtlQZ6LA; Fri,  7 Aug 2026 17:26:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 632C3605CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786123592;
	bh=ssFekF8IfnMoOJWP1KlWhj63hf3zHDGOcJ3yk5uJJkA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZTocLbR8rKeGVq3FZ4RT9o0N1o4kLQ0vS2vKGDE+6ljSVdMpMU6Sd44TylpQxkUk+
	 nTfthHKHicncVq0s1RsMLyBC5qQW25FdoLXhRXR8EO6QSRY6xJ2jOLRnAmA9yc67VX
	 v55v+99EEwq0fROYHvWtOaXiFU+WMTRWMm9cptO+xPP1h74T4+/FEoeW2stQ0I9gQf
	 RGRiuB2IlOnyAAtNj6WXxh149qh7zjNyesRS8XQf+qOZCuH1Ip2iaXWlaXUpOpbOLC
	 coBnbqB3AkwxjQjJ7JyWhmW/ZvRyR5CtRNJw3AY7YvDN5iZXE9lFVEOZ9t6I5RZuRZ
	 IOrIomoADU+5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 632C3605CE;
	Fri,  7 Aug 2026 17:26:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A037D3
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 17:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C0A7401DD
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 17:26:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7hblT4ZRcwz for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 17:26:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A022540020
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A022540020
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A022540020
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 17:26:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 681A8780505;
 Fri,  7 Aug 2026 19:26:23 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 07 Aug 2026 19:26:23 +0200
MIME-Version: 1.0
Date: Fri, 07 Aug 2026 19:26:23 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>, Romain
 Naour <romain.naour@gmail.com>
In-Reply-To: <20260806163311.1312780-1-bernd@kuhls.net>
References: <20260806163311.1312780-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <0ed28a75f8a7d29466f6d051cc4c794a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786123586;
 bh=lxczK72TElg4ObqiumX2svfnlLHbjhKv5lvLn/bKkSQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nGXTDhCZsx5g1axhpPnyHKxQX8F4xvbJjcbhLjLrOFL5DWQv9Lrnsiwvb/Nls2/qn
 6DPOZyQ3iDgBY9TJlWoszhbzYTPO9gpC9zLF6MW7inA/w35Wz5sLAJT2hJKdeyfXNn
 T0l5AknYRInmHP+c6KbH2CxVWW3qKUHli4fe8vcOTqmRfV+mFslxArNy1RAFL3MGjR
 yufIXCp4wcWCTNbHe4P8GbjUTJsUdH70MYI3ywvzkwKmgE7VrN98f/kDmW/VtI7vwE
 VdHjDzITAGJxNqEZ57Onacen3gMmwjjAcdTOtZh9bN59+MG3hCaSKbdy6mzUaX8gk8
 /FizH/7E8GZnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nGXTDhCZ
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.2.0
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

On 06/08/2026 18:33, Bernd Kuhls wrote:
> https://lists.freedesktop.org/archives/mesa-announce/2026-August/000863.html

The user QwertyChouskie[m] recently reported on the Buildroot
IRC channel:
"""
Just a heads up, when updating to Mesa 26.2, libclc is no longer
required for anything except rusticl, though mesa's clc stuff
(host clc to be specific) is still required.  Also, libclc itself
should be compiled from Mesa's fork that includes critical fixes
for OpenCL that the upstream LLVM project apparently won't merge
due to their EOL policy, see
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43020
for details.
"""

It is also mentioned in the release note.
I am surprise this patch is not changing anything on that area.

Could you recheck those libclc dependencies?
Could you also check if a new mesa-libclc package is needed?

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
