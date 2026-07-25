Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8890C531C9
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 11:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7EFA2606CA;
	Sat, 25 Jul 2026 11:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N46dUXHNO6Bv; Sat, 25 Jul 2026 11:10:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF9CC60662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784977827;
	bh=SwJ8RoG6RRQTwI/kxDDNcUMUGyCRU1I8c9tqUIsiw0c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=F2DADS87hJgIh49dmlC/8MwLEJbrhYHKqUR3PNDfRr4qVqd1UQzxrmGz7ZRW6g8YJ
	 CnrmQtrw4pXEZGPQJ67xD1hcki6MrrlsEtlbaakGrIrP4ffUa69aB46X8X2V2hU2b4
	 npsS9bFW8TtJZKlCloqEp/zR+FWntFH9HPLprBxRl0+QztwhmApsuZ5bPyRFn/FJ5G
	 PMXZ+axCgySTbxNWLmIdvkjTfA6vyxCqgZbJHTpLFeTtxehILmlPHXqIzC+OGizJGr
	 zWnkYlwtjoL5se+LkNzZz+2LuHDoZ5RSAqdGUfJOVkW3REnpUiDIDulfQ6YZIJKlJs
	 YagKs7HWYldVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF9CC60662;
	Sat, 25 Jul 2026 11:10:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87FB3977
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7983880EC8
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IlKGYguGFAOI for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 11:10:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 94E5180C31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94E5180C31
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94E5180C31
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:10:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8D3EFB0057C;
 Sat, 25 Jul 2026 13:10:22 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jul 2026 13:10:22 +0200
MIME-Version: 1.0
Date: Sat, 25 Jul 2026 13:10:22 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260725072850.27821-1-bernd@kuhls.net>
References: <20260725072850.27821-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <92be9f990405e0d94b08f2bb1e52294d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784977823;
 bh=MI6/xm+9A04FnjCcsr05wwm+29tEiKDajmuw70IyL3I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OaC+G8tj1eOX/d456v2mjV1vXNjeq0obTsQENuTJFSrotIMUHXDmgLUsmE1C1lzej
 gykPCgkF6YInyeSqZiWL1oQdy2d5YqdFBtftoprW48Blf+H9JKd0z2F3mp22YRbN0i
 YA/74oyPENEupbMdyU+VdroC/FkTRWzJN58DsxBvVKbZrdqI5TERJGKAsvnV9Yazib
 Eqxk4U8ZJIr35yPTbbysyLbzPLaGw3foVsnBt5B7qVl7fHiwS4FgYRR9FyeewXpAUS
 S6HBbTXorB2J5oRWQjQzvwJAkUJXcYgtpQcIC+Jxy1W23eZzc5yhh/nEyJniVcS+if
 x+ApjxscsOQ0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OaC+G8tj
Subject: Re: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.53.4
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

On 25/07/2026 09:28, Bernd Kuhls wrote:
> https://sqlite.org/releaselog/3_53_4.html
> https://sqlite.org/src/timeline?from=version-3.53.3&to=version-3.53.4&to2=branch-3.53&y=ci
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
