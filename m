Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10234FA3741
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 13:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C47A080F49;
	Fri,  2 Jan 2026 13:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FmJTTe4zBLjp; Fri,  2 Jan 2026 13:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C529580F4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767362274;
	bh=JVBUN5t79XeONtcJ+XDp251Uf0uku5tfY+m88Bi5Mms=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hfFy9WBDkflVlf1FEOH8AiLMjZBs404ZjFeNLmyYdt7JhHpVxjNF2i/0uHzgdMvRe
	 19zvtP0Fdz9V5SjvcwQ5wF0d8+JKkyqesOrnZk4zIcwuVAp+HI70bDCdYElptTBP39
	 DqJVflE6T0I7L4g2UkISPg+jwKbv6B/b97sLKimd082rKCii1JA9mlt+M4pIaRtKin
	 A/MexcmEuzpK68OCDMnZ0WfDb+ug6S1lTLEPJwvGyVEU4veylTqsOSHd1FVzDzIwtI
	 +i0GxBytUZLQhKEglgZVSGAwWI0AcJynAQfLqdHuR+ZKFz2xhUjrh4q8gUdIrMQ7mL
	 KYHve1RRaA1Qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C529580F4F;
	Fri,  2 Jan 2026 13:57:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DC15A351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 13:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDC4A403EF
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 13:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJmk4EWmmc0U for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 13:57:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A85D040182
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A85D040182
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A85D040182
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 13:57:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E87B619F574;
 Fri,  2 Jan 2026 14:57:41 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 02 Jan 2026 14:57:41 +0100
MIME-Version: 1.0
Date: Fri, 02 Jan 2026 14:57:41 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Guillaume William Brs
 <guillaume.bressaix@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>
In-Reply-To: <20260101180843.247730-2-bernd@kuhls.net>
References: <20260101180843.247730-1-bernd@kuhls.net>
 <20260101180843.247730-2-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <fd785e968bf226c8f82897dc4e651d2a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767362270;
 bh=JF29moaG2diRBVg7UtNK1RrkokqLr/A9L7mBe1f0kZ0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FnOYAdF0eFZnwYYB3fhqKPUJyav5yX5YrtnE5jN6iAcR52agPNqLYN1ItYQKN7n4E
 NQMXTpZdfsSOa37ikz7GpoN8okMW8PIZNeUpb3TbYomTDwUdUeIMOvZ7NCH6YARAGM
 axTl1INHYeIf3xJk905FQlY3tZ9IRUWYHdTGvEnmUPcULEi6oM1QNPhI9nIRrPbbIM
 kKOh2lS9ZQclqVdWtsn7GFKGguOzfTt/IpmDohtXiQ84LwYHD+N9uX4FvFLKRfvXjm
 JVbCankgyqlcl+Dx5k2kt5dLBQML4wUJmI7c6BTgzCp30lFID35iVQonrIW7Y9P/+H
 XVaO/59luy8/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FnOYAdF0
Subject: Re: [Buildroot] [PATCH 1/6] package/python-numpy: bump version to
 2.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Thanks for the patch.

On 01/01/2026 19:08, Bernd Kuhls wrote:
> From: James Hilliard <james.hilliard1@gmail.com>
> 
> Release notes: https://numpy.org/news/
> 
> Add new supported architectures.
> 
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
> [Bernd:
>  Bumped to 2.4.0
> 
>  Removed patch which is included in this release.
> 
>  Updated license hashes due to upstream commits:
>  - copyright year bumps:
>    https://github.com/numpy/numpy/commits/v2.4.0/LICENSE.txt
>  - file move
>    tools/npy_tempita/license.txt -> 
> numpy/_build_utils/tempita/LICENSE.txt
>    
> https://github.com/numpy/numpy/commit/63a1fee8d1c1e442aa8ca08ac7cefb195f99b2a9
>    
> https://github.com/numpy/numpy/commit/86940987a9d8d54c860d8c862d5d96c51b339f23
>  - directory move core -> _core and various code updates
>    
> https://github.com/numpy/numpy/commits/v2.4.0/numpy/_core/src/multiarray/dragon4.c
>  - directory move core -> _core
>    
> https://github.com/numpy/numpy/commits/v2.4.0/numpy/_core/include/numpy/libdivide/LICENSE.txt
> 
>  Following Romain's review
>  
> https://lists.buildroot.org/pipermail/buildroot/2024-November/767739.html
>  host-python-numpy was switched back to host-python-package to install 
> the
>  f2py script needed by the upcoming bump of python-scipy. A dependency 
> to
>  host-python-meson-python is also needed.
> 
>  Changed path in PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES following
>  upstream commit
>  
> https://github.com/numpy/numpy/commit/923f219077c8aa3ad7d3792d8c06cba010b70252
>  and updated opencv4 as well]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[...]
> diff --git a/package/python-numpy/python-numpy.mk 
> b/package/python-numpy/python-numpy.mk
> index 200fac20a1..1b20a98b3d 100644
> --- a/package/python-numpy/python-numpy.mk
> +++ b/package/python-numpy/python-numpy.mk
[...]
> @@ -38,6 +41,61 @@ else
>  PYTHON_NUMPY_CONF_OPTS += -Dblas=""
>  endif
> 
> +# Generated by running this test program under QEMU:
> +# 
> https://github.com/numpy/numpy/blob/v1.26.4/numpy/core/meson.build#L376-L455
> +ifeq ($(BR2_arcle),y)
> +PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_LE
> +else ifeq ($(BR2_arceb),y)

The script "utils/check-symbols" reports the error here:
package/python-numpy/python-numpy.mk:48: BR2_arceb is a legacy symbol 
and should not be referenced

This symbol  was removed in:
https://gitlab.com/buildroot.org/buildroot/-/commit/2d570f8369342590836378e86e3d2a65f7fb6fc3

> +PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
> +else ifeq ($(BR2_aarch64),y)

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
