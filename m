Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE84E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 18:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57146404A4;
	Wed,  8 Jan 2025 18:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8gU8I7dz9AbL; Wed,  8 Jan 2025 18:39:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D27240264
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D27240264;
	Wed,  8 Jan 2025 18:39:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B38E1EB8
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 18:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39320607BE
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 18:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b8HdMX7mNz5G for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 18:39:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 55DFD607A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55DFD607A1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55DFD607A1
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 18:39:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 74A7C6012F;
 Wed,  8 Jan 2025 19:38:59 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:52470])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 08 Jan 2025 19:38:59 +0100
MIME-Version: 1.0
Date: Wed, 08 Jan 2025 19:38:59 +0100
From: Julien Olivain <ju.o@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <Z3vgF8YhSYdCRn9q@waldemar-brodkorb.de>
References: <Z3vgF8YhSYdCRn9q@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <7088fa1d3527a8d4bd988889d470e853@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736361540;
 bh=orgQpnv+B8YsZjc8nSH8sL2qmI2439LW6Dj3w+1BH9w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=df659JZi6fyjNYgtafzQHLzU5FeztjTSTJZqpF6F/4OnIaJC3Jzxv742uDBdxC0xi
 9cDksotBhSxiFgv2ngXNQ0v/jWLcSITA6FHvHm7rBcX3FDbN1BNOxXZZyIA3fHww7n
 vRbDb+YU9JgzAeOhUcz8ME8ZwEWEN8CqmcPWfqgJAgFRR8rYieQmRKs1UD6msOTldH
 evVvTv5cZmGupuh+SrZXx090g4L12dEKWv4lhM+tQ3wIuWRUEUWkg/eYrYMM+4kJSA
 hr6aVPKcAqi5TufrF//QgUWSWd7ltHnv/0rX4ARiyIy5PvQ57G13vxEzOJTXHBspm1
 0XlpOUMs80hLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=df659JZi
Subject: Re: [Buildroot] [PATCH] package/ruby: update to 3.4.1
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

On 06/01/2025 14:52, Waldemar Brodkorb wrote:
> See here for changes:
> https://www.ruby-lang.org/en/news/2024/12/25/ruby-3-4-1-released/
> https://www.ruby-lang.org/en/news/2024/12/25/ruby-3-4-0-released/
> https://www.ruby-lang.org/en/news/2024/11/05/ruby-3-3-6-released/
> 
> The LEGAL file was updated.
> Entries for following files got removed:
> [ext/json/generator/generator.c]
> [ext/nkf/nkf-utf8/config.h]
> [ext/nkf/nkf-utf8/nkf.c]
> [ext/nkf/nkf-utf8/utf8tbl.c]
> Some minor rdoc changes were made.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
