Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67021FD45F1
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 20:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28581616E5;
	Wed, 25 Feb 2026 20:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GfAOlqHF3Mkl; Wed, 25 Feb 2026 20:47:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46EAA616E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772052425;
	bh=cI/ogJ3CMaM7xIgjV4gkkLR+/fAxli9yTzNSQjDBzLk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ro9SIlRriJoyMmuzJuRZ54vnGobki5eRC5sqFmgXaCX9Da+4WOcbc88enQjkcnWIq
	 2FSJ8qHywGY8k2iMOWdb8gWZH/S5Gux4Nqex+/sri1LGPw4PClNNCUuuF4WAJVySnG
	 t1pMQM/5q6M9ybImI5EUrfdV1W6QfiUwM2JIF/vCVyf1uQRu/w3vgeXDZU/F7AMQUk
	 YYXDe9T7qO0bIqyMDecf0ewFA2bm+rJcbzvCawsMlaSoA7FpCbf0MuPTxBRm0+43Ds
	 qEBZcV8PhMQ9mQeidfOnYK0Q4kl/P7iRpPuxtXjhvkOpMvfKacFZzCIEZvH+mW1P8d
	 byoUOLTnD4LBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46EAA616E1;
	Wed, 25 Feb 2026 20:47:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D9BDA204
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C01EE616E5
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uvAQKJGcYLmh for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 20:47:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6776C60BB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6776C60BB8
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6776C60BB8
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:47:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 9CF3D780395;
 Wed, 25 Feb 2026 21:46:58 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 25 Feb 2026 21:46:58 +0100
MIME-Version: 1.0
Date: Wed, 25 Feb 2026 21:46:58 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260220111946.2137330-1-giulio.benetti@benettiengineering.com>
References: <20260220111946.2137330-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <276cd8bf8b6b2363baadbe5968ba79bb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772052419;
 bh=apDs5qogitP54qqTbOUxArCLSHQXOmDg7ID4siMQWco=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eIIyp15VU+VX42fqy0C8Ax9n4uCR2Rk0JnSMBtE0r83xf5jn5Hi9AtaHEMoJ9B8Ma
 QwONDmoSzBvHngR6Vjfqj3b7JBLUsynoTuG92RTe9yE5vCrhi5qbMYzfsbPo3cQG1x
 oVR3mlN+91AY33WeR3eSWWXI67joCflUzoMLwBzHMkHJd3Gj5hpjFZSGrCZ+nc/EUZ
 tyKZcUCDur8s7GkHiLX9iT0pMXoV9Byl401vnxvhaq9qBBiJotl4N+e0B5wi4g6mvg
 GGiV+8fjLtbA9CL0EQBQGlEJEakYeia/WCIcZ9CrcRJLoDnyWb5BJT/Nxjic5Xc2eD
 ty2ViaQePmN7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=eIIyp15V
Subject: Re: [Buildroot] [PATCH] package/wireshark: bump to latest upstream
 stable v4.4.13
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

Hi Giulio,

Thanks for the patch.

On 20/02/2026 12:19, Giulio Benetti wrote:
> See the release notes:
> - https://www.wireshark.org/docs/relnotes/wireshark-4.4.9.html
> - https://www.wireshark.org/docs/relnotes/wireshark-4.4.13.html
> - (and all patch versions inbetween)
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

This update should have been marked as a security bump with links
to CVEs. I applied instead the patch proposed by Thomas in:
https://patchwork.ozlabs.org/project/buildroot/patch/20260225091006.238395-1-thomas.perale@mind.be/

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
