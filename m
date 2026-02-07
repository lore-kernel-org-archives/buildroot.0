Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B108EE0AF3
	for <buildroot@archiver.kernel.org>; Sat,  7 Feb 2026 20:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B292E40850;
	Sat,  7 Feb 2026 20:07:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CT_hR5uykF5i; Sat,  7 Feb 2026 20:07:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 950A740887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770494825;
	bh=r3SGNEDqet57A0gr/AKTO8PMdqIK0l/uevFK8jFix6k=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Va2WTUMA1l0B8WiKqF2QUOsNpkeo/8hS7sN4ntQI/3i2OJxSbP/TElAj7xsbXOOVM
	 DLg05MjviVRJvDdE1qXod5q3WGZW7APydz4pS0DMZiFSz1SoP/Apm4T47OGRGHAFYF
	 Dzuvo1IijQUBHGwgxtrcmVxIi6woiZh7MtikL4N+xBBdkBZB2Q/FUOyA/h1MkI6tdA
	 ddVgLBe9jVgp6LoTarIw291ZXgb1f8w3jiq4lMLfWc7sYmJGxyHP3UJ3LulQaGTf0b
	 Vq2F+MzhHAtTaTwJAB5DTee7XQIDdANisTUZIPN93CmD1eQNjkKH8yIL2JsZTKZjTG
	 eFmUxkZ1rqpng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 950A740887;
	Sat,  7 Feb 2026 20:07:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D5E9219
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 20:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F1004084D
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 20:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PB677h6lG0Pv for <buildroot@buildroot.org>;
 Sat,  7 Feb 2026 20:07:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDF984080A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDF984080A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDF984080A
 for <buildroot@buildroot.org>; Sat,  7 Feb 2026 20:07:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 68D3878034E;
 Sat,  7 Feb 2026 21:06:58 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Feb 2026 21:06:58 +0100
MIME-Version: 1.0
Date: Sat, 07 Feb 2026 21:06:58 +0100
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Pierre Ducroquet <pinaraf@pinaraf.info>
In-Reply-To: <20260204163439.777298-1-titouan.christophe@mind.be>
References: <20260204163439.777298-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.12
Message-ID: <b4c543b01a8721825f98117ef63816b6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770494820;
 bh=uEF/mkvPdn1MzM+Fy3cCqP8k9G7mLm7sdtvO02BJmbA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=akpfudls8c4zmrTJRnS9JmQf9hjm5FIH6aZFHq0VXQH4HcyLu2S0HcF/2vSNDsoQ4
 rxznBEYDUecyoyGxKPocLbJFGhIUY5gDpu2RWlGuNEdX/VGiy/Zdn8SEMJPqvawIsm
 SNc3IY4CTd9Q8dLFtkOAX2nOErDrFGuOf1HogTqGenXIJcWoIi8REUoclaUSOFQgb4
 oDyHAN9gevZQfDKHEVK1sj9MBHnHNoRPgfvU5XFLqUl4vkpQUj01ja8LnwiHm9Qeix
 z0B4ss7XN8Io+VaF/z6AOZU+slPBbw8hFDyF6kTG2c61JMRbqEoCLHa3ShO0sOvSg9
 94tBhAyr0VHOw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=akpfudls
Subject: Re: [Buildroot] [PATCH] package/kf5/*: bump to v5.116
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

Hi Titouan,

Thanks for the patch.
It generates hash errors. See below.

On 04/02/2026 17:34, Titouan Christophe via buildroot wrote:
> This is the last (known) release of KDE Frameworks 5, read the 
> announcement
> https://kde.org/announcements/frameworks/5/5.116.0/
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>  .../kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.hash    | 2 +-
>  package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash                | 2 +-
>  package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash        | 2 +-
>  package/kf5/kf5-networkmanager-qt/kf5-networkmanager-qt.hash    | 2 +-
>  package/kf5/kf5.mk                                              | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
[...]
> diff --git a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash 
> b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash
> index e4ebf2bb39..ddb6af01fa 100644
> --- a/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash
> +++ b/package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  
> dfe3da03260e0153f9f6ced1fc7464eaaf0ed1fb692fc6c2b2d968b629ad719b  
> kcoreaddons-5.91.0.tar.xz
> +sha256  
> dfe3da03260e0153f9f6ced1fc7464eaaf0ed1fb692fc6c2b2d968b629ad719b  
> kcoreaddons-5.116.0.tar.xz

Trying to download the package generates:

ERROR: while checking hashes from 
package/kf5/kf5-kcoreaddons/kf5-kcoreaddons.hash
ERROR: kcoreaddons-5.116.0.tar.xz has wrong sha256 hash:
ERROR: expected: 
dfe3da03260e0153f9f6ced1fc7464eaaf0ed1fb692fc6c2b2d968b629ad719b
ERROR: got     : 
defbb4c068fcfccf7a08298ee6f7b88f9c2d3f34e4ae22b8f8e2df47dfb73174

>  # Hash for license files
>  sha256  
> d1cf0896da7045d841fe45b0991cf35540bac1a17b5d11f4afcf8fcb950246b5  
> LICENSES/GPL-2.0-only.txt
> diff --git a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash 
> b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
> index 4b6c03a3bb..cef63c3b3c 100644
> --- a/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
> +++ b/package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  
> a2673f18c7866d39c9cedca2f86540c56baf966a2491a86ca06a5a0427358496  
> modemmanager-qt-5.91.0.tar.xz
> +sha256  
> a2673f18c7866d39c9cedca2f86540c56baf966a2491a86ca06a5a0427358496  
> modemmanager-qt-5.116.0.tar.xz

and also here:

ERROR: while checking hashes from 
package/kf5/kf5-modemmanager-qt/kf5-modemmanager-qt.hash
ERROR: modemmanager-qt-5.116.0.tar.xz has wrong sha256 hash:
ERROR: expected: 
a2673f18c7866d39c9cedca2f86540c56baf966a2491a86ca06a5a0427358496
ERROR: got     : 
06055351f3a6f8755df60f48b3fdaabb4a406939b9c777f474e8a22bdd116f80

>  # Hash for license files
>  sha256  
> d1cf0896da7045d841fe45b0991cf35540bac1a17b5d11f4afcf8fcb950246b5  
> LICENSES/GPL-2.0-only.txt

Could you check those hashes and send an updated patch please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
