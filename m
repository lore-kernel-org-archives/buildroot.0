Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C04AC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 13:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3126341772;
	Fri, 16 May 2025 13:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id liLjCR_wXVDl; Fri, 16 May 2025 13:16:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60D8B41776
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60D8B41776;
	Fri, 16 May 2025 13:16:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54AE1185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 13:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A953409EE
 for <buildroot@buildroot.org>; Fri, 16 May 2025 13:16:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bZ2lQfU75e3j for <buildroot@buildroot.org>;
 Fri, 16 May 2025 13:16:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 332F04044F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 332F04044F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 332F04044F
 for <buildroot@buildroot.org>; Fri, 16 May 2025 13:16:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2509C19F74E;
 Fri, 16 May 2025 15:16:30 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 16 May 2025 15:16:30 +0200
MIME-Version: 1.0
Date: Fri, 16 May 2025 15:16:30 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250516114626.110630-1-thomas.petazzoni@bootlin.com>
References: <20250516114626.110630-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <57df9bb3f2059192457c5546113b1234@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747401392;
 bh=B+P5XltGZWhS75jixMZpKmkpq1V24m/kKov33c4HEYc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ldJ8KaDB9xkVvik5uP2zc7tjbPeSEEKa446YJsgPM2k9emHn/27hM+iTwU+dbY/GX
 GSGTYMHXVYGNfNCRprbcsqiKHhB8BfbIICLgKDE9zGxX482cPhpYalIBepHvCLYkBh
 fnjhRIkdXmANzqVcgkZxgtvjiDLz3gN4e2gzsMrJIBKrxUw4kxgJr8YVeBGAHYORrP
 3XjV9PwoXaiRzGQUjb/RgklrHfBsZUxRzioZO3OQr+DnRDfQ0imaLZK3kJjAx1LbCA
 maBdMKaiTW6KdfRkGvnGuaFOHS5XrlopslS7ghQUZ1FIFlt0S+mlxFQEBGKjjEklHk
 7N1NBcIbmvxrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ldJ8KaDB
Subject: Re: [Buildroot] [PATCH] package/libcap: backport upstream patch to
 fix build on Xtensa
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

On 16/05/2025 13:46, Thomas Petazzoni via buildroot wrote:
> Following the bump of libcap to version 2.76 in commit
> e2eb2ee58b9f70ebb83231537cca19bd28fa48de, the build started failing on
> Xtensa. The bug was reported upstream at
> https://bugzilla.kernel.org/show_bug.cgi?id=219915 and was
> subsequently fixed by upstream commit:
> 
>   
> https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=6cdd8cd72ebcedd6b1b6c989a7e5722d5d87f35c
> 
> Which we backport in this commit.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.org/results/b9ff9258f407898eeee80dd8cc4dd1d777f44c06
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
