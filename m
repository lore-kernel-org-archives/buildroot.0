Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74191CD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 17:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 356444153F;
	Sun,  3 May 2026 17:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uofFt-bTIqno; Sun,  3 May 2026 17:46:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6453641531
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777830394;
	bh=v23gEu83ffUiCazTOafaKjJ/Ck+1eZV0j9+ph61tVPs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ESyNYZPWuXy5VHkk6rq5OYmHPw0qfseSJM6G6+Bn44V4iR/ZxtASHjgfIXRMJOJDq
	 ppVKGI39DcuvJLgILViNVBi3P6bLPXyL3l/VqOMhnTLXIDwa2jWhjwEZGZvCz9eX6G
	 lU0TF8JAsTfkQBwq5Klv74QL4NBEjhfbThf7O8BfBCNHQRvROnKUxQcjYQX6XFn/ZG
	 o2760+a7hoKSE3hvRlGBcRvkQOyLG6n9Pr+9rZPID/BJrFP0dItm8vWBnmaEWsjlZ7
	 sZoSh2VOifya2XYDOSjVwXqa5gAn2t1AG7kVaTQ2BWonODEpWIkvzQF2UY4NGi/L07
	 mtAq9LVFJD2Tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6453641531;
	Sun,  3 May 2026 17:46:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D43D825D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 17:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5DB140747
 for <buildroot@buildroot.org>; Sun,  3 May 2026 17:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VPDQTEAV30Ux for <buildroot@buildroot.org>;
 Sun,  3 May 2026 17:46:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C90ED402DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C90ED402DC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C90ED402DC
 for <buildroot@buildroot.org>; Sun,  3 May 2026 17:46:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id CF60CB00579;
 Sun,  3 May 2026 19:46:28 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 May 2026 19:46:28 +0200
MIME-Version: 1.0
Date: Sun, 03 May 2026 19:46:28 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260503061617.615268-1-bernd@kuhls.net>
References: <20260503061617.615268-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <5923c95447f2d1a14d6376fd184b2411@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777830390;
 bh=iicsn/LzRIeKe865r9cL8WxspcWPOpmnOZSY0XMUaLA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FWJzYgclyhFJhYvjUuTvyTeqSCOuH3Bcg6vMaCUOKwQSWOjU53yxqj+Se/YTsmAlV
 bIYhNtU4rCu4qQ9nSvCBZY+FvmyLP6D1wNHtW6bkEgJoOiEQ5k7ow+VE+WjguD9gwR
 zIx+b/xzQS7zuq+gbN1PB83mUQUh4zcHTAdKgqS5/jeziG2TmWVWjt8TqJGEV3Xxv9
 aOt1N7KCGcro2vfYzOGAwbQp0v1De3yxCagEaW8L06zylQMJOWBrrUxPr/UlefVBKm
 0g+HLvf7O2kx13iHU8NdPAbmWw+XaGFXOBt0foRkfyw/JQUVwn0sCLWnv0oVV81E25
 H8IqVGK+au1uw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FWJzYgcl
Subject: Re: [Buildroot] [PATCH 1/1] package/spirv-llvm-translator: bump
 version to 22.1.2
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

On 03/05/2026 08:16, Bernd Kuhls wrote:
> https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v22.1.2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
