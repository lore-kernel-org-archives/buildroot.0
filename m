Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9450BC3601E
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 09:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66D3960BB6;
	Sun, 13 Apr 2025 09:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtPaA5a5oheO; Sun, 13 Apr 2025 09:47:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B42E360ADD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B42E360ADD;
	Sun, 13 Apr 2025 09:47:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ED4B7DE
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF22D4014E
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pi0RQ83EfERI for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 09:47:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 47640400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47640400CE
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47640400CE
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:47:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 374F55FFB7;
 Sun, 13 Apr 2025 11:47:15 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Apr 2025 11:47:15 +0200
MIME-Version: 1.0
Date: Sun, 13 Apr 2025 11:47:15 +0200
From: Julien Olivain <ju.o@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, Brandon
 Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>, Romain
 Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
In-Reply-To: <20250328180427.3434693-9-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-9-olteanv@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <627ab87c4906b108a41ac8f01dbe8fb1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744537641;
 bh=PxN8cMMxfgcIBTKpI8mptcxDKszLdZSTMv0C9DFp3/M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BGDflp9nFEB+jBms/NtNvDzFIQXo+GNutRFkul5aR7xgAEyGJ6m3oBM8qlIPBFd5s
 PQ6976kSGq4nXG/OxQ8PXJGoO6ocLGqrjXnnchVfUBu2GwOKxqJscs/pjsgfW6V9S2
 14ZLEJblgOrsfGe9CJUxhT6OvPFlOCCa64PJ//kJmoBRxyqfnNe/NPN++3ttsmqugy
 vXoWp0vPzuM6IZGwwDxIViTtTQLiGaWG4ZytdonjqWALyypGQVgAwvgwQBGispnIW4
 ryG4kOxLsd/tH7G9FGUovPDrGwZ9oh51b4HmKzmyCA3xa2q7EiiPYIYwDGOFXSddG/
 rNa2lufblEXcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BGDflp9n
Subject: Re: [Buildroot] [PATCH v2 08/18] configs/ls1043a-rdb: bump BSP tag
 to lf-6.12.3-1.0.0
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
> The latest Linux Factory tag is lf-6.12.3-1.0.0 (Q1 2025), update to
> that.
> 
> The LS1043A-RDB board is currently supported by NXP through a BSP
> called LDLSDK. That isn't what we use, so update the documentation to
> reflect that for awareness, and provide a link.
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
