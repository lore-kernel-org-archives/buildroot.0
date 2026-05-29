Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97DBCD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 07:02:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9886A61124;
	Fri, 29 May 2026 07:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qXqQmwLFswn; Fri, 29 May 2026 07:02:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 142F96111A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780038128;
	bh=7IIPiO7sjOw3mLHcuBgKaUIoP7pmVJEQ1BZOUSgLiAM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iINQqXogCaN2gXRkxxaVQSZFdWiQNL8LuNNfjam6cYPoLZI6DOlMQAmxzccCwYUz4
	 w7Wz5AIWzQ25HzmMVfGnj9QDvk2M7gEMQ5AxJSgHMu97N8KfC6T9WAkMJG+31IzGYs
	 Vv0t/3Gp6vkPZIdhaozyWALHoaxK3NVPFWjBy6jiN67xr1u0oSTotFK0SRIRQTNXCO
	 XdnQjjvZaHLS7kgGJ6zVxzXj5H9USeGYGTi++9h2sGuOb+yTLXU9Mmy7t8yBinatMG
	 j9LcveYVvdLrmotAF+4insA7sJGB6tMigDDPse26mWfa59mmOAWsL/a6xor11nawqq
	 XCzcHjsJU43PA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 142F96111A;
	Fri, 29 May 2026 07:02:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 55AEE28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 07:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 373DE8344C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 07:02:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RH07MzwqsWU9 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 07:02:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3028A8343E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3028A8343E
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3028A8343E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 07:02:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 26AADB97C4B4; Fri, 29 May 2026 09:02:03 +0200 (CEST)
Message-ID: <e6fa29f5-a135-421d-a256-c60a3121a0f9@rnout.be>
Date: Fri, 29 May 2026 09:02:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Titouan Christophe <titouan.christophe@mind.be>
References: <20260527194041.2109092-1-giulio.benetti@benettiengineering.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260527194041.2109092-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780038123; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=HdZA590drojWWpZbfQxhuf6fgjXLa9nFKR9WtZIh3vA=;
 b=neg5snrwjFXUk4kVoZP70OS7Aij6mP/0ZWragGa0txHFeCh/RR7vZ/L4r6rnob8lK8eccb
 ev3HGIfix+Oih2SiBftcy6Ek7psFY5BSL7QFzWSmSgb5IGB0sAmKrlj/r7g16sZXvX4KJ9
 2Pt2l9Et6g1zL9rDdrFuru1/cdGN8wX/a6zJts1vnQRIzGI8xLyfZfEz5hiK7xV+Y8E2mP
 4hUSY+t18csHPI2WgvSwAXy7oeqjD/5AQ3cRORcdZFd0EJmzqM9llukEayqHHvBXr9UtdR
 tf/7grMvWdrS+yF8IpQGHICNJYC/sCi19rlEP3tjXE5WUa6OQ8QapAuZeEhiyw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=neg5snrw
Subject: Re: [Buildroot] [PATCH] package/rpcbind: bump version to 1.2.9
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/05/2026 21:40, Giulio Benetti wrote:
> Changelog:
> https://sourceforge.net/projects/rpcbind/files/rpcbind/1.2.9/1.2.9-ChangeLog/download
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

  Applied to master (with Petr's suggestion), thanks.

  Regards,
  Arnout

> ---
>   package/rpcbind/rpcbind.hash | 6 +++---
>   package/rpcbind/rpcbind.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/rpcbind/rpcbind.hash b/package/rpcbind/rpcbind.hash
> index e268a0733a..3059751050 100644
> --- a/package/rpcbind/rpcbind.hash
> +++ b/package/rpcbind/rpcbind.hash
> @@ -1,6 +1,6 @@
> -# From https://sourceforge.net/projects/rpcbind/files/rpcbind/1.2.8/
> -sha1  2f733aba26075ca91fda3787890232da3d07c06e  rpcbind-1.2.8.tar.bz2
> +# From https://sourceforge.net/projects/rpcbind/files/rpcbind/1.2.9/
> +sha1  111058e312e0634f8bd23a783ea4f99912ced085  rpcbind-1.2.9.tar.bz2
>   
>   # Locally computed:
> -sha256  964132c389918e8964d7334936b6dd10ef025b300c6b29e693ba0f29550e3de5  rpcbind-1.2.8.tar.bz2
> +sha256  ce5f1a87c566ef0b2897a28f50a75c1dc23fec413a46a7f4183423b6b6aa991b  rpcbind-1.2.9.tar.bz2
>   sha256  2b9477d2f4ab277b29702958f0058546edc120aae4b5fb8b8d1a9652104e1ba3  COPYING
> diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
> index 3b496ee2c6..96025624ff 100644
> --- a/package/rpcbind/rpcbind.mk
> +++ b/package/rpcbind/rpcbind.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -RPCBIND_VERSION = 1.2.8
> +RPCBIND_VERSION = 1.2.9
>   RPCBIND_SITE = https://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
>   RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
>   RPCBIND_LICENSE = BSD-3-Clause

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
