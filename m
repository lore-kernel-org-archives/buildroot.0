Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DE7C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 13:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13E0E80B39;
	Sun, 15 Sep 2024 13:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rBpr_f0Jx_3p; Sun, 15 Sep 2024 13:31:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 116E480B42
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 116E480B42;
	Sun, 15 Sep 2024 13:31:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B02EC1BF283
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 13:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E452403CF
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 13:31:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b07c05nlZry3 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 13:31:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E9B65403C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9B65403C9
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9B65403C9
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 13:31:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9AC460002;
 Sun, 15 Sep 2024 13:31:41 +0000 (UTC)
Date: Sun, 15 Sep 2024 15:31:40 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240915153140.3a94ac39@windsurf>
In-Reply-To: <20240726092042.1273023-1-fontaine.fabrice@gmail.com>
References: <20240726092042.1273023-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1726407102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/fcAkEde29H912uxBFacigLaO9VCYSk50shS7WDAWVA=;
 b=hOLFkfB2eA6ATH56Lc60A+cSyCmPlqFvAuMnmlSCWUDCgyuF/CHHTDaWMeLrOVGWqN6Mb0
 p8Ow39gji0qLMVlLVt7uVHZC+auS6331fuSwdN8HzrG8gNrTYBlWESBthIn82pRNV/YANx
 uONc4sjLNj3OVo2RbhNDPkVBhQe+aBEO+BDAvS0ectfQn3qVOnbG3JrdxYVKbwKPkfXDON
 nQuEwX1N6ZSmgb3N2Xvh7rPQ+cqPqJMAxyea0m72vZZz63sej30jHqdpliQZ6Vhe1deHjw
 bj2Uqnc0ILqK9t+fJe+ILYwgc46OgAC3NCg6DniNcdJV6K9N1uOWQ1sHcjDGOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hOLFkfB2
Subject: Re: [Buildroot] [PATCH 1/1] package/lrzsz: bump to latest git commit
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

Hello Fabrice,

On Fri, 26 Jul 2024 11:20:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Switch to github to get latest code
> - LRZSZ_POST_EXTRACT_HOOKS must be added to remove wrong links on
>   /usr/share/automake-1.16/config.{guess,sub} which were added by
>   https://github.com/UweOhse/lrzsz/commit/f02af40d15bade4c07e057f4b3baccd341b692b6
> - timesync dropped by
>   https://github.com/UweOhse/lrzsz/commit/6322e4944c11373eeadc346e838351874b7d799f
> - This bump will also fix the following build failure with gcc >= 14:
> 
>   configure:1011:1: error: return type defaults to 'int' [-Wimplicit-int]
>    1011 | main(){return(0);}
>         | ^~~~
> 
>   [...]
> 
>   configure: error: installation or configuration problem: C compiler cannot create executables.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/076db37c936786291028b770ef2f83cd39f87ef3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-lib-long-options-c-include-stdlib-h.patch | 41 +++++++++++++++++++
>  .../0002-configure.ac-check-locale.h.patch    | 31 ++++++++++++++
>  package/lrzsz/lrzsz.hash                      |  2 +-
>  package/lrzsz/lrzsz.mk                        | 13 ++++--
>  4 files changed, 83 insertions(+), 4 deletions(-)
>  create mode 100644 package/lrzsz/0001-lib-long-options-c-include-stdlib-h.patch
>  create mode 100644 package/lrzsz/0002-configure.ac-check-locale.h.patch

You provided no feedback to my questions asked in July, so I looked
again into this. Looking more, the maintainer on its Github repo says:

========================================================================

NOTE:

Do not use the repository until further notice.
It contains work in progress and at least one change i am unhappy with.

Use either http://ohse.de/uwe/testing/lrzsz-0.12.21rc.tar.gz (over 20
years in rc state, so it's good enough), or 0.12.20 from 
https://ohse.de/uwe/software/lrzsz.html (do not expect me to update 
that old site ever again).

========================================================================

So instead, I sent a small patch that doesn't bump the version, but
fixes the GCC >= 14.x issues:
https://patchwork.ozlabs.org/project/buildroot/patch/20240915132735.862622-1-thomas.petazzoni@bootlin.com/.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
