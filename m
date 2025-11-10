Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28997CCF9E3
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 19:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0134C817FF;
	Mon, 10 Nov 2025 19:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xnQvnm6dfSiy; Mon, 10 Nov 2025 19:09:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2433C8179B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2433C8179B;
	Mon, 10 Nov 2025 19:09:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59B3625D
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 402AE8179B
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:09:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1waasHQlsWr5 for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 19:09:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7200381498
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7200381498
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7200381498
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 19:09:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 75B3AB00572;
 Mon, 10 Nov 2025 20:09:18 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Nov 2025 20:09:18 +0100
MIME-Version: 1.0
Date: Mon, 10 Nov 2025 20:09:18 +0100
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251110055527.205954-1-nemaakhilesh@gmail.com>
References: <20251110055527.205954-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <bd0a893cef4612570308951b342fd162@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762801759;
 bh=/c2EpRoQxXen+4tev0tcJkiLdZ4Rz8rdM4GJGS3pchw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JelsAg0sgOd8JheNHIYf8yXKL3oM17j8r/y01y6Z48qqUIiq7v7aYTNEKmUAfro7Y
 uTpEN7CU9yIzvAcsHky/GhN8oDrJs48KXBFVEDMcoIwQzB5KebTIAl9CEO4v+/bd8W
 1JqZ7rIxFmmg9fyWR4JKt6KSm+Hr2XYEGovvyebYzSucEaCsVUNNeenzTPjaZthVxX
 KbgZSClaUpcLu+DgV/kR5GNkxf4IB5Wyd4aVtBj/3Xh497L+dHc0TdcFBeKj0u+W75
 jH5eto8QE4p7nRlME3w62IuUZa22zuL5SunDu2IdfVm+Ej0/HrHp1tHmdZaQli3Nfc
 TGJv/ragR2Hjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JelsAg0s
Subject: Re: [Buildroot] [PATCH 1/1] package/nmap: bump to version 7.98
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

On 10/11/2025 06:55, Akhilesh Nema wrote:
> Changelog:
> https://nmap.org/changelog.html#7.98
> 
> Note: It includes a fix for CVE-2025-43715, which impacts Windows-based 
> systems.
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
