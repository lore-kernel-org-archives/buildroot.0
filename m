Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AE0E7719C
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:37:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19E85606A3;
	Sun, 12 Jan 2025 11:37:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3PrC7QkV0ISo; Sun, 12 Jan 2025 11:37:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A5DD606CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A5DD606CE;
	Sun, 12 Jan 2025 11:37:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 15DA168
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB6EE606CE
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kcx7JVcfYVli for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:37:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 51FE5606A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51FE5606A3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51FE5606A3
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:37:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 941F25FFB1;
 Sun, 12 Jan 2025 12:37:17 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41924])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 12:37:17 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 12:37:17 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111185821.2958289-1-james.hilliard1@gmail.com>
References: <20250111185821.2958289-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <3850d8ecf896da30c8dca0e0a7f1b2a6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736681838;
 bh=qUtYltQBFfk3gevOuyznN2jG9D1ekvW8QJ9bzyTv4x0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YClVI5dlYVVVeDk3oX3o5YgmfbR+puQSWcbWcROXokDxKx4wDigRBri6fDhsPh/jy
 FJhxlYah3QBipHbs5tA39eF7j6Lb82M8BSc0dVem2ik01XWjUSoL6+SgsLmP2ryNIK
 gKmi4Mm39tHbATG5BuNpzG/6miU+sPLOEN+euWk4Og1VE8PpUrkOBdu0MmLrilIDmz
 QTeg0RuYxrZJql8MmmvCMwZ3A0TmlERZGb6HTLS/nefuzz/3ZTUoUtdniAx/cAzZsJ
 1aocHFVnvO8CNuvUg2cdQXhdjU3iiUy3h9cAV7EtG4kc/wmksH/GGe5Pio1/OXw/ly
 U/mkTYHyYYruA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YClVI5dl
Subject: Re: [Buildroot] [PATCH 1/1] package/python-weasyprint: bump to
 version 63.1
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

On 11/01/2025 19:58, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
