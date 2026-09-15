Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5709BC88E75
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 16:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E16980A96;
	Tue, 15 Sep 2026 16:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SyB5zYSjIvRE; Tue, 15 Sep 2026 16:32:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7AD1080A56
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789489963;
	b=lpC5/ow8SLgZCR+ar48VIDGAsoGDZYjOw8qbLHOqrjP+7XUJfEEQb1xjs/3KyPtRPLCo
	 KNGn4OWHuAY417ZdfKfVsXwW1qFBQqM2Ly/+kRhSiA85tl0JXs1aoC22O35tCNexmwcKk
	 8IKI/rO4o1gqjTfThmg4mUfeTQoiGOs+tVn1uaQx+K857f7+29GwAOC6iZJKRlg8VJn2t
	 Nvfwyg7PkzwQZPUUuXHUoaaGitWLfF14xKTpGSWE6RTJgrvFJu4GFfpwmnEJ3JfDZpE7+
	 00Sn0JOJ0dz/7Biiyrc6UTJsd1C/lbj0Fn8Y4o4FaEOmpyyTx5dvlVDErcR/zuik3cg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789489963;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=hXXAfXdNFo0NdrmrkbGU4CNNsf7dUFkAHCxzdhL6LEk=;
	b=aGmSHWvvroYMJ7M0UmqyMFo53xr6ldLu5VqurgkQj0gTaikGIrni/ltLALCtw5AhjC9T
	 8XD5gTWj0941Lbp+qYwUyKS6OcfzFLPpwL8wcIMbMi8dj4tjl3k+wCSHDCZoq64fWy8A7
	 LUSbmCIdGRkegEzGPlC2dTYDqe4OL8MNCa8zPtKh6Vsh6f0JmQFUHjOU7oW5DnCf+hTKk
	 rV1LuhnWYZX0QKNnKSfjSFNXGKgwTawzEb8RLpob3X39d05lKGFUxbMR03V3hk0pulfhE
	 BnFAmi32wsght4/+ERSA4ScRUY7125B9MCAFIgkt/iHeQZfydOxTTik4L48U7wugdCA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789489963;
	bh=hXXAfXdNFo0NdrmrkbGU4CNNsf7dUFkAHCxzdhL6LEk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iwnMWNotaa1q6EIi9ZC7QlkfVRpKjsKBvKA60wBjovEultzfFUBHv4se8YxXWgfwr
	 6dANKenupdxvbBvsmLR0PgX2EvIFS+jyqRr/Z+jl6EJuNiabocyXfcp3snxzsaIk75
	 VVBSAMGBEpAqyLhtquZh3BPN3Y59bnSZHrkuJiVbFs9yR+K49TWVSl6SJOi57mTyyh
	 6hSGj7wJPuBpA1bkFFSoKo7DNtPcQc8XT7zp5CYFgI9QU27dU72xdA0ocZVIJ6/DSz
	 UYMjzRbmgWtJqo3VYiIPRwnq+8/fvYN4QRwKDxS1YLoQudHXNCcUyaVgPqucPD/Eme
	 GZf1t/VpohHcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AD1080A56;
	Tue, 15 Sep 2026 16:32:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D3322E3
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 16:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E6CA80A56
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 16:32:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bs6ZHnV6qexs for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 16:32:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 33DF080956
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789489961;
 b=qc5IUERaX/Bclvrtg24NjPSBbW9SrkI0dOlBTJuQwBoUDm5SIhcgKvQlwYqkyZv/+ZXa
 +jT3WL4eKmURlpK+d6m8+7ulFwyEX18NFKjEwOyHchjGbNi8yZ1IzlBFUhiWhV/dmNass
 oCUb+lX09uMdetLn2PJ7aIhYafkaZ79s0SoyQsB2e3azfu7Qyqjn1w2UCVks3+2L26Jgd
 neV5ds7UwLDCPzP2rZcC3CH6bPy3bcO+9EpcFC59IR5m/zrVrcZxFbmsl77fdEJW8WEw1
 EOV1AMLL2+ymo8BbHo0+lKj8VZpcCnyAT1VePyREmcBsH49FZo3maQBVU1OUEyWhk5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789489961;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=WDd1sHdy8PlO7Y+77Ar2RjsWNVbRrEgUXwWsoLkeUhU=;
 b=sOyvf0iR2i/tN0IgucrBWyeFpZdUDREejSRwdPcljPcSP9hNu7tIFA+V3x+2ZjuuslQj
 PYlQOWAHIzj82K1tOtBfNC8p93EzkPSMWUIvdhPrdvVfrUUPs4LwEsa8QN1snHvTpIc5e
 91Btxl6hD/oSmeXQZWyfeZJmR/WvYnsz4g67LP2RUnJostHE1POS9lLmJqDc3y0No2dxf
 Zbhu1mIFx+pChBRmf0E+lyk23hbmXrLR9O9aQ04MzZfJderZ3oVBbIdiRkmIyy2F1ocWF
 LTet6FDrTfjIcj+dEoFUE+ifsQoH7TAJosnVMPZm4aXm9BCptE/H7X76023qXHiFsSQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=A1bH3iSc; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33DF080956
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 16:32:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id EE6F76013B;
 Tue, 15 Sep 2026 18:32:36 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Sep 2026 18:32:36 +0200
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 18:32:36 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260914213936.1167526-1-bernd@kuhls.net>
References: <20260914213936.1167526-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <3792b89306cfc4b4319373d2cac1d59e@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20260910
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

On 14/09/2026 23:39, Bernd Kuhls wrote:
> Updated the hash of the WHENCE file, due to firmware additions and
> firmware changes, but no changes to the redistribution/licensing
> conditions.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
