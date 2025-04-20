Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B90CC369D1
	for <buildroot@archiver.kernel.org>; Sun, 20 Apr 2025 16:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 221ED60672;
	Sun, 20 Apr 2025 16:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vJJtUOsV42J0; Sun, 20 Apr 2025 16:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58644607A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58644607A5;
	Sun, 20 Apr 2025 16:54:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 236231A0
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 16:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14A9960803
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 16:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pU-sRObBgh7S for <buildroot@buildroot.org>;
 Sun, 20 Apr 2025 16:54:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 31FF660672
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31FF660672
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 31FF660672
 for <buildroot@buildroot.org>; Sun, 20 Apr 2025 16:54:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 882BFB0053D;
 Sun, 20 Apr 2025 18:54:21 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Apr 2025 18:54:21 +0200
MIME-Version: 1.0
Date: Sun, 20 Apr 2025 18:54:21 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Chris Packham <judge.packham@gmail.com>
In-Reply-To: <20250420113930.1137446-1-thomas@devoogdt.com>
References: <20250420113930.1137446-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <103f80b393609b1b6a59b871f79ff3c4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745168063;
 bh=zmrwxFHBCNBuAr8nEzKD9doShbWwnz7eriC965yX7+s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j9svzmfmKuytmETb83gb8kdXJvvp6sUGZjISWVN7LBNYubDJHwlLviXUIZuxvl94b
 UuMLMQXVpzXYnp7AEWmUcejVMoSHuFetmmn5KMFt5+Ddi9Fbu1lKOZKmkVw6mUU2SC
 3Pku3auJpRkGvBR4WQkHF8mz2w9y3aG+L33b1EMqr8DbbWPpE7+zvpbQnDGbyMWId5
 qFViChV/yphQK0JGAyhpTYSz/TSX80fEJ6cS30eXaeCrH8ZbsxxhAHDCLtEsxjxm4E
 QS3e23m3z43STdXP0VEF5EbEEnTg0/DtU6u5XWRwya86al+/Xsj1imSYFFANBsq5+y
 kedvjoejB81CQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=j9svzmfm
Subject: Re: [Buildroot] [PATCH v1] package/syslog-ng: bump to 4.8.1
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

On 20/04/2025 13:39, Thomas Devoogdt wrote:
> Announcement:
>  - https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.8.0
>  - https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.8.1
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
