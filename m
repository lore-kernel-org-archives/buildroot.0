Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10828C47088
	for <buildroot@archiver.kernel.org>; Sat,  3 Dec 2022 10:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98DE860AC4;
	Sat,  3 Dec 2022 10:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98DE860AC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nOeijf22jJEt; Sat,  3 Dec 2022 10:21:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B36D560A8B;
	Sat,  3 Dec 2022 10:21:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B36D560A8B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57E401BF831
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 10:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32AFC81E3D
 for <buildroot@lists.busybox.net>; Sat,  3 Dec 2022 10:21:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32AFC81E3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hEZ51mhTDx7Q for <buildroot@lists.busybox.net>;
 Sat,  3 Dec 2022 10:21:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44E9C81E3A
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44E9C81E3A
 for <buildroot@buildroot.org>; Sat,  3 Dec 2022 10:21:53 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 q17-20020a17090aa01100b002194cba32e9so10569112pjp.1
 for <buildroot@buildroot.org>; Sat, 03 Dec 2022 02:21:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kbgWHgl23i9b/RLdIQXr6Yr5/Cb7pgvii8m1i33cMjQ=;
 b=j6oSRGZfzffuGu/cEjvdveQWkWprjiPWiYLoFyFPm0f+IVgj1bFnNyH0Z6ZYfkbGTk
 ulsjIGHGIsLuDec7Z6oBqlBEFUNaojikhzmQdlN02V36vnTevl/BLzu7jNh63ADDjgyi
 by6NHsxwNE7CPkYX9b7wuRYTU94B4QEV3jCOvDaLWDQBy4+UlHLTY5ZnGTvaeSGDPvz8
 d6pA22rx5QUyrXVVr0UTb7PrFIvMsDmFTPF/xGFcooLyDYD3Gc6rcEmYCfIt6/cxmC+f
 j0WHQyWVv7Idwkib3BfUrqLvVGLnRA3gpPqYxHChnzeuoEZA7EHQlq4DF4JU2RIXsyYz
 etow==
X-Gm-Message-State: ANoB5pnkU1BIs/eiQ5mbkC+1VVDoMlSzZT1peRsNEGck+qEC9pyjwpLB
 /3EAFir5Wai8kMizEuozTnsQCOPNMZF5NW8oxivz1tbasgU=
X-Google-Smtp-Source: AA0mqf4j66VQWvERZA8jwLmFSW1rhExR/dwxdhTPMvSVrhbzvGwLbKNdMOAxQNPDICW/7lI9KMNvBUW6yHiHsNuvQOE=
X-Received: by 2002:a17:902:c115:b0:189:c9ac:7428 with SMTP id
 21-20020a170902c11500b00189c9ac7428mr1167849pli.159.1670062911764; Sat, 03
 Dec 2022 02:21:51 -0800 (PST)
MIME-Version: 1.0
References: <20221203101803.23169-1-heiko.thiery@gmail.com>
In-Reply-To: <20221203101803.23169-1-heiko.thiery@gmail.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 3 Dec 2022 11:21:39 +0100
Message-ID: <CAEyMn7asTUGpTOKCvt=Z9xpR3ODbBy6UTnc_xP_RTkFXGjM=Pw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kbgWHgl23i9b/RLdIQXr6Yr5/Cb7pgvii8m1i33cMjQ=;
 b=NeNmv0bFh+jSOa0YN4rxBv/noP7sFhYuoB61ln7lACAelWETus9BjBGtL9iK8o0ctc
 Du+tLxZAk95uxu0xTUukKkKVg/qe/f9DFyK4R5ybrIo+XOAoUBtd+/iTNl8Aywotkr/Z
 Q3MRAu/EJPVjUKboyB7Yga6N/jXDajj8PNp8mxOjVFjsdVWbITPgpGBxs924ASwmQfMI
 nJgjD8ZyGDc4UM7CQkyLle6EqF8+r5EJChASdEdI0Rln3nbwQA9dzDIUSLqDkszU77tD
 u/LRlFlU5ViVe+uoZytg6AoKEsoi1UfIfjgJwOFXK942JGkZsVtEHkIjelT6eikZljwQ
 PJmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NeNmv0bF
Subject: Re: [Buildroot] [PATCH] linuxptp: add patch to fix build failures
 with make 4.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Petr Kulhavy <brain@jikos.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

just realized that I forgot to add the "package/" prefix in the
subject line. Can this be changed before applying or should I resend
v2?

-- 
Heiko

Am Sa., 3. Dez. 2022 um 11:18 Uhr schrieb Heiko Thiery <heiko.thiery@gmail.com>:
>
> When using make 4.4 the KBOUD_OUTPUT environment variable provided to
> the linuxptp makefile is not utilized. The added patch will fix that
> behavior.
>
> Fixes: http://autobuild.buildroot.net/results/5294fac7ed04945d47ea4eb2d1448bcbea5352bb/
>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  ...itional-assignment-for-KBUILD_OUTPUT.patch | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch
>
> diff --git a/package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch b/package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch
> new file mode 100644
> index 0000000000..73cd34f744
> --- /dev/null
> +++ b/package/linuxptp/0002-makefile-use-conditional-assignment-for-KBUILD_OUTPUT.patch
> @@ -0,0 +1,43 @@
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Wed, 23 Nov 2022 08:23:46 +0800
> +Subject: [Linuxptp-devel] [PATCH] makefile: use conditional assignment for KBUILD_OUTPUT
> +
> +Refer [1],from make 4.4, all variables that are marked as export will
> +also be passed to the shell started by the shell function. use "=" will
> +make KBUILD_OUTPUT always empty for shell function, use "?=" to make
> +"export KBUILD_OUTPUT" in enrironment can work.
> +
> +[snip of 4.4 NEWS]
> +* WARNING: Backward-incompatibility!
> +   Previously makefile variables marked as export were not exported to commands
> +   started by the $(shell ...) function.  Now, all exported variables are
> +   exported to $(shell ...).
> +[snip]
> +
> +[1] https://git.savannah.gnu.org/cgit/make.git/tree/NEWS?h=4.4&id=ed493f6c9116cc217b99c2cfa6a95f15803235a2#n74
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +
> +[Retrieved from mailing list. The patch was not yet accepted and applied:
> +https://www.mail-archive.com/linuxptp-devel@lists.sourceforge.net/msg06151.html]
> +Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> +
> +---
> + makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/makefile b/makefile
> +index 9aed383..ba3fb38 100644
> +--- a/makefile
> ++++ b/makefile
> +@@ -15,7 +15,7 @@
> + # with this program; if not, write to the Free Software Foundation, Inc.,
> + # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +
> +-KBUILD_OUTPUT =
> ++KBUILD_OUTPUT ?=
> +
> + DEBUG =
> + CC    = $(CROSS_COMPILE)gcc
> +--
> +2.25.1
> --
> 2.20.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
