Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F20DE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCB8F41413;
	Sat, 11 Jan 2025 16:06:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35b4FSQM-I0V; Sat, 11 Jan 2025 16:06:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA5AA41415
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA5AA41415;
	Sat, 11 Jan 2025 16:06:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F16B0940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEF77611BD
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjg2y7rS_3DK for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:06:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 41951611B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41951611B5
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41951611B5
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:06:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 33C3B78035B;
 Sat, 11 Jan 2025 17:06:26 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:37794])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 17:06:26 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 17:06:26 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250109191912.2359594-1-james.hilliard1@gmail.com>
References: <20250109191912.2359594-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <a38d3c812648c860fa4ca38eeed0f121@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736611587;
 bh=K8fEkWXzc5dZSW2q4Vmh+UMRH+ICVwrjqg943a15JeU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kNdli+Yfssl/9urQuJh7TC2gwR0MdYC7c1UPbu3UAnbPAsIiwC8IMnHDVWJfOLP2W
 0lzHngsLMX0oNwt6Y0LGfuPkqRzzi4FE1a7H56gORaaHN8Xvv6F4M+WJhvTZN0Pqzq
 lLDoKDBS3crxBTgOENlk2T5N0NOAzOVmGQ0R10wf31S7hchixsjkk4HeistM2i90qg
 DdW/gedy2w1Y+nwwjwuJI75914BNp77F8IoH678F3Cyt72ieVTv7/qfwGQ97UWLKjG
 /KvLYp5qykVlCGAGTeL/FhzaAek7qHlJ2KJoCIbfbazt4kPvSEXsg6R1BAFyP71Lwa
 ErpKpYBXOBLbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kNdli+Yf
Subject: Re: [Buildroot] [PATCH 1/1] package/python-argcomplete: bump to
 version 3.5.3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 09/01/2025 20:19, James Hilliard wrote:
> Migrate from setuptools to hatch build backend.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
