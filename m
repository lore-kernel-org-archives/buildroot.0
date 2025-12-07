Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF58CD2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 15:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3929A605F5;
	Sun,  7 Dec 2025 15:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCXWSejYb_N6; Sun,  7 Dec 2025 15:52:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A5BD60629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765122728;
	bh=ygKfVx/Rq1wl2EJszfsxKOHk3HJn5aV3LaBx/o67Z+0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KF85DngqkcD2n/TjPoylO+Bf+QgQKp2KzJyba6PWY4OfDuK1VHqVWoLvguYHvL06P
	 I95P97ya8qZHkh4G7zTlSOoHOamRvPQ/Cb7h82v/BJOJ/AkfXAUTl1kAKCIhTbLRm6
	 nAneW2kDOEG4USc0rm3/VjWE1P9kLS7u9vUr2E7WNS8waO3H8PSBOmeMdmLGSTgZaw
	 GTwtxoSeH+JEa5zVP/c5kzF9QPa+IkAPM74WQqc+0yY0aBxqmWpD8J+mB0FlMrB3Md
	 mMdnYbU63B4nJ1Xp03Ob50IdKVGtIITI0uklt1TG4jIcDRElHdqpgA9n+M+Emv/kZU
	 nfD5T7z8rdoJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A5BD60629;
	Sun,  7 Dec 2025 15:52:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 32CCA151
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 15:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EC1B40166
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 15:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5RYQOzmYqRQH for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 15:52:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 051C5400AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 051C5400AA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 051C5400AA
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 15:52:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1959D6012F;
 Sun,  7 Dec 2025 16:51:53 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 07 Dec 2025 16:51:53 +0100
MIME-Version: 1.0
Date: Sun, 07 Dec 2025 16:51:53 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Alexander Dahl <post@lespocky.de>, Davide Viti
 <zinosat@gmail.com>, Eero Aaltonen <eero.aaltonen@vaisala.com>, Fabrice
 Fontaine <fontaine.fabrice@gmail.com>, Rahul Bedarkar
 <rahulbedarkar89@gmail.com>, Romain Naour <romain.naour@gmail.com>, Sergio
 Prado <sergio.prado@e-labworks.com>, Stefan Hager
 <stefan.hager@ginzinger.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251203214709.2321976-9-bernd@kuhls.net>
References: <20251203214709.2321976-1-bernd@kuhls.net>
 <20251203214709.2321976-9-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <a25b12aeab13c4d62f4d13059a320a36@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765122723;
 bh=6dqhVfaA8D6O9c9H7UVEhnBQndOK2khAG1OIFIjkjio=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CibmIrD7sEdTQt7XC9DM3BJsn6EDNKqAvrixNoNATXfeBz3NOOqH7enflnOwnHywp
 OC7IBoL+12FJCFMdG+bHbISrfQlzhZKTheUrrg8r6hZFAeEdKTLMVWDTMl8kq5x9KR
 Pq/9xiB8x4XUiu7uN9EwVp86Khs1m1WCQnYjI59ohoYz0EmGkjceG3WQGbBCEqmQWF
 EKxPpJ68c4YxA1qJYRivBgxN2pGuPUGSDrJLsA5BHzfgvNpZ57Nfi/VCqfCqTd1U+D
 gJ8OgYmFfi94hFBmI3yHtKuARux52mfsrwl0pjN15ww+dH724uE4CzXfdQj/GURRXN
 5hi7x8vVfUZ4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CibmIrD7
Subject: Re: [Buildroot] [PATCH/next 09/21] package/json-c: fix cmake 4
 compatibility
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

Hi Bernd,

On 03/12/2025 22:46, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/dcf/dcf72922750a830901279e8eb8fc2def95d35e01/
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../0001-Allow-build-with-cmake-4.0.0.patch   | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 
> package/json-c/0001-Allow-build-with-cmake-4.0.0.patch
> 
> diff --git a/package/json-c/0001-Allow-build-with-cmake-4.0.0.patch 
> b/package/json-c/0001-Allow-build-with-cmake-4.0.0.patch
> new file mode 100644
> index 0000000000..c9c957885f
> --- /dev/null
> +++ b/package/json-c/0001-Allow-build-with-cmake-4.0.0.patch
> @@ -0,0 +1,25 @@
> +From 42864e12b0d7af01b1cf989d6da9e9a4477775a1 Mon Sep 17 00:00:00 2001
> +From: Rudi Heitbaum <rudi@heitbaum.com>
> +Date: Fri, 28 Mar 2025 23:14:48 +1100
> +Subject: [PATCH] Allow build with cmake 4.0.0
> +
> +Update the min version to match parent CMakeLists.txt 3.9...3.12
> +
> +Upstream: 
> https://github.com/json-c/json-c/commit/42864e12b0d7af01b1cf989d6da9e9a4477775a1
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + apps/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/apps/CMakeLists.txt b/apps/CMakeLists.txt
> +index f7c9dec633..ef2271d131 100644
> +--- a/apps/CMakeLists.txt
> ++++ b/apps/CMakeLists.txt

This package is currently always built with -DBUILD_APPS=OFF

See:
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11-rc2/package/json-c/json-c.mk?ref_type=tags#L13
and
https://github.com/json-c/json-c/blob/json-c-0.18/CMakeLists.txt#L582

This package patch seems to fix only the apps. I don't think it is
currently needed in Buildroot. Can you confirm?

> +@@ -1,5 +1,5 @@
> +
> +-cmake_minimum_required(VERSION 2.8)  # see ../CMakeLists.txt for why 
> 2.8
> ++cmake_minimum_required(VERSION 3.9...3.12)
> +
> + if(POLICY CMP0075)
> +     cmake_policy(SET CMP0075 NEW)
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
