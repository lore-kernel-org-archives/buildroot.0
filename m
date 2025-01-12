Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E7DE77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9507E6075F;
	Sun, 12 Jan 2025 11:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JyN8_J3awDJO; Sun, 12 Jan 2025 11:34:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B325E60711
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B325E60711;
	Sun, 12 Jan 2025 11:34:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 52239942
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 249578112E
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_PcKs9Ms0r3 for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:34:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 752C781115
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 752C781115
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 752C781115
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:34:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 9AEC7780333;
 Sun, 12 Jan 2025 12:34:29 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41924])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 12:34:29 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 12:34:29 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111182546.2932747-1-james.hilliard1@gmail.com>
References: <20250111182546.2932747-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <45e039132b70fe060a88ea3c7e8422fe@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736681670;
 bh=93bx2jH8goEcmL7jnUOfr26MJO5253JgY1xrxWvHGsw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mvJFz9UHWIaHL+9188nQNGVoHNz5aAtNTPM770FTab5YGpOgR/mT++2MuEYVPgUng
 ZM457NZs4gm+hW7SU87a45s5W9wxnDqLSnTnDj1hkNsB+/BNb3Nc7GTrOvIG5EBBHX
 f7gSizbtmlAHFJcYGH+Yu7DFn34349tXGjG81aFs3V8UFSC8ishyT55TYmFyggOTto
 6/NqU1SqDrButQloi+ALEV+tZSdwtXOUh8IuUznRo7B5Pq6b7b60cKLbeF1L+Gr7j+
 uy30QUZmHWkLq2UgAv+aa3wBOxEVfDofLBPJUfcCDfATOv+EbUUY9D9eGtA4clYl8K
 u35B6Dr+8Dbdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mvJFz9UH
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tornado: bump to version
 6.4.2
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

On 11/01/2025 19:25, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
