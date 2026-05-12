Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF30BCD4F21
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 19:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71FE140FF3;
	Tue, 12 May 2026 19:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RAf1WU5Ikoqf; Tue, 12 May 2026 19:27:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57EFE40FF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778614042;
	bh=EeND5yDW4UFKYbQM2sIdXiXbnBs4l4iTwZ+0SYKRdIc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S8E/JFcAK5CY4Lmu4agr2gdT/cGuSuaJsyqg11uuXhLq2LgjcScsCZaaYAR+cI67C
	 8H8CVmcQV5ko2qwwpSf6QeLjvDwDAbEfG3GRMDe1AUa7jqzNydD9sMwv3O3KWynGFX
	 XBDVnIrQ6149NgFJ1G+191tNAppEfsZb6DhvrpIacfJ2HzKBLVytxzTtTvkpwVEuOi
	 wh3gSp5FD+yIAAWI1y0Rl5n63ppHc0+GBt7o74G3qqE1sCp1BlASgKBsEhi0zzijRn
	 yo1O7fCIjdgN3XF3Fhac4TGryaoThm66nYeej85gAf41yZKeXUihombB06BOFfsM5U
	 kxMRn+7SRl0oA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57EFE40FF1;
	Tue, 12 May 2026 19:27:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9BF0223
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB30C40FF1
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BC0Aab5oikCb for <buildroot@buildroot.org>;
 Tue, 12 May 2026 19:27:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9CC3A40FE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CC3A40FE5
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CC3A40FE5
 for <buildroot@buildroot.org>; Tue, 12 May 2026 19:27:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 5D24D2003D0;
 Tue, 12 May 2026 21:27:15 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 12 May 2026 21:27:15 +0200
MIME-Version: 1.0
Date: Tue, 12 May 2026 21:27:15 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260512140610.52172-1-bernd@kuhls.net>
References: <20260512140610.52172-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <518835bca4b79756d9d193c52c945a82@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778614036;
 bh=LdmfX8LPkeRQ/sYTk1KDYpsXfsRW5EQfRQDpGq2Q0ts=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cydgPkh2relMREHqobEB2LrPqWi0q6wo5Vh2NXaToll4hzTJ0yZHi7BOkjNFImtov
 zxP3tGfqmgKKyLpTvQ5kmCKlsvQZWSpLeHKyUJ8T/HP6LygDeEMlTNsb/w4OFaDHok
 2uQhUeBRfZmuqQCubjH+CRjRvvsGf9ftFrVDHYtXp2dLg4f6MSlumBqzOOtUuqxs6m
 OsaUAYXvKK0F3I1TuPJYjNNpnTXJGHBPxkyv6B23ls9clR0qJ/wdJYtsMYw18fnfvM
 1zGRBJd8jpJj702YbCCQlbmwdZKj/AWu0wKKOv/BhaKNg60ZHvNkvKEf9TTeyVKN2h
 7WsHwKrOVWfrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=cydgPkh2
Subject: Re: [Buildroot] [PATCH 1/1] package/liburiparser: security bump
 version to 1.0.2
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

On 12/05/2026 16:06, Bernd Kuhls wrote:
> https://github.com/uriparser/uriparser/blob/uriparser-1.0.2/ChangeLog
> 
> Fixes CVE-2026-44927 & CVE-2026-44928.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
