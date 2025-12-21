Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7B4E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 12:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3023740613;
	Sun, 21 Dec 2025 12:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ffb2wR3LLItk; Sun, 21 Dec 2025 12:01:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ED7F405D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766318495;
	bh=/FgWePuB9D/GhJfV4cl+4gXK5zfAEj5NasPoNYzvZNQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pBB7swJp+KBeYvsnMyVYHEfybDzKEn0MBHZGmP/utX1lMwT4UJLZKPL3kvgZdTYYC
	 T7LABtVb0S1rF0+aehYc16ey+IQjCD3dfOZ+FD1XrIgsifkLTjcaxrgg900HqhC3zX
	 z9swlanwxwHpXIBaieBbtHbm5T30SN40Uk5OANGhLLyR+Ra+LiL+Tj0b7dZHGLNadD
	 vV3mRLRL2CE/zY4ejcF6amn+64sOKt6CvYunRPDYRcGR3hRxhPGCFTGvrbeYob4OOQ
	 bbJfWdYfPzTPA//vHRCknT8Gcfl9rDhp0sLsFwi50ILV4k95ffJhEVpGH3j/MJNcQ9
	 p6WN1etUG/b3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ED7F405D2;
	Sun, 21 Dec 2025 12:01:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A6E16195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D8DD80D57
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKmojVEhH0v0 for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 12:01:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE46180AC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE46180AC3
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE46180AC3
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 12:01:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 77BC7B0055E;
 Sun, 21 Dec 2025 13:01:29 +0100 (CET)
Received: from 2a0d:e487:412e:ace1:8cb:5573:7181:a54f
 via 2a0d:e487:412e:ace1:8cb:5573:7181:a54f by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 21 Dec 2025 13:01:29 +0100
MIME-Version: 1.0
Date: Sun, 21 Dec 2025 13:01:29 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Rahul Bedarkar <rahulbedarkar89@gmail.com>
In-Reply-To: <20251130131454.3040498-1-bernd@kuhls.net>
References: <20251130131454.3040498-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <80ae1b82eff8d2f2822097e5fe6e34f4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766318491;
 bh=0lUhHVi2QI3bMYxgVMUbtQw/z7rI5ng+6zxGGA8OKcM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gQSqmyhsb1hXC27S3qV0jaxcNArEyS7ZMMV8cBz2qDP8APWSrEL3Inqw/GayEiUf/
 r4W1NT6lfIrPCAJ40YvroheVN0mKvL5YVQY+FQFutk4lrkJUtgtSWBDpRR3GKFzq7R
 dSzXqh2Qux5aPWoqfR9JkI43zH84au5QMpoZMzXX0HgzdsfkgCQ5wiyrhQimwoShol
 B57P/dzldxurmB9P291qkBP0zrlgVxvjlmEsLjwbBVi/IVKjHqVNe/aeW6VJ0Ou9pj
 s2IeBI9rK7Qq+Qsi6GF0irQLeQfm1nfTn0gsw5+GnETm+HqCsPyZTEKi+40o7Bxk8e
 KMjVzNRYf/hWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gQSqmyhs
Subject: Re: [Buildroot] [PATCH/next 1/1] package/nanomsg: bump version to
 1.2.2
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

On 30/11/2025 14:14, Bernd Kuhls wrote:
> Release notes:
> https://github.com/nanomsg/nanomsg/releases/tag/1.2.1
> https://github.com/nanomsg/nanomsg/releases/tag/1.2.2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
