Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95E3E63F3D
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 09:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EE6760B44;
	Mon, 16 Feb 2026 09:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSOCtFQ6HbjR; Mon, 16 Feb 2026 09:23:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E69C0607C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771233825;
	bh=hBv3ItmwqUSreJGwW2bZQlmuPYzGr9An45ROLHusLsA=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D9CwGNUpzmJCpZRFKl/6fOWCLKxbTXjqvXZ2XTRVypIOcuAJzpfQ9myimzQ3nRgvR
	 cSJFbxTSdVv/LgQwfLXGufthOGOMaZOZlGTK7geSAAsKarFEn8cULu8dLyU9g86qGv
	 72j7LYRkwpt60lvtgKvMufLb04r0Rmi0NTHU3aiwCp6+e1lObTqOmoUYsCoR7SgItW
	 xQ4MargdstcJATh40ppA/a1pjp2J1lkooHNNdCkqlZjg8S9KFsesP+zdGArnCv9PL0
	 HD5b88Nwa6JXeiw3Kg7bd47wjOqq6fr6mDXUIjHtISI+RjYORjI7aqX5tEebeJFm3m
	 O5SoO7w3WfM8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E69C0607C4;
	Mon, 16 Feb 2026 09:23:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B0EF270
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CADA81169
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 09:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Cj76HwWqICk for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 09:23:42 +0000 (UTC)
X-Greylist: delayed 577 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 16 Feb 2026 09:23:41 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 93FC78116A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93FC78116A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93FC78116A
 for <buildroot@busybox.net>; Mon, 16 Feb 2026 09:23:41 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id 51D82440762;
 Mon, 16 Feb 2026 11:13:17 +0200 (IST)
To: Michael Fischer <mf@go-sys.de>
Cc: <buildroot@busybox.net>
In-Reply-To: <20260216090524.7172-1-mf@go-sys.de> (Michael Fischer's message
 of "Mon, 16 Feb 2026 10:05:11 +0100")
References: <20260216090524.7172-1-mf@go-sys.de>
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Mon, 16 Feb 2026 11:14:00 +0200
Message-ID: <877bsdkq3r.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1771233197;
 bh=o4jesvLilaJa0M/PXFpGvTzmYc3NBj7x5NDgJP1afUM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ewndVkYWCHYEOaGge26hjCZwuTT/lU2L+TKe1DPzX0R6lltdwMZ9sH9FuHhJogIx5
 KFsOfeaUEGVl3fNmpaUUo6gFneZvtQT4U7wyeJPWFLicx2ztOv9oPRDJdyU+cCc0ER
 pjdic/gjgW18YwOxb5toVC8UJ5ILtzEVFTB5sYCKzaQHzM7S6/JHV2teZRuQU45mRc
 unqCeW5r9KwaDzDd4YixTE5ZDq6T26nqfvjSsflnfdg/nr6C7gcaVFNcY7uuVN4DyP
 ds2vv2Rpv2r7WItq6vLgjSEe+Zc8BIJ7K2RuIbInOT/2oRX0RDr7zz1eZafkYAwmv0
 ZvQSdEoxk9B4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=ewndVkYW
Subject: Re: [Buildroot] [PATCH] SDL3: Add new package SDL3
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michael,

On Mon, Feb 16 2026, Michael Fischer wrote:
> Simple DirectMedia Layer 3 - SDL3 is a library that allows
> programs portable low level access to a video framebuffer,
> audio output, mouse, and keyboard. It is not compatible with
> SDL3.

You probably meant to say "SDL2" here, right?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
