Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCD3E94617
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 22:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CDFE40D61;
	Mon,  9 Feb 2026 22:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3kOhNrlvvgXJ; Mon,  9 Feb 2026 22:30:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94C2A40C50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770676238;
	bh=2obhQiewJrERoD0FiObdRcFqtdsQbjWEjhU5CqZwcZk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jXZ5u8vJol95erdzj3X8NBQ4LnmlvWeFH2gJUVdXVMYnCnux0gSYNoVaaomrYGdl+
	 0M5nziTE7W5tmVjx6Q16QJdrUnxswGd374ks9HIZRiwZbEwNOyFGs/19VvToceQlVo
	 YnceVMUr6gtOioRweekwomPh7fQr5UXnQmFJXqBMLHHXyccM6uYI8LIHNmry2UdJBT
	 SwwITASpH79jiB0WDCex4+DBM6cNBjnY9zpCdNmf68p68hlf691Sz8V/kCORY7OkxH
	 gJ+k5QIhOJ0/PgYIz3BlZnAa/T3sSXJ4SqP+dqZ8xYmyctiX/Mz0NfkzC8kEl+uMND
	 Uz1X+r5X4ODhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94C2A40C50;
	Mon,  9 Feb 2026 22:30:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC807219
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 22:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1FCB40C4D
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 22:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AI24VB66102U for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 22:30:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6EE4640C50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EE4640C50
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6EE4640C50
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 22:30:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3A2E778032A;
 Mon,  9 Feb 2026 23:30:28 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 09 Feb 2026 23:30:28 +0100
MIME-Version: 1.0
Date: Mon, 09 Feb 2026 23:30:28 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260209195633.384345-1-bernd@kuhls.net>
References: <20260209195633.384345-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <7a85081ed1cf09a0c39744761a4ae0ea@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770676232;
 bh=N2eRuOKSCgoA8+uRIgHJRe8pHzffjHbmT5FDAORO7qA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Yxkoa5hhEXM4x7shzsnIScKqJBX7fuGqTLlPRYBP4OAdclGnXmFAYFEgJ0zI9A+38
 zayLznYXu6+V0LuOo/PRyqm3XB9uNIDBRktGdk8XPeg+9IQ6zW470qKf4oaUhhIJwd
 zA/3TIxMo/dyub4Db3LuwA8KdueP5LwtBGzZQDM2AZmyfMfVDPXB54y/Us+GVxkyLY
 51hFsyW3i0j+DHxzHjBVNwz81/uYsGvdeVyEpoEP7EZ5n4kJ+/Ne8shodazjm7tAPB
 QtY4MTiRKzB+PAF80b+htqZbvC1KmxJpWklqBvCb+eySJwNQ9LgLrrWEXRJVZT3boG
 SV52EBIOgoblA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Yxkoa5hh
Subject: Re: [Buildroot] [PATCH v2 1/2] {toolchain,
 linux-headers}: add support for 6.19 headers
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

On 09/02/2026 20:56, Bernd Kuhls wrote:
> And add (and default to) 6.19 to linux-headers.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
