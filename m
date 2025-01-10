Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37E3E77188
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 20:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EB8A40372;
	Fri, 10 Jan 2025 20:28:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uSanMd4OUHIz; Fri, 10 Jan 2025 20:28:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E4D6403AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E4D6403AF;
	Fri, 10 Jan 2025 20:28:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34E5776C
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 20:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 218FA403AF
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 20:28:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xIsNn9n5Sqd2 for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 20:28:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7B2C140372
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B2C140372
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7B2C140372
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 20:28:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6030813F89A;
 Fri, 10 Jan 2025 21:28:25 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46672])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jan 2025 21:28:25 +0100
MIME-Version: 1.0
Date: Fri, 10 Jan 2025 21:28:25 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>, buildroot@buildroot.org
In-Reply-To: <20250110104134.7638d728@windsurf>
References: <20250106043927.154476-1-nemaakhilesh@gmail.com>
 <20250110104134.7638d728@windsurf>
User-Agent: Webmail Free/1.6.9
Message-ID: <81d60dbc93cc938d49a3828ddafdbd7b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736540907;
 bh=iA8DD4GVvH9TVN0Y5MFv0xFIpKRUAjB3LJ2hYnQ+kqM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=izR20FhBw+XNDqM4/7HRiq5pEUy0NamspQCLv9Bg8kDbbaUgPRbv1PlCilgZTIINq
 Gc9WgOwAZ1TKh+i28+Gg2oBxK2dXI9VIeYJsCgCottBiLdqPmTB6ORh+r84X/tiOZK
 FAFyxc5cLr6UNdhpdLExfynbbzEoxoc0s5sldcK1DSnF09NGo4ubVpeEGFy3TvquCP
 j4Pz2ASL07DL2M0xx1fm+gqxaXQSOPE+y25gL0dxmCRvThmW8pIglIsTJ4Yvm9ozIr
 1wLigt1kse9GCZloS58+Z+pcXy+sHVtPOZW58zYgz9p0N+VAhGDeMmHMNUfaiOhzcM
 ho/N3ud4U4eog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=izR20FhB
Subject: Re: [Buildroot] [PATCH 1/1] package/msmtp: bump version to 1.8.27
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

Hi Thomas, Akhilesh,

On 10/01/2025 10:41, Thomas Petazzoni via buildroot wrote:
> On Sun,  5 Jan 2025 20:39:27 -0800
> Akhilesh Nema <nemaakhilesh@gmail.com> wrote:
> 
>> Release notes - https://marlam.de/msmtp/news/msmtp-1-8-27/
>> 
>> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
>> ---
>>  package/msmtp/msmtp.hash | 4 ++--
>>  package/msmtp/msmtp.mk   | 2 +-
>>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> Thanks for your version bump!
> 
> However, it seems like it is causing quite a few build failures in our
> autobuilders:
> 
>   http://autobuild.buildroot.net/?reason=msmtp-1.8.27
> 
> Could you have a look and send a fix?

Regarding those build failures, msmtp seems to require
libgsasl >= 2.1. This requirement was added in msmtp after
version 1.8.27. See:
https://github.com/marlam/msmtp/commit/64e06bfc2d61efdbcd79833f73ee3d0f22fb6c38

I see that Akhilesh already proposed a patch to update libgsasl
to 2.2.1. It will probably fix those issues.
https://patchwork.ozlabs.org/project/buildroot/patch/20250109011520.27360-1-nemaakhilesh@gmail.com/

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
