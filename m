Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0F1E77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DDA8606CE;
	Sun, 12 Jan 2025 11:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPJCJZKZJugO; Sun, 12 Jan 2025 11:38:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E9086075F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E9086075F;
	Sun, 12 Jan 2025 11:38:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A3D3942
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19ECE406FD
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vB0EhKkodnEZ for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:38:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 467B94055E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 467B94055E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 467B94055E
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:38:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 953ADB0053E;
 Sun, 12 Jan 2025 12:38:13 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41924])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 12:38:13 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 12:38:13 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111192138.2967261-1-james.hilliard1@gmail.com>
References: <20250111192138.2967261-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <3a97b586c12af9638ef543d7f711320e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736681894;
 bh=TMzJek9BuAfUn7SYWdDbZqo09q88xIGn08YkplBpEx0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RWIwKvnHB9FLDg+v1JvhKNaALs3ZxEdBlOz9yTaJc/70GNJObeIDGWSJfmsaLKtYY
 FhFDmwYbaU1TSyOa/CmbGM4UEhW0ZTgJGwPxt/5+osjNb0Pwvk0VGahCyQCCpIVWrH
 OKgbWlqKA9+c4tED6UZ82D1yo4Sba1z+Rzh+7vRgbcmHfyAV8cgjQOVazhbO8LFQmg
 G/lPqLY7F9/vUV8v9aS9Zir8fauwXuqBlqZDKga+1XBo8BQ5JqIPBPD0KVTwoWB3sU
 u/0hD2BUeZ515va8TItAtaYilEdJx0LXYxMkRzjZq3eTR48HB3TMPkcnTEZy7AIbZI
 VayKv+Brw0wmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RWIwKvnH
Subject: Re: [Buildroot] [PATCH 1/1] package/python-yarl: bump to version
 1.18.3
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

On 11/01/2025 20:21, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
