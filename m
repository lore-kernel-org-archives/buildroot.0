Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B3AF53D9B
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 20:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7335B837D3;
	Mon, 16 Mar 2026 20:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJCvKa0jFELf; Mon, 16 Mar 2026 20:59:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 174AC835CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773694774;
	bh=gbDri689JeOMJdj0k9kE5xge2N1svdfZZjSOGOdBKqo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kM15jApt6DhPXiCrCCra3iedkSB4MdhSDLs3DLWXrkdNDKEIjJGAT+EPmVkNA8zak
	 sTT8KsFHHc/XMKd0ywysejj5GvaUwwg7coDq+TOHUtkfTF2WRYTzPUxk+AV13MZqH+
	 096+58YxjgBRvkN5NTnHVXS5gBMrV905v83I92Tet/wdzC3rl8vMfl5RMQurbHRd2R
	 /tvRmv+IiqIfLw5fI2Ajn5H4dYXvO6b9x8vjnoJ4a5Xsw3Rm40Vk7bppFXOVJ+WPZZ
	 /TvoHw4pGCONs4U12EoZT/6z87TOirMUDjLozcNVlfrh3gO8LpplR5DJ6nSF4hMp+S
	 6A5qcNWZIJhjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 174AC835CF;
	Mon, 16 Mar 2026 20:59:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B9AED3C6
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 20:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F211835CF
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 20:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bgfJMGvNUtcS for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 20:59:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D723882864
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D723882864
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D723882864
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 20:59:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id DAA605FFB1;
 Mon, 16 Mar 2026 21:59:26 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Mar 2026 21:59:26 +0100
MIME-Version: 1.0
Date: Mon, 16 Mar 2026 21:59:26 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?=
 <salvador.joseluis@gmail.com>
In-Reply-To: <20260316201420.798780-1-ju.o@free.fr>
References: <20260316201420.798780-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.13
Message-ID: <7fb4a892fa061d8da919446f9c4d5352@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773694769;
 bh=ji6uOIhLhHFDSeJRwudvBL/R7kzaVWMsn7QAFSykB60=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TZ7yId2HSWkJOWSt7t9D6sGjcXWL1qk2iz69G7txRphW1SbQ0i68PpATpwungcIe2
 XciTTgFWEA3FbzlLcH84AqGG0bXqQM5MHEV5j6XZWRKFHe8Hq7z0Yjpn6Prk9b7BdE
 fYv3PLtGHkasnC7g488mCov9amAaNlT+e/xg6kSOkNoJjwI1nuos0tISJh0zHNIFIe
 w/kNG2T6zZf4xzBd2rJO7VO0iD7c0+W008c4Ef4M5xvw0YnTZBYIz5rTorYpH7uTmY
 qt7O2UFYmTWWwtEtmmfm8IZ2l5VCFBhzJ+xtyX3/DjW8iXqpMhEvDmq1aoJx+o9HEc
 uPfBXORzfUKnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TZ7yId2H
Subject: Re: [Buildroot] [PATCH 1/1] package/zfs: add patch to fix build
 with uclibc >= 1.0.57
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

On 16/03/2026 21:14, Julien Olivain via buildroot wrote:
> uclibc 1.0.57 added a statx() syscall wrapper in upstream commit [1].
> 
> zfs fail to build with uclibc 1.0.57 (not yet in Buildroot), because:
> 1. uclibc <fcntl.h> internally includes <sys/stat.h>, and
> 2. a zfs test redefines a statx() wrapper with a slightly different
>    prototype.
> 
> In that case, zfs fails to compile with error:
> 
>     tests/zfs-tests/cmd/statx.c:58:1: error: conflicting types for 
> 'statx'; have 'int(int,  const char *, int,  unsigned int,  void *)'
> 
> Issue has been reported upstream at [2].
> 
> This commit adds a package patch to fix that issue.
> 
> [1] 
> https://github.com/wbx-github/uclibc-ng/commit/d3a819aff25af436e22abd5ba01ff2cfc0631b32
> [2] https://github.com/openzfs/zfs/pull/18316
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
