Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E521D39019
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 20:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADE7660D9B;
	Wed, 14 Jan 2026 20:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yug_3kj7dIZ2; Wed, 14 Jan 2026 20:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1614D60D9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768423137;
	bh=lhpvErQEg0haq4TnYzSifpwKdJE11JB/9A3UZcjo8co=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MHblCrbJviRSwA/IZDmW8ufuVxTQA3nluIQFqgYV3we/O2JYcv4wU6HMrj9P/6bPc
	 9IK7JA/Rp3I/Jh96azQO96gJE+O2LxbbyEpnw0KGl30JEXdQYqg75/IM//1aA87VwX
	 RawjJwK8hosa/6iRwjW9RIKrPVG2SlGdlQb0u8MVqvlovkaBZbbn5+he6vKsXRpMhA
	 oAMLfqdSki9r3rcNFreAH1p/jm31xC7U1c6+gfUAhdf63DArJSADzjZOabCLgJVtvv
	 AfvwEz42cQDpYc63WDyiwtiICQNbTRPoVZcB1gFGt8GpwE9QkpShPO+fGkcmSL7Xoc
	 jE/9peiqNwJoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1614D60D9C;
	Wed, 14 Jan 2026 20:38:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C51E25D
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F222840B76
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v5WB2Yuqua_o for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 20:38:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 04D2640B73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04D2640B73
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04D2640B73
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:38:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3506B13F861;
 Wed, 14 Jan 2026 21:38:51 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 14 Jan 2026 21:38:51 +0100
MIME-Version: 1.0
Date: Wed, 14 Jan 2026 21:38:51 +0100
To: Gilles Talis <gilles.talis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260114155946.70930-1-gilles.talis@gmail.com>
References: <20260114155946.70930-1-gilles.talis@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <e17105a588a4883218bf3625ce4e4597@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768423132;
 bh=R7HSiISKnfRwuvz9YdyUEtza8l0upSsMxyrnDW2+ubs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bucG2QWWmWRmVkouE6RN2TPTofPHX1SqPdJRGcAZqJqF8aN485UKqWjmq8J5PxvzS
 gKU9wHtbl1J+EX8yOJr8ZlBGcnh85af7b9yo/BzLwZmbTkjbROVMUn3AfqosR0NF28
 hGZ8I0RuYnPS1Ac4OV0MejP8foQpOWWdK7gxA3b/OQHS4k5Auj9fcci0cqlJNeMt9b
 BquGMj04RLZfgNU41jWLxovhRR7l1wxm8Z/jYJc0famiz4tq60lmALD3kneva9LxBg
 u/tY9cZF/QuDQqIUQrCLXLjYoVqySKB0C/2U5DHymtSFU2piu3lH7JPwXnPGXVV/ka
 /IhBkqgs6ZnrA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bucG2QWW
Subject: Re: [Buildroot] [PATCH] package/leptonica: bump to version 1.87.0
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

On 14/01/2026 16:59, Gilles Talis wrote:
> Release notes:
> http://www.leptonica.org/source/version-notes.html
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
