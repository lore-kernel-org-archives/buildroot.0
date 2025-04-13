Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7A0C3601E
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 09:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1040D60809;
	Sun, 13 Apr 2025 09:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W23rbzM4I3m6; Sun, 13 Apr 2025 09:48:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E50760867
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E50760867;
	Sun, 13 Apr 2025 09:48:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 704FDDE
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6210160867
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zniwLHyzw3L4 for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 09:48:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5205060809
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5205060809
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5205060809
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:48:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 1CE05780371;
 Sun, 13 Apr 2025 11:48:36 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Apr 2025 11:48:36 +0200
MIME-Version: 1.0
Date: Sun, 13 Apr 2025 11:48:36 +0200
From: Julien Olivain <ju.o@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, Brandon
 Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>, Romain
 Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
In-Reply-To: <20250328180427.3434693-12-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-12-olteanv@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <13ab74ff1a2d7d875c279dd1eec84e77@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744537722;
 bh=7PygM4dqlL+aDf0RiY/mFRmCcKHzvTDFwSurziBG9Fc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dSjSWySEYeqM8oSuDZp8lQq/JsPduKHkNPmRgn0McjHDoYdlnkGkIAw/LrG49EE0J
 XFb3VVsTQrIMkBG+AyH1eu41CWnh4DaMwP59/w9jXdO+K0TYu8PeGETD4cwmB2zhUV
 psgkWmaAGG/ir2Q24JTu4VSa2xSZgMGQnVMTYDfkVjk+1RhohvychVM6GPOiUMK0kY
 KECI5beFiZ9HGZ0mA2LlOJWmdRIOjNmjV/A5WHIKHJyDgf8zPyavrreAH164UYUctG
 BGL7ulEqSxqT7pLPEZv89yznntlLQobSeeoHQlmKbc0H2v/rRQQX0qfLtxX7/5c7Uk
 Y+iXUeiJFfV+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dSjSWySE
Subject: Re: [Buildroot] [PATCH v2 11/18] package/fmc: uprev to lf-6.12
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

On 28/03/2025 19:04, Vladimir Oltean wrote:
> Concretely, no change. But prevents people from going to Github and
> checking whether the package is up to date.
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
