Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AEEC021A4
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 15:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C91540625;
	Sun, 16 Feb 2025 15:28:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lhDe1c352e3D; Sun, 16 Feb 2025 15:28:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 464F7406F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 464F7406F2;
	Sun, 16 Feb 2025 15:28:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F7291BA
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F5EC4080E
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jo4FWGcIUWQl for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 15:28:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B162A406F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B162A406F2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B162A406F2
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:28:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 6FEABB0056A;
 Sun, 16 Feb 2025 16:28:08 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Feb 2025 16:28:08 +0100
MIME-Version: 1.0
Date: Sun, 16 Feb 2025 16:28:08 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250216135824.2070591-1-bernd@kuhls.net>
References: <20250216135824.2070591-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <6a07b4e561ea7bcab1b59bcd4b83b23a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739719689;
 bh=0wWP/WbBo//v/EYblgUkfUB9ma1QbKXbf/KVdfp0Epk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HR/JdjXUn0WRcL/E26HJi9oZWAg5XS6K9+PclTsMEClSyDs2xSdesagOuZh4FrPJW
 Z4G2+D4aXm8ZMOd9JsmtgSYHtBky3o8FieSYJOEhpU15Et6vTQRiqOblbjsIHWcmyB
 ONRY75aIXfs0Nwhqb8CO7C7Y0QLbGqa3/tnme/A1jiGcoKkwz2POUidSYmpNqh7AtG
 hJn0wp5KrbgZV1AKPGQlhiGzxJXWyFdn8p7kk0DhWGhdtW7g0iB0UR/cZfgDfnWQNo
 qdzt27W5Nt83hqsDLkXCCvQna7eFNbSjamZNHSWC34Lo9EukK2ajpCk4xip64neObY
 VXuSnGe1YfFJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HR/JdjXU
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{6,
 12}.x series
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

On 16/02/2025 14:58, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
