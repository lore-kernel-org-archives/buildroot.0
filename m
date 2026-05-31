Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A793CD5BD1
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C932D81351;
	Sun, 31 May 2026 06:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PTqkKafKZv8u; Sun, 31 May 2026 06:19:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCCC7811C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780208376;
	bh=UTK0pOlAM1V+c+RGM6dEI+rlvZ70bWJrODMQpFFvgh0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LXn43EVq23JGHuiDa1bEDM8s+BW7vuUJwY7cTFvtj29VkKs6ZJBF57IWKLlMiA4yK
	 rOIhrJVUQ+1BiJ4xFtu6O0VQ5glGv1BrQMvDCbgOP3qyajCizPX0QIAqanuZABOhrI
	 RTJwMJ06mGBOhHywJObvESfljAur+sOoLpv7CiQwwrUOKiI63afg6fCYejigmm1vWA
	 ijPjccLP63a1n8K/jMZkD8z8R3KDDxPAyr1Bqind8ZjW4HWNOWatmeT6l5ZFXViKMS
	 zzYmqTeYxU0QAZlwMALKRqg0rqQd4g2rL3EjztL9DCJGSHIAZsrQWIm/k//QiUVmOz
	 Mo/J/kGGD2qoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCCC7811C9;
	Sun, 31 May 2026 06:19:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 62A22257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 498C161AC1
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lEBZNx9D_-gn for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:19:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4BC95617AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BC95617AE
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BC95617AE
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:19:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C5D25C62473;
 Sun, 31 May 2026 06:19:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3B5E4604EC;
 Sun, 31 May 2026 06:19:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0CD7210888CC7; 
 Sun, 31 May 2026 08:19:29 +0200 (CEST)
Date: Sun, 31 May 2026 08:19:29 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Johan Oudinet <johan.oudinet@gmail.com>
Message-ID: <ahvSs1F6Z7DgktE5@windsurf>
References: <20260428215547.3059152-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260428215547.3059152-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780208370; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=FpMxXl0IsLNxaFZmb47lOh8VGkHjLD0XHDmPXFUtOTw=;
 b=SVyuWbpD5IGR/LeDkD1SPWtRy71db64E2z0UqedYdqzToPkPZbBv8PMYGuQDrsWaMgr4R7
 NNoXnLblXcZDEQWvOsMDdpl/b4DNmO7TuqTmyGAE5Mo2wvgNxEygrEdtk9962c8zddeyh0
 XuIolCdjfUYVyue6/Xc2jH0eHdH4jU7vWBH2rWHux0EwoxeW8qL3s3GWCyqbyCduoWF1Cl
 A7/GSFjwiYCiZClD9IlS/Wq+5jqinyiHd+fOHuoz1OhJkDM1IcsZzbvhLZROfhHmn5FjMj
 WaYG540WwDVXe9o3Xj2v6x31Gh6xlIzuHKBM3IGikckvmQI/QmJ3F0C7yslb7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=SVyuWbpD
Subject: Re: [Buildroot] [PATCH v2] package/erlang-jiffy: bump to version
 2.0.0
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

On Tue, Apr 28, 2026 at 11:55:46PM +0200, Giulio Benetti wrote:
> Release Notes:
> https://github.com/davisp/jiffy/releases/tag/2.0.0
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * fixed LICENSE hash as pointed by Julien Olivain

Thanks for fixing the LICENSE hash, but such changes must be explained
in the commit message, otherwise having hashes for license files is
completely useless: the goal of those hashes is to detect changes in
license terms, in order to update license information in the package
.mk file if needed. Therefore we require license file hashes to be
justified in the commit message, with an explanation of what changed.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
