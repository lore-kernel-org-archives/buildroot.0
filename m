Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C86CC5DF81
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 11:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF100807A8;
	Mon, 24 Aug 2026 11:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y1fSCM7IWuUe; Mon, 24 Aug 2026 11:49:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787572192;
	bh=Ln8WNyblAm2Bp4qAIDhQlefpH89SH7kx7HSWVPCBaIs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=M7CSK2NbeNFG20cIIAx+9XnETr/LanoLZg+++CcD8Ws/5x5tVATvsdEBH4YcLtZNT
	 tDPCL6wo4HJRj6XvKcq2dyfoqwxvOc5gd5cXGL4tUB5/u4fAYJb5jny6R5wia9yvQb
	 CoIr2VzPzfByCk+2x79H0XUebnk2+FZQrhZ3yMx9nZlUpNs0SKgPZLb5kBk/jpK+ks
	 oFW3rT6lzb3icfV1qwevSMvMzqqzEaLx6R4AU0YCxW+Rj0GyekVL3vmNMcahIUO9TO
	 3DIdGpBhbdYD19jABdKbcW2roiEvgeicl2uM7WXuD9hmaCUtsTAww2hJwId3YnWmCK
	 8GA+fVTeErhVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAC43807AD;
	Mon, 24 Aug 2026 11:49:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A97153DA
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 11:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A67E440345
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 11:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id umNPAiQGqzlo for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 11:49:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 057B640343
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 11:49:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiacH-1wTXkE3JUV-00qaKr; Mon, 24
 Aug 2026 13:49:45 +0200
Message-ID: <608a2b06-49d2-4483-866e-59d2103273cc@gmx.de>
Date: Mon, 24 Aug 2026 13:49:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
Cc: buildroot@buildroot.org
References: <20260824093528.3357438-1-rhidian.dewit@openpixelsystems.org>
 <20260824093528.3357438-2-rhidian.dewit@openpixelsystems.org>
 <46ea2d74-b802-42a3-9fa2-56c1f2b76286@gmx.de>
 <CAKWiKxEjHakTb6C8C9GpOq9DSxB5JwmP8fRwgkgbZXNm1gvfoA@mail.gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <CAKWiKxEjHakTb6C8C9GpOq9DSxB5JwmP8fRwgkgbZXNm1gvfoA@mail.gmail.com>
X-Provags-ID: V03:K1:JH5++hUv6T6KhFXNml1RAjT8w1TM8EOdHqvKooYKd+cFnJGdY6L
 NUMw2kg5XafrmO/GUlYduIei8eCgWF0uaZfcrJ00HPSCpF5OJY/LW93s3jVR8qNTuufPnCi
 0zpOBCnJCVcvcMCJhhzVgnTgC8ofCmStRcvqTEaA+7nMI1ZkDjXqlOj/ZqlIqEZ2o1IBjZL
 o4X6u1UZY9W3IGy5C5oaQ==
UI-OutboundReport: notjunk:1;M01:P0:FxexjrQq1dc=;0segsXyEnqKuu3sBCVFAnu1H2Va
 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
Subject: Re: [Buildroot] [PATCH 2/2] Check if bootcurrent is valid before
 using it
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Rhidian!

Am 24.08.26 um 13:20 schrieb Rhidian De Wit:
> I am actually trying to commit add these patches to buildroot, but I wasn't
> fully sure how to approach this. Looking at the zip package for example, it
> also has patches for files in the zip project that aren't in the buildroot
> repository itself.
> I assumed this was fine to do, but I probably messed a step up, how would I
> go about adding patches for RAUC in buildroot?
> I've already submitted PRs for the bugfixes in the RAUC project itself, but
> I assume that won't be in for a while, as the last RAUC release is from 5
> months ago.

In that case you need to add the patch files to the package directory in 
Buildroot (they will be applied to the sources during build), and send a 
commit adding the patch files to the Buildroot ML. The process is 
described in detail in chapter 19 "Patching a package" of the manual 
[1]. Short version:

* Make your commits in the RAUC repo
* Create patch file(s) using "git format-patch -N"
* Put them into the package dir (here: package/rauc/)
* Add an "Upstream:" trailer to each patch (together with your s-o-b), 
with the PR URL(s)
* Test your patched package (I assume you have some Buildroot build 
using RAUC), you should see patches being applied in build output before 
configure
* Commit
* Run "./utils/docker-run make check-package" to check for any style 
issues (check-package only looks at paths that exist in the Git repo, so 
if you add new files you need to commit first)
* Once everything's good, send a patch for that commit to the RAUC ML [2].

You did the "sending patch to ML" part right already, it just wasn't the 
right kind of patch. ;-)

> The second one seems to have some indentation issues.

I mean in the C code. Your changes are indented by 2 spaces per 
indentation level, not with one tab per level like the rest of the RAUC 
code. That is something to fix in your commits in the RAUC repo before 
you create the patch files (and push to the PR, so reviewers can focus 
on the code).

Best regards,
Fiona


[1] https://nightly.buildroot.org/#patch-policy
[2] https://nightly.buildroot.org/#submitting-patches
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
