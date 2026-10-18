Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3708CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B43A7406CB;
	Sun, 18 Oct 2026 14:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DWHJEy5J6Kia; Sun, 18 Oct 2026 14:28:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DEF8040758
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333721;
	b=TlwSz1OFVh7ITwa/phtIKmDcjpgwVuIRI7K5Rq5rTPJtSHN0NQPmor+O+lcCnc6fOTGa
	 zVFY7MeOx1rUHjwhnPnvJQjrLndgoNmkC6d14PLtAy7Y/a0jfLuJAFoOzhVbxjDxZzuYp
	 uxAhq0oQdSzbqvHIL/oyHViEJAhmBMv8aZBj2vI8tFlSrKKzduMp2zpoHZh6vo7isUFey
	 JmCY/RyeFEF8mXAa2SAJmRvqsSJ8wh/xCcv4OYrsTLhI7bvGN1OCRnbvozAEruDxL58wv
	 z15v0XN/Zn2PxSjIHD2vBVV0bA5pnoeLa4Y0xQaZSfra8FYgGAPh7B4+8zZHqmSm+bA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333721;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	b=XuBLsm5NKQaEF2K5v4+23pQrkSaY42cy+UQzDqnvu96/Unw7gbZ0gsSIQrmntSW+pKQ9
	 EtahBcdDAd64NAveQjTqPhAP3SmIB/yjOu366sTVE0x0cs8mcaD1H0zQFabVln9Fw2i6k
	 IzOZMdMVHcldYhttoamx3Ibzcynw5EuMvD7zAVSvU5pJlRr5uTygIm1qmlF98jnT3U29L
	 0jM6pvRWlMT3PslbDF+cH8OdV54PnvVhd5yPrTF975AmIbuJObKgN4A2aEBbuwXhzDc+H
	 sYKhBBV40nAtQReva8IAX80UbLI8iHb9JEOiPnTkJJAwSeuFbOwvo3uD4JCvD0IUJ3A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333721;
	bh=Fp5Z3qtLJujiCOzoJg/CODeqAia0Omr1PYVsLIW/mME=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fdbVs/SUI+LkmQOCMoiXqui/OsPMzYqq9Ue5/MpUOfdYJfpOn+GclvCzvyvhmhB+a
	 E+RZ5UXPxCOena0PFYIEVaKLK+YRtvpy1NQ5uwqe3nCho0lyYTUrsVV8O4DUjn1pHq
	 +KYRz36Czps8t5J18Ea1A0B+Tpf1X5/ND1ZHzodBABCtTWILIuXz4txyXHZmsPrH87
	 kj7Pf+IjZYb7ukYmihCM/DNMmR+pWViImGzA0ZInOiS2rvuShy6xqAp6Qz4lb7Vf2x
	 ppbXoKmmD9DvUsBphb9QpeLMB655p4c1C4FyLnhsEdW9BRyaQDXaxLYzB7Ld+xY09k
	 QV+VL2fP2ZCPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEF8040758;
	Sun, 18 Oct 2026 14:28:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AC572A8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7176E4009E
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ru9u8iSZXH3m for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:28:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A6E514005C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333718;
 b=XvgrI09q4lVoPXze19MCw3qgyBwg/ZlRDK4AMtASLITKgWhocvabsb0wJsiJu03JwmcN
 J9hArCiwcIMguLhkmy1rfJs8OYCjOzAJAEV5gJb/+2/+QtT4/gqqD4+B2KPqxiWdTpEZt
 ZlGn5TzLPA7M6TJ0/uISwysPAK5v14hxxArB7+sADKt50C5dQL4UmglQGBfGOz24B164N
 H2+9Sp0Ik/yo8T+Ghf/NjSMzY/qKoryR/XIe9inXhUnsR393UVmqpxhzbwNvFrhxJIugv
 0AxZgFuWhGov3w0Geson08vDStVmdkYOKvt4mqEm5sfNTtT5Yr7T8d1hc68DkUJfdOg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333718;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=awyLErPRQ77I/ZziMpclWd3944AdbeOe5V0WcJCQt/4=;
 b=X7hnugJrBka61i9yZHcbJydWNRPa8kpX9MzAD5YFnQLK75m5DrfR1SmVeGOXQl7XAR5D
 n/K2aNpamciud+OcgxIv/5IAt+AwPMOG+72OT/y/kgDCQvmOvpAglCkma5gosHhqEWqR4
 3I5U4UY4xixncGieBPaOaoadItQKCick7nqd/C1xkBKA0bo0nw7c+mymW4uBoCNfVySdX
 n6aHgreK++399oAwfOSsrMgoW0R31y64YASEd33sJKQq31wVAaHp5uJM3pJ00EoxIN2Ji
 Xt9U4xTZ0RMqy2yksEMPI5TPqK2s3ZnKalqb/qQbn7yHy+5ptCT4waJ3+I2YlOdbZZQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=A5XYVbQt; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6E514005C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:28:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4746813F880;
 Sun, 18 Oct 2026 16:28:35 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 16:28:35 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 16:28:35 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261015215210.3426895-10-james.hilliard1@gmail.com>
References: <20261015215210.3426895-10-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <b6117795cd2f4f1c9016763d84203ff2@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-pycares: bump to version
 5.2.0
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

On 15/10/2026 23:51, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
