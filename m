Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EC7C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 21:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67D6460035;
	Tue, 23 Jul 2024 21:15:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id el_UsfZAuYeQ; Tue, 23 Jul 2024 21:15:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50525607A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50525607A5;
	Tue, 23 Jul 2024 21:15:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 41E5A1BF2F9
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EA1180B06
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id or6eX9nB18zX for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 21:15:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EDD53805AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDD53805AB
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDD53805AB
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 21:15:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F3D1240002;
 Tue, 23 Jul 2024 21:15:15 +0000 (UTC)
Date: Tue, 23 Jul 2024 23:15:14 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240723231514.0c81f86a@windsurf>
In-Reply-To: <20240723120140.176562-1-fontaine.fabrice@gmail.com>
References: <20240723120140.176562-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721769316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YbXbiEXUp8/GUHY0ADpKp4kbElC2Gf3WiPFWSPZe2uA=;
 b=p4jfGXw8ea2TfXFwpCCh/sKlH6NjLKyvMSaPUShpzeuPjMkdq+HHDrORBVTOq9u0Z7YDNz
 qVsWFVLlDh06BEqk0QdBSJ9Zd+N4pI//CUS70V51bAVFG8a0Oxm6PlsowGC2pYtpFTJPIK
 +kEHYBBYPj9cOs9bfagsqrdrpnLvpueSJSU65xpvubiGMa4eqbgxvDmzGU/f9/TP4nYtNp
 TF2FqBw6t1k3NNesf+LaRY1nQzlFqO4bgPfz2RCh7zOq5I8dMVDT9AQ/JV+dqsYHOnhinR
 DKr7AuBjhTHG4EWOdxsuu5rhseMadH5K1itk0lBy+/LBjllXTuMlmEpBYFoM8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=p4jfGXw8
Subject: Re: [Buildroot] [PATCH 1/1] package/procps-ng: bump to version 4.0.4
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 23 Jul 2024 14:01:40 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop all patches (already in version) and so also drop autoreconf
> - This bump will also fix the following build failure with gcc >= 14:
> 
>   pgrep.c: In function 'main':
>   pgrep.c:1066:37: error: implicit declaration of function 'pidfd_open'; did you mean 'fdopen'? [-Wimplicit-function-declaration]
>    1066 |                         int pidfd = pidfd_open(procs[i].num, 0);
>         |                                     ^~~~~~~~~~
>         |                                     fdopen
> 
> https://gitlab.com/procps-ng/procps/-/blob/v4.0.4/NEWS
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/bd7b49123905c580842a3dd3b7a338d5aedf55d7
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                           |  3 -
>  .../0001-configure-Add--disable-w.patch       | 93 -------------------
>  ...ssing-nl_langinfo-on-certain-configs.patch | 34 -------
>  .../procps-ng/0003-fix-pifd_open-check.patch  | 59 ------------
>  package/procps-ng/procps-ng.hash              |  8 +-
>  package/procps-ng/procps-ng.mk                |  4 +-
>  6 files changed, 5 insertions(+), 196 deletions(-)
>  delete mode 100644 package/procps-ng/0001-configure-Add--disable-w.patch
>  delete mode 100644 package/procps-ng/0002-escape-c-Fix-missing-nl_langinfo-on-certain-configs.patch
>  delete mode 100644 package/procps-ng/0003-fix-pifd_open-check.patch

Applied to master after tweaking the commit title and commit log to
mention that it's also a security bump. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
