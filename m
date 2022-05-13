Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EA6C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 21:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CE6B60B79;
	Fri, 13 May 2022 21:54:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vidVttVO4Le1; Fri, 13 May 2022 21:54:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3743260A75;
	Fri, 13 May 2022 21:54:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 44AEB1BF5A8
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40FA983F74
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:54:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s-p7-m4I6BJd for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 21:54:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0318A83F6E
 for <buildroot@buildroot.org>; Fri, 13 May 2022 21:54:40 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id kq17so18627559ejb.4
 for <buildroot@buildroot.org>; Fri, 13 May 2022 14:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=eirOpyxv8WOXDUVq5bX5454w3gVfaugzW6Xf+X4IqX8=;
 b=iPfVtWavUcyGJdDfhTZGS/mnQr6aITjqhMbXthjcN8FjD2VtYowOnBZKR2UjP50hxB
 geJ/NRxq1YIwEczTXbY5X3jEID/Eu5rv0sW01lRerD/AuEG1kas4nBj7pgNaouRiqFlg
 1bvOUUHSbTR61cmweAdO5+1AW6IeCIEi6Nilh00/etIdQ+s0GTKEhkPshXOSI4gcA5rn
 QGYUUd6eAkT4A9JCDg4BDA3Lv3for+gHSCgyqi+I/CFGpZznlX2q4pkmiPzS2PkN4T2I
 HyXI3uOU6TS611RHlM7P80sH8scxR5urAaEWIevNxRSQlbvK2cdiTyjeT03LMg+li5gY
 7xnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=eirOpyxv8WOXDUVq5bX5454w3gVfaugzW6Xf+X4IqX8=;
 b=rmMWdJ+ovIGBIKEPx6c2wvAyE0Sn8BClw1Xf8fCkBXiBfBi6hD+jko+dH8rqRKV2IG
 NvclN0abqQvt+2/WIAw3MGRBmWk5VFQ6JOhh1Oa+BENTN2EoObHN/giPyYo6uQ41NLU4
 WoqwEeK7zJotAuutuE4UZTPdQ5XZBBzSJ9PLy0ychz5lHp0LzCDpruO782BfxT6kPa1Q
 4uL51/Wxc+GH5JbLf8LT1GxVu1At9NkfFpZhMWaxlANzFmnykbeF9EW8ftO8nukZiWQB
 enxJn67hBQFS1NFe7FBTTkZ75PXqwnEq+/e/i6+W42Ke/U7QlF+POdWKExeuZbDqQzPN
 fgpQ==
X-Gm-Message-State: AOAM530VEV8B6PYm7XJxzmNxBvxhbHk6P2+RmOo9S8DhMMhe+LyE1QdD
 CL3EfAaQ+fMYJ45dzNeQINga+NIOQ3ZdhA==
X-Google-Smtp-Source: ABdhPJy1ZYdPdYHSfzJyGGhq80s3rbQYKw8ynyFG5J/NmnR5EHEDEoZMM5k0j2ZrM0ZmJHISMF0haQ==
X-Received: by 2002:a17:907:7da6:b0:6f4:dc6f:1e32 with SMTP id
 oz38-20020a1709077da600b006f4dc6f1e32mr5895330ejc.614.1652478879020; 
 Fri, 13 May 2022 14:54:39 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 gv2-20020a1709072bc200b006f3ef214df5sm1159974ejc.91.2022.05.13.14.54.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 14:54:38 -0700 (PDT)
Message-ID: <67908613-e26b-4a00-ca95-730c19aa87dd@mind.be>
Date: Fri, 13 May 2022 23:54:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20220510120858.3350640-1-buildroot@heine.tech>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220510120858.3350640-1-buildroot@heine.tech>
Subject: Re: [Buildroot] [PATCH] package/boost: bump version to 1.79.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/05/2022 14:08, Michael Nosthoff via buildroot wrote:
> - remove upstreamed patch
> - add patch for boost::json bug in known issues on the boost release page [0]
> 
> [0] https://www.boost.org/users/history/version_1_79_0.html
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...stat-h-include-on-musl-based-systems.patch | 31 ---------
>   .../0001-json-array-erase-relocate.patch      | 65 +++++++++++++++++++
>   package/boost/boost.hash                      |  4 +-
>   package/boost/boost.mk                        |  2 +-
>   4 files changed, 68 insertions(+), 34 deletions(-)
>   delete mode 100644 package/boost/0001-Fix-missing-sys-stat-h-include-on-musl-based-systems.patch
>   create mode 100644 package/boost/0001-json-array-erase-relocate.patch
> 
> diff --git a/package/boost/0001-Fix-missing-sys-stat-h-include-on-musl-based-systems.patch b/package/boost/0001-Fix-missing-sys-stat-h-include-on-musl-based-systems.patch
> deleted file mode 100644
> index 9b86b816bf..0000000000
> --- a/package/boost/0001-Fix-missing-sys-stat-h-include-on-musl-based-systems.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From de657e01635306085488290ea83de541ec393f8b Mon Sep 17 00:00:00 2001
> -From: Leonardo Neumann <leonardo@neumann.dev.br>
> -Date: Mon, 13 Dec 2021 01:07:20 -0300
> -Subject: [PATCH] Fix missing sys/stat.h include on musl-based systems
> -
> -Boost 1.78.0 fails to build on musl-based systems because musl does
> -not include sys/stat.h by default.
> -
> -Fixes #161 ("Boost compiler error")
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/boostorg/interprocess/pull/162]
> ----
> - include/boost/interprocess/permissions.hpp | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/boost/interprocess/permissions.hpp b/boost/interprocess/permissions.hpp
> -index ab55411e..0b21a685 100644
> ---- a/boost/interprocess/permissions.hpp
> -+++ b/boost/interprocess/permissions.hpp
> -@@ -29,6 +29,10 @@
> -
> - #include <boost/interprocess/detail/win32_api.hpp>
> -
> -+#else
> -+
> -+#include <sys/stat.h>
> -+
> - #endif
> -
> - #endif   //#ifndef BOOST_INTERPROCESS_DOXYGEN_INVOKED
> diff --git a/package/boost/0001-json-array-erase-relocate.patch b/package/boost/0001-json-array-erase-relocate.patch
> new file mode 100644
> index 0000000000..899b202279
> --- /dev/null
> +++ b/package/boost/0001-json-array-erase-relocate.patch
> @@ -0,0 +1,65 @@
> +From 07d7c3b2e0f8c6b269ba167117cd3e549df2f342 Mon Sep 17 00:00:00 2001
> +From: Vinnie Falco <vinnie.falco@gmail.com>
> +Date: Wed, 13 Apr 2022 05:49:05 -0700
> +Subject: [PATCH] array::erase relocates correctly
> +
> +fix #692
> +
> +Signed-off-by: Michael Nosthoff<buildroot@heine.tech>
> +[Upstream status: https://github.com/boostorg/json/issues/692]
> +---
> + boost/json/impl/array.ipp |  5 ++++-
> + test/array.cpp                    | 16 ++++++++++++++++
> + 2 files changed, 20 insertions(+), 1 deletion(-)
> +
> +diff --git a/boost/json/impl/array.ipp b/boost/json/impl/array.ipp
> +index 4d067fb5..a2c7fd6d 100644
> +--- a/boost/json/impl/array.ipp
> ++++ b/boost/json/impl/array.ipp
> +@@ -491,8 +491,11 @@ erase(
> +     auto const p = &(*t_)[0] +
> +         (pos - &(*t_)[0]);
> +     destroy(p, p + 1);
> +-    relocate(p, p + 1, 1);
> +     --t_->size;
> ++    if(t_->size > 0)
> ++        relocate(p, p + 1,
> ++            t_->size - (p -
> ++                &(*t_)[0]));
> +     return p;
> + }
> +
> +diff --git a/libs/json/test/array.cpp b/libs/json/test/array.cpp
> +index 1cc87566..4516cc78 100644
> +--- a/libs/json/test/array.cpp
> ++++ b/libs/json/test/array.cpp
> +@@ -1269,6 +1269,21 @@ class array_test
> +             array{nullptr, "a", "b"}));
> +     }
> +
> ++    void
> ++    testIssue692()
> ++    {
> ++	    array a;
> ++	    object obj;
> ++	    obj["test1"] = "hello";
> ++	    a.push_back(obj);
> ++	    a.push_back(obj);
> ++	    a.push_back(obj);
> ++	    a.push_back(obj);
> ++	    a.push_back(obj);
> ++	    while(a.size())
> ++		    a.erase(a.begin());
> ++    }
> ++
> +     void
> +     run()
> +     {
> +@@ -1283,6 +1298,7 @@ class array_test
> +         testExceptions();
> +         testEquality();
> +         testHash();
> ++        testIssue692();
> +     }
> + };
> +
> diff --git a/package/boost/boost.hash b/package/boost/boost.hash
> index a174e414ee..0f46befc0c 100644
> --- a/package/boost/boost.hash
> +++ b/package/boost/boost.hash
> @@ -1,5 +1,5 @@
> -# From https://www.boost.org/users/history/version_1_78_0.html
> -sha256  8681f175d4bdb26c52222665793eef08490d7758529330f98d3b29dd0735bccc  boost_1_78_0.tar.bz2
> +# From https://www.boost.org/users/history/version_1_79_0.html
> +sha256  475d589d51a7f8b3ba2ba4eda022b170e562ca3b760ee922c146b6c65856ef39  boost_1_79_0.tar.bz2
>   
>   # Locally computed
>   sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index 032ba5c820..fe86344f6a 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -BOOST_VERSION = 1.78.0
> +BOOST_VERSION = 1.79.0
>   BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
>   BOOST_SITE = https://boostorg.jfrog.io/artifactory/main/release/$(BOOST_VERSION)/source
>   BOOST_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
