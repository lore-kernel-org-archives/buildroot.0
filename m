Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4369CC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 09:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 040C3811E1;
	Sat, 17 May 2025 09:40:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYq1p2_Yk3u2; Sat, 17 May 2025 09:40:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 234FE8101D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 234FE8101D;
	Sat, 17 May 2025 09:40:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F09DC223
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6CAF8101D
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9osDj4Su31N for <buildroot@buildroot.org>;
 Sat, 17 May 2025 09:40:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C39280FAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C39280FAC
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C39280FAC
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:40:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C2F581C1134; Sat, 17 May 2025 11:40:13 +0200 (CEST)
Message-ID: <486de3d7-eea0-4941-b0a1-f0cefbfbc6f2@rnout.be>
Date: Sat, 17 May 2025 11:40:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
References: <20250516210452.342275-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250516210452.342275-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747474813; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=LThksiyYwV1r3ZiJU0NK67bFTJY22alHyaJQQSpdT24=;
 b=NEm4BcrSbF0cBPxP1GbiJQ6xXGSnm/jqWSLGiavHImheZVHiJ00WeZjpdv4/TMiiCbDsd7
 3y6h3IqBSYefKXwD0BG/cT/w2HUAqC7vz61C5baaTrv2oVuBArzH6Ize3pGGUXW5vJQppW
 p7nRCg9/PW1QJFjm9VzmeD1M4rOv8H+ejsa7yJwN7ssCdefTXnPvVnVgiqUq3hXK4JrAIu
 z/aSE8lSqw088QsZ9vY3dxYxL8yUnNf5OCGvPAZ0bRLapdg77JXp0ggnDDWF4Hm0g7PQfp
 ctzflSty6hHg6zsBRcXzJLGErpzHUHVm+iGq0tEUYvmZbDjHubT1qo0Jv1XNBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=NEm4BcrS
Subject: Re: [Buildroot] [PATCH 0/4] Qt6 related fixes
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/05/2025 23:04, Thomas Petazzoni via buildroot wrote:
> Hello,
> 
> This is a small series extracted from Roy's Qt6 series at:
> 
>    https://patchwork.ozlabs.org/project/buildroot/list/?series=456986
> 
> but from which we extract only the fixes, to which we made some
> improvements, and added two more fixes that were needed to get
> everything to build.
> 
> Hopefully we can merge those fixes quickly, and then move on to
> merging the Qt6 bump itself.
> 
> Thomas
> 
> Roy Kollen Svendsen (2):
>    package/qt6/qt6base: fix build when xcb support is enabled
>    package/qt6/qt6multimedia: fix ffmpeg plugin build for x11
> 
> Thomas Petazzoni (2):
>    package/qt6/qt6multimedia: ffmpeg support needs headers >= 5.2
>    package/ffmpeg: bump to latest commit in 6.1.x branch


  Applied series to master, thanks.

  Regards,
  Arnout

> 
>   ...lpdsp_armv5te-fix-label-format-to-wo.patch | 63 -------------------
>   package/ffmpeg/ffmpeg.hash                    |  2 +-
>   package/ffmpeg/ffmpeg.mk                      |  8 ++-
>   package/qt6/qt6base/Config.in                 |  1 +
>   package/qt6/qt6base/qt6base.mk                |  1 +
>   package/qt6/qt6multimedia/Config.in           | 12 ++++
>   package/qt6/qt6multimedia/qt6multimedia.mk    |  6 ++
>   7 files changed, 26 insertions(+), 67 deletions(-)
>   delete mode 100644 package/ffmpeg/0008-libavcodec-arm-mlpdsp_armv5te-fix-label-format-to-wo.patch
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
