Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80E2CCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 21:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75CF561491;
	Wed,  1 Oct 2025 21:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jfYJhrkqGvXJ; Wed,  1 Oct 2025 21:04:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9573B614C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9573B614C3;
	Wed,  1 Oct 2025 21:04:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D46A1CE
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C14781215
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dMOjq_8IhAv for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 21:04:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D64698121A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D64698121A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D64698121A
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:04:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 31EA519F522;
 Wed,  1 Oct 2025 23:04:44 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 01 Oct 2025 23:04:44 +0200
MIME-Version: 1.0
Date: Wed, 01 Oct 2025 23:04:44 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251001194426.3261816-1-bernd@kuhls.net>
References: <20251001194426.3261816-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <f95ab19ad5a3fd367c69b5eed7c58b16@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759352685;
 bh=0saOtD7U1MqibhKMXNd850LoAlSXx/XqDf5Xniv3rFs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VrSB7x9d7o2AAjq7tUgscfRtq9VaPcq1kxlT3bwUjr8VdVbgFN0AMcxp/qMyMy8/q
 oppbz3/F6ow4b6xpVkI4HXcNXrPVqlmWkVjhGFHm3aON/itjn6q5UeGM6GxuLhHPjQ
 BaN1I5OePTW4eOg3itJZKSK/n1lJpmba3p1BIJuyS8LQTbYJPqr1TJyYGpGC/BP+Sm
 dzNNr3XkzZJbgDSAIIHLL+2fa/LmnHjVFu3/dIuEkjVthgVyY7AWXZNIxAPK4FaTCK
 JcuIW8Jpd5zPzNYoo1pVamKoxh6cinWq/N50W+MI6S1kw3O/mEI4g+Hk0XCHhngC0j
 xzVVdAsRKSaPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VrSB7x9d
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.5.5
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

On 01/10/2025 21:44, Bernd Kuhls wrote:
> Release notes:
> https://sourceforge.net/p/fetchmail/mailman/message/59238340/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
For info, I fixed the license file hash. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/8082b26a2be1669d9d55b19873d2b2b5e99c77b0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
