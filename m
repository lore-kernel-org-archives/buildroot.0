Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E5ACD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 09:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E7DD84167;
	Fri, 15 May 2026 09:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rKBgcxirfYCy; Fri, 15 May 2026 09:58:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 191C184160
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778839113;
	bh=cy6YiSN2gsnJDc97wkg1c993ex5bkOD0flRhNUC6W7c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PreiT2liJGqo8FHS8tckSHrWuBRc6CeZnjhDFgzLeCfe5QMr3ucncYtModGndIWDx
	 nwtdbY1pHKUpEYJZIKIGuJW20UbDbVfIXbJA/9h/LtmSqksjxMwEPQxP0RjN04qEKC
	 ToAPdK3b6hLe2o4q5GaAxJ2CjOgUJtnD8qdsO/Z0lIN31VTAYe7+a+UFa4hZ4quNz4
	 4Ui/piCEPLTLF2YqTSgusHPPSNj/kG1QVrg8JSkAhlTqTJXyE2nvmpoIBnyPj0Dcek
	 BsGQtpUctNJSbmpCXkZEIlh8XRfVUmoYd/o5d9Zv209heV1CT/CdBla0sULrsP8Zjg
	 VhD0Ql0Pi3PgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 191C184160;
	Fri, 15 May 2026 09:58:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 705E736E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 561B161503
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCWQAshX05ui for <buildroot@buildroot.org>;
 Fri, 15 May 2026 09:58:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CAE6461501
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAE6461501
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CAE6461501
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:58:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0E69F2003DA;
 Fri, 15 May 2026 11:58:26 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 15 May 2026 11:58:26 +0200
MIME-Version: 1.0
Date: Fri, 15 May 2026 11:58:26 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260512161906.2942572-1-bernd@kuhls.net>
References: <20260512161906.2942572-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <0de637adbf0438a892ec95b34027d6be@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778839108;
 bh=wFSiukhO1NhipD7t2VaV9M9X+YAXriNWj0pBjOi/S8c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dwASghGdD/xwWD5qPSR7+0EXn5CRBc3M547HAhajWuoSFL02o4S/VD2MFRJa5NuOk
 rgZ6yFKkBdqecT40oDIcd59vtfFG9KfpziT84YGaXneKmL9OxVwwBrlKJwo7KewTel
 uZ9fGA9BRejPA7D+mxYCuGYlHxD9r2qqXHCS0Hjx30fOHUxQVjWWK7McgmU/odEoQR
 ZCyIyBxGKy0C0Wb4U/jf8Ksv1B6Y9wSlAl6sPIyvUl2L0/J8wuEV7DT1aoeVjoLiSA
 JVDAvcGZkrE5B4ASLcWlV8ZeYdtXxhNyFjdMirFSbeplKOQ2y7GCjhFUj2MIyBKab7
 iPWMNewnpoQ4A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dwASghGd
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libunwind: bump to version
 1.8.3
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

On 12/05/2026 18:19, Bernd Kuhls wrote:
> https://github.com/libunwind/libunwind/releases/tag/v1.8.2
> https://github.com/libunwind/libunwind/releases/tag/v1.8.3
> 
> Switched to tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
