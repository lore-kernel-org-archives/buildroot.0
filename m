Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331D3C3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB49B40204;
	Sat, 20 Jul 2024 21:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WkwAB2Jc84-J; Sat, 20 Jul 2024 21:05:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A650640281
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A650640281;
	Sat, 20 Jul 2024 21:05:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40D2F1BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C060740290
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:05:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iBClRZ-R_VMW for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:05:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A3AC402BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A3AC402BB
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A3AC402BB
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:05:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B52220003;
 Sat, 20 Jul 2024 21:05:01 +0000 (UTC)
Date: Sat, 20 Jul 2024 23:05:00 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240720230500.26fbd225@windsurf>
In-Reply-To: <20240720195505.1052184-1-fontaine.fabrice@gmail.com>
References: <20240720195505.1052184-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721509501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fY9NevdR69REC2HsBt94Nph/uaILVmYrUr5MsO9bAdo=;
 b=Lp+3a05pJoO654jV1Z9xJzYAkDa8dgXaoiXCQI8VOozRg/W5ADip6DLGZfVpgrHbswj06h
 47oDXNEF78AwIDm5y/QBEy70UoT9DeSlZNiZjYkI2L2uA7Cesf0BZYnY08FSBHxKDco8Kj
 uEQbSvuzLEkvPrft0+2hoLBX5k+OKdY2DLI84gMeuUqJBHbk46ueY/ATOMv/4ePrrJ2E4l
 PuNWERSjrVm41/7DwRtqiZzQdrFKUOgYmFDYlqldLsF+x39uWH1OpJ6hmMPK0IV/D9ZiGZ
 fl+b/wl/jvGijob4q4gU7JxkXA2ylZgu8HGZQ/XwxCVaD7OdxUzn0zmW50hsgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Lp+3a05p
Subject: Re: [Buildroot] [PATCH 1/1] package/zsh: fix build with gcc >= 14
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
Cc: Phil Eichinger <phil.eichinger@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 20 Jul 2024 21:55:05 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc >= 14:
> 
> termcap.c:45:14: error: conflicting types for 'boolcodes'; have 'char *[]'
>    45 | static char *boolcodes[] = {
>       |              ^~~~~~~~~
> In file included from ../../Src/zshterm.h:1,
>                  from ../../Src/zsh_system.h:932,
>                  from ../../Src/zsh.mdh:17,
>                  from termcap.mdh:17,
>                  from termcap.c:38:
> /home/autobuild/autobuild/instance-0/output-1/host/or1k-buildroot-linux-uclibc/sysroot/usr/include/term.h:764:56: note: previous declaration of 'boolcodes' with type 'const char * const[]'
>   764 | extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) boolcodes[];
>       |                                                        ^~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fe2f7170465e96cc1de3dae139a25f615331f4b9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...er-types-in-terminfo-global-variable.patch | 51 +++++++++++++++++++
>  package/zsh/zsh.mk                            |  2 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 package/zsh/0001-52383-Avoid-incompatible-pointer-types-in-terminfo-global-variable.patch

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
