Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10CFEE01F6
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 21:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C723F405C9;
	Tue, 30 Dec 2025 21:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q08EsTHSScvZ; Tue, 30 Dec 2025 21:06:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2C40405C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767128808;
	bh=TlG5q+AzgcXo+bWQbbe3Dp4+JYXV9R80e3Z6f9q6GbI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NbRYy6OnFHd3Z2I6pwHIhjuqd4LOo3fyWWxKp6XucWmC6sZGoRm66mo1253pIahzC
	 w3XX4aY4ayH4gtmEDHZ71aPV9uiJHWvVFYlt6R4WWVlaHhg/Zcvoq6sIOg1AGKax7i
	 SF9Lk3hJu25dQB3TGsbKVh7CH9AJhuRhsy1NRhLc0e0Oc5ynMOHA2pS8XggyWPpxA6
	 HZXqENMVhAsGuUCpYJDSK+hdsYpa00qdGxFwSNXm2Xg77/49VIKEMFH/Vkv+7gsRcO
	 ONXNBCtqQ0MCXx6HQMS5AYFAaczQvYZzeQH8fza9ys/3FgCHUdubRQNmUOBcMdEmlI
	 1ZtBs5xj2wOCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2C40405C1;
	Tue, 30 Dec 2025 21:06:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5106CD8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DFE560704
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12ez0ayE7jYY for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 21:06:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 17A11605B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17A11605B7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17A11605B7
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:06:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5864319F574;
 Tue, 30 Dec 2025 22:06:42 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 30 Dec 2025 22:06:42 +0100
MIME-Version: 1.0
Date: Tue, 30 Dec 2025 22:06:42 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>
In-Reply-To: <20251228211045.3059593-1-thomas.petazzoni@bootlin.com>
References: <20251228211045.3059593-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <e34dd97dec7499c79694cd2a34d5da7b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767128804;
 bh=HTVx/Dode/rN9gA+o0oTi3S8V+/vuX9XiOHCe5700Z8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DX/pQGRbKUsBjJqJPynawUc5Eck+qHcbjifdMxNw42O4eZpBQZm+SzpjCsshmk4tc
 DaCjRQCGkwIp0QcxQiyN1OxHJ5T18DSTLruy9MblO5xV0PfD5L6ek1c9D7h9aCbWzE
 ahHZjABUUznE9bYL1TngQPRmWmFoDjRKUZmdyVpJEJk310n5uDiyMPM9TV19YN8cq4
 0VMI/u97U5zeGpa0QBG8UWpNqQtMcy0WuFGCT/IIO0szo6MX0IMeEP8AbE74SpdOMl
 HRP3ReZxZuD2usYkve7gT4tLyDGiRop1QdbiuJ9UiqVJA1ypt2v9EPK8XkExPjD6R1
 CEDvVJHT3RTAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DX/pQGRb
Subject: Re: [Buildroot] [PATCH 1/5] package/qt5/qt5webkit: add patch to fix
 CMake >= 4 compatibility
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

On 28/12/2025 22:10, Thomas Petazzoni via buildroot wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
