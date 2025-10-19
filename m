Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744FCCCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 12:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BF16813E7;
	Sun, 19 Oct 2025 12:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FnmxIPoFoHba; Sun, 19 Oct 2025 12:09:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63D23813A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63D23813A6;
	Sun, 19 Oct 2025 12:09:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BFF643F
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 12:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E38A40A9E
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 12:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Bmv5VS3hD0l for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 12:09:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 78A7840A91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78A7840A91
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78A7840A91
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 12:09:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5E0EE5FF88;
 Sun, 19 Oct 2025 14:08:58 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Oct 2025 14:08:58 +0200
MIME-Version: 1.0
Date: Sun, 19 Oct 2025 14:08:58 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, David GOUARIN <dgouarin@gmail.com>
In-Reply-To: <20251017214949.3857613-1-bernd@kuhls.net>
References: <20251017214949.3857613-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <d6994becd0274079c7d121fbf8ec31ea@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760875740;
 bh=QQGUcuSmtYpV5kL0eoKpzZwoFLbb+2quDKqUEWN58qk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h1isKHFw0zDvgf/V5rpVILZ6WBcl9hfSKmy1aqYsfkQTNfmVVGgR15P6TNugbYlOR
 jqatMOOaMZGqebsMWYnviV45ZeOfYe9J4oeZgmB6yVmjWIHcWpEhBNPH57weP4jWkF
 adsTIYFOIiQRzlFQtr1K1lRnchul7NVc1FVwZrkWgnefp1x4D/NKAy3zu9IO8WcD9o
 qPvc+BH6bpfaHlsmINH61fGwErnqYQbpeAl6ed5BoByi5ErqxhXv4NdZfh8AZXA9Yq
 q6AmnM6mzfQPmqXpaEcXmSWtVmBAOJFLhy8vAMrI/XIgpByCj2GJlGBD0lL6ArPNMl
 HQzkP/5WpamAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=h1isKHFw
Subject: Re: [Buildroot] [PATCH 1/1] package/freeradius-server: requires RC4
 support in openssl
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

On 17/10/2025 23:49, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/5a5/5a57a82800fb7a47731198effc15bd7044133c4d/
> 
>     src/modules/rlm_mschap/rlm_mschap.c:1016:54: error: implicit
>     declaration of function 'EVP_rc4'; did you mean 'EVP_md4'?
> 
> The oldest build error found with a quick search appeared back in July
> 2024 with freeradius-server 3.2.3 so a backport should be considered:
> https://autobuild.buildroot.net/results/e2d/e2d77a52f81b0fea1081417c5c80f7991e27810a/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
