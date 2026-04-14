Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B894F9D0EB
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E9A884DE0;
	Tue, 14 Apr 2026 17:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxshDKLvuFYA; Tue, 14 Apr 2026 17:57:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 547A284DD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776189427;
	bh=c3pAqGTex54HhwgzdqpMLOy7wv8345p1NGzVNXifew0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=skYwvQOYzBYrlpsChd2L6/UNO747OcedAo9pEafxu4wKdM+cudLpSDT1Ip7+8QC8b
	 zMVBf0N9pNlIT423CBtn3TO4ZNNylVgLJ4EgV5dfq8Ex15rrxM8uIOVQSzyOpNR3rp
	 N9N+woEbMN3Pv0QfyXplaY7GQ31LK7KJAVYA+18yIkRMVrQWs2oMFk5HXMH5xZPbcB
	 rp6UX28jTSJe7R7wK9K6sfylcgAZdbICySw/Su/VeeM7l60gvAB1GJF6b0StWOPEeK
	 4X+mWvWzzA0/oOP4WW+sawRPomx7UbXuE7ru2ZZ994Bas38lTTErtC4EPYTtBxMxBx
	 XqEtX+qmiJOGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 547A284DD8;
	Tue, 14 Apr 2026 17:57:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73184375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:57:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58A7984C41
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e2XwLKH42ktD for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:57:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3FD5984DD8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FD5984DD8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FD5984DD8
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:57:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2E5ECB0053E;
 Tue, 14 Apr 2026 19:57:02 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Apr 2026 19:57:02 +0200
MIME-Version: 1.0
Date: Tue, 14 Apr 2026 19:57:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260408085531.1641831-1-bernd@kuhls.net>
References: <20260408085531.1641831-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <864cbed9408911638965e115a047d967@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776189423;
 bh=nDwQqtThLUsJ44I7K6Kn2/WRCXlb3w7yGOlRwrpWFEk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XMiVgNmbV+7vsSDHJIDBVXcN+w8SqP1TkEJ6hTbDDBL3l9hWtUh2VS2162RuIPq0G
 7akH6ZWaMCwW+E48Yv19/bpX9Q+Xeqo4/8BmQ4hCHWGjr4zbYx8LfUumgyHf2kaJaM
 qHp2E54DpZ1aZPzPUrAX/JyIqrJ1vjyF9AksGmE3x3YCXTOHwF/uXGb5Qt3lSc3bN8
 Ol1GsEST8qtZqD8KGf2MgKF/AA0RfY1fI3NSu1uoVY9l3Lspskmqu0lMIHQNXJxrPh
 nVgIFIktDOYNrbaJig9JxX8K12YkPUlTEJuppu1d8sFiNH+huzP44svMhmqYeNQjvp
 yc3Xrx3u2Uvug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XMiVgNmb
Subject: Re: [Buildroot] [PATCH 1/1] package/libplacebo: bump version to
 7.360.1
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

On 08/04/2026 10:55, Bernd Kuhls wrote:
> https://code.videolan.org/videolan/libplacebo/-/tags/v7.360.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
