Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CE0FF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 17:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05D458467F;
	Mon,  4 May 2026 17:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jnjC41ayUFLl; Mon,  4 May 2026 17:11:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0357B845BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777914697;
	bh=6vHjc70vkxlVFtnFiBMyPrb6eJ3FhF3rNkKlfvb/ICE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VCgyTRyfzbQricY37xuoQFRFkJDgyw2/Dp0ACl3WcjrBpaGWgQ8QYUigBjl8bV3ik
	 l77DNUEYHtZb/bNPvzeI6aTgNA/LfK8886k/7h+2jCJw0GROZ0osFG1R587Dh8X8U6
	 I6eacw/ak+dvu1FOD1YPzb7REHJZZNCYjl974zcgzC/bwJVGKpgMDTwhIkkG1hqcvW
	 3dBCJLuEZydK05IMveQXFZ2BcaBBMA67uquBDlqlhOn9jjV4x25vtbgTr3DVm+XbyQ
	 u3lB+/SPXFsdOEMh87IYsSuHGcrKGliOmTYHpf9sJD8SJySsuNVYqLV9oZ3BEoSQds
	 UwgDOpzE2BCLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0357B845BF;
	Mon,  4 May 2026 17:11:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FE20204
 for <buildroot@buildroot.org>; Mon,  4 May 2026 17:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4147C845BF
 for <buildroot@buildroot.org>; Mon,  4 May 2026 17:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFv0XUAxhWMm for <buildroot@buildroot.org>;
 Mon,  4 May 2026 17:11:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B2025845B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2025845B6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2025845B6
 for <buildroot@buildroot.org>; Mon,  4 May 2026 17:11:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C72FF13F854;
 Mon,  4 May 2026 19:11:28 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 04 May 2026 19:11:28 +0200
MIME-Version: 1.0
Date: Mon, 04 May 2026 19:11:28 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260504160924.14432-1-peter@korsgaard.com>
References: <20260504160924.14432-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <d0abdc273a842bf4243335d4801b9e0f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777914691;
 bh=C0a+GCu0oP1Hc37TMzWYZloqKvMwKM99gCS1jNJnUUQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LxiUPivlnqqzzQYBCcc7ypuNaSOlHQ9VvdZbK0PNk7KeqFPEgjWu3RckSVPq3CZ1W
 6Owfv1yQoz3mbPttG11+KZKByXDVLvuSppsk4kwm59MujA4lGAbgzRNFB+/gLLAwKY
 ayUVia5djd7KgEDbYYe74NCt9uOjvcpB3knLg1I4gboY90CMKCx1X4T+bYTm6YRSsk
 zplf9GNPPq1FCG4xfK/LZ2qeIcjNpuOLed5IB755rk26yNSWQZ0ABR9vSBHNTYTfNg
 hIzrurI23N2n2n1UnCVFZ46DdqIVFHOxL1phdMlEoYpsq0F/nwnBLxnza9M+jAOb7L
 RBJVOSMQG7xTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LxiUPivl
Subject: Re: [Buildroot] [PATCH] package/haproxy: bump version to 6.2.27
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

On 04/05/2026 18:09, Peter Korsgaard wrote:
> Bugfix release with large number of (security) fixes.
[...]
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
