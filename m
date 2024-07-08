Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46273C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17DB860A4E;
	Mon,  8 Jul 2024 20:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M9o09dFUii7i; Mon,  8 Jul 2024 20:23:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6684B60B8B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6684B60B8B;
	Mon,  8 Jul 2024 20:23:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C3621BF390
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16845812A8
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 387Ut-v44Okg for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:22:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F2DF28109E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2DF28109E
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F2DF28109E
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:22:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAAB51BF20C;
 Mon,  8 Jul 2024 20:22:19 +0000 (UTC)
Date: Mon, 8 Jul 2024 22:21:48 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240708222148.2e99f88d@windsurf>
In-Reply-To: <20240707121556.4039945-1-dario.binacchi@amarulasolutions.com>
References: <20240707121556.4039945-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720470140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GWnsaiTJv+nJVD6cWASCNDFv8m2fnhffw6xNJVp9Yc8=;
 b=Mf872Tf8VcXm98/7vV6XcKPNf/Hm+sdd+2twi6e/F3d9YAD7/a3C+ePUG82ZtxwzSzi4yi
 u6M3dAhsr86+SrNMtJpUdlzMh7y9GQ8CUiLVX1GrrB1oR2AOa+K2n9KDW1N1fXk43OqqjV
 OibhVmI7c5kRmdG8SeC+EHzhVYICkuCMi6KBUIwKDiMcL5YpCCGbT9TCnlYMkpb38GB7nH
 ZQSZta5J16zAfe4PFnZ2/4llnzbfotuVk8cljudWrJjX0RMS5Jf0cTEH60TjNhxMrSA1ZH
 T0y853rOtk4PmCNW6Ao7OZRWAEbK4nhFo3D9Y+QMFGwQ3lGbdjIyZRDnr0+LMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Mf872Tf8
Subject: Re: [Buildroot] [PATCH 1/1] package/vtun: update the patches to be
 applied with fuzz 0
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Jul 2024 14:15:56 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0") reduced the fuzz factor.
> 
> Due to this change, vtun fails to build with output:
> 
>     Applying 0002-fix-ssl-headers-checks.patch using patch:
>     patching file configure.in
>     Hunk #1 succeeded at 169 (offset 3 lines).
>     Hunk #2 succeeded at 179 (offset 3 lines).
>     Hunk #3 FAILED at 193.
>     Hunk #4 FAILED at 208.
>     2 out of 4 hunks FAILED -- saving rejects to file configure.in.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/vtun/0002-fix-ssl-headers-checks.patch | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

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
