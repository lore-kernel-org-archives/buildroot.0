Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5233EC25B10
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 14:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0902080BAF;
	Sun,  5 May 2024 14:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJGwW2DF6soX; Sun,  5 May 2024 14:28:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D0A680BDF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D0A680BDF;
	Sun,  5 May 2024 14:28:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ADE181BF616
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 14:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B1E0400B8
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 14:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QhQOAUY5voPi for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 14:28:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B0F9400A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B0F9400A6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B0F9400A6
 for <buildroot@buildroot.org>; Sun,  5 May 2024 14:28:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 137B6FF807;
 Sun,  5 May 2024 14:28:40 +0000 (UTC)
Date: Sun, 5 May 2024 16:28:39 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240505162839.10ee98c9@windsurf>
In-Reply-To: <20240411173855.583816-1-fontaine.fabrice@gmail.com>
References: <20240411173855.583816-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714919320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M3VdHIshWNNk6Zi+cGF5UjxalcJ24xEr4Leb8HLsG5I=;
 b=pa5KSX4zA3lLdDk95gcaIFdrSZuHPRlk4TGJTyVEmpqHPdietl7+KERjQvxQZB2iiDKuij
 weYjO7SVBVdUKBxaSZ8LL6XEjcfhFBalfumsUI2g5y/fkYcrTun63wglJgagpWVVzssYty
 BdsLRt8Ln6VUV7Wru5dzGXaCrS1mAdwsohWS45mlLo3t9NEoyPxzXOfiIQGDuI2KIfdtAF
 QYHgcdRN7eRnNaVe0Z6XgTmKBoUb+nUp8Sf7PLYQvY5BeOCmJGAvp8p7+SAOiaBrpFLs5g
 qEwjIo9ssT41+cnHszHVtZXX5kkKUEsUyPiTjJP48uXoVNWErVa+d0OcC8XZNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pa5KSX4z
Subject: Re: [Buildroot] [PATCH 1/1] package/glog: needs gcc >= 6
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 11 Apr 2024 19:38:55 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> C++14 is mandatory since bump to version 0.7.0 in commit
> 2e9f161d4a7a68a041860e5855e98bee9d3a1498 and
> https://github.com/google/glog/commit/674283420118bb919f83ceb3d9dee31ef43ff3aa
> and
> https://github.com/google/glog/commit/42a185cd888439d500a35191cd31a605b7c5bd20
> resulting in the following build failure with gcc 5:
> 
> In file included from /home/buildroot/autobuild/run/instance-2/output-1/build/glog-0.7.0/src/demangle.cc:43:0:
> /home/buildroot/autobuild/run/instance-2/output-1/build/glog-0.7.0/src/utilities.h:210:22: error: enclosing class of constexpr non-static member function 'google::glog_internal_namespace_::FileDescriptor::operator bool() const' is not a literal type
>    constexpr explicit operator bool() const noexcept {
>                       ^
> 
> Fixes: 2e9f161d4a7a68a041860e5855e98bee9d3a1498
>  - http://autobuild.buildroot.org/results/8d5e105283ead1057545b46726385f4ba4dff29e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/glog/Config.in            | 6 ++++--
>  package/opencv4-contrib/Config.in | 4 ++++
>  2 files changed, 8 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
