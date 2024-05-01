Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D6EC10F1A
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1B0F81A34;
	Wed,  1 May 2024 19:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JX9dMviujrG9; Wed,  1 May 2024 19:33:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD29B81EFB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD29B81EFB;
	Wed,  1 May 2024 19:33:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB0971BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D53CE40181
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FNs5HHrFGJ5z for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:33:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D63F40132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D63F40132
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D63F40132
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:33:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3D8E60008;
 Wed,  1 May 2024 19:33:32 +0000 (UTC)
Date: Wed, 1 May 2024 21:33:31 +0200
To: Nasser Afshin <afshin.nasser@gmail.com>
Message-ID: <20240501213331.48643919@windsurf>
In-Reply-To: <20240401192629.932481-1-afshin.nasser@gmail.com>
References: <20240401192629.932481-1-afshin.nasser@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714592013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+h0sQguIdGxwyLxJ63ufCZgSTxcXj1GpgSUoQnfaiPM=;
 b=A/+d8/lQ6lOGoRIbcCX6ej+JhNWTTEYGQshV2+fmtMIDAEfmY6OFD05bjKjazieawHIKAb
 Utid2os75Y6hAZO7l4ODdPT9OlAfQ2OdOmNkpFT9KEVaM+MZifEH+/n2uOlVTnPQEaDjI/
 MqMrN7o0fvK6FRQGlvaEuyrNzBSFOtTycFKKD5CFPFQj826SvewgLe604sskfwbPqoFfsk
 C8x8fETi3D/V8MfDyulJ+xbdBXiDTDOajdu4UNZ7vSAOljgVGPYHMCKez0Nr3BIXDgiTwT
 ZEcdhSr3iPwxzysxmWhyTOPkKJjkMaUld/0dhy7QKAU24a1a48nPXLY1+kWajA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=A/+d8/lQ
Subject: Re: [Buildroot] [PATCH] package/python-pycrate: bump to version
 0.7.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Nasser,

On Mon,  1 Apr 2024 22:56:29 +0330
Nasser Afshin <afshin.nasser@gmail.com> wrote:

> Signed-off-by: Nasser Afshin <afshin.nasser@gmail.com>

Thanks for the patch. However, your empty commit log really wasn't
enough. It's not just a version bump, it does a number of other changes
that should have been explained in the commit log. So I've expanded it
as such:

    The license.txt file is now part of the release tarball, so it is no
    longer needed to download it separately, and re-add it to the source
    tree.
    
    The https://github.com/P1sec/pycrate/ repository has been archived, so
    use the new official location, as referenced by
    https://pypi.org/project/pycrate/.

> -PYTHON_PYCRATE_LICENSE = LGPL-2.1+
> +PYTHON_PYCRATE_LICENSE = LGPL-2.1

This change looked incorrect to me. Files I've looked at in the tree do
have the (or later) statement, so I kept LGPL-2.1+. If you have a good
justification for this change, could you submit a patch with a
non-empty commit log giving some explanation?

Applied to master with those changes, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
