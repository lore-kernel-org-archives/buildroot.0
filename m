Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA1EEE49B4
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 21:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A849960B63;
	Tue, 30 Dec 2025 21:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QvlitGk7N4TR; Tue, 30 Dec 2025 21:16:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8F31608A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767129407;
	bh=rFgCRgIzbslyGlfqSODGQJ4F9lKWCu7v7mONM7WNaGo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n+anU5S5hop2Roru4zQrINFgC56ZLYBSGvbKbhql/v0K5BSls31j4Aa1W1zAxdDZ9
	 5BxfCCqMgcyKPqUF6NrdK0/HajJ6aA+BuVx9birn0mzAsxU55PpF5bMwDtkC8S4j54
	 EhXjVLXM4qe/6KUQuBv+lzLzKhgGNKWpFaJZjbxWKwgevvIUhozfJ2AOZ24GCOorKJ
	 Yoapw8kK+cIv5H5GOwfwxA3ZLwup6GZdAqi2J70oZHE2gGQMALYFfUA2252402xEne
	 fj6VsYjOvxOE5aoenypVf8bfx1ZBz2dZB6zvDShPLfKCkBcjVbFC8m6OFBl7vZFJAp
	 1xf4AYiBsS6fw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8F31608A1;
	Tue, 30 Dec 2025 21:16:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 289CA177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19511608A1
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QgUKaqpYu2XI for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 21:16:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5681360666
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5681360666
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5681360666
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 21:16:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9E36119F59C;
 Tue, 30 Dec 2025 22:16:41 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 30 Dec 2025 22:16:41 +0100
MIME-Version: 1.0
Date: Tue, 30 Dec 2025 22:16:41 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251220171004.157963-1-bernd@kuhls.net>
References: <20251220171004.157963-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <4083bcfa463a2323b770d0cb8e9f1056@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767129402;
 bh=Ycg/SIPds1Q/gVI6mbfkDQLGSoO58Nb6alRHrJJE7SE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rLwaP1HSWYLjwezFaJK1hHqdsRa479pvvMRR4usDxdVVYZin9qSJ5z5BP5o1KYDqG
 y9srJQTPTizT+hH8R03eifYYvBGbpX/yEB3zdyg/zT5/V+FobG2J0/yybbawDBBfGD
 Pm64sWWZSRSDUkd4bi3inJH6Ak+dFspuc85dLC0srdPQ2Tx1KMoEe34MHPYgdumVbn
 ReedtnC+JQdFq9xyrbJak0RakTdFgOv+6OPmSZ7jL6WXCUboZMtayJYmYeUHuYACht
 p8xINVAtNE7LdhlDyjiw4EWwwngGI2+aemjqn6t9UUF6TpvpyLw0zjTq73SGsng/AR
 79hWj5/xPwJJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rLwaP1HS
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-pvr-mythtv: bump version
 to 21.2.3-Omega
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

On 20/12/2025 18:10, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
