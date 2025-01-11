Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835FFE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 18:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4441E80BC9;
	Sat, 11 Jan 2025 18:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3B-4AtS1d2d; Sat, 11 Jan 2025 18:34:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E18A680F0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E18A680F0F;
	Sat, 11 Jan 2025 18:34:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1342F942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E570140017
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4oBp4esMCXO for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 18:34:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8BDD9400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BDD9400F9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BDD9400F9
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:34:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2E63219F732;
 Sat, 11 Jan 2025 19:34:13 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50694])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 19:34:13 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 19:34:13 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111161154.2867405-1-james.hilliard1@gmail.com>
References: <20250111161154.2867405-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <88b536c8d4d1007a5d33775966e851c3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736620454;
 bh=V1E/9420KzXlNOP2OzngpHVObVoqTHTjDURa0ljILJ0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fM3zPhcQY6cFS1l1msiycIxAHULKBhDWOP/XkfMr/6RpWxQiEUafa+JZeUQXV2Hvn
 vkjvosd3pjIeMte4y639Zh5ZJ14M/bAF2vuBUsC52SA6SIUC5KWL1Eha5KEZg7j4ir
 5on14axhj1Dy4JartayutC7juJ5EL1vvvcwGuXGFY5bNKZ9lpOSX/4tqaz/AmY39UH
 dNJfm53G+XyCnaw1XrcqITnnD8oHKqpiAHgz2tyMUbGqqXBI+JJMs6GvDvBOvJ/9Uj
 n8KyxMHZfn7AUpD2w8BxBk0NcQnt0VEFXFl8mHBkhLhVy7TI+NDm9gDfCKkmszjT79
 InPo3M30Q8Apw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=fM3zPhcQ
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyroute2: bump to
 version 0.8.1
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

On 11/01/2025 17:11, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
