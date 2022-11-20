Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EC1C4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 18:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 153CE401FC;
	Sun, 20 Nov 2022 18:38:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 153CE401FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hla8eX-PBMgH; Sun, 20 Nov 2022 18:38:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D383D401B1;
	Sun, 20 Nov 2022 18:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D383D401B1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 928B81BF38A
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 18:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D65B60BF2
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 18:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D65B60BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EXEsOd1JJ9XL for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 18:38:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6167660BEF
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6167660BEF
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 18:38:13 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 w15-20020a17090a380f00b0021873113cb4so8993380pjb.0
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 10:38:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/n+vM7nqc4mCWCjRrhIkDoM33wI357QVXQUkJ3Wm49I=;
 b=3szHYOf4MiObE+4VyB6MlXBNLrBU9Ng8zTpeQVDygyG1j4wAcN9abhfBpPJzQMfQ/k
 cBFSbs0AHQFD0cHHxfl13V2hihNpFGrrSVfB8xyXAvN5WKWHp+5DyJzI7PF6DmLnnbpL
 DPARW8VvyM6wHSyzJsqPz22ISNETP4K1ew1RPSQvnVMsi5JHe5TvdFIyp+82c3wJXvUe
 dQRt66M3afVaSMoPwhchF/9pnBwU2SMOA7at7dzPg4mLqOvxvKRDRA7Ynv1s45Rr5Or7
 lwEoxRF9bz2cfQq2/884FaIIn9EvmoMx64u2OqN4Knr75w3/Ynqa/FFzQ0Y4uQJeGaXd
 3coA==
X-Gm-Message-State: ANoB5pmeCa8RzKFOMZ2Lsf6wX2S4FnhZ3ZaIBALsp0Je3X8DAv6DsLq8
 y3g6t2Oy/Dy8f+H5MiX4K75exbmCEa1/hEV8v1E=
X-Google-Smtp-Source: AA0mqf56ElGdP7t41vCRUhlgMo+MJVnZRWhLwVt9fhxjCEkFok4+Nh/Shoc9uPiSnZ6zGr99W8TGBNdPaHrdi8egWlA=
X-Received: by 2002:a17:903:22c4:b0:184:cb7e:ba36 with SMTP id
 y4-20020a17090322c400b00184cb7eba36mr8478735plg.57.1668969492706; Sun, 20 Nov
 2022 10:38:12 -0800 (PST)
MIME-Version: 1.0
References: <20221117194505.949846-1-giulio.benetti@benettiengineering.com>
In-Reply-To: <20221117194505.949846-1-giulio.benetti@benettiengineering.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 20 Nov 2022 14:38:00 -0400
Message-ID: <CADvTj4ruehTwH+aT-khto5xPjhoF5-jdYVx_z6H+5kHgWHSyGw@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/n+vM7nqc4mCWCjRrhIkDoM33wI357QVXQUkJ3Wm49I=;
 b=m+XqVgL9VhyMUTT8rR9RhigUa6RNksuFu9gxpbDcPpQCdHb8md6tq4jRTXemPBHqpg
 EIY27UU6UNkMAuP1gj0IqbtOI0I+/r3A3mkkBSyG9JF1JIzo4mih6cS/E7Ed3lLV7py3
 gwyjWFD2nULfMiTXB3Ja4V/+rl2r8y9HFN7OzrY6GvROe1AnEA8b+Wv4A1PMS4PwmK8H
 URHTS/uLIx9Hx/EtiWlHtcBLtCkgmsyoJzClGWxEdINLPJsUkVKhlxNZU36hkA/b6uCi
 JoIdiLkdAJE7mj+POhcBXo42uhXxc9D/4yRutdWMGIEHd5kxoaGsUlUwpX9m7wkKunDh
 5LfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=m+XqVgL9
Subject: Re: [Buildroot] [PATCH] package/libnss: fix build failure with make
 4.3.91
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Nov 17, 2022 at 3:45 PM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
> Make 4.3.91 doesn't allow to safely override Simple Expanded Variables, so
> let's add a patch pending upstream[0] to make those variable Conditional
> Expanded.
>
> [0]: https://bugzilla.mozilla.org/show_bug.cgi?id=1801182
>
> Fixes:
> http://autobuild.buildroot.net/results/1074143dbea60567cd83be0a23f7c0214d470de9/
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Tested-by: James Hilliard <james.hilliard1@gmail.com>

> ---
>  ...w-overriding-OS_ARCH-OS_TEST-and-OS_.patch | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch
>
> diff --git a/package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch b/package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch
> new file mode 100644
> index 0000000000..7b3abea307
> --- /dev/null
> +++ b/package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch
> @@ -0,0 +1,45 @@
> +From a1a5f3afea2ee59bdbb7a74eb2d7f82b635dbd1a Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Thu, 17 Nov 2022 20:38:48 +0100
> +Subject: [PATCH] Bug 1801182 - Allow overriding OS_ARCH, OS_TEST and
> + OS_RELEASE in Makefile
> +
> +Starting from Make 4.3.91 simple expanded variables can't be safely
> +overriden via command line anymore, so let's use conditional expanded
> +variables to override OS_ARCH, OS_TEST and OS_RELEASE.
> +
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +[Upstream status: https://bugzilla.mozilla.org/show_bug.cgi?id=1801182]
> +---
> + nss/coreconf/arch.mk | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/nss/coreconf/arch.mk b/nss/coreconf/arch.mk
> +index 17e9faeac..85aac9341 100644
> +--- a/nss/coreconf/arch.mk
> ++++ b/nss/coreconf/arch.mk
> +@@ -20,17 +20,17 @@
> + # Macros for getting the OS architecture
> + #
> +
> +-OS_ARCH := $(subst /,_,$(shell uname -s))
> ++OS_ARCH ?= $(subst /,_,$(shell uname -s))
> +
> + #
> + # Attempt to differentiate between sparc and x86 Solaris
> + #
> +
> +-OS_TEST := $(shell uname -m)
> ++OS_TEST ?= $(shell uname -m)
> + ifeq ($(OS_TEST),i86pc)
> +-    OS_RELEASE := $(shell uname -r)_$(OS_TEST)
> ++    OS_RELEASE ?= $(shell uname -r)_$(OS_TEST)
> + else
> +-    OS_RELEASE := $(shell uname -r)
> ++    OS_RELEASE ?= $(shell uname -r)
> + endif
> +
> +
> +--
> +2.34.1
> +
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
