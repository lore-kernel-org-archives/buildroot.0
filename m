Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1E6CCF2D6
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 08:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C08040738;
	Mon, 19 Oct 2026 08:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CM9EIGC4ZQn2; Mon, 19 Oct 2026 08:40:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7797D4073B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792399241;
	b=ZTkL9WxpMLeSAYJ50HUZV9Ai+573MyAOauuA6gBt6objuQOXG9aAnAQoF9OmEjDLV25i
	 540+875RAwpPrb1qluOhTuwpf6o4EMujNXN0jaMV+oTw2vYda7tknWiCbK8s2F5hE1+ry
	 yC1JTQ+by4R0gHQpAHlvrJ525C0dc+aUxumtD50tIqrKhzSMNhZ0A5MbYZ+hKQwkdhZNQ
	 Jt198odBmZWq/nhnP4D6pgbMXq2arYvtqfBecbAiUUCaov3gw0ceWl3fAEf6x+eA0VAqf
	 y3/nGCM7MR9SaKPaElZKffPSw/LEFaJLzsds4oDAVBUiPSGnIfG564+vFER3Eb7W4Bw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792399241;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=z6hOx9yii4enfhiNoQSQ8JCAvZ7IBT0+ICh1+X2RlV0=;
	b=RAxMAn+VYpYSpioqF50d4MLuxldzuzaCJiDGKhvX9l6JEJR8u1eSNwV1lMqu+Prbft29
	 uHVTtUuKBmiDemGhYFrEDdCaT3u+hXHqepADMj0+Qn2V6iU8gGO5tMWu1Wr7BpJRyQloo
	 4E/mav01etEnBBwnAoaDOADtxbasvmq43Y56xP3vNRPqJ2PYpqf4p/dAayZnTeXbKUxsq
	 cNANFINTPrd8eQRGbDtlvFmutXzW5CrMq1f0/ylY7SaiCew6Qt3WnRsW+8G+F+njPTkvR
	 5AKgxYeQIFfwgYoqi8LZiud/D7L5yyz1l7bRp4eB7N7jy1g8eIFB378o2t8rm05RcLw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792399241;
	bh=z6hOx9yii4enfhiNoQSQ8JCAvZ7IBT0+ICh1+X2RlV0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZzUsKplOuK4uo5knKfP8FrPYzwtPJYIA4kiez24ZYewdLclJYhRvLeP43ewCKX+7a
	 3VowUouBqflgQsawuzJXWwUUsjPJd+gKyzq0nqFkpJVgKKXBICx4sSeQTdT0ilPVfI
	 EEFAEnCOa6kTWWcT7nuNqG08m6YLkPCNZWA71QlVQMxMmgJwktyiVFJmn9/bLNUE9X
	 hL1jRAWfKSngEcxs9Y9tLnoNWQxb76kH6cUU47WWEjjSPVqM4mP6NRs6f7ob7Xz/69
	 9wgu8nTpUQ3I1MnWcdsJcITJS7SPP4DJUP+6VwbnyuXYzwCGOKopaKnW5gziRCFyRW
	 UbCtU3Gjb85iA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7797D4073B;
	Mon, 19 Oct 2026 08:40:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 55619465
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A4F280EC7
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkZDSW1wJ_oS for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 08:40:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C2CB980F7B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792399239;
 b=PHr+qeu8y8R7yNsXw+8xNqGf+1U9wnv8O5ejRQWYX8IVnunY34/0MNC5lGK+qvXh+wjr
 rz4VTtIvqAqsHE654xsNYl8AsFfG9vp3Gr3Sb/k4tIO4D/4U6Z5N7ky+etivpfRIwtnAv
 zpfInblKEo6FCz5lYRueQb1wlC2KdGD9Nu8BaYyTgThIn4NpZ9tX4vlozg7BRn20mZJA8
 FNOIO8Ys5QpZqpLPoEx2QOeGRvXQ2cMvaOgDFQwUvLxEI83I/owHT3FoRi9xveS23RheL
 BgD+1UjGS2vrl2urfkB/e5sn84ZqwImHey4raHh0BFU1zhv2VX3FJdxk8HqZQC90jRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792399239;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=B4Usxfdb5XJBah0HGZ+g7Varrl7oMXdM+2YQrSR6FuA=;
 b=mMLcMZL3sZDTGrNhvCFp9j5yJhBjvLG/adB+5a3QmAT2XlmCek7PXqAH0QJaHc/R1b2E
 VG++bla4x17bpmy1bwP9b3NhXYqQVKylLi4uwErnbLtv2LBvDZuhpgGfZNwl7IY4M32rS
 aWboWahe7iqE9iUw9SK7a+rLcxQNG/PApCvVZLzcez8KuXkkfakYR/d2Y8KYUWEYhD/cv
 rfNrhSpqOYCJ1LRDDXLQw1RW1D1EJan+Tw/+hBZ2FA9sUsJU6CowVbcC/LisdIKdadrZX
 Q4dmmVdH1O9ZLHIsp6yMxBncnkpFdPWu7PNiR9WMnfvhE+fOrkmqH9j6UKCWb8jKCww==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="fz/Ec7vA"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2CB980F7B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:40:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8CF351A128E
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:40:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 43F7160582;
 Mon, 19 Oct 2026 08:40:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 23B6910328429; 
 Mon, 19 Oct 2026 10:40:34 +0200 (CEST)
Date: Mon, 19 Oct 2026 10:40:33 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
Message-ID: <atXXfDh-6qjvAdIK@windsurf>
References: <20261016211225.30380-1-fl@n621.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261016211225.30380-1-fl@n621.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/sigsum-go: bump version to
 v1.0.0
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

On Fri, Oct 16, 2026 at 11:12:09PM +0200, Florian Larysch wrote:
> Changelog:
> https://git.glasklar.is/sigsum/core/sigsum-go/-/blob/v1.0.0/NEWS#L1-34
> 
> Note in particular that this package now requires Go version 1.27.
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

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
