Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AB2C5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 11:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3C7480E8F;
	Sat, 15 Aug 2026 11:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1KY68FeIsHj; Sat, 15 Aug 2026 11:08:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F388D80E36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786792130;
	bh=TaxrnpDjcS/ODU+SxgKWt6M/pxyWm9/9YcFgF50aal8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q0NvjAm/4LaHPirFSeN1cl/GLGiKJVXj4X64LSt9yJTih4/8XHky224vSRfqDMnol
	 KmvONDWq74NgrReyaEVbUMuyAi9mIHoSELC6JkaKiiE19jAl9L64BDMAJkc+15IEbv
	 gzY9NNB8f7uaZSsmHGgdXWLzmUMgxQphf7aDXureF2QlazuYhuvagEY8XbCHS7cZtb
	 T4B+fZSlcQTLnlQCd8+THF5ZKYK3Wsin1nWqvONNdtW3b/Aql9prbiCXgCGHb8t6U9
	 tHHvxvldRWlb4mwQkt+ZP+NhxJX88dyfbySbqFgVQOj42GCexthBIDePhNzDyLHHLG
	 pfslRqARY4KYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F388D80E36;
	Sat, 15 Aug 2026 11:08:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B74E361
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 11:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D64F40869
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 11:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4s07syaRLAs for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 11:08:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3960E4085C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3960E4085C
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3960E4085C
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 11:08:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id EFD5E2003D0;
 Sat, 15 Aug 2026 13:08:44 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Aug 2026 13:08:44 +0200
MIME-Version: 1.0
Date: Sat, 15 Aug 2026 13:08:44 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260815100306.100753-1-thomas.petazzoni@bootlin.com>
References: <20260815100306.100753-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <7a475cbf31266f212e4204514e6f28c3@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/cramfs: bump to version 2.2
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

On 15/08/2026 12:03, Thomas Petazzoni via buildroot wrote:
> Changes:
> 
> Security and robustness release.  Notable cramfsck changes:
> 
>   * Reject dirent names containing "/", "." or ".." to close a path
>     traversal during `cramfsck -x` (reported in issue #12).
>   * Open regular files with O_CREAT|O_EXCL during extraction to
>     prevent duplicate-dirent attacks from truncating files reached
>     via a previously-extracted symlink.
>   * Fix outbuffer NUL termination and a 1-byte overflow in
>     do_symlink when running with both -v and -x.
>   * Harden romfs_read against truncated/malformed images by
>     zero-filling the window buffer and checking lseek/read returns.
>   * Reject directory entries that extend past their parent's size.
> 
> Documentation: README now documents cramfsck and lists all current
> mkcramfs options; stale hard-link and endianness claims corrected;
> NOTES trimmed of the 25-year-old Future Development section.
> 
> (See https://github.com/npitre/cramfs-tools/releases/tag/v2.2)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
