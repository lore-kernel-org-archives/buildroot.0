Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C523CF55102
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 17:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6542460FCD;
	Sat,  7 Mar 2026 17:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2QocKbpygls0; Sat,  7 Mar 2026 17:04:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 553FA60FB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772903085;
	bh=KUrIp7PmCSa0NglLhBs853ISdZ0OVNuSKt9EU7KRsUk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MASvHiwYJbzK2dJrXmt52LlPzVEvVSwlgzs3xmAOiazUSD0QUfaufOmGi3lRcNmoH
	 afy82MIJtJkSjqrHr80nQvUV9Il8T4aO98ahD5ekX+Y0oCbFTn8L7P/LQhNC3VEcoB
	 MONlt6yO8rqseLQnNvwLNMV69CRB9NjRBuYycEFv8TwQ+up/PRArKNp/AQLu8F6FdD
	 npZOEFor0zEii73cbgiBfVOn1VT3WRpJlCzPq95aWB85uDhX58J3QJ+a1IraLUYELt
	 TP8PLNxuh+kmEoTE3wy23yFuv4Mtl8bsj0Lz7M9Q9Dylf8PxGu3aQ+kHu6FQYJjWcD
	 mvTHHxqWnArwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 553FA60FB9;
	Sat,  7 Mar 2026 17:04:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ACFD0223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 17:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E37483FAC
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 17:04:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hS3AZ43iMCJC for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 17:04:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE0C283F9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE0C283F9F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE0C283F9F
 for <buildroot@busybox.net>; Sat,  7 Mar 2026 17:04:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 193C22003ED;
 Sat,  7 Mar 2026 18:04:38 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 18:04:38 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 18:04:38 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260307153929.384884-1-francois.perrad@gadz.org>
References: <20260307153929.384884-1-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.13
Message-ID: <f7afa8ffc44904214426c75103d65730@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772903079;
 bh=Wu2GioKdAlNN3pDPUaezMkCjNKVjpZjhIirTl/xwU7o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MICaINUxcVMk4Eqlobz+PJ1AmntoBm1FXHvZSdYqy9SXdpO/T92JZJSasYRMQUVYs
 Cj0ti46FJR+bpmrebNYuKbuneq7AqtJeNCoY5MT9NASpC2adjFCu9qM0VyqdXLIs87
 wVfrU0g7o2D7S3Gp2+EIm6ft666KsTV8RmMSm2/5f1WZcWTeytakfW9k3QJz/k/S9t
 tNF9jY6EQ2wJMLJFyHXqCkcLRlcaEGDO5lTmvcHhv/wP2rx5U95VfcYbYfDMkPkOKv
 JTuo5VEPWLX+rhgGHJE1X8QuRUONjFNLj4OejRYxJPkRBNfwx7mbMlhi4JC3GNpAS7
 kfLssQhu9Dy8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MICaINUx
Subject: Re: [Buildroot] [PATCH 1/2] package/ficl: downgrade to version 3.03
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

Hi Francois,

On 07/03/2026 16:39, Francois Perrad via buildroot wrote:
> see https://sourceforge.net/p/ficl/news/2025/07/ficl4-is-retiring/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/ficl/0001-fix-Makefile.patch          | 47 -------------------

Removing this patch generates a check-package error.
Its entry in .checkpackageignore should also be removed.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
