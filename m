Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF590EA719D
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 20:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F2E64103D;
	Sun, 19 Apr 2026 20:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9QoXC5YD1QQ; Sun, 19 Apr 2026 20:54:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31FD541034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776632045;
	bh=a5DrPRe7dTKaoX2kR3S0JAAlvRvfU7qgVzD44T5Hk9M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pdYdN7MTd1BTMMlJJWz+ATONCxZlQIdcn92tv1XADwTR+5+P6+vva+BOKPm3y+edg
	 6DdX3BKaOv/stdf6lM4R+ekFJFVVx2hNw0rtcRr3BJBax/AryRA03MJSaXHD0+DPuy
	 sU93hatUCOJzfhTkrTZ2uJn8t7urNrzgQBO9POXRePyb4gmtQF8N6Rnvfzb2oEffT7
	 kyCTFX5/+maPdHBOqcWx0a38729kXGPT8zlR9yFEfpeLBA5Qw6KHFcUn4nr3dQA/wc
	 vZRV+9McxAreA+nWa5krXWuGkTOb/yPa8jAJQvtehbT3yqLwK1QfynEpl2sWzj01hN
	 EIi1vWfMwJLNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31FD541034;
	Sun, 19 Apr 2026 20:54:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A2EB124D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 20:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 884E382389
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 20:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-mAgBWaVQaZ for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 20:54:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9908A822A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9908A822A9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9908A822A9
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 20:54:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0B2A513F89A;
 Sun, 19 Apr 2026 22:53:58 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Apr 2026 22:53:58 +0200
MIME-Version: 1.0
Date: Sun, 19 Apr 2026 22:53:58 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260417084010.1414193-1-aperez@igalia.com>
References: <20260417084010.1414193-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <8016c9ab415662eb88b6d566423b4df9@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776632040;
 bh=W1s79jJ2zAqW4bDGTGpuuWNWECwFjITZ9MyOB9Kffls=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l8D5DF2/wtXipCbWk+pJMgzumuXG1LK2MNPZ4uiWBk10gV9FAEYyQ/kOZ5odujNHz
 MCHZEQlk2c0P2r/kZK2dHJOg8452jVSRE/gbSww5SQqwIU8udfFj+0+BsgMQw4nz2r
 sheN2vGjVwAJROw1fKSel47DnbdPE8CFJif1PIIhUhM555Bn5ymtaTlQnDx+ZEMxBm
 dB7O7r2vuwhKGApHob/hcPS8y/aaZswRyBjvRXg8IKD9L5j7JNY4DgVD1MGOp4LWUX
 IlXwkdCQFO8J1+Tvh+zpHrpLV4Yl4mVSM0nwidufGoZPvk2RAmnkSu3Pvv0gqScgnd
 DwgPrtleEHgeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l8D5DF2/
Subject: Re: [Buildroot] [PATCH] package/bubblewrap: bump version to 0.11.1
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

On 17/04/2026 10:40, Adrian Perez de Castro wrote:
> Release notes:
> 
>   https://github.com/containers/bubblewrap/releases/tag/v0.11.1
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
