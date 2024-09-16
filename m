Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6707BC3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 10:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34D436086C;
	Mon, 16 Sep 2024 10:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UsKwedtqJ85V; Mon, 16 Sep 2024 10:25:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CE7360A54
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CE7360A54;
	Mon, 16 Sep 2024 10:25:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 60AD21BF5A4
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C29140B07
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 20DhqI5m9h0A for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 10:25:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E8AA440386
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8AA440386
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8AA440386
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 10:25:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.117.145])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A1CA8B00548;
 Mon, 16 Sep 2024 12:25:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Sep 2024 12:25:03 +0200
Date: Mon, 16 Sep 2024 12:25:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZugHf9sLvzw7Qv0x@landeda>
References: <20240914203740.1089249-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240914203740.1089249-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726482312;
 bh=jeBv0iPul1LhWiwu5DMaYEbrEqvK1E/n1lBPYD71ufI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H1fcptGf2fM9bc8HJNis9fRxWEbe1zqjK/DSCDheebngxheKU/Tu1yv602oaBxCIp
 7P9eFLOrDZ72j6SAkQtiTGwfX7YSeS704MDJubWugsbZ3lkOfV+be6GC5GXt4snNrm
 rRqU2MrrP2MAfSfimoDdL8vb9ihHT2uijBj4mfbmwZ9zgXb5GTJTwtberzUQ6EsWxd
 sdrWyRK+g5i11+OhXvOeYp3lAjV4fOsI+5uSYPabAsLuP0sE2zr83oj+GBD2XiLehz
 MIakOg5Ycl+mLSXEjimaQJOcXvjK+TIx+4kr4pCfe6T32fS/fnlY6GxbLhA0wsluIp
 SEnHDKYSnQ3rA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=H1fcptGf
Subject: Re: [Buildroot] [PATCH v4 1/3] package/python-numpy: bump to
 version 1.26.4
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
 Jagan Teki <jagan@amarulasolutions.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2024-09-14 14:37 -0600, James Hilliard spake thusly:
> License hash changed due to date update:
> https://github.com/numpy/numpy/commit/c1ffdbc0c29d48ece717acb5bfbf811c935b41f6
> 
> We need to build python-numpy with its vendored version of meson as
> it currently relies on features that are not yet upstream. To do this
> we can simply set the PYTHONPATH with the vendored meson path before
> the normal PYTHON3_PATH so that the vendored version will have
> precedence. We need to set this for both host and target numpy.
> 
> We also need to set the architecture specific longdouble_format
> property as numpy is unable to determine the value for this without
> being able to execute target binaries.
> 
> See:
> https://github.com/numpy/numpy/blob/3e7e5c3cabb8f1a0d940dc6f2058fed4a8c3e284/doc/source/building/cross_compilation.rst
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[--SNIP--]
> +ifeq ($(BR2_arcle),y)
> +PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_LE
> +else ifeq ($(BR2_arceb),y)
> +PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
> +else ifeq ($(BR2_aarch64),y)
> +PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_LE
> +else ifeq ($(BR2_arm),y)
> +PYTHON_NUMPY_LONGDOUBLE_FORMAT = INTEL_EXTENDED_12_BYTES_LE
> +else ifeq ($(BR2_armeb),y)
> +PYTHON_NUMPY_LONGDOUBLE_FORMAT = MOTOROLA_EXTENDED_12_BYTES_BE
> +else ifeq ($(BR2_i386),y)
> +PYTHON_NUMPY_LONGDOUBLE_FORMAT = INTEL_EXTENDED_12_BYTES_LE
> +else ifeq ($(BR2_mips),y)
> +PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
> +else ifeq ($(BR2_mipsel),y)
> +PYTHON_NUMPY_LONGDOUBLE_FORMAT = INTEL_EXTENDED_12_BYTES_LE
> +else ifeq ($(BR2_powerpc),y)
> +PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_BE
> +else ifeq ($(BR2_powerpc64),y)
> +PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_BE
> +else ifeq ($(BR2_sh),y)
> +PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_LE
> +else ifeq ($(BR2_x86_64),y)
> +PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_LE
> +endif

You missed the riscv case, added in commit a0b8ca1c214
(package/python-numpy: enable on RISC-V).

How did you establish that list? Where are those settings defined?

Regards,
Yann E. MORIN.

> +PYTHON_NUMPY_MESON_EXTRA_PROPERTIES = \
> +	longdouble_format='$(PYTHON_NUMPY_LONGDOUBLE_FORMAT)'
> +
> +HOST_PYTHON_NUMPY_CONF_ENV += \
> +	PYTHONPATH="$(@D)/vendored-meson/meson:$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
> +
> +HOST_PYTHON_NUMPY_NINJA_ENV += \
> +	PYTHONPATH="$(@D)/vendored-meson/meson:$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
> +
>  # Rather than add a host-blas or host-lapack dependencies, just use unoptimized,
>  # in-tree code.
>  HOST_PYTHON_NUMPY_CONF_OPTS = -Dblas="" -Dlapack=""
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
