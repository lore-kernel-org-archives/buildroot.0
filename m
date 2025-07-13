Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDE1C83F17
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 11:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF490405CF;
	Sun, 13 Jul 2025 11:45:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZhVpWOCOJVH; Sun, 13 Jul 2025 11:45:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F21674051C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F21674051C;
	Sun, 13 Jul 2025 11:45:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AE25DF
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 11:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60BE08179B
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 11:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hLntajmQ1O7C for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 11:45:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 779D881699
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 779D881699
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 779D881699
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 11:45:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C30EDB0055A;
 Sun, 13 Jul 2025 13:45:37 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Jul 2025 13:45:37 +0200
MIME-Version: 1.0
Date: Sun, 13 Jul 2025 13:45:37 +0200
To: Andreas Ziegler <br015@umbiko.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250713103047.1826080-1-br015@umbiko.net>
References: <20250713103047.1826080-1-br015@umbiko.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <48229d2d929a69001d77bafcd467cb96@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752407139;
 bh=ZK2sWU1W/wwCsseTQFgsC73eu4zx0jgB6356EcooRFQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LqgVW4At7WH8EdAW4FCajsDDJr1S+8GifAWaIP8MxY4hyzxw9u3fTUF+2dQ1S0uzR
 0a+cyP+Bm2JdYe7OZGt43zA3omllI3mfVZ2TH55h80LqEgqJ29lAl7kAo2pSzf2ymb
 /8/7Z/rgarlhmsz+hy7v/ckEmWeN40EzQRYIiJgviJJR92/Wsh2Sa8uwD/s63OqD3e
 DklYK9HjmUAaOY1ibYIRW3/zQiwy/6qFTfhTx2/TVRETjYKLmiB4UQSk/pptD9aDdP
 MFqp9l2B+JHsD0XCCGR1B9iM29KFW+4lUUJ8asjmwDuez3w2+JIaenTGnztLjE/bH0
 yTrUK4kfe6pcg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LqgVW4At
Subject: Re: [Buildroot] [PATCH 1/1] package/libmpdclient: update version to
 2.23
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

On 13/07/2025 12:30, Andreas Ziegler wrote:
> Version 2.23 change log:
> 
> * support MPD protocol 0.24.0
>   - allow window for listplaylist and listplaylistinfo
>   - command "playlistlength", "protocol", "stickertypes",
>             "stickernamestypes", "searchplaylist"
>   - tag "ShowMovement"
>   - new sticker find api
>   - new subcommands for "tagtypes": "available", "reset"
> * Support open end for mpd_search_add_window
> * format floating-point numbers with the POSIX localew
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> Tested-by: Andreas Ziegler <br015@umbiko.net>

Applied to master, thanks.

For info, I also updated the signature link in the hash file. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/ec477e79661235e6da30ee5c6fcb3970a0b5b789

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
