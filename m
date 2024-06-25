Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFE4C2BBCA
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 09:58:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCA2261030;
	Tue, 25 Jun 2024 09:58:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L5ZuYvEF1JZl; Tue, 25 Jun 2024 09:58:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A071F60EF3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A071F60EF3;
	Tue, 25 Jun 2024 09:58:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38D4D1BF5D7
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 09:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CA0481886
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 09:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mhi5JGe5t_YK for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 09:58:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:4:17::42a8;
 helo=smtp-42a8.mail.infomaniak.ch;
 envelope-from=slaveze@smartandconnective.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C2AC081831
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2AC081831
Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::42a8])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2AC081831
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 09:58:14 +0000 (UTC)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch
 [10.7.10.107])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4W7gJ16JgRzZ2x;
 Tue, 25 Jun 2024 11:58:09 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4W7gJ131RszVnl; Tue, 25 Jun 2024 11:58:09 +0200 (CEST)
Message-ID: <05d85bfae63d486b220fc57d1fed134370d0bb69.camel@smartandconnective.com>
From: Sebastien Laveze <slaveze@smartandconnective.com>
To: yann.morin@orange.com
Date: Tue, 25 Jun 2024 11:58:09 +0200
In-Reply-To: <ZnqTVec1xjimkGjo@tl-lnx-nyma7486-2>
References: <00b56f4cad554a6c6e13be1346df41673580fb95.camel@smartandconnective.com>
 <ZnqTVec1xjimkGjo@tl-lnx-nyma7486-2>
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartandconnective.com; s=20191114; t=1719309489;
 bh=abcXqCp06cHnry4OiNFTVYEO8kiDmvj48TOoYCx+uko=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=I2Ef3lxvGcp/SUwJfxsdEpCsqpudmMNuGiiBH2B66W48n1o7bsiOYnlDpyMaAzRs1
 w39FS58KAKF+kw74bqswHcfSdRDyJbem6rMlBjj/kNZTAnjDoGQSz0EdX+pvztg6cj
 bCDUdDoi7Bv87ADpXkDgqLlF5SW/Uws4aYimvNyA=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=smartandconnective.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smartandconnective.com header.i=@smartandconnective.com
 header.a=rsa-sha256 header.s=20191114 header.b=I2Ef3lxv
Subject: Re: [Buildroot] Rust general questions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fares Chati <fchati@smartandconnective.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> The last stable, 1.79.0, was recently added in commit 2ab21855bb06
> (package/rust: update to 1.79.0).
> 
> > Finally, are there some scripts to generate the rust-bin.hash ?
> 
> I think the commit above provides a hint. In any case, such a script
> was
> also added very recently, in commit df899041fb83 (utils/update-rust:
> add
> script to automatically update the rust version).
> 

Thanks Yann, I indeed missed these recent changes, that's great.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
