Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D16C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 17:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F38D541A27;
	Wed, 27 Apr 2022 17:13:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LaRGs_vs0Tsi; Wed, 27 Apr 2022 17:13:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 047C941A18;
	Wed, 27 Apr 2022 17:13:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 155561BF420
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 044AE82B21
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bo-DChzikiQO for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 17:13:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5687882ACA
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 17:13:51 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id i27so4697865ejd.9
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 10:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MeH7JhRGMksq88H8W+FcxKHaYIMJK1JLl4vzg9hMOZs=;
 b=hGTzHFhv7gjWCNL65c2vTSmotTliCTTYJINLaXRq9ttDnsDoagLbDvy8Wyjubgezjm
 riyjfx3Rj2Ed88AHx/gO1nj7JrbTx2Yrq2vvF9eiY2kn1ArBgkdp9pvQuY20dsNHiVMX
 wtfOtB2RTp8i+CuE8VOuOhnazTqBouNOMoi7wu7QhrRwQDgHXBQvr9ivotIPeWYGzMsd
 ZefiHTZmZ6hrqXLLYF6AkaVuctWBhpFEEVHYtp7zrQs/myxeTJhjnu4AOO7DCshrn5hF
 2bKgiJRFO/WVhzjVjNsduu0DR2HzSMMvJPbO0S9JbCADu6dfhSb4kMmEJD8WVKobLxsc
 Fszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=MeH7JhRGMksq88H8W+FcxKHaYIMJK1JLl4vzg9hMOZs=;
 b=plKAQlSKjwubUKuhaFA+ei7a5Cg1SpJAGb50MKSZaYMc+b2ajDV9PMwTamVBewYG7s
 BiVBguhA6SQtNDwwMghfjQOAtI2n5o4VvAavJmWfEqoGk+h69VO0TSZJ505wUoqCV045
 mkuOr8+SFtmefzkQhmF8tV9DEhBWSBhYXdgZDsLKHXsEAjIJwryuy409IYIPgLu25CGz
 4qhQAOxeN6XJ03uKeSA6DDTyztwKhqlqq4fYYbMYtvjltTKU7V8csUOi7EGLxEbXdn3c
 NhwAqGYiQi7sGhGKbHVoiyH8rasKWNpFMyKxDIqav2Qt7S6smsFoeDH80DF67p3/YYR5
 hlHQ==
X-Gm-Message-State: AOAM533F0f55ZRi6S959q3ZQaLrksTKVO6w0RkuHMz0PxM8IlK8esIE+
 0/4KNQp+joRVm8JdxUXx0dD3fg==
X-Google-Smtp-Source: ABdhPJw2xPtIppyBVynZKOI3+ax9nUx8xopjcI/x8xlLx82Od/syZ7/eUZ6HSpFpxXwXSqHdEk7WvA==
X-Received: by 2002:a17:907:7f0a:b0:6f3:9863:4183 with SMTP id
 qf10-20020a1709077f0a00b006f398634183mr15207265ejc.576.1651079629487; 
 Wed, 27 Apr 2022 10:13:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a170906088f00b006f3cea6b85dsm1068619eje.42.2022.04.27.10.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 10:13:48 -0700 (PDT)
Message-ID: <c504db43-e26c-e89b-0d69-0551e5d67160@mind.be>
Date: Wed, 27 Apr 2022 19:13:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220424200620.1413743-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220424200620.1413743-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: bump to version 3.10.4
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
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/04/2022 22:06, James Hilliard wrote:
> Drop override system locale patch which is now upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...dd-importlib-fix-for-PEP-3147-issue.patch} |  0
>   ...locale-and-set-to-default-when-addin.patch | 39 -------------------
>   ...0012-Add-an-option-to-disable-pydoc.patch} |  0
>   ...13-Add-an-option-to-disable-lib2to3.patch} |  0
>   ...ption-to-disable-the-sqlite3-module.patch} |  0
>   ...-an-option-to-disable-the-tk-module.patch} |  0
>   ...option-to-disable-the-curses-module.patch} |  0
>   ...0017-Add-an-option-to-disable-expat.patch} |  0
>   ...Add-an-option-to-disable-CJK-codecs.patch} |  0
>   ...> 0019-Add-an-option-to-disable-NIS.patch} |  0
>   ...dd-an-option-to-disable-unicodedata.patch} |  0
>   ... 0021-Add-an-option-to-disable-IDLE.patch} |  0
>   ...22-Add-an-option-to-disable-decimal.patch} |  0
>   ...n-to-disable-the-ossaudiodev-module.patch} |  0
>   ...n-option-to-disable-openssl-support.patch} |  0
>   ...tion-to-disable-the-readline-module.patch} |  0
>   ...o-disable-zlib-bzip2-and-xz-modules.patch} |  0
>   ...hon-config.sh-don-t-reassign-prefix.patch} |  0
>   ...Fix-cross-compiling-the-uuid-module.patch} |  0
>   ...dd-an-option-to-disable-uuid-module.patch} |  0
>   ...fix-building-on-older-distributions.patch} |  0
>   ...p-CC-print-multiarch-output-for-mus.patch} |  0
>   ...on-to-disable-the-berkeleydb-module.patch} |  0
>   ...ng-doesn-t-set-errno-when-encryptio.patch} |  0
>   package/python3/python3.hash                  |  6 +--
>   package/python3/python3.mk                    |  2 +-
>   26 files changed, 4 insertions(+), 43 deletions(-)
>   rename package/python3/{0012-Add-importlib-fix-for-PEP-3147-issue.patch => 0011-Add-importlib-fix-for-PEP-3147-issue.patch} (100%)
>   delete mode 100644 package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
>   rename package/python3/{0013-Add-an-option-to-disable-pydoc.patch => 0012-Add-an-option-to-disable-pydoc.patch} (100%)
>   rename package/python3/{0014-Add-an-option-to-disable-lib2to3.patch => 0013-Add-an-option-to-disable-lib2to3.patch} (100%)
>   rename package/python3/{0015-Add-option-to-disable-the-sqlite3-module.patch => 0014-Add-option-to-disable-the-sqlite3-module.patch} (100%)
>   rename package/python3/{0016-Add-an-option-to-disable-the-tk-module.patch => 0015-Add-an-option-to-disable-the-tk-module.patch} (100%)
>   rename package/python3/{0017-Add-an-option-to-disable-the-curses-module.patch => 0016-Add-an-option-to-disable-the-curses-module.patch} (100%)
>   rename package/python3/{0018-Add-an-option-to-disable-expat.patch => 0017-Add-an-option-to-disable-expat.patch} (100%)
>   rename package/python3/{0019-Add-an-option-to-disable-CJK-codecs.patch => 0018-Add-an-option-to-disable-CJK-codecs.patch} (100%)
>   rename package/python3/{0020-Add-an-option-to-disable-NIS.patch => 0019-Add-an-option-to-disable-NIS.patch} (100%)
>   rename package/python3/{0021-Add-an-option-to-disable-unicodedata.patch => 0020-Add-an-option-to-disable-unicodedata.patch} (100%)
>   rename package/python3/{0022-Add-an-option-to-disable-IDLE.patch => 0021-Add-an-option-to-disable-IDLE.patch} (100%)
>   rename package/python3/{0023-Add-an-option-to-disable-decimal.patch => 0022-Add-an-option-to-disable-decimal.patch} (100%)
>   rename package/python3/{0024-Add-an-option-to-disable-the-ossaudiodev-module.patch => 0023-Add-an-option-to-disable-the-ossaudiodev-module.patch} (100%)
>   rename package/python3/{0025-Add-an-option-to-disable-openssl-support.patch => 0024-Add-an-option-to-disable-openssl-support.patch} (100%)
>   rename package/python3/{0026-Add-an-option-to-disable-the-readline-module.patch => 0025-Add-an-option-to-disable-the-readline-module.patch} (100%)
>   rename package/python3/{0027-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch => 0026-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch} (100%)
>   rename package/python3/{0028-python-config.sh-don-t-reassign-prefix.patch => 0027-python-config.sh-don-t-reassign-prefix.patch} (100%)
>   rename package/python3/{0029-Fix-cross-compiling-the-uuid-module.patch => 0028-Fix-cross-compiling-the-uuid-module.patch} (100%)
>   rename package/python3/{0030-Add-an-option-to-disable-uuid-module.patch => 0029-Add-an-option-to-disable-uuid-module.patch} (100%)
>   rename package/python3/{0031-fix-building-on-older-distributions.patch => 0030-fix-building-on-older-distributions.patch} (100%)
>   rename package/python3/{0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch => 0031-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch} (100%)
>   rename package/python3/{0033-Add-an-option-to-disable-the-berkeleydb-module.patch => 0032-Add-an-option-to-disable-the-berkeleydb-module.patch} (100%)
>   rename package/python3/{0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch => 0033-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} (100%)
> 
> diff --git a/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch b/package/python3/0011-Add-importlib-fix-for-PEP-3147-issue.patch
> similarity index 100%
> rename from package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
> rename to package/python3/0011-Add-importlib-fix-for-PEP-3147-issue.patch
> diff --git a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
> deleted file mode 100644
> index 4d021d86a4..0000000000
> --- a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From e4ae670e3489544a49dabd1618c32fe73504a7ba Mon Sep 17 00:00:00 2001
> -From: Samuel Cabrero <samuelcabrero@gmail.com>
> -Date: Wed, 23 Dec 2015 11:45:48 +0100
> -Subject: [PATCH] Override system locale and set to default when adding gcc
> - paths
> -
> -Forces the use of the default locale in the function
> -add_gcc_paths, which is called when cross compiling to add the
> -include and library paths. This is necessary because otherwise
> -the gcc output is localized and the output parsing fails, which
> -results in no paths added and detect_modules not able to find
> -any system library (eg. libz, libssl, etc.)
> -
> -[Thomas: patch taken from https://bugs.python.org/issue23767.]
> -
> -Signed-off-by: Samuel Cabrero <samuelcabrero@gmail.com>
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -[james.hilliard1@gmail.com: adapt to python 3.9]
> -Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ----
> - setup.py | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/setup.py b/setup.py
> -index d3f0e663f2..926c16f58f 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -761,7 +761,7 @@ class PyBuildExt(build_ext):
> -         tmpfile = os.path.join(self.build_temp, 'ccpaths')
> -         if not os.path.exists(self.build_temp):
> -             os.makedirs(self.build_temp)
> --        ret = run_command('%s -E -v - </dev/null 2>%s 1>/dev/null' % (CC, tmpfile))
> -+        ret = run_command('LC_ALL=C %s -E -v - </dev/null 2>%s 1>/dev/null' % (CC, tmpfile))
> -         is_gcc = False
> -         is_clang = False
> -         in_incdirs = False
> ---
> -2.25.1
> -
> diff --git a/package/python3/0013-Add-an-option-to-disable-pydoc.patch b/package/python3/0012-Add-an-option-to-disable-pydoc.patch
> similarity index 100%
> rename from package/python3/0013-Add-an-option-to-disable-pydoc.patch
> rename to package/python3/0012-Add-an-option-to-disable-pydoc.patch
> diff --git a/package/python3/0014-Add-an-option-to-disable-lib2to3.patch b/package/python3/0013-Add-an-option-to-disable-lib2to3.patch
> similarity index 100%
> rename from package/python3/0014-Add-an-option-to-disable-lib2to3.patch
> rename to package/python3/0013-Add-an-option-to-disable-lib2to3.patch
> diff --git a/package/python3/0015-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0014-Add-option-to-disable-the-sqlite3-module.patch
> similarity index 100%
> rename from package/python3/0015-Add-option-to-disable-the-sqlite3-module.patch
> rename to package/python3/0014-Add-option-to-disable-the-sqlite3-module.patch
> diff --git a/package/python3/0016-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0015-Add-an-option-to-disable-the-tk-module.patch
> similarity index 100%
> rename from package/python3/0016-Add-an-option-to-disable-the-tk-module.patch
> rename to package/python3/0015-Add-an-option-to-disable-the-tk-module.patch
> diff --git a/package/python3/0017-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0016-Add-an-option-to-disable-the-curses-module.patch
> similarity index 100%
> rename from package/python3/0017-Add-an-option-to-disable-the-curses-module.patch
> rename to package/python3/0016-Add-an-option-to-disable-the-curses-module.patch
> diff --git a/package/python3/0018-Add-an-option-to-disable-expat.patch b/package/python3/0017-Add-an-option-to-disable-expat.patch
> similarity index 100%
> rename from package/python3/0018-Add-an-option-to-disable-expat.patch
> rename to package/python3/0017-Add-an-option-to-disable-expat.patch
> diff --git a/package/python3/0019-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0018-Add-an-option-to-disable-CJK-codecs.patch
> similarity index 100%
> rename from package/python3/0019-Add-an-option-to-disable-CJK-codecs.patch
> rename to package/python3/0018-Add-an-option-to-disable-CJK-codecs.patch
> diff --git a/package/python3/0020-Add-an-option-to-disable-NIS.patch b/package/python3/0019-Add-an-option-to-disable-NIS.patch
> similarity index 100%
> rename from package/python3/0020-Add-an-option-to-disable-NIS.patch
> rename to package/python3/0019-Add-an-option-to-disable-NIS.patch
> diff --git a/package/python3/0021-Add-an-option-to-disable-unicodedata.patch b/package/python3/0020-Add-an-option-to-disable-unicodedata.patch
> similarity index 100%
> rename from package/python3/0021-Add-an-option-to-disable-unicodedata.patch
> rename to package/python3/0020-Add-an-option-to-disable-unicodedata.patch
> diff --git a/package/python3/0022-Add-an-option-to-disable-IDLE.patch b/package/python3/0021-Add-an-option-to-disable-IDLE.patch
> similarity index 100%
> rename from package/python3/0022-Add-an-option-to-disable-IDLE.patch
> rename to package/python3/0021-Add-an-option-to-disable-IDLE.patch
> diff --git a/package/python3/0023-Add-an-option-to-disable-decimal.patch b/package/python3/0022-Add-an-option-to-disable-decimal.patch
> similarity index 100%
> rename from package/python3/0023-Add-an-option-to-disable-decimal.patch
> rename to package/python3/0022-Add-an-option-to-disable-decimal.patch
> diff --git a/package/python3/0024-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0023-Add-an-option-to-disable-the-ossaudiodev-module.patch
> similarity index 100%
> rename from package/python3/0024-Add-an-option-to-disable-the-ossaudiodev-module.patch
> rename to package/python3/0023-Add-an-option-to-disable-the-ossaudiodev-module.patch
> diff --git a/package/python3/0025-Add-an-option-to-disable-openssl-support.patch b/package/python3/0024-Add-an-option-to-disable-openssl-support.patch
> similarity index 100%
> rename from package/python3/0025-Add-an-option-to-disable-openssl-support.patch
> rename to package/python3/0024-Add-an-option-to-disable-openssl-support.patch
> diff --git a/package/python3/0026-Add-an-option-to-disable-the-readline-module.patch b/package/python3/0025-Add-an-option-to-disable-the-readline-module.patch
> similarity index 100%
> rename from package/python3/0026-Add-an-option-to-disable-the-readline-module.patch
> rename to package/python3/0025-Add-an-option-to-disable-the-readline-module.patch
> diff --git a/package/python3/0027-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0026-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
> similarity index 100%
> rename from package/python3/0027-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
> rename to package/python3/0026-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
> diff --git a/package/python3/0028-python-config.sh-don-t-reassign-prefix.patch b/package/python3/0027-python-config.sh-don-t-reassign-prefix.patch
> similarity index 100%
> rename from package/python3/0028-python-config.sh-don-t-reassign-prefix.patch
> rename to package/python3/0027-python-config.sh-don-t-reassign-prefix.patch
> diff --git a/package/python3/0029-Fix-cross-compiling-the-uuid-module.patch b/package/python3/0028-Fix-cross-compiling-the-uuid-module.patch
> similarity index 100%
> rename from package/python3/0029-Fix-cross-compiling-the-uuid-module.patch
> rename to package/python3/0028-Fix-cross-compiling-the-uuid-module.patch
> diff --git a/package/python3/0030-Add-an-option-to-disable-uuid-module.patch b/package/python3/0029-Add-an-option-to-disable-uuid-module.patch
> similarity index 100%
> rename from package/python3/0030-Add-an-option-to-disable-uuid-module.patch
> rename to package/python3/0029-Add-an-option-to-disable-uuid-module.patch
> diff --git a/package/python3/0031-fix-building-on-older-distributions.patch b/package/python3/0030-fix-building-on-older-distributions.patch
> similarity index 100%
> rename from package/python3/0031-fix-building-on-older-distributions.patch
> rename to package/python3/0030-fix-building-on-older-distributions.patch
> diff --git a/package/python3/0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch b/package/python3/0031-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
> similarity index 100%
> rename from package/python3/0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
> rename to package/python3/0031-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
> diff --git a/package/python3/0033-Add-an-option-to-disable-the-berkeleydb-module.patch b/package/python3/0032-Add-an-option-to-disable-the-berkeleydb-module.patch
> similarity index 100%
> rename from package/python3/0033-Add-an-option-to-disable-the-berkeleydb-module.patch
> rename to package/python3/0032-Add-an-option-to-disable-the-berkeleydb-module.patch
> diff --git a/package/python3/0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch b/package/python3/0033-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
> similarity index 100%
> rename from package/python3/0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
> rename to package/python3/0033-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
> diff --git a/package/python3/python3.hash b/package/python3/python3.hash
> index 97f4653490..5ae0add789 100644
> --- a/package/python3/python3.hash
> +++ b/package/python3/python3.hash
> @@ -1,5 +1,5 @@
> -# From https://www.python.org/downloads/release/python-3102/
> -md5  14e8c22458ed7779a1957b26cde01db9  Python-3.10.2.tar.xz
> +# From https://www.python.org/downloads/release/python-3104/
> +md5  21f2e113e087083a1e8cf10553d93599  Python-3.10.4.tar.xz
>   # Locally computed
> -sha256  17de3ac7da9f2519aa9d64378c603a73a0e9ad58dffa8812e45160c086de64c7  Python-3.10.2.tar.xz
> +sha256  80bf925f571da436b35210886cf79f6eb5fa5d6c571316b73568343451f77a19  Python-3.10.4.tar.xz
>   sha256  f03e17cd594c2085f66a454e695c7ebe5b4d3c0eff534f4f194abc2fd164621b  LICENSE
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 3a334fb28d..cffb34e264 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   PYTHON3_VERSION_MAJOR = 3.10
> -PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
> +PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
>   PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
>   PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
>   PYTHON3_LICENSE = Python-2.0, others
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
