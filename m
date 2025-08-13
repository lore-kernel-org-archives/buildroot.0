Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A838CA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 14:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5879940EE4;
	Wed, 13 Aug 2025 14:37:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tAzl2C6XGjn8; Wed, 13 Aug 2025 14:37:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B73340E9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B73340E9E;
	Wed, 13 Aug 2025 14:37:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 18739938
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 14:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2755607FC
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 14:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0qAqg5ItifkK for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 14:37:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D9C70607A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9C70607A7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9C70607A7
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 14:37:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E0B3C13F8AE;
 Wed, 13 Aug 2025 16:37:44 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 13 Aug 2025 16:37:44 +0200
MIME-Version: 1.0
Date: Wed, 13 Aug 2025 16:37:44 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20250812214238.2398115-1-thomas.petazzoni@bootlin.com>
References: <20250812214238.2398115-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <53d4b5abca67c5d5a2e3b4a416d714fd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755095868;
 bh=5pOwQShWNlqazmVKgYQ35qmj9oy0JGVfQGZslVMnz/4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ux+IEpf8udxmcbiM7y+1s1/ARCbrsVjlMMut8mtmt445U6nbB75um0nJxgLSSLlp7
 XuaqJroOOVz6Je1bJwH5posutyk1p09E5F9VWpVo+/WVDSEVbdKNorswSyLrYzSlRo
 mZbwRdxwyE0cqVkCbFZhGLW7zTs9zQsJFjmLQOlI1eXsK01htxrKBT6hZzd8TzwUi+
 kW81JLRVKR+6FFRi1R06ML+lF5APfzSRUPTn6sRm+TwK8j9VDSUz2AASEeiW/TEVxj
 5J3VY5vm77ZIh7Iyh//EKJt+gUAISxc8adLmJG0d7yrTIjUcN6atTuHQ2NIPfykZLk
 vcfLOYdKQOcBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ux+IEpf8
Subject: Re: [Buildroot] [PATCH] package/gcc: bump 15.x series to 15.2.0
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

On 12/08/2025 23:42, Thomas Petazzoni via buildroot wrote:
> Announcement:
> https://gcc.gnu.org/pipermail/gcc-announce/2025/000189.html
> 
> GCC 15.2 is a bug-fix release from the GCC 15 branch
> containing important fixes for regressions and serious bugs in
> GCC 15.1 with more than 123 bugs fixed since the previous release.
> 
> One patch is renamed to match the filename generated by "git
> format-patch" out of the box.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Considering that this is a bugfix only release and that 15.x is not
> the default GCC version in Buildroot for the 2025.08 release, I would
> believe this patch should be considered for the 2025.08 release, even
> though technically this is a version bump.

Since this bump is indeed a bugfix only, I applied it on master.
Thanks.

For the record, I added in the commit log a link to the list
of bugs fixed in this release:
https://gcc.gnu.org/gcc-15/changes.html#15.2

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
