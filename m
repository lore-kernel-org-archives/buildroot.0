Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51879CCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F11B9406C5;
	Sun, 18 Oct 2026 20:41:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PDj2G_fHhsA8; Sun, 18 Oct 2026 20:41:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 954D5406CB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792356104;
	b=qxw9F9t4f2c0zysyQoTq3N0jNHEE/+WuHBPMapdEv13E1kiZfU9Rr+ciVLRqMxS0/rHA
	 57ufwC2EIPcLaCVujjLr5ICgxXBzIthrHAX/3vbc0pbYiGfvy3dAXKEuWkFJU1GR6I1DO
	 hfh07DJ+aevsEzRCjNLZKhhAZ7TZM3qIOmpXvnninHWRdaOBBBTQgHfhPdPzlvEX/N/nk
	 zBIPcecyriW+jIdQhp9skB2VnoZOQorE0IWJOB06Q2MqHPiqW/RSwKpThTkHqBO7WNixH
	 1q79WjxzMoZ8ENslUCia8A42f7PA6QG0ifDj5e7f1ZdRr+TeGAQ/L8diIdc5vMjJcXQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792356104;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=No6ZikpIgeaQ+ivwkFRbTVuhSOikBXIoqBxUVtV8e60=;
	b=kSol1nsFMohA3Vppbru53fZAIfeXGJTaL8+vhdkscepWLO/mC18fAeV/tONPMJKuUo0D
	 1/V3+buZv6kwc7FCYjmeu07nKISykl+eAqxOPN6Ly1y2ys4Sdk/9OwCfuswQMdmVIXyZk
	 fZVJp6/fY2vgcV/uoqCq/OjrYdRRlwnWRECISr2iWas2cKVgg9IX75LWQEx/i5966bXhB
	 hBWNVXFkrq2nk7jZf//NNOqElcM/EP00ECadNSKv7DUZjciPm2m9mTGlnfTfBpwwdV902
	 naSe6dXIpB2kYBr/hZ/2v3h6z3ASpkNmWUG7FTz2cvOrUuTRlNR6ujydIyHPKCX3GJQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792356104;
	bh=No6ZikpIgeaQ+ivwkFRbTVuhSOikBXIoqBxUVtV8e60=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZHqYG7bDQts69EwR4eWZqNAulGnZIHZCTjArVkfb+I7T1W3+VVt+Kzs/AsRjtbTr6
	 RHxISbsp6/oKxTdxn5Ja5x1WsQkp5d/Hy97xSAhxo5Ni7tZmCDsyItmkBjIPCre3ji
	 0bRtU9vYs3lg7BLHYCIvtCPKLCpnOwDZ9qRmWePLm7Igo8pDJsnKak+N43q6fR5Unl
	 DnswpW7TULU5W9m2QaDrHd9FZ+0gMeHxCHWtxVdljJx55qEaX5fYm9JsT2caxSdWrn
	 otsVYNSrOvlCWdereknMbNAhgToFvZEY/0sNHLKaTvaTFWgt8kIbhISCXI02Kn2W0P
	 zxLICjNb2F3iA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 954D5406CB;
	Sun, 18 Oct 2026 20:41:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 780EA279
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E9D04009E
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:41:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gO-MYzDqBX7H for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:41:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0E2F340049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792356101;
 b=c92qKb7yGs0L8D9j88DEehzEXCoMWwffYTRlQ9chdVdbnojhFvrKWSWKvoj9evZAYhFQ
 3zwmAUzMSL8c8MilAXrFoQeeGLXD+mKu6jyBE6q5eiPmXe4ajeHB2u3d9OEakchEt9Qt8
 DQ7MzBghCfiT91uFes2a4MKMLLHV7WLICAjdcWimJL79dYBA+cEN4189IX1filpxlCot8
 u2wZ0PmiSNfjCvmagHLfs8eCerIDvIEspJwODlm2G1MFSwGMSVW46sB1sF7EQv+7qVNZ4
 tdLcS3tltw46Fai0RjHGJddcWQGIxGNjn4/83meHCjj7wbTkmbHNl+Xra3+rqsZlc6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792356101;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=lz1MwI+6f3ZlyklBkcACGToiOb1Abe+lbk+PauJpqyU=;
 b=NSPO03oqepRkROQ8XuUOa1OLilhYVyZcyiD2D37XLaFsI2SO//+k2vDZ64gZ/TekxqIu
 DM+P36lH+zPlTYrC1fbgv5Ctnxs3VJ7Xm5KpGi6uSNT9dJ8ekEO0g3T4ixHg/kDJWnsyx
 pKBULns6y0NaWZbTkCwu4RH8+X9M1hMqk35GHsfP6I+9fCjWk4GyYo4YWgDj7uQmsGn/K
 y+UlkfDWsGjph7sl1PiBkJ8FIyHRMN0y5ZZVioM/yYQL7xcGU0F73Wyr8kf5YXyBJaQbu
 tnlp5AZEBWFwz980G/dNYV7OGh71uzZhaEtRcnfjpMnFJjGT1yCf2784Xwz9XstS1KA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=RiOji4bl; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E2F340049
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:41:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 9FE064E41218;
 Sun, 18 Oct 2026 20:41:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6B10560582;
 Sun, 18 Oct 2026 20:41:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B55C01032868C; 
 Sun, 18 Oct 2026 22:41:35 +0200 (CEST)
Date: Sun, 18 Oct 2026 22:41:34 +0200
To: John Ernberg <j@j-ernberg.se>
Cc: buildroot@buildroot.org, Adam Ford <aford173@gmail.com>, 
 Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <atUtmzafWnVtVm-t@windsurf>
References: <20261018160651.349981-1-j@j-ernberg.se>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261018160651.349981-1-j@j-ernberg.se>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [RFC PATCH] package: {libgl, libglvnd,
 mesa3d}: Propagate libglvnd GL provider to libgl dependencies
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

Hello John,

[+Yann since he added libglvnd initially.]

On Sun, Oct 18, 2026 at 06:06:51PM +0200, John Ernberg wrote:

> xwayland will fail with a similar error, not finding dri.
> 
> This is because dri.pc is in this configuration is provided by mesa3d,
> but libgl is provided by libglvnd, which does not depend on mesa3d
> (because mesa3d depends on libglvnd to build the interface used by
> libglvnd).
> 
> If libglvnd is extended to cover the nvidia-driver, dri.pc would be
> provided by mesa3d-headers.
> 
> It seems that only libgl usually needs this extra bit, so EGL and GLES
> are left untouched.

Thanks for this new iteration. It is really annoying that mesa3d needs
libglvnd, as it prevents from doing the natural thing:

	libgl -> libglvnd -> real OpenGL provider -> mesa3d

In the end this indeed means that the only option is to do something
like this:

	libgl -> libglvnd
	      -> real OpenGL provider

Now, the questions that come up are:

- Why do you need libglvnd in the first place? Why don't you just
  enable mesa3d?

- Why do we have libglvnd at all? It has been added in 2020, but so
  far only mesa3d has been made "suitable" to be used behind libglvnd,
  and since we have only one OpenGL provider able to be used behind
  libglvnd, the abstraction that libglvnd provides seems quite
  useless, no?

So shouldn't we drop libglvnd entirely?

Otherwise, I guess we would indeed need some additional virtual
package like "real-libgl". mesa3d would provide libgl when !libglvnd,
and would provide real-libgl when libglvnd. And libgl would add a
dependency on real-libgl when libglvnd is enabled. This is a bit like
your proposal John, just generalized a bit so that potentially other
OpenGL providers than mesa3d can be used behind libglvnd. But before
going this route, let's figure out if we want to keep libglvnd at all.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
