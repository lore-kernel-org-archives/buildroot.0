Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7629EC67861
	for <buildroot@archiver.kernel.org>; Fri,  5 Apr 2024 08:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2220C409DF;
	Fri,  5 Apr 2024 08:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reOQqNaMEXXE; Fri,  5 Apr 2024 08:12:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D97EE40AB9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D97EE40AB9;
	Fri,  5 Apr 2024 08:12:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F65A1BF27A
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 08:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1947E8217D
 for <buildroot@lists.busybox.net>; Fri,  5 Apr 2024 08:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gLfOTL2NEZR for <buildroot@lists.busybox.net>;
 Fri,  5 Apr 2024 08:12:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9182082175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9182082175
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9182082175
 for <buildroot@buildroot.org>; Fri,  5 Apr 2024 08:12:54 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id D63FDC049A
 for <buildroot@buildroot.org>; Fri,  5 Apr 2024 08:12:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD4DDFF80B;
 Fri,  5 Apr 2024 08:12:44 +0000 (UTC)
Date: Fri, 5 Apr 2024 10:12:43 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240405101243.58a8281f@booty>
In-Reply-To: <20240404211228.1979139-1-fontaine.fabrice@gmail.com>
References: <20240404211228.1979139-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712304765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0GwHh6T7v/D9API4OpxdYqcaAN68iAdBQeRHqR8M2FE=;
 b=g0a6sIr9/13/71TJq7iWBzGCaUfLmvcs57WSwmuI3XkzlJgUBSvaGMY4LlRU6w5qzefUPh
 tKouCvJeAkZXYE+8wfE1WzBX4ZgsJgujoTkzTzJwOQIzTAAakJmYzn2O/JSXQohpOINc+3
 aCBGVgHLu+7ssSPhM21ifvPH0GuJU5ICIOfahdK/igx0pK/ohudrOEEcYAi6sOfqPEGBBA
 oRacUEYVS+or0LSTDIaWEizYZahLh5LaW8HZsnoU0aY0/u94fiZe16bp5wH5MZGU6FLKB6
 EaeLZjJ7AN/kVtRmNo1j7McemmF8NJz8AcY6lBaGhsMXvkyMMue6tohEQ6HawA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=g0a6sIr9
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: add libxcrypt optional
 dependency
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On Thu,  4 Apr 2024 23:12:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump of glibc to version
> 2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:
> 
> crypt16.c:45:10: fatal error: crypt.h: No such file or directory
>    45 | #include <crypt.h>
>       |          ^~~~~~~~~
> 
> Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
>  - http://autobuild.buildroot.org/results/3c846c763a05f2569db7a019af8b91b0563c8f42
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thank you for the fix. Indeed libxcrypt was removed from glibc 2.39:
https://lists.gnu.org/archive/html/info-gnu/2024-01/msg00017.html

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
