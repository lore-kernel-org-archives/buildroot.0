Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4497BC021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 19:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0526A412AD;
	Sat, 15 Feb 2025 19:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ew16825bA6Cj; Sat, 15 Feb 2025 19:48:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC4CC412B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC4CC412B2;
	Sat, 15 Feb 2025 19:48:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 97452DF
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 19:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83A7D412B9
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 19:48:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CmQUL3jNAURB for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 19:48:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 35A12412B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35A12412B2
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35A12412B2
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 19:48:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B246E2003AE;
 Sat, 15 Feb 2025 20:48:20 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Feb 2025 20:48:20 +0100
MIME-Version: 1.0
Date: Sat, 15 Feb 2025 20:48:20 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250215135309.385622-1-peter@korsgaard.com>
References: <20250215135309.385622-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <bc9890752b48faefb07b3741edea3e8c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739648902;
 bh=6aw8siDlIiwlOka0Mkh99SWqioIaoxoVOsYone4e99k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hkaCpQEwtHiuRga+FWn9OtcqjjxskKJogVPNGAGj31W0vU2ebS/MCtOmQu9nv+LKT
 qL05FUQrmPngFo67loFtk2LlXMSXdlRkwUSAxOl9MXTnVJZO/9wR+xIcyXIW2xwb5/
 960GrtJu3Zz0e6VwXIXk9DwjfTTJvddWj3ireDSyvi1bxgyhyML/aP+WcEFVHF4NH0
 I1PsQsWDh4oQvVhLKcRUtyO96xd+Z9MOswu7s/Y0MHxvczGB6w/7Xxj0wYDe8ci5Fs
 WlgPtnCJ0vK8P4dv1bbzTzB3z0FxgRCeMg4cQSmDqk6oR8aq0hs0h/XKFgNz19R31w
 x8g8+AvzfhZ+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hkaCpQEw
Subject: Re: [Buildroot] [PATCH] package/libtasn1: security bump to version
 4.20.0
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

On 15/02/2025 14:53, Peter Korsgaard wrote:
> Fixes the following security vulnerability:
> 
> CVE-2024-12133: Potential DoS in handling of numerous SEQUENCE OF or 
> SET
> 
> https://lists.gnu.org/archive/html/help-libtasn1/2025-02/msg00001.html
> 
> Adjust the license files after upstream moved the license clarification 
> to
> README.md and moved the COPYING* files top the top level directory /
> slightly updated the COPYING* files (http->https) with:
> 
> https://gitlab.com/gnutls/libtasn1/-/commit/73cc886c3ff29c326a5f1a10b3127d521574a1ad
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
