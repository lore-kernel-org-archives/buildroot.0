Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847C8C83F1D
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 16:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41A9A81F90;
	Sat, 12 Jul 2025 16:42:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VD7Z1meluNhG; Sat, 12 Jul 2025 16:42:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 817F581F7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 817F581F7D;
	Sat, 12 Jul 2025 16:42:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3835D1CC
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 16:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EC19607A3
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 16:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DdRcmSbFkO6d for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 16:42:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2268760762
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2268760762
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2268760762
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 16:42:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E74AE19F5C6;
 Sat, 12 Jul 2025 18:42:21 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Jul 2025 18:42:21 +0200
MIME-Version: 1.0
Date: Sat, 12 Jul 2025 18:42:21 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250708181608.3524627-1-bernd@kuhls.net>
References: <20250708181608.3524627-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <507036b1d8fbab21dbc40cb055f448cd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752338543;
 bh=ccYmhntlFlJhZNUcOgwI91ApAiOLZp8btXtTKnjp4LA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M8id87zxTd6/1TjkSUldiLKDBjqLES8zytqs5RnSs9rcL3sKURMIpevMicqNYf+wd
 WFrzh7mzh36+VaDlpng/sVxYdB5PbI5YUdsEAIYRKedSQ4qPUcd0URhYN638OxqQ6l
 tuxtFXUwzGAnvT6+VikMQDV6SaqEPabJ/Bo3fG7Xg/nqxP66vVcjijGozGDl6dtDhO
 wDKpzS0N0N6b4USaNzKr1iu8unsnKB5OIAL7rvG8HHulu9V0IHcjoWrRxEsX8j60hO
 ZTMeTeNNM8bwFVIAUtyIdo3F46vyUvo5CdFzuC8cqyqiPeUz3EYjUfiN1WDSHTNVK9
 T0BXjfzqDsWPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M8id87zx
Subject: Re: [Buildroot] [PATCH] package/samba4: bump version to 4.22.3
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

On 08/07/2025 20:16, Bernd Kuhls wrote:
> Release notes:
> https://www.samba.org/samba/history/samba-4.22.3.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
