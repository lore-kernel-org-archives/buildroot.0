Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F68D5B15C
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 12:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED39660D94;
	Sat, 13 Dec 2025 12:42:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56RHIqjFVPIk; Sat, 13 Dec 2025 12:42:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8D3A60D70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765629732;
	bh=4xbhb8xFshURDowLV866STBD6hEccjron6mkQzaX3Gg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ATaDYo0HAll16MENwRrNHMDohYBB3LA7UO1sqYSUYR1q3+FfLoIK/G7B49Bfj9EzQ
	 +FSyj+JjU07s25efG1r2nNf0twTLG0vqgf9OIdcDO4K2mmkpjIa+T9iZpI5eoKV1Va
	 sfuK+6rOdgdP9LXZfZpjpDzEjY36y1LE+zbfyPj9G0jYMnD+0R+mEqaasFwcaI85aR
	 CToOBObBXUNqXfyJo6HRb6L3pt7ix7sIkmlqTYCnmz/LUKUr1WwUwrm37N5eRap66P
	 R4lq2AZ/OqSSu6PPKGv3x+vq7JmyKFRPwQvFxX6uEv+Pa63pvcRoi6KF3pdLoZMY9l
	 OqGqQ3rPyltrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8D3A60D70;
	Sat, 13 Dec 2025 12:42:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CCF3A13D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE50783104
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 12:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uriTPJfN1RxV for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 12:42:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B08A0830C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B08A0830C2
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B08A0830C2
 for <buildroot@busybox.net>; Sat, 13 Dec 2025 12:42:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 4DB5B780375;
 Sat, 13 Dec 2025 13:42:07 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Dec 2025 13:42:07 +0100
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 13:42:07 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20251212084937.76206-1-francois.perrad@gadz.org>
References: <20251212084937.76206-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.11
Message-ID: <1895ab6871b41f2b7ac64ab793b71236@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765629728;
 bh=ywFy5r02QXijJ518H4Bf6G8ALobmUZEPMWO14YSYups=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AR8DjIwW2lLMZSlptk45KgOJ7fMrXeFdhFGsrOthMucLr0r9IDoi/BhzTq/sf7TSo
 3CSmrjRAfFbEmkX3at4xY5e6Zyix6qbhvlxmrQjzuKEOvOGZZMsg/cS1hJtj7qOuv2
 T8LD8uWThhWyrEulrjAr6smlNypgft0vWkMu0rnF4nOgQzDxbXy8EVQvI6fuu1hIaQ
 QeC1xlxzEgf51UubnCbhSPlpz//kYvyK4QLATl6BYobLyuB5lhhfWhL7G91Kk3Tr4d
 RtObZdlBR9dfcGMCdyRMS08miTZUg2qvLNNKdXQvnQD31o4PClFbT6occ8GVk1aUq+
 jKl2rcRCPXmPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AR8DjIwW
Subject: Re: [Buildroot] [PATCH] package/dialog: bump to version 1.3-20251001
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

On 12/12/2025 09:49, Francois Perrad via buildroot wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.
For info, I added links to the release notes and pgp signature. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/8f940235c07aac7d564863281563a22611149d5e

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
