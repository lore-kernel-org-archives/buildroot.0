Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CB8C624DB
	for <buildroot@archiver.kernel.org>; Sun, 22 Feb 2026 17:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FA7160EC9;
	Sun, 22 Feb 2026 17:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vOlDsQScXcTw; Sun, 22 Feb 2026 17:50:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8498E60ECB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771782615;
	bh=pndv04digusyfUkthelDC3Bdks2XaW8Gq3PTOxqMHGI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eCINANl4JnUuVzzxd2QX+MX4RSx5WQzsVZf8QoCEIoEiGyCepD7LNW5JmfCEs+jIT
	 MCpA34SO2iXW3t6Ogd2tOWAwWY36QcFLy1e6T4dLQLv6BPj1+BPTsEn/UdYap52dMX
	 x/NVQhMgCtBvkQt8JozmSHw2WTkWBZ3NC4nYGvY2YHeB7LB/Dj5OOzQu8NUfMiOs/9
	 70B6VOHcDWGDT7AeD1krBOasJk18JwyJJfiUYLfFw/ubAT9zvOCWmbzjNjrxpMvfxb
	 ssMOO3TVFYnY3m0JRUK4jLULn/WTcySs9eTH42DeHoia+zssd9joqfR23OpJcInuKp
	 81LKvflTc9yHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8498E60ECB;
	Sun, 22 Feb 2026 17:50:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91DFF2DF
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 17:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F72460ECB
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 17:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5a_IVlCPh7jO for <buildroot@buildroot.org>;
 Sun, 22 Feb 2026 17:50:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 591CE60EC9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 591CE60EC9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 591CE60EC9
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 17:50:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id AF97313F899;
 Sun, 22 Feb 2026 18:50:07 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Feb 2026 18:50:07 +0100
MIME-Version: 1.0
Date: Sun, 22 Feb 2026 18:50:07 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260221202603.467160-1-bernd@kuhls.net>
References: <20260221202603.467160-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <b1100ef29f6fa1e5ba6343cb8dd30772@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771782609;
 bh=oP0PMbZTTp5xm3Y8q9t5IjZXBF+e12Q8ks1s8mYYnF8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hiRi4XV2RBIZyfccE8HP/Oq50DSvRsrH79biAl5RZNvU5QyEeLd2jo7CxJLssunEO
 wZ1cFPoNmIpur43cU4WKlOdsnY2mNNeemu9sfTAYqFsOUpszjMckFLbmbfUHAPBP5h
 GyhHYh5rIM0dNJ0E2XUqpR8R7pUpn+iI5NTzu+O8HjiKmqXEnRbCIK/FW2Pip6tAnH
 AXmFvoVS1fEJFtbttKG5u4vxJB1+rG7PHWl0BaSfiQ7u+1Oi6jY4+PiDUqZ7PL/LD2
 Os4i8fSSAeHRb6bU3FbhSQB2iDMP9CvjghWgXiztK4DCkac7tVy5/Bgt9Pjd2mBDgh
 UTqWX0PM4th2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hiRi4XV2
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: Remove CRIS support
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

On 21/02/2026 21:26, Bernd Kuhls wrote:
> Buildroot commmit edfc67fb1a5f0fe67ba9de91e90b06a44902c231 bumped the
> package from 9.1.0 to 9.2.0 without removing support for CRIS which was
> removed upstream in version 9.2.0:
> https://gitlab.com/qemu-project/qemu/-/commit/01d01edc9fc4623e93118bc8cb8c69a46d707026
> 
> https://wiki.qemu.org/ChangeLog/9.2
> "The CRIS target has been removed without replacement"
> 
> Fixes:
> https://autobuild.buildroot.net/results/376/376ea96ddfc0f220bca8bd241614303747f61bd4/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
