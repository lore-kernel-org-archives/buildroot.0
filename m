Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4184C88E73
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 21:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AA30605EE;
	Mon, 14 Sep 2026 21:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4yOe7JzfUvXs; Mon, 14 Sep 2026 21:23:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B60D86060D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789420989;
	b=qIbKvfRRpU91Y0cDRoFT+AoT9jdIpDB2Ni7iZAFR0YGDpxfDhwaIXGqVdyHuHca8Qzjz
	 jolXFzWF2kMebqvgSnVwqSXevzSUMmI7dk9CUGDMcEBE5/tLm9khEZxwxiIeOLdsMs7Tt
	 XRrqQeWDNN/UAffiOxIFHNJW9M85sUmzq+jNm+NqUthx+lstr40hm9MB3kTEgm5vs4OKa
	 zsZK0xY4jh06PEjbOiNDNk8sBI5sTG3CzWF6QBTuWJ+LZCBkEyeXI5RCxGyNxwIgLED/p
	 QjZFOzZUAqjDX/C1j35JB56mWxTmLvKLn9lnZGIZB+Ay7qZTbSYfitNaRSMAXhLddPQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789420989;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=OCfWkzcp/sVyVExBjX79JSl92BUXdPK6m5EhNR3idSA=;
	b=bMLSLmZfaw6r/+r8d+Pxu4D9DhnbJbs1RhFPg+0cPBmFm/Uy0lIM99sdBMyElQAwxiNR
	 OOF2lDaQHrtlBcVnPO4d37m2ksaGDixLjZJnXenJzdYjncQI4MGN2M9QnE+Dcrf6AEyLn
	 Xvn3DgYTvdtHr2mUNyagYO5Oh6TTl02OaL6ggkfXm2/uHKUaJK83oIIReiuhBAD7unubQ
	 oUZkRUfsCdAmrkcdyn9cx9hO44dvUm5PIPQAxTys+cb49dUnuZzp2azcFEACJOC+CvCng
	 ZeyGVTXQbj+x9uzDMTz57lqBprjzj6Lf75ih6CgDYjpyzClBcjg1sYT6fOmJ9SAPNbw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789420989;
	bh=OCfWkzcp/sVyVExBjX79JSl92BUXdPK6m5EhNR3idSA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mWNBaX02rpEb4JSBCOSaGqNXNbkR6Gh8WrmygVLFl/n7ieBBPfSIpuKr3O2m4efEw
	 5HoDXZxnEWg1Vz3s26YFZdtJ4/Ul2Zk78QdIDptxMATM/JIJ6Fce72rfqlyYkW8Ett
	 dm4/6cEnhwL5IaX+Z5r292o8KIJfP61Po6rbAkDOrCiFdGaZFhrLEPTNjSNJF9Z6Cs
	 zYZZRMI6cTBde72oMuYBJd+hUfdrjFrUHiKxcOYPisyXnNIwKBOp7+p5ly0rZXhwjd
	 TvF4Gl8czNLYa2qs+FEeh7nytnO7ztuvdaOjfmrfBOJCrhtypH49HTa/7OI7Lq/pCk
	 KqZ07xCpEpf4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B60D86060D;
	Mon, 14 Sep 2026 21:23:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EFF40465
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 21:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D600D40515
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 21:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uwu6bXwCHk2w for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 21:23:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4B08840514
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789420986;
 b=cnFzqH6SN6Zdx7LiteArTT+zCZt4Ojl5qSsy0JM3zkzPZ+4eT1lmrYyZG8tJDVPQjNR4
 a+cnHLvJI1yBPmTwDhTmPB7rgcdVkubWOFryzE1pw/tBhz2ZgeEfPiPgemY/jzOQg+JJ4
 dUd0uu3lU0gbA9a1Ctw/3HJK/RzhtHGgoE61qSsMV9+VXcfPGzyHqvHwx2aX4i0wJYi3z
 m8r1XOuSE4E313Dk8JecD+vAs6B/QkiX1I26jxUNGkiaEX0RwddIGM8JKKVIyfMqL8j0b
 xhsT7jqN56aQx6/9hiRqJp3rF9BfPH1Mfno2ngLcxzqfbOiocVpn3ZK7G8Ok0oc3hMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789420986;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=n71v9FqjAX94p0GoQOOdQ4j+WcrgtNXXyA8f5PRtyFQ=;
 b=YYc4sSLkYns0pNhzGCXDRAfRPpIXVv/HNd44soe+vjbwJ5GXe2VEoQKvo5Nk6Q/iYXrq
 VJ0/9bhIjdValeRZYXPWsatEX959WDfLUJCzOh7n6v4668VLbc7AoiALIwOF1HtRD7NUO
 zLRFpJG3vp0muBwS8Tsrxi1wyfOC4MxJhPG4esvk3vssEsLt/D/hAmK04wLQKAa5aeFtl
 gxqtq9r9aKQbUoGwMl0fhzil9vA2lG1ok9JZ6V+g0lxKUotYuuMoASEwV8rMFVE5Dmtkp
 ugHFREOy/gLG4gRu6KABI85DMXjhGI0euEabjVoP9gYJIamAwJxdMeulMVCbRkVDeYw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=BMJtiJuE; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B08840514
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 21:23:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D7DB21A06E3;
 Mon, 14 Sep 2026 21:23:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9654360323;
 Mon, 14 Sep 2026 21:23:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E672D11C7AFC3; 
 Mon, 14 Sep 2026 23:22:58 +0200 (CEST)
Date: Mon, 14 Sep 2026 23:22:57 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>, 
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Message-ID: <aqhkbaMkRynOxfoT@windsurf>
References: <20260618065137.3987932-1-james.hilliard1@gmail.com>
 <20260618065137.3987932-2-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260618065137.3987932-2-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v3 2/3] package/pkg-python: derive PyPI site
 from blake2b-256 hash
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

Hello,

On Thu, Jun 18, 2026 at 12:51:36AM -0600, James Hilliard wrote:
> Python packages downloaded from PyPI currently store the complete
> files.pythonhosted.org package path in their .mk file. That path is
> hash-based, so it changes for every version bump and adds churn to
> updates and backports.
> 
> When a Python package does not define _SITE, derive the hash-based
> files.pythonhosted.org site from the blake2b-256 entry matching the
> package source archive in the package .hash file before the generic
> package infrastructure validates _SITE.
> 
> Follow the usual target/host fallback pattern for _SITE, and raise an
> explicit error if no hash file is available or if the hash file does not
> contain a matching blake2b-256 entry. Add the host coreutils dependency
> for packages using this resolver so b2sum is available when needed for
> hash verification.
> 
> Update scanpypi to omit generated _SITE assignments so newly generated
> PyPI packages can use the resolver.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

I must say I am not a fan of this approach. It is very "tricky" and
not obvious to understand that the _SITE information is in some cases
derived from information in the .hash file. For me this breaks the
principle of "obviousness" that makes Buildroot generally quite nice
to work with. I don't really find the current situation problematic,
and what we have currently is completely obvious to use/understand.

Of course, if the other maintainers are happy with your approach, I
will not oppose. But since so far nobody provided feedback, I thought
I should share my humble feedback.

Another concern: I assume you're adding
$(BR2_COREUTILS_HOST_DEPENDENCY) to DOWNLOAD_DEPENDENCIES so that
'awk' is available? But then if we run "make show-info" without doing
any build, it means we no longer have the _SITE information?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
