Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2805C0219B
	for <buildroot@archiver.kernel.org>; Sun,  9 Feb 2025 21:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D4486079B;
	Sun,  9 Feb 2025 21:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gmz9D0a-E9kr; Sun,  9 Feb 2025 21:07:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65E6F608F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65E6F608F5;
	Sun,  9 Feb 2025 21:07:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0E16C2
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 21:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B367C4064D
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 21:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 40p8lxy21Mbn for <buildroot@buildroot.org>;
 Sun,  9 Feb 2025 21:07:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AC2D9408E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC2D9408E0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC2D9408E0
 for <buildroot@buildroot.org>; Sun,  9 Feb 2025 21:07:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 929D4780372;
 Sun,  9 Feb 2025 22:07:13 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 09 Feb 2025 22:07:13 +0100
MIME-Version: 1.0
Date: Sun, 09 Feb 2025 22:07:13 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250209121355.2430797-1-bernd@kuhls.net>
References: <20250209121355.2430797-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <f4ab8707100a2aa3fcd07bb863c92fc4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739135234;
 bh=8E4TDX+wdnGmWXDHNtcdyraARps0heUPqLnNqDudH7k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MYrfELZbSyQFIuw/Io+LTt37GPKITNx7W4HKTLgwGLZfSza3bOLiWmY8k9C4alUF5
 w78mhneWqHZspdcGBQNc7yh3uEajzVKZDw7vObbWJsedIqyefj4XljuPnGBnEaRSPD
 7AQtmEGHq0YvHRbZT+oRyECh4hRQ52k4AEWlkunnYD4I6vYaTmt1ff0MCYVVvdGxaS
 hHqUWTnFt0j9yxeVI783ei5hsARasSgW2kBb0aT3Oi4iNew4VRxHeay/vazVFDuiqC
 sDRrlU/BEcy5FDOhUBgC07xQ+C5Hvo1ryHMfXon3lZafRc3L1+Ws5//9gMSmfslgRa
 Zw91BTbjqcDcg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MYrfELZb
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: add upstream patch to
 fix Kodi segfault
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

On 09/02/2025 13:13, Bernd Kuhls wrote:
> The error was introduced by the libcurl bump to 8.12.0 with buildroot
> commit 2da031c2e54cb19efae41fb666064551cfccb59e.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
