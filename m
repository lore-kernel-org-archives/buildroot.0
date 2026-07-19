Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D70C4450A
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 11:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2311160650;
	Sun, 19 Jul 2026 11:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BQxZ8JBV3i7g; Sun, 19 Jul 2026 11:08:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 308B060623
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784459281;
	bh=SaGUM0o+InPzbQpl/3cfCFwKdt62wr4E5Fd63tdvHf0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=olEZ4gYr7ODpPxQTqbozuL37mIfwiSGDkux7bshsZNABmeas0G7qB6uTRMb1fVbhn
	 sVHhmR/TLb8z0upBmIYEETZUAEo4keOJB+QJgBhnI1e5xmrZ0H+B0jzwxYzALgmGU4
	 2OMziukj2rxCXLTO7UuveKdeJ053FtvlK2/cvSpI2Mi9CEatVJit/BXq9GqPoU0IKU
	 tMLZO3B5imfqbjwoCL+w+ZW7F8Rgn20si0YQ1ogDzL827V8PIM0nSBsnv8FAT9R7lo
	 gdL/b1yImtfENzheCUlygvhvtW0DcTBxMOk1NjfQewvFEEPqDhXmx/ml7tN3pIhc5I
	 bo46hLuhCE8kA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 308B060623;
	Sun, 19 Jul 2026 11:08:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0ECD206
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92B5A60623
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:08:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tBUG-NSE7Wf5 for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 11:07:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1FDBC605B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FDBC605B5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1FDBC605B5
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 11:07:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E5C66B0054E;
 Sun, 19 Jul 2026 13:07:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Jul 2026 13:07:55 +0200
MIME-Version: 1.0
Date: Sun, 19 Jul 2026 13:07:55 +0200
To: Joachim Wiberg <troglobit@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260717142528.2709557-1-troglobit@gmail.com>
References: <20260717142528.2709557-1-troglobit@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <0aff2b4ccac2bb7207a3cec5e2e23e6a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784459277;
 bh=xGBQJsaCy/18Oome0K5KJeu6UYkC11dArkKfSXnceTE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iUQHgiWRlddTUMw2n1BxuoE1IxeFGcByMMpVhz0yU/lhymi4OBdKfG4aZvSM8gYvq
 t4w0b4frXwDrzSRypFffPtVIGslZT7rVU5jsCd4y6dGDpi1AxRuXzlnjeUyUxZ1Xas
 pKSmfbYR0/7xMLPZf4XOXLzJGRh5WJXthFrX6HlZZec1vXBj29IrZwgoxXOSWnTXe3
 bwhvBlLSRqLt1JZgRKxRr6BGg3rCU8sMl5EXbWcE8SGW7IqneXvuj8twNWZvRTqgQv
 +wZPUgMcfhiclQgfdn6CDaE1Qh5KmQFiCldebggWmxuwQ5/HYtsj7tNzo5V9cT/sxu
 kyq9jxluWqQgQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iUQHgiWR
Subject: Re: [Buildroot] [PATCH 1/3] package/mdnsd: bump to v1.1
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

On 17/07/2026 16:25, Joachim Wiberg wrote:
> This is a major update of mdnsd, for the full release notes see
> https://github.com/troglobit/mdnsd/releases/tag/v1.0 and
> https://github.com/troglobit/mdnsd/releases/tag/v1.1
> 
> - Update package description to match mdnsd v1.x capabilities
> - LICENSE hash change due to update of copyright years
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
