Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B419CCF9EE
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 22:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0833540B00;
	Wed, 29 Oct 2025 22:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RYAT3MdTJpKU; Wed, 29 Oct 2025 22:18:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 104FB406D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 104FB406D8;
	Wed, 29 Oct 2025 22:18:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B1C0F2A2
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 22:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97E2D41385
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 22:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aB-i-BYxIUGO for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 22:18:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C3CDB41383
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3CDB41383
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3CDB41383
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 22:18:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B841860129;
 Wed, 29 Oct 2025 23:18:13 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 29 Oct 2025 23:18:13 +0100
MIME-Version: 1.0
Date: Wed, 29 Oct 2025 23:18:13 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251029213600.2408843-1-bernd@kuhls.net>
References: <20251029213600.2408843-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <c4e5acecea2dc472eeb0a246498cd971@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761776294;
 bh=KFnM4qB5VFC/lnoVwlkT+4WhCvxStQ3ldQfmtm8cJ28=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YnvtwxIdFJHbLuoDQ4V7IKNhMKUOUuplk+R7tmSc7uA9LAe9lY5v/cFkhV1HBLa7/
 OqXkkUiYKKmbzJb8/quz959KD7yPoYcp++ZRMVOm/xQtfWnNUyG6zv1J7pUuu7hyrf
 wIO6csWxS0VmB5jx0UfDvAZivxB38cF4oSqWsXyMIlXPbplnJGyGGgD3nJNqFVF9xO
 eDoqNEEQ10P+8EHPUta59lZqfbB1BHeWgGl2QlS7/RRY8GQmDSGBYEEL4YGg84sctW
 l3seZNCWaIluLa7NxxdBXR8bmDXSEVfFqvGJHva+qemRTHA0Ig61ouZk+WXIVfLXHm
 Y7bomRsGCparQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YnvtwxId
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{4, 10,
 15}.x / 6.{1, 6, 12, 17}.x series
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

On 29/10/2025 22:36, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
