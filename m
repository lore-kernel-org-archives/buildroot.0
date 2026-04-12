Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7783E937E9
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 16:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BDF442390;
	Sun, 12 Apr 2026 16:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kIF9Fof9x0xz; Sun, 12 Apr 2026 16:18:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95BB542302
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776010693;
	bh=VD7YUP/fYmtY90Y/WG05DBl1S8Xalm2fNAJZYY4YCjo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MoH3XR/LrxxyTg/XiW4OahrMUK9DVHKiecUC4qEv4o+cF/2QvwiUY+n9mwq9B3Zv2
	 Owx2RzaCiQSPdxno4x4gxhxvuqtNXh6v0a89/l20013/tCivPPYBSYhof1mnhdMD/V
	 gE5FPldjdHs9HRkqn3FaUdNFoustwHRgAcHsKA6Spo9YhWg6klvcLIx9hLXvIPLH+U
	 gupQ4ppJNRRkhKszL/o9pmJ3mEYycFc4PLM365Uky7sSkLMSq/WU7lOhXJQZxhnTFk
	 q9Se554ZcESTij+7KeI+FIg3QZOH0J9YN6Cyrq1S/0hCugnJC8guWeJY0zGVbGNO1b
	 2V4JdRKeD/GsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95BB542302;
	Sun, 12 Apr 2026 16:18:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A3929194
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 16:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89C3742302
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 16:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id udJtR3Z6NcTa for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 16:18:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D52A42301
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D52A42301
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D52A42301
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 16:18:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6632C7803A2;
 Sun, 12 Apr 2026 18:18:07 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Apr 2026 18:18:07 +0200
MIME-Version: 1.0
Date: Sun, 12 Apr 2026 18:18:07 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20260410072812.1874864-1-titouan.christophe@mind.be>
References: <20260410072812.1874864-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.14
Message-ID: <fe3e96734e99cdeb0f4b06e80cf05077@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776010688;
 bh=Iug/q9w0//wW0tr4cPtOasurySQcb9OvJHoKznm2HQU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kcLXIFjXtFBfaDgAirlPq1EW9ElLXgLEKzmY7Kh7cH7x8VMbZENnKRC7BKSNNj56E
 FaYUodSKbeq5JJVByOeXHvv6mMJetmyNatR5WnSAN2N44Wh7nKAwRE8cyLkMliUMiT
 6tirDQupVdGWxxmi2P39JHrqz8/K6eVN6JI1vAoxAPK/k5vbg7me7TGVYL+l3LEGrY
 iWO74OM6QY1WXRLxkYOW37HBmTrSb/FtYhMB+/phlwIdgGOnPRS28pBfabm+KXPm5W
 pUr1qzBX6dFB9wEHcGrWMufUk7/zAO53UvHKYiWW19nrUZbO7K/Ob57XUe6F3LvGqe
 yCkGv5vzcq3kg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kcLXIFjX
Subject: Re: [Buildroot] [PATCH] package/waf: bump to v2.1.9
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

On 10/04/2026 09:28, Titouan Christophe via buildroot wrote:
> This contains some minor bugfixes and enhancements, see the release 
> notes
> https://gitlab.com/ita1024/waf/blob/waf-2.1.9/ChangeLog
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
