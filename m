Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF4FC02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 19:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB6918215A;
	Fri, 24 Jan 2025 19:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQzxUUUvusXx; Fri, 24 Jan 2025 19:51:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1F4F82160
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1F4F82160;
	Fri, 24 Jan 2025 19:51:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B62094A
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8912A608A0
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wcJ_O0hjUqP2 for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 19:51:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C019C608FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C019C608FE
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C019C608FE
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:51:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 18DD078035B;
 Fri, 24 Jan 2025 20:51:52 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:42088])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Jan 2025 20:51:52 +0100
MIME-Version: 1.0
Date: Fri, 24 Jan 2025 20:51:52 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250116204852.1896100-1-james.hilliard1@gmail.com>
References: <20250116204852.1896100-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <930c585e42a29120731b7fdff2a4f31d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737748313;
 bh=2G0W+sK7EtdyRrEBEco62MUbrDHJp39EqhtlD5asBdA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pQkiC7wUBzEgJ7Tkshk2E/BX55UdNOQPRYQQpopGk21keqJk4GNXVOy914oUOZrFE
 jJjmJKTBQLBhq2ZZyhl4hn9Us168LUQ2FLBLkgauPhocIAEx+eJqsrdQY3DPtDzsc0
 tER3M2Di62yV0//ywI7sDH7JmCROskmi7zo5lbdE9OObmNk+wDh61FHPYo4rIe3Fd/
 ga09lV1cahM3e+f5kFuWV0oQygktzlCWebS1D2tTCYiN//ABcZIOhAvsm+4r8XiAw8
 CFDeo6o3DWlxrQWWRv4AU1QC+85BS9vQ0IMBT4oEQX/CNlW2QoaD3qTJqUO9p9MLlA
 K2H6AAvx4k+iA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pQkiC7wU
Subject: Re: [Buildroot] [PATCH 1/1] package/fwupd-efi: bump to version 1.7
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

On 16/01/2025 21:48, James Hilliard wrote:
> Drop patches which are now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
