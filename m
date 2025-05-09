Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36444C3ABC3
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 17:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E01314097E;
	Fri,  9 May 2025 17:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id etf2F7lni5aU; Fri,  9 May 2025 17:09:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1936B40C44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1936B40C44;
	Fri,  9 May 2025 17:09:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0774C1A9
 for <buildroot@buildroot.org>; Fri,  9 May 2025 17:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED0B340BED
 for <buildroot@buildroot.org>; Fri,  9 May 2025 17:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z70hdDePvFZf for <buildroot@buildroot.org>;
 Fri,  9 May 2025 17:09:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2412640166
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2412640166
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2412640166
 for <buildroot@buildroot.org>; Fri,  9 May 2025 17:09:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3261713F8B5;
 Fri,  9 May 2025 19:08:58 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 09 May 2025 19:08:58 +0200
MIME-Version: 1.0
Date: Fri, 09 May 2025 19:08:58 +0200
From: Julien Olivain <ju.o@free.fr>
To: Daniel Crowe <daniel.crowe@maxmine.com.au>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250509011530.202963-1-daniel.crowe@maxmine.com.au>
References: <20250509011530.202963-1-daniel.crowe@maxmine.com.au>
User-Agent: Webmail Free/1.6.10
Message-ID: <57d368b473a8af9e919415a7697f67d7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746810541;
 bh=xpDcN6JT7KnQQdE//TeQfgQHZ518t1JaiMnUwkLqnRA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GoprAN5pqzZre9ZveF8g+qoAr3aY110uOcdr1pUFc+fwjZ5WhwjDZU46UELA3XUAy
 g+GWNVM3+hrL4j1RqCA4ngh2V8Rqe8htez24bh6/JczqXThrGE2806sdSxbX0j/epx
 +K81rv1QpUtwHzySJRRnVcQt6uQPHnOkU2R0EMrG30GlNAWQZtHrSC0+hHVGCEeS0A
 iteCFmEa4sqpLAEiQCIY0KJLInsYrpqyYusM8iESIy5zGjV5zCChxCcy64e5U/JzBI
 g/W6RiReeXWj+7V/V22l1qXu0aRIUZgE6INrc7e1NkCkmYoNmiLWfQiI/MRYXvhohQ
 r+0Up5vhsjwlQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GoprAN5p
Subject: Re: [Buildroot] [PATCH 1/2] package/python-flask-restx: add version
 1.3.0
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

On 09/05/2025 03:15, Daniel Crowe wrote:
> Support REST APIs with Flask applications
> https://flask-restx.readthedocs.io/en/latest/
> 
> Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
