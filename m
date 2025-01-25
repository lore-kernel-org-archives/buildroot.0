Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D11C0218C
	for <buildroot@archiver.kernel.org>; Sat, 25 Jan 2025 15:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2039860609;
	Sat, 25 Jan 2025 15:13:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6pbQbyaX4LhZ; Sat, 25 Jan 2025 15:13:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EFB860B07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EFB860B07;
	Sat, 25 Jan 2025 15:13:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 833C81183
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7114B40737
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:13:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pO-RvYQXPmZj for <buildroot@buildroot.org>;
 Sat, 25 Jan 2025 15:13:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A170940733
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A170940733
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A170940733
 for <buildroot@buildroot.org>; Sat, 25 Jan 2025 15:13:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E8C6460128;
 Sat, 25 Jan 2025 16:13:29 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35960])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 25 Jan 2025 16:13:29 +0100
MIME-Version: 1.0
Date: Sat, 25 Jan 2025 16:13:29 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250124201754.3848443-1-james.hilliard1@gmail.com>
References: <20250124201754.3848443-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <6185db2e91b82ca076cc4dd40a030c85@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737818011;
 bh=Kb7SWljjJi9nNNWTenWj8csiDpIv5h/7Qtq1PhDi4gQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KaTwQ522KAnl22ELm4XZAq+GZdN92/qJO5EJ9sDb1fhdobzk4n6uU3J3Mv67RPEMw
 vXBlD9V2Z94pXfoLQ4wJGDgNkhOmFFacWNCdcMA9zr3JE0ETY/DuMxgKW3RVFGy1Bd
 GAPWKZsMF/xaxBwdEQqQodL0gdG+iU+B02YAknheN7ydTrwLM7y7HUOPRDCRXnZWTP
 Oy9htUWA1AP4RiV4Zh5OkhJ6OPSE6x1fTHJQpXoHQS8/rHICEj2bQXKj9Bbxi9pMW4
 80Kmj77WloA0GZw7uC8wsfOXwe9QmqFMkRZQtceoZtn5sXrGUBUdHUjBZ0RSUmPFBL
 o/xl1naGepo6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KaTwQ522
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pysnmp: bump to version
 7.1.16
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

On 24/01/2025 21:17, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
