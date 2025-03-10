Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08FDC282DE
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 22:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EEA541061;
	Mon, 10 Mar 2025 22:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcwMv9QUckw1; Mon, 10 Mar 2025 22:28:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71DCA410AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71DCA410AA;
	Mon, 10 Mar 2025 22:28:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 19E84EDF
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 22:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08EDA8209E
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 22:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wa79xXpT5KPJ for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 22:28:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E849982099
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E849982099
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E849982099
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 22:28:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4CB5A19F57B;
 Mon, 10 Mar 2025 23:28:38 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Mar 2025 23:28:38 +0100
MIME-Version: 1.0
Date: Mon, 10 Mar 2025 23:28:38 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250309220640.213083-1-olteanv@gmail.com>
References: <20250309220640.213083-1-olteanv@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <e8f8cc824b8cabadc25d80d901925eb3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741645719;
 bh=vQh945cF41iFe6yE1rZtnWfOOHEUgoCKMyDBeixT+2o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=luXIC17IEwiCCWcv5uNZbaDPoViHUmLF643i+uq1xdBXHDyEdYWCCNgIXkBMqsVol
 Rp3W44BS6GvEIfyjSLdIQqHVA9AlVqKgpU31/PPGMU0ZUGeO5MeyVzGTzZ/CtIw505
 +DeIG90+2vS1kyLBboOl8g7qp4SbI+BwqSJRaHEnQ6+16IFWQQCkJ8qX806kUssqpk
 axjWnQk6pQqYReLEdLZZidMEgvBRVzQvjdgblgMdWtHxO3BIclxz5K8ZyAQz7nu9kj
 o5owO+bmOdSeydmmU0HidE1m3tW2tVFun/9wrHU6iThIZ8gwRDIyM/vYVLfOAVJeuy
 ATOsRyIg9W5Ig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=luXIC17I
Subject: Re: [Buildroot] [PATCH] package/util-linux: add uuidd user and group
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

Hi Vladimir,

On 09/03/2025 23:06, Vladimir Oltean wrote:
> At rootfs creation time, fakeroot fails as follows:
> 
> printf 'host/bin/systemctl --root=build/buildroot-fs/ext2/target 
> preset-all\n' >> build/buildroot-fs/ext2/fakeroot
> (blabla)
> FAKEROOTDONTTRYCHOWN=1 host/bin/fakeroot -- 
> build/buildroot-fs/ext2/fakeroot
> rootdir=build/buildroot-fs/ext2/target
> table='build/buildroot-fs/full_devices_table.txt'
> ignored spec: h /var/log/journal/%m - - - - +C
> ignored spec: x /var/tmp/systemd-private-%b-*
> ignored spec: X /var/tmp/systemd-private-%b-*/tmp
> ignored spec: x  /var/lib/systemd/coredump/.#core*.%b*
> ignored spec: z /var/log/journal/%m 2755 root systemd-journal - -
> ignored spec: z /var/log/journal/%m/system.journal 0640 root 
> systemd-journal - -
> <stdin>:37: Failed to resolve user 'uuidd': No such process
> make[1]: *** [fs/ext2/ext2.mk:66: images/rootfs.ext2] Error 65
> make: *** [Makefile:83: _all] Error 2
> 
> The error comes from systemctl, which cannot find the uuidd user in
> the target rootfs, needed for this:
> 
> /lib/systemd/system/uuidd.service:
> [Service]
> ExecStart=/usr/sbin/uuidd --socket-activation --cont-clock
> Restart=no
> User=uuidd
> Group=uuidd
> 
> Add the uuid user and group in support/scripts/mkusers syntax.
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>

Applied to master, thanks.

I slightly reworded the commit log, to add extra info (commands
to reproduce the issue).

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
