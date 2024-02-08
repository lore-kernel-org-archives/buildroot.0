Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB05C48260
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 08:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 629C84258F;
	Thu,  8 Feb 2024 08:01:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EPGbK8CmNml3; Thu,  8 Feb 2024 08:01:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73D784268A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73D784268A;
	Thu,  8 Feb 2024 08:01:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 280B51BF476
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 08:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1320A41B01
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 08:01:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id POQAETZHgvlu for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 08:01:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 12B1441ADE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12B1441ADE
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12B1441ADE
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 08:01:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2E40224000E;
 Thu,  8 Feb 2024 08:01:21 +0000 (UTC)
Date: Thu, 8 Feb 2024 09:01:20 +0100
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240208090120.4d886b8c@windsurf>
In-Reply-To: <20240208074901.1654224-1-roy.kollen.svendsen@akersolutions.com>
References: <20240208074901.1654224-1-roy.kollen.svendsen@akersolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707379281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LFhWP1KACet/M+nNO06FnLOXjOwYmfhpWEoPcOrtFxw=;
 b=GmuM5HMgRwEvQ1aGzFn3JnVqLzE+zKRIzH7VithuoIo0KtfGhGdlapezgcSB18EnmzXJgu
 HWH182rY6cGqpLnIwhSsV20LNvux5gCvqIjD/wOgnAq2UeuPijXvU/2yYoirEtDLU8m9tA
 9UWRDTAdEGAHgWdbetAciXYYzlm7yRNgeaK6Q86XHufgDtWgIkYAN8YOTY14JFUcMfgYyH
 S4Rv0KGk+TyOvcqboZRrYkE3iIbQ5YtYTR19X4BXhqUp/PtqVQlrMQ1uuKJE54Yz+qxyGV
 QpsrLg5t5Nb7VT6piAED/kdXrroc6U7Nf1Hkr8U1ueUNeZon/wGzBr1ZvS1r3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GmuM5HMg
Subject: Re: [Buildroot] [PATCH] package/python3: fix install
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roy,

On Thu,  8 Feb 2024 08:49:00 +0100
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 42765abcf4..81d9a904c7 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -34,6 +34,7 @@ HOST_PYTHON3_CONF_OPTS += \
>  HOST_PYTHON3_CONF_ENV += \
>  	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags" \
>  	py_cv_module_nis=n/a \
> +	py_cv_module__tkinter=n/a \
>  	py_cv_module_unicodedata=yes \
>  	py_cv_module__codecs_cn=n/a \
>  	py_cv_module__codecs_hk=n/a \

Thanks a lot for your patch! However, in order to be consistent with
how we do it with ncurses, sqlite, etc, I think it is the --disable-tk
option that should automatically set py_cv_module__tkinter=n/a.

+AC_SUBST(TK)
+AC_ARG_ENABLE(tk,
+       AS_HELP_STRING([--disable-tk], [disable tk]),
+       [ TK="${enableval}" ], [ TK=yes ])

should be followed by something like

AS_IF([test "${enable_tk}" = "no"], [PY_STDLIB_MOD_SET_NA([_tkinter])])

something like this (in
package/python3/0012-Add-an-option-to-disable-the-tk-module.patch).

Or, we need to turn around how things are done, and instead of adding
those --enable/--disable, look at whether py_cv_module_<foo> is passed
to appropriately disable things. Might be more upstreamable (but I
thought about this idea *after* redoing the 3.12 patches).

That said, the 3.12 bump is for now causing quite a few issues, so it
is not impossible that we revert it before the 2024.02 release.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
