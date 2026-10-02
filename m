Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6AFCA5FE5
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D5C660B24;
	Fri,  2 Oct 2026 19:50:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWrYNYG_vHEa; Fri,  2 Oct 2026 19:50:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 31C9660894
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790970644;
	b=gXSUbzUXP/el07vZ8rpizGa6ssi/XpeF4n/ZM2inRQOZGnTBqU70fHkMlS50yRb/6pAn
	 tn9DgFFRKq8JAkpD8QGihuIyWDdgYInJr6wAIRhKSkU2+9OxR2ctCtUqWmsc99CATw6PA
	 GqPs4Yu3JVZuXJ3Vmx+gCoCmN2qGc+0LcwBKk75oL0RYbHwaNvHNwcbaivkhw9vAT/PT3
	 XXlOVK2pOk8S1g9Cl+F9MFu7nysF7lsLk3m5/VzFXXcREjMX3v17Cx0LiOlnokmzgPk8p
	 Tz2o5Vb9DIuMxr3HSkg7nS+Y8EqPl3biy0JFdPa1yUj3IaVe/IqZJjNRpCYTfkmgknQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790970644;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wDF/I1vWsIoS2+eXdNrLKO/hfXvGXEFezvkUEUfS4Js=;
	b=XR88yL+BgOCieyXYooDrfzjL5WWhvOUh1qjqhN7SDrUsw103AZjiQkmARU4oL/dGVeP0
	 90qT7DzBuHLiVruim9G/LkR89mcG+tcnKH+HHHyp6xeNZo0G78PpDnt7i8goLS7bqYHe9
	 myCponZJjGYuUeMXLCHipzAYXWLyH6BXcPd8BO4Wu8+Q50Oa9nVqQDrhK0yTldOBXmhG3
	 COguZ0vX00vMEGOku1mUwkawxR1BbUpDWmE6vZCT5fZwUy87hqNnvMkp7Pgyv3aQlkfv6
	 Yo+DCs4Skm5ecdWGl4QX3YmHL4XX8u2+YrnED1evRW+e69+E/Ep5RM64fyEWsJUtGxQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790970644;
	bh=wDF/I1vWsIoS2+eXdNrLKO/hfXvGXEFezvkUEUfS4Js=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KjVmxqiBmLBOBk6wwnxACQXg7/8cLOT+i0S6+JaSqC31iyPn/5JU6mJ2FCYYXsNo+
	 2Mj9ezjPe0xt6IyA/GCN2YW5rgmIbmNrkEDj1ZbVTFkdqbRkiOK07bQYnEI9qPoVye
	 lwLDPDLlj5cQK+qSwMlpIoCGPEFcCo2LeKeTrRlhDMC0T8emxVBu6hp72NnRl86fnK
	 AT/RgEpzRgpg3YV7NBc2aE31o+Ek6kwX3UTzoOmowNjeTAJs4olV9ErZuZPdx8o8Vy
	 voC8DKDRzQsA07LyvZrxHllVhGnOm21paiaSdaNsq82STUHo/uKXGHPj8KCnUK9FsA
	 JqSEPyF6rSSAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31C9660894;
	Fri,  2 Oct 2026 19:50:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA68A2E0
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6AE781327
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mssu6_kK3Y0X for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:50:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6817A81326
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790970641;
 b=rGIDisfG5FTSf1o0fiw2EP0miTfF+bdmJeK9mPVfy8ubUtNhHAptrJtqKbZlxOkedEqE
 klXTjhm4avjHRQZH6mBk+DMO5XX9dQVH7og/XlLNRGvziSLJAnSGgR4tjpEBcBNsNR//D
 6MHku1YzKPJtbbkt1WgGvmqlsJe/rYeuJ2LQNNW+KJoitLHyCd2wNGp3stZrNYWXRQ3CC
 jQ8QvuuzZxwgIEvjVYQMNg5+yDCjrFfWLpQ6eECYCZ1S2mCQXvZohhH6Ino4QRoUPpxOT
 GmPoEhRrY2FVY4ZuYXCBBxaBt2eguN1rWv5vponau+tYjKRtmH+DiclsB5fml4yH2Yw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790970641;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=cC7cvySjchJjOB4us8iUJUmR0KW8iYWATjCkMMu/g/0=;
 b=J0rse6ZvLKQ0ulf8I5q8UPOdZkW5CEB6ktPAqYlh2x0TrymkGyqqCSklOyp6xranZhuF
 aEsfr97k3OcwFy9C16sxFKJM2ababjo8qmP9DZBpxwScRj/u1Up8cg0C/v1AtgQLfb/jq
 FsQxpuA7YnihyiYJXHI0myzsrFEfAQkC8fXN+0ID9Hr1WsBFronrk+TpdLyhoqK79x5Vc
 cOZpkNwZ4HMVCByPJ/JNgcZdCT6ktx6GDN6snz4jVyK6RsLRODuS06tzKbctb7S/sKHLW
 QoGjvKZIFq/myAabtUljQaSOz8OKuB6ZldeISCYLbQVy+MtjfAMAt7fRpRNV5ntiSuA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=doDI5cvS; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6817A81326
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:50:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3E0561A10EC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:50:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0F48A603DC;
 Fri,  2 Oct 2026 19:50:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 23C3A103282D9; 
 Fri,  2 Oct 2026 21:50:32 +0200 (CEST)
Date: Fri, 2 Oct 2026 21:50:32 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, Will Newton <will.newton@gmail.com>
Message-ID: <asALApVNDMnZuh3N@windsurf>
References: <20261001141804.833216-1-yegorslists@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261001141804.833216-1-yegorslists@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/erlang: fix build with
 BR2_TIME_BITS_64
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Oct 01, 2026 at 04:18:04PM +0200, Yegor Yefremov via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> erts/emulator/sys/unix/sys_time.c undefines _FILE_OFFSET_BITS before
> including system headers. With BR2_TIME_BITS_64=y, Buildroot passes
> -D_TIME_BITS=64, which glibc only accepts together with
> _FILE_OFFSET_BITS=64, so the build fails with:
> 
>   error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
> 
> Backport the upstream commit that removes this ancient workaround.
> 
> Fixes:
> https://autobuild.buildroot.org/results/72443d8e794451cbc4063e906d6b2405021cb52f
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
