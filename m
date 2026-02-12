Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7439CEEA865
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 22:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40D9C83FF7;
	Thu, 12 Feb 2026 22:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akBkE2rz7Oru; Thu, 12 Feb 2026 22:36:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9484481EC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770935810;
	bh=uNxIBnbVaH9+QHqtFa4MuMYwc3m+YlnCr76+KiltyNo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ngk/3zhm3xXi7B4FuC1WIHm2blyZAAw+/Tl9LHoc5YDq3rdpfYq4mKqziKtaFmm6x
	 /lzScJ0aNheYEJoByiTP7niGhrZRUBbTU92Wye7VIlgS7viU5Z0oOb2NUUdze4V3R0
	 V4P5qL9BUBuVtKOqdJR9uMePA8Qx/0AImn3mZb7ITQz6BxUPG8WEU9iDQRgK+dz7kj
	 w2dQ69iov+KxAhWXv9zmUWHtdOiOnJtWXIlQ3lrGE7nxsnoVXyM5RSXW9gpciErb5C
	 /QeB2/mTOLHDdApXhRGWdgfKqEr3FIYXJ81a/N8Js1kYP5Z6zaw+kuOUR4baSxtHjM
	 ZoT4a7sHPTSqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9484481EC4;
	Thu, 12 Feb 2026 22:36:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4542D1CA
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 22:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32E9F4064D
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 22:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eiUzgHE3QlZ9 for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 22:36:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1F3A34063B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F3A34063B
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F3A34063B
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 22:36:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A3B4DC23DAD;
 Thu, 12 Feb 2026 22:36:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4B52F606B8;
 Thu, 12 Feb 2026 22:36:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3112210368DCF; Thu, 12 Feb 2026 23:36:43 +0100 (CET)
Date: Thu, 12 Feb 2026 23:36:42 +0100
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: buildroot@buildroot.org, tim.hammer@nav-timing.safrangroup.com, 
 nicolas.carrier@nav-timing.safrangroup.com
Message-ID: <aY5VzlQ-9y9yBrgg@windsurf>
References: <20251016-openscap-v3-0-d7b28e958f5f@bootlin.com>
 <20251016-openscap-v3-3-d7b28e958f5f@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251016-openscap-v3-3-d7b28e958f5f@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770935804; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=i/pdyU9V2sNXWcC1GxUi7UJgowU+AlPf+I/+cG2C98I=;
 b=Pt+qmqNUr67aJyyjkMWWLxUCsFBbXEHbd9ffRAnSPbbPx5SEp7KLx1eplxbpN6EL13RJ68
 Xa3GR8APaNM4lz2NpXuuREHnrjQKsiYkJ0ZyiM3H849dZYj/WzNK+TdKYmRUGTKetmdUpO
 K/aVXlUhT9BHCv2NFw+seq6qaa5L5hJ/lia5Z51PQgefHXHTTsV7tAAYOWTwfzEjQuQXOW
 fv6ttLOFoppqUob0eUGBowsOKjQ4VPW6AHEI1y2czBz6Qusau4CDvXblnq9rrmH/0FPtKG
 TPIK1Ml23NScYMBEzj459amqhTwlfdE5uXGBHZEBE8peSGzk3oryeHnIgZ6NRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Pt+qmqNU
Subject: Re: [Buildroot] [PATCH v3 3/5] package/openscap: new package
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Oct 16, 2025 at 04:46:36PM +0200, Alexis Lothor=E9 via buildroot wr=
ote:
> Introduce the openscap package. openscap is a command line tool allowing
> to scan a system configuration to perform security compliance checks.
> The tool consumes XCCDF and OVAL files to perform system evaluation
> against a list of policies.
> =

> The package provides both a target and a host build configuration, as it
> is needed on both sides:
> - it is needed on the host to allow building the security policy files
>   to be embedded on the target
> - it is needed on the target to actually parse and evaluate those
>   security policy files.
> =

> Signed-off-by: Alexis Lothor=E9 <alexis.lothore@bootlin.com>

Applied with the following changes:

    [Thomas:
    - Drop dependency on openssl, apparently not needed
    - Depend on gcrypt if !nss, as either can be used
    - Add missing dependency on libxslt]

Hopefully I didn't mess up with these changes (of course it builds
fine, and your compliance-as-code test continues to work on top of
this).

Thanks!

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
