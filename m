Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73C14C369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 09:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40D7580E63;
	Mon, 21 Apr 2025 09:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dGLyXhLMXtiB; Mon, 21 Apr 2025 09:52:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CE7D8114D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CE7D8114D;
	Mon, 21 Apr 2025 09:52:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4926D1C0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E8CA8108D
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:52:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3krvrxhd77u for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 09:52:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5868980E63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5868980E63
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5868980E63
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 09:52:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 3B41D19F5C6;
 Mon, 21 Apr 2025 11:52:40 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 21 Apr 2025 11:52:40 +0200
MIME-Version: 1.0
Date: Mon, 21 Apr 2025 11:52:40 +0200
From: Julien Olivain <ju.o@free.fr>
To: Daniel Lang <dalang@gmx.at>
Cc: buildroot@buildroot.org, James Knight <james.knight@collins.com>
In-Reply-To: <20250418144530.24911-2-dalang@gmx.at>
References: <20250418144530.24911-2-dalang@gmx.at>
User-Agent: Webmail Free/1.6.10
Message-ID: <85c1a12beffbb002d6c7df37f9962bba@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745229162;
 bh=JBWUowX9xDsd1z7ikOGKedNaVTURxuIdiUMdiNmPUDM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PdWwOaWreeLKpZ2N+5OJOqVCmHM0eOWTihE+XjLbuCtV3tdH8bRUUKtjM9PXcQUro
 Oo5+xCqI29m2bOG++zPNm3d9XgXjVlFxZRScxyKukoq6kNSOXUt9U1inDljfzDF5mO
 +bSMQExbKXEGEyWdgkW4V673gY/HnAAbZ0shENWlwN2JVXR9xio4WSlD0q+rXvAh39
 0KLBF1mxf2cv2WKQ9tFVWTDQINnZ2vaJRa7HrXgftRja0TSpS8qHJ8lYa6chxIPsED
 jIWaChSSHsf3MGO15QsdXjaz/ezbKngIyUBrqiI8mkLYoh7e1L1mJ+RDfQwG1wbN6i
 VT0RFtZvrWB0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PdWwOaWr
Subject: Re: [Buildroot] [PATCH] package/gtkmm3: bump to version 3.24.10
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

On 18/04/2025 16:45, Daniel Lang via buildroot wrote:
> https://gitlab.gnome.org/GNOME/gtkmm/-/blob/3.24.10/NEWS
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
