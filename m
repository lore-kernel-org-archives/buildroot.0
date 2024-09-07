Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5796E6FE4E
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 06:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26940409F8;
	Sat,  7 Sep 2024 06:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hSB1feDBi9L; Sat,  7 Sep 2024 06:45:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED2A7409F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED2A7409F2;
	Sat,  7 Sep 2024 06:45:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2EB51BF2F8
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 06:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDD468417B
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 06:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zqxFE2dCv7OR for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 06:45:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4B1B8411B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4B1B8411B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4B1B8411B
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 06:45:04 +0000 (UTC)
Received: from [213.36.2.128] (unknown [213.36.2.128])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B80D8B00539;
 Sat,  7 Sep 2024 08:44:58 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>
Date: Sat, 07 Sep 2024 08:44:58 +0200
Message-ID: <191cb3a8a28.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
In-Reply-To: <17a5d38e19273c96711a040d50652f94@free.fr>
References: <20240827003813.30083-2-vjardin@free.fr>
 <20240828102106.55640-1-vjardin@free.fr>
 <20240828102106.55640-2-vjardin@free.fr>
 <17a5d38e19273c96711a040d50652f94@free.fr>
User-Agent: AquaMail/1.51.5 (build: 105105504)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725691501;
 bh=aGqHzINC/UJqdr59cb1/GaCrPiQaVfBW4HYzZBxXL6g=;
 h=From:To:CC:Date:In-Reply-To:References:Subject:From;
 b=GLvAUUB1Prr5+okPLlDrIhBvvq7XBt8AUlSR8NdEUtDx1wXMxHxuU94zsadJDKLHx
 x1LjnS1ae3uYg4/imVS0VvJb4ckEKRPOFAg1rJcPoTsl5dYq/7KDVIGRZoZaOgF/mi
 y4TA4vRHeyKk8zkz+Hx4VlW0GvkRy41rvUtWE5eHePqAOPBdZi0AZZSB2ErPs/nRJc
 Lv3KckEir5BXlfadUc0TCyxK/Lb7ZL77oaf/dO5DfD1QG3US7PPvRUAv8kMMQqh9Ox
 LcibYkOSSQamPv/TXwGoUlbx5GU3i+Vz6sqJkv6Noc1FUc4FJ6JFcFIkRqmk++ABMz
 ycJq+K06NhS1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GLvAUUB1
Subject: Re: [Buildroot] [PATCH v4 1/1] package/dpdk: add 24.07
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1245425731146149511=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============1245425731146149511==
Content-Type: multipart/alternative; boundary="191cb3a8e5454be2856300af12"

This is a multi-part message in MIME format.
--191cb3a8e5454be2856300af12
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

Hi Julien,

Thank you for the checks and helpful hints. I'll review and adjust the 
supported target CPUs accordingly.

For now, let's stick with x86_64 until I can gather a proper build on other 
GCC target CPUs. I'll make sure to follow your guidelines.

Best regards,
  Vincent

--191cb3a8e5454be2856300af12
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">Hi Julien,</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Thank you for the checks and helpful hints. I'll review and adjust the=
 supported target CPUs accordingly.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">For now, let's stick with x86_64 until I can gather a proper bu=
ild on other GCC target CPUs. I'll make sure to follow your guidelines.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Best regards,</div><div dir=
=3D"auto">&nbsp; Vincent</div></body>
</html>

--191cb3a8e5454be2856300af12--


--===============1245425731146149511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1245425731146149511==--

