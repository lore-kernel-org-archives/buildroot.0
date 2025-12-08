Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1564D3B7E2
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 19:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46501610C0;
	Mon,  8 Dec 2025 19:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AVhCK2KfMTeW; Mon,  8 Dec 2025 19:37:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D77C6102A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765222675;
	bh=slBrNdlp/WIFERmc0MQFAkT3Ouwfp0rHiLyJm1eLIzQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=G/FRa6EKw7tSuD9AIHxu3oIsFjU2ntDmESXSANHQ2JiewyhH/uedWbLa0RHRDRlnC
	 +2cZVGvbv4hxe3+mB12N5t3tuwKXlk999PaKjrW4O1quGjQEv2c9RejtUlAMaiHGj9
	 OZfCFZcfhFbJWMhg5SF4tA+TgFyJKObeTKZKeQROnaUJgbAb1URLCanvJFkpNYF3Lt
	 NQNl26sHVVUnepPuc3zVGSl8HwP5hoenwa52ZDRH6VcqURT8uzVBA2Zyvg4o6arpLa
	 Q5FUlWxsHR/7giiNRWMGZvnsA+X60ZkSRUPtEJUA+emwlIpxUGB4SoWj0Run1yT8ek
	 hcl9bXAnOwGFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D77C6102A;
	Mon,  8 Dec 2025 19:37:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 181B6197
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 19:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F39384059E
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 19:37:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 52cgcZSUBAYx for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 19:37:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A94624058F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A94624058F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A94624058F
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 19:37:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id DFA4478035B;
 Mon,  8 Dec 2025 20:37:48 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 08 Dec 2025 20:37:48 +0100
MIME-Version: 1.0
Date: Mon, 08 Dec 2025 20:37:48 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251208165658.3644480-1-bernd@kuhls.net>
References: <20251208165658.3644480-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <4c0a2e3f9e32eead23ea827f437b87cb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765222670;
 bh=81pPNWwp7JBsLP26Z/CegQxbFbcqp8xX7lwYHRHb02Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XTovVAVrpATfWqGeLWfoq477P6y8VAaDFqajkVOj0piD3lLJiqO/zkDMswA0Aiglp
 QiHUgEtNrYsbbthG4iGoh9Q2wVQ3bG3F9s2HKF5ub3Nu+Nxv08Capc15Ph3v9sr/bQ
 Q7Air2vVAOB85Jp1nH7BPwjzFGjmHO76kNRarx5nmoVIq+D71/ez7kmE+FXVDRjH1s
 3n2RlNFDGjDLk9rjFumf8No9c1tes2+/UNigLJydEYXgWGZO3J7/oQT0zhqfOxxvOL
 Z80cdtA0LfUnh0kNuFTSOHzZwLa1exZhoUSm0BdOsGQ11KtallvItg7za18Bt41vCb
 swGwbDNJy44FA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XTovVAVr
Subject: Re: [Buildroot] [PATCH 1/1] package/strace: bump version to 6.18
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

On 08/12/2025 17:56, Bernd Kuhls wrote:
> Release notes: https://github.com/strace/strace/blob/v6.18/NEWS
> 
> Buildroot commit a06d79862a60d3c8d5ddd6a9ab12b5ccdd91984c bumped the
> linux kernel to version 6.18 which broke the build of strace.
> 
> The build error was not yet recorded by the autobuilders.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
For info, an autobuilder failure appeared, so I added the link.
I also added commands to reproduce, and update the pgp key URL. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/8344efd7646d3eed0e2313b1f692bb662d6e2d8f

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
