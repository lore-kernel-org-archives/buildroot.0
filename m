Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4A6CA5FD4
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 16:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E85AC8115D;
	Thu,  1 Oct 2026 16:53:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JgTKMOhEwDxg; Thu,  1 Oct 2026 16:53:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4231080F61
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790873615;
	b=lm2k4kJq7Q8Q64ZBVV7r+d7W78Q+8iGnoyMyFmR3ou5VqhqXHnjN77CxtXtV9mItOKGk
	 x2qGIe49vu6jTnO3gsrxONHryASkl/VLIQOWWPR9Y2jOCtKy5Nkuh/LZzE8PNjd+tB8iu
	 1mBP7gVN9Bqm/sMSWPIqfS1JxzEBIN7WUb3OEVtfcLFl/HJTYUNoP8FtTFiQaFoWaGPeo
	 gHKgQlSeKY+ZHriCruh62nyX8axwuFE9u1TPF/Ee88y8vnr00Mfxd3hFRLxIwg+QBhaX+
	 3sc6k/qvigBpspUPj+K7aAKTqGzBWjqMak/XdewCEf21+xyLdIrAvvvWXeZvNL5QzvA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790873615;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=8KsixPe1zCUeIVi4eEMpGRf6gcngshSdBNjV+5JA8jk=;
	b=jA9Xhk3IREe6AIMBym5kU9pjWOuA41UwgoWhkDp+E59RfRWSnM2saSHZMRFIu7elltCg
	 6qTzZPGXK++DMY7cvHy0BcUrbbT1WFroonlAG9lGknMTAQMpUihfY7uaE6WBYbyjM27IU
	 f1+Kb0x1hYB9U9evHqyAVmw4YDhaOQUbCOL5ICwygbGCiYR+1GeZedWYHv/wamCVOBeAu
	 +kzmdqiqDA4sqW3vYL/QhKEaGC308GiFjCCZaibD5yMe5y5uCHRZG34W51bxFuhvFBbXb
	 xc6xvuJlzqPI6n/RWO52mNYFC4MtEwE0H95/e4+GyDF8QVO5QgfDUmQCOcs/1gIf1Aw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790873615;
	bh=8KsixPe1zCUeIVi4eEMpGRf6gcngshSdBNjV+5JA8jk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N5LBVFUMyHQ8o6J/mP/dy/uZt6BzFf5eSfTJSs2XPQDkGOmxccnxsk0bLBvRCJblN
	 jF+QQ6ZSBXBRPdsx2bxbKTqsb3b8raTsSLvGCQcF3KoZtNuaR1MlCpRN6YFcfg7NB+
	 rwOX/DgtAU148RgY3yTCr/dPwPGSQRII2p+Moq5QH7Nfzyu/YuPXu7MriqH9aq1RSM
	 5jaPMsJyAl3BkIF+udMi0uJNXGiWHOJzj+RJcWdOCOmevX37ck4buGxWORP/3BluXv
	 +hEdk26wOUNzVUqOIfd2ItXuVYJJLnVXWDeV6hR85GIy+mtcu1L3z5DAv3wMV0JTmc
	 OlDzBEGHseVwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4231080F61;
	Thu,  1 Oct 2026 16:53:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D85B32A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7D5A40ADF
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:53:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQVuDkHUaRAU for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 16:53:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F00B940AAD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790873613;
 b=icL5RStPagYD/aoGgcSwW9TcC6nKoos6CiMNfSmwrhh2x4n1n+1HBx7rXnpTgfcu6ZEt
 ghG+IvO4ACwyY3cPdaMGi2r7wI2juXBxLDUxuoIwV/dsyWRcw28Mew+A8ATWEIDTG0MIT
 KtQ/AHNXyQNWGphwE/uARwrGVY7Ae0F6X1mnZkAnRZpaX/NScI8O0t53lsTzqVwvnft1i
 AfAJDeY1UIQBzucNjM56ZYohgSjkt/0KPucW5EiCziUMUOQiO/zviBbFAfwuNqWqZcAQZ
 anSE7hEoCFdoq0V1i9OKGRXgN7fiX1k9Zfc6nYMN4nADd8w3vJJFZ/9MFw7un+1TQnw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790873613;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=g/T0sOMPTmC5b5DVuqmVQNH2lxhRdOKXRk48t4cF2Ao=;
 b=svGXCON5Fbv3z9Xe0dpA3zVNw7rFYI1ER0bx4g5y3nX3LW6e+TsjEwSjN4dYbLA4qi9i
 YvG2oww2PMpv1mDN9jLkfbpHoiuXvHwTh2v/967shuPmObVMC+s2be2wzACP/jRkj/SHR
 LPBMbCKdDEJqfDbzcE0NSi6G3F112PxjDzOyU6ZmWriipaYb7Y8OsFGstCCdFPrXk7A/u
 rUBNMg/4ZtLMu+7vf5/w03lC9Gz71GkrypfmuSLyT8DggaNlEBwzcBgiYxBjXE8nX7QjV
 4+ukY7GabvOCbRLej0PhutU8a/VklGO/s7N+HJp36i2w2tCvNGfJSzskmJHsdjw2OFw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="qSBa1c5/"; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F00B940AAD
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:53:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 8628719F58A;
 Thu,  1 Oct 2026 18:53:29 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 01 Oct 2026 18:53:29 +0200
MIME-Version: 1.0
Date: Thu, 01 Oct 2026 18:53:29 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260929193342.1905539-1-bernd@kuhls.net>
References: <20260929193342.1905539-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <5d6291e454f5031296c169aff08ba677@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/rsync: bump to version 3.5.1
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

On 29/09/2026 21:33, Bernd Kuhls wrote:
> https://download.samba.org/pub/rsync/NEWS#3.5.1
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Added configure options to handle new optional dependency to libidn2:
> https://github.com/RsyncProject/rsync/commit/f0177d82a8fcbbebaac2bdf556f983160ae03988
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
