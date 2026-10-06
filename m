Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0ECCA6004
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09BA840743;
	Tue,  6 Oct 2026 16:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EU-scQ0mKv5D; Tue,  6 Oct 2026 16:34:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 357E440741
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304449;
	b=GU1dVpTYotN8sJDBzS71qVoSaGeDL8597wOaX+eKPsEJV0Li7iiwEeDP/KRE8jDnBV6e
	 Ld4tMVi3nGgEyKhmZXAgc68e4Riwcf9KBTEqH+xp9kO9EWDuUMDHr5iVBtVXDsCQxx6AM
	 x/tykXTCqSpVDrsG+vRbrrXvXJ6xEyMETnc6aE+6o/E/Jp21Y0wSOQJlVUv4OwlcpfIQC
	 mKAADnN55uROHnQ10VKszZHG8OW2JmoXnu4UEgZCHxoCVKxM2gHxYHI7xgFq4xTtQEUVX
	 VrzXNlhUtnnsHGjDK9uR8uqEHJXbDS4pneH+6rVwGDAsqXcoZnN5Th7yxyV8X6xMxxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304449;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=i1alRoBIFH0N5auRgZ3M8krmucAEEAEi2k+Aff3E3ow=;
	b=qqzWJcDyUtaNK5V/hJ/zswh6pFGKFXEj+qj9frMqDi6uogJPKV4nQkzXO3PqErp+EnoB
	 q/1D99swoBsNE92IP2QmtWGD4FPHUkCdPR64bwlaoRbYlyVqc1AOUc7pvwwuYVXBZDZgV
	 bFy0vDFfAIDDAjEsIOYjoFXR6kXiMMkyI3UgHQM5jpZNLC+RiHnyk4pM5LmtSAK8x+RoR
	 Ddk/a6gF1Nxa63SfZCluAQei0CJVsF74MwAe8Rj3durkz0XpueAV5tHfbIxUFlLsyKwqN
	 ov864oNfxWEveKDUlEJO1kv9llkPFT7RKG0WoS7ZrCRIcZsP0Vg/hbU8vCbNoxUbqZw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304449;
	bh=i1alRoBIFH0N5auRgZ3M8krmucAEEAEi2k+Aff3E3ow=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ROaLNulKB5nXmfeP9W0oaGYemlSe3tCwawDd2ZjGUavJCdIH3/HTdo7jHsYzbAGne
	 eVhe2SsCV5iXZbi4g1Zy4LtH6Dm+xgYBB7r5Nah+pBMmoKf7aRE/T7O5lbut/bS9Ce
	 mroQ3PMc7ciojwt6fUkZRcIED1ObVVJ8A1APK3qPHxg1rkO9/tYLEtPdG6EqabWQXO
	 FSl3hjd6lyG4JUK/G40SyVRSq0v7MRxDIejNRJc3bZ0j66kqOlT2zfGOGq2J+Y/KzX
	 5qco+s+P1+Q4AYypDvdBNC6nkbpEL9DV+85Zcq+zjmhTCaThZZlNg2mf+dPod3w7Lo
	 Qblgg0SSpbJJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 357E440741;
	Tue,  6 Oct 2026 16:34:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4514B317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37115402B7
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IzyPySicpXkV for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:31:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5F1FC402AF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304291;
 b=R4hrHqsmLWaM69BZjq3CZb432DieX4ryjH26jywN3Nwuftm/DCJ1rUhZPi+UQ0rOBGM3
 /DzGdJ2xa5JNczJAzJJEc1mHtX7yOGl8Wxv2QWdZmTJ7AFZmVuE3h+vF3xWUPc6Dm4n+r
 ZSCirD7J6DcvoOjgRx+5L9LQisF4hKXEnq6JrdBmKhi2V/l7cAGzNP+9IEU4h8tLw7gFG
 F7RFfQw8y80BM/OtJjq6Bmcl9X7lCq4fMvLAntnks6EH8JB27+WVQeZTgxSee2pX0uibE
 oEMzBlHd9iXVsKMYeJ3d/wZ6vBRf4R8RA4+cPuzWuCHy41zk5suoKHT2laKhCORZ3WQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304291;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=HgQ6ifd/c3/kJJcy2yccNBwttkX7takyUcpFWfVr4Ro=;
 b=VS3giCey0wMNfFO7cZ3YXhtqW7HtkF/sPtBu3Ktmmiu0rkNyiM7ZKqzvrMy6eM4sPpoG
 h3PVj0h+mv0NhwZB1rhUY4vHTAQTXFTlvvSl4bRjX2LhIQK1tI9Sm51/XAju2uVKIN/pl
 3T85iKwCD/d/nMr1G2ydm9PAhIzKoHXBYsu+C2OckUrsoS0h3UAvtzvQrCdzaPvfXaLdq
 qj2VggRLA44j2jbpG8NmK/UyGK3quMKspC7xh0cF8k8IZf/uroPaV+XtKOGk9JwSrvz1t
 ROIE/1r/khh85L+zdwS+y8R7cBUW+bEvmHTQyo49s+jfDQl5V6GkacqKMfY+s8ekbIw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Epe6coVH; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F1FC402AF
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:31:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0717C19F5C6;
 Tue,  6 Oct 2026 18:31:27 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:49648])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 Oct 2026 18:31:27 +0200
MIME-Version: 1.0
Date: Tue, 06 Oct 2026 18:31:27 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261004214154.1053602-1-james.hilliard1@gmail.com>
References: <20261004214154.1053602-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <0f6561dc97585ccb704de73d2513f035@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pycryptodomex: bump to
 version 3.24.0
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

On 04/10/2026 23:41, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
