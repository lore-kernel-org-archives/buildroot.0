Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49F0C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 15:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C87C84BCD;
	Sat, 23 Jul 2022 15:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C87C84BCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9XK5rPmeshSV; Sat, 23 Jul 2022 15:25:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D37E84BC7;
	Sat, 23 Jul 2022 15:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D37E84BC7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12F211BF46A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E774242418
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E774242418
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4P3eQvBTav1T for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 15:24:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A5014240F
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A5014240F
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:24:58 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id v5so4351714wmj.0
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 08:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lRWfTaEkC5Vp65ck1GuXQa/43VJTPQZ/SqmkvtSTCt8=;
 b=2IakGN19Jf2fuNMC2qbhNH8rK8CNuOUCfY1yUgGLdJ+T8kcNKdfKbCYr7BwWVFsTJB
 hNxLtfkxu/cPrl5Z4+rfKMu6rGOuLODZLwqu+ZkGu5FIogcR9Ptz7y476xouDGE+vXXD
 flt+YwZUMIdWHDPxS+NbkllmDKz+FdzwUJ3PbueJHZpVU3pBBhivkQ51lPd2/PYboidR
 n164YjfH+Sy4JYeaVrM+JX3e25W2zG02mxgdW9saC/wQpE1Blap3JJWZlgmeCZhfstmk
 X8MN3D082wLnOuU/XUaU92namxj+zlzi7puC8qxw6zrpxBYxmn7ju5P6899/OUgbU7p+
 gIUg==
X-Gm-Message-State: AJIora9+KE1M9q+6+LMeEZc6/nfRwHe6EdGr5iG/4ruTXIAobknXZOJe
 XfxIk/xwyjaNkHAV44OA4Cu/VQ==
X-Google-Smtp-Source: AGRyM1u/yU30WSUYIcd8aonIpQ5m2wdgOHtEh4B3eNO55sTSFJTTZWgY+sGMLjwE3//lmV4KsMXsZA==
X-Received: by 2002:a05:600c:a42:b0:39c:9166:5a55 with SMTP id
 c2-20020a05600c0a4200b0039c91665a55mr3141621wmq.141.1658589896829; 
 Sat, 23 Jul 2022 08:24:56 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 z17-20020adff751000000b0021d6e14a9ccsm7416688wrp.16.2022.07.23.08.24.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 08:24:56 -0700 (PDT)
Message-ID: <504133a2-2a71-1833-4346-119939e2fa03@mind.be>
Date: Sat, 23 Jul 2022 17:24:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1658581474.git.yann.morin.1998@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <cover.1658581474.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lRWfTaEkC5Vp65ck1GuXQa/43VJTPQZ/SqmkvtSTCt8=;
 b=GfpWy/Key2yo92UrhhydzvgUydrp/DWg4y0MBF3FINFT6bVLJDg5PDfeYfNwLN31LX
 uSMfJnBonTsQUwazhqbsVXevwdCgFrKMInXjeCuuqlFhC18+9ZzqCBMaVdX5jnt+UBqe
 Quuxb3M5v7MwwhCZeq/vHcV+HaT1qdHl66U2zvgS0u9vRaZVzoR0G7dt99t/9fAU1I1T
 4zGTrOz2KEHfYNYJ6sd9UHVpISVwff+HDzj07qWp9fKnnFtxEMG82gWbCnLYXvpKQ6Zv
 GsqebL5h5fdSbGfGJ7JtW1/Y1lNHSGjwbI9/PSmgSwppgzT4cPDL0PsIYQrTevi7XkLJ
 +0ag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GfpWy/Ke
Subject: Re: [Buildroot] [PATCH 0/3] package/python: allow building without
 python on the host (branch yem/python)
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vincent Fazio <vfazio@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/07/2022 15:04, Yann E. MORIN wrote:
> Hello All!
> 
> This small series fixes #14911: building python3 requires host-python3,
> which itself requires that the host already has a python interpreter.
> 
> With a little cleanup patch, new runtime tests, and a nice patch from
> Vincent, we can now drop the requirement on python being available on
> the host. It also drop one of our patch and some crazy and fragile hacks
> to regenerate python internals.
> 
> Regards,
> Yann E. MORIN.

  Series applied to master, thanks.

  Regards,
  Arnout

> 
> 
> ----------------------------------------------------------------
> Vincent Fazio (1):
>        package/python3: use the provided pyc compiler
> 
> Yann E. MORIN (2):
>        support/testing: drop legacy python2 code
>        support/testing: introduce py-only and py-pyc tests
> 
>   ...h => 0011-Add-an-option-to-disable-pydoc.patch} |   0
>   ...0011-Add-importlib-fix-for-PEP-3147-issue.patch | 105 ---------------------
>   ...=> 0012-Add-an-option-to-disable-lib2to3.patch} |   0
>   ...Add-option-to-disable-the-sqlite3-module.patch} |   0
>   ...4-Add-an-option-to-disable-the-tk-module.patch} |   0
>   ...d-an-option-to-disable-the-curses-module.patch} |   0
>   ...h => 0016-Add-an-option-to-disable-expat.patch} |   0
>   ...0017-Add-an-option-to-disable-CJK-codecs.patch} |   0
>   ...tch => 0018-Add-an-option-to-disable-NIS.patch} |   0
>   ...019-Add-an-option-to-disable-unicodedata.patch} |   0
>   ...ch => 0020-Add-an-option-to-disable-IDLE.patch} |   0
>   ...=> 0021-Add-an-option-to-disable-decimal.patch} |   0
>   ...option-to-disable-the-ossaudiodev-module.patch} |   0
>   ...Add-an-option-to-disable-openssl-support.patch} |   0
>   ...an-option-to-disable-the-readline-module.patch} |   0
>   ...ons-to-disable-zlib-bzip2-and-xz-modules.patch} |   0
>   ...6-python-config.sh-don-t-reassign-prefix.patch} |   0
>   ...0027-Fix-cross-compiling-the-uuid-module.patch} |   0
>   ...028-Add-an-option-to-disable-uuid-module.patch} |   0
>   ...0029-fix-building-on-older-distributions.patch} |   0
>   ...-fixup-CC-print-multiarch-output-for-mus.patch} |   0
>   ...-option-to-disable-the-berkeleydb-module.patch} |   0
>   ...libc-ng-doesn-t-set-errno-when-encryptio.patch} |   0
>   package/python3/python3.mk                         |  47 +--------
>   support/scripts/pycompile.py                       |  91 ------------------
>   support/testing/tests/package/test_python.py       |  34 ++++++-
>   26 files changed, 35 insertions(+), 242 deletions(-)
>   rename package/python3/{0012-Add-an-option-to-disable-pydoc.patch => 0011-Add-an-option-to-disable-pydoc.patch} (100%)
>   delete mode 100644 package/python3/0011-Add-importlib-fix-for-PEP-3147-issue.patch
>   rename package/python3/{0013-Add-an-option-to-disable-lib2to3.patch => 0012-Add-an-option-to-disable-lib2to3.patch} (100%)
>   rename package/python3/{0014-Add-option-to-disable-the-sqlite3-module.patch => 0013-Add-option-to-disable-the-sqlite3-module.patch} (100%)
>   rename package/python3/{0015-Add-an-option-to-disable-the-tk-module.patch => 0014-Add-an-option-to-disable-the-tk-module.patch} (100%)
>   rename package/python3/{0016-Add-an-option-to-disable-the-curses-module.patch => 0015-Add-an-option-to-disable-the-curses-module.patch} (100%)
>   rename package/python3/{0017-Add-an-option-to-disable-expat.patch => 0016-Add-an-option-to-disable-expat.patch} (100%)
>   rename package/python3/{0018-Add-an-option-to-disable-CJK-codecs.patch => 0017-Add-an-option-to-disable-CJK-codecs.patch} (100%)
>   rename package/python3/{0019-Add-an-option-to-disable-NIS.patch => 0018-Add-an-option-to-disable-NIS.patch} (100%)
>   rename package/python3/{0020-Add-an-option-to-disable-unicodedata.patch => 0019-Add-an-option-to-disable-unicodedata.patch} (100%)
>   rename package/python3/{0021-Add-an-option-to-disable-IDLE.patch => 0020-Add-an-option-to-disable-IDLE.patch} (100%)
>   rename package/python3/{0022-Add-an-option-to-disable-decimal.patch => 0021-Add-an-option-to-disable-decimal.patch} (100%)
>   rename package/python3/{0023-Add-an-option-to-disable-the-ossaudiodev-module.patch => 0022-Add-an-option-to-disable-the-ossaudiodev-module.patch} (100%)
>   rename package/python3/{0024-Add-an-option-to-disable-openssl-support.patch => 0023-Add-an-option-to-disable-openssl-support.patch} (100%)
>   rename package/python3/{0025-Add-an-option-to-disable-the-readline-module.patch => 0024-Add-an-option-to-disable-the-readline-module.patch} (100%)
>   rename package/python3/{0026-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch => 0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch} (100%)
>   rename package/python3/{0027-python-config.sh-don-t-reassign-prefix.patch => 0026-python-config.sh-don-t-reassign-prefix.patch} (100%)
>   rename package/python3/{0028-Fix-cross-compiling-the-uuid-module.patch => 0027-Fix-cross-compiling-the-uuid-module.patch} (100%)
>   rename package/python3/{0029-Add-an-option-to-disable-uuid-module.patch => 0028-Add-an-option-to-disable-uuid-module.patch} (100%)
>   rename package/python3/{0030-fix-building-on-older-distributions.patch => 0029-fix-building-on-older-distributions.patch} (100%)
>   rename package/python3/{0031-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch => 0030-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch} (100%)
>   rename package/python3/{0032-Add-an-option-to-disable-the-berkeleydb-module.patch => 0031-Add-an-option-to-disable-the-berkeleydb-module.patch} (100%)
>   rename package/python3/{0033-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch => 0032-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} (100%)
>   delete mode 100644 support/scripts/pycompile.py
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
