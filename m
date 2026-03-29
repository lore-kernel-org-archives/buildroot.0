Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9511F3D5ED
	for <buildroot@archiver.kernel.org>; Sun, 29 Mar 2026 06:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9347740DDC;
	Sun, 29 Mar 2026 06:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r3cCL1l6NWK2; Sun, 29 Mar 2026 06:33:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3450940CE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774766023;
	bh=mD/4OgrSgQAd7Zmi2hxW0EOBnBQbasCGfmTRiUpOabY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z9OP5k7ScD8s9+EiUFkiwwtju3JhJqxcJgjyrZOngeIDdS7wd2vpnL/H8tqJ/EUdd
	 BzfCza+MQdIFyAOLSKDvBSncW3Vf3Em0DbbOVXo24MtAb71hZ1hHMKd+AInUPUDiXK
	 n0fWPSmmb6hGZFLwlZsTpu4owfrqNgTIjOeX8yyw0hZRtkFveZPeCR7WbK2hPfKh5V
	 DUhUTeZKB4uv/lX+rnUGsB5nB5/mcH9S22FMloEomTRXshvgDEz+SmX2BCxzrNjxxY
	 5AXBKDx64DxbtklcCHH7pJZ0Sh2bBXOyBqjM9C1plSkNPlbJ21e+HWLAKdFMdKTa56
	 7DHkYz/m0WxFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3450940CE4;
	Sun, 29 Mar 2026 06:33:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 700CB1D3
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 06:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A506400E4
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 06:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rY9mNjLG8Y2S for <buildroot@buildroot.org>;
 Sun, 29 Mar 2026 06:33:41 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AFD4940055
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFD4940055
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFD4940055
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 06:33:38 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 44534BDE43B9;
 Sun, 29 Mar 2026 08:33:35 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 29 Mar 2026 06:33:35 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com,
 romain.naour@gmail.com
In-Reply-To: <20260328074708.98982-1-chakrabortyshubham66@gmail.com>
References: <20260327094348.193822-1-chakrabortyshubham66@gmail.com>
 <20260328074708.98982-1-chakrabortyshubham66@gmail.com>
Message-ID: <b0b5f8952025479230650c07ddf30c76@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1774766015; bh=5mz/baWMpAIB5SltWae7SDx0tSC2yDmrM9WqxmaVim4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=GQQjEMSZxvH97CqPCS7D8pln+3ejJ9TQ7B+fOeOWTo31RsiaAr9P+DEF727Yax3j1
 cQe16N5gdnkV2fc71UYfMSUV8jVIORaEdHumYiF8b+OkRdg1WIRT4HZVblYI16cW3F
 VIwO2JhPILjX/rK+BGfyjhJ28qqu37Zd18mAZ+WY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=GQQjEMSZ
Subject: Re: [Buildroot] [PATCH v5] icu: fix static linking by adding
 -lstdc++ to pkg-config
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

Hi Shubham,

Thank you!

On 2026-03-28 07:47, Shubham Chakraborty wrote:
> The ICU library requires C++ standard library when linking statically.
> Without this, applications using pkg-config --libs --static icu-uc
> will fail to link with undefined reference errors to C++ symbols.
> 
> This patch extends the existing fix for static linking to also add
> -lstdc++ to the Libs field in the pkg-config file when building
> in static-only mode (ENABLE_SHARED is not set).
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>  .../0003-fix-static-linking-with-icu-uc.patch | 20 +++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 

Acked-by: Andreas Ziegler <br025@umbiko.net>

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
