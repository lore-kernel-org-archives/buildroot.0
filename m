Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB32C77B61
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 21:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C8A3606C0;
	Sun,  9 Apr 2023 21:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C8A3606C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i-aCqXhgZH3c; Sun,  9 Apr 2023 21:19:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90D7060709;
	Sun,  9 Apr 2023 21:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90D7060709
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A8BFB1C3AE3
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 21:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E4B5415C7
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 21:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E4B5415C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3h5ehYaje-Ts for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 21:19:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A22C4415C3
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A22C4415C3
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 21:19:13 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id xi5so8543272ejb.13
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 14:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681075151;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jv0ntMGAntYEa5G3DVo/oaI85cDBKbUtVXLNQ3XA5Pc=;
 b=CoYMEEHN0eXy3bP6+f+PHGTAiA+EwqOIE7e+GboBYh3m/6atutTsTnR45yPGcNtZUW
 jo/zpZf15VCaoNvqbeZLKNsn/63R20Wkk5JnDVhx0FvIPqGNrOBcA7nEJlDL1/GN60zS
 o4jpfuTXWKAIpOuS6v9EMRQEP/MMTtSTgmi3GzTdhaZQtjytPv8yNCdfEY4IS8gryMvy
 Fb2pEdhaevaX0eqVRfWqeLk7xUc0CdiGSjg0TjW++PqP1ZeWium2/VR9XHWt2Qt8aRoi
 egLOV6qExZPPvVoLk5HS9RV32U6w8ATgBOonc1smn4d48MCz3+7FBpCsopDbN6jOuJ5q
 Svyw==
X-Gm-Message-State: AAQBX9dzCq73hyYtmhBKSggsKG2YujH6w8bQDBsubdLWHPy+vIb12UsK
 cGkB9ekyvlBxc91066LnyLyukw==
X-Google-Smtp-Source: AKy350bWXWVmm3/re/i40dcHJ5slF7zrs5J1I7Kt1YGCkuw3AjxWwUTegijMtUSSkkFVj5tsKlbDZQ==
X-Received: by 2002:a17:907:76b1:b0:94a:5ecb:6ea7 with SMTP id
 jw17-20020a17090776b100b0094a5ecb6ea7mr2725555ejc.43.1681075151592; 
 Sun, 09 Apr 2023 14:19:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 g23-20020a1709067c5700b00947c0df0fc4sm4495861ejp.19.2023.04.09.14.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 14:19:11 -0700 (PDT)
Message-ID: <569726d0-73f7-4af0-0d05-c14eab1de4d1@mind.be>
Date: Sun, 9 Apr 2023 23:19:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20230403163433.368657-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230403163433.368657-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681075151;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jv0ntMGAntYEa5G3DVo/oaI85cDBKbUtVXLNQ3XA5Pc=;
 b=FPRz52MugRbZmyAJFPaQRUnxabk41tJZtDfqr3Cja8bJBjgdWRjPF7ffk0ZbT20hdl
 KwXOB9azdrmxHm0CFAKwoabHj0LPiOdUc8IssR7Y6PHa8+YoB2rlttcwH44U28mPWOS9
 h1OG2vpD8CKEPQvVEiBsSdmsuq5TvFBJc8e7p+kiWChxMIWXQydc8nGLJ2MSihkOPJw0
 u2/l7l2iZg0EuTtMsj0OpfBDXBfc42lzC9etX0E29SL0wLeNpUp/YjCDDfnl48K02prN
 8+m1yWuxoJO7QGs9c54wmC7a2NITpWJ/tt0AMH571TqkcPDz7is3sZOPMApTZU4QHAQF
 Rw2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FPRz52Mu
Subject: Re: [Buildroot] [PATCH v3,1/1] package/zeek: bump to version 5.2.0
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



On 03/04/2023 18:34, Fabrice Fontaine wrote:
> - Handle build and install of gen-zam
> - Disable new spicy option (work is still needed to cross-compile it)
> - Disable unit tests (as they are now enabled by default)
> - Update hash of COPYING (year updated with
>    https://github.com/zeek/zeek/commit/273126a87b8f7134b81439ae31343c7b45d2a421)
> - Update hash of COPYING.3rdparty (path updated, filessystem added and
>    file renamed with
>    https://github.com/zeek/zeek/commit/72cbc7cd13b7c1bda98658104431c3b530ff68d6
>    https://github.com/zeek/zeek/commit/b77f5fa14cc1b64572b70f80366e1ba56f87503c
>    https://github.com/zeek/zeek/commit/4f6f46a4043b092b40c01d91a57c5ff273ab433a)
> - This bump will fix the following build failure with python >= 3.11:
> 
> In file included from /home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/3rdparty/pybind11/include/pybind11/attr.h:13,
>                   from /home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/3rdparty/pybind11/include/pybind11/pybind11.h:45,
>                   from /home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/3rdparty/pybind11/include/pybind11/functional.h:12,
>                   from /home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/_broker.cpp:13:
> /home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/3rdparty/pybind11/include/pybind11/cast.h: In function 'std::string pybind11::detail::error_string()':
> /home/autobuild/autobuild/instance-6/output-1/build/zeek-4.1.1/auxil/broker/bindings/python/3rdparty/pybind11/include/pybind11/cast.h:446:36: error: invalid use of incomplete type 'PyFrameObject' {aka 'struct _frame'}
>    446 |                 "  " + handle(frame->f_code->co_filename).cast<std::string>() +
>        |                                    ^~
> 
> https://github.com/zeek/zeek/blob/v5.2.0/NEWS
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/43ca5fcc5b8618e6a7a65e77061f673a3c30bfc6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3:
>   - Add a patch to fix install
> Changes v1 -> v2:
>   - Update commit message with information about python build failure
> 
>   ...CMakeLists.txt-drop-EXCLUDE_FROM_ALL.patch | 30 +++++++++++++++++++
>   package/zeek/zeek.hash                        |  6 ++--
>   package/zeek/zeek.mk                          | 13 +++++---
>   3 files changed, 42 insertions(+), 7 deletions(-)
>   create mode 100644 package/zeek/0001-CMakeLists.txt-drop-EXCLUDE_FROM_ALL.patch
> 
> diff --git a/package/zeek/0001-CMakeLists.txt-drop-EXCLUDE_FROM_ALL.patch b/package/zeek/0001-CMakeLists.txt-drop-EXCLUDE_FROM_ALL.patch
> new file mode 100644
> index 0000000000..c6f6fe0f46
> --- /dev/null
> +++ b/package/zeek/0001-CMakeLists.txt-drop-EXCLUDE_FROM_ALL.patch
> @@ -0,0 +1,30 @@
> +From 397cfad57d38bfb4dc681c9533e5ed98a342d9ae Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 3 Apr 2023 18:29:14 +0200
> +Subject: [PATCH] CMakeLists.txt: drop EXCLUDE_FROM_ALL
> +
> +Drop EXCLUDE_FROM_ALL from add_subdirectory(caf) or caf libraries such
> +as libcaf_core.so won't be installed resulting in a runtime failure
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/zeek/broker/pull/327]

  I was going to apply, but then I saw that this PR was closed and a new one 
with a different implementation was opened instead. Could you refresh?

  Regards,
  Arnout

> +---
> + CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/auxil/broker/CMakeLists.txt b/auxil/broker/CMakeLists.txt
> +index cb99d290..c91dcf22 100644
> +--- a/auxil/broker/CMakeLists.txt
> ++++ b/auxil/broker/CMakeLists.txt
> +@@ -217,7 +217,7 @@ else ()
> +   set(CAF_ENABLE_TESTING OFF CACHE INTERNAL "")
> +   set(CAF_ENABLE_TOOLS OFF CACHE INTERNAL "")
> +   set(BUILD_SHARED_LIBS OFF CACHE INTERNAL "")
> +-  add_subdirectory(caf EXCLUDE_FROM_ALL)
> ++  add_subdirectory(caf)
> +   list(APPEND OPTIONAL_SRC $<TARGET_OBJECTS:libcaf_core_obj>)
> +   list(APPEND OPTIONAL_SRC $<TARGET_OBJECTS:libcaf_io_obj>)
> +   list(APPEND OPTIONAL_SRC $<TARGET_OBJECTS:libcaf_net_obj>)
> +--
> +2.39.2
> +
> diff --git a/package/zeek/zeek.hash b/package/zeek/zeek.hash
> index 05e57b5024..872ef8e14f 100644
> --- a/package/zeek/zeek.hash
> +++ b/package/zeek/zeek.hash
> @@ -1,6 +1,6 @@
>   # Locally computed:
> -sha256  8c0afc999a8dd1c1f677a5cf818479b99c2d527e679e1ef99fb1b03f989c0373  zeek-4.1.1.tar.gz
> +sha256  511047400dd4539177542c84a5e80d7e97ad73d2a9986ffcd6cd85b4cc711fbf  zeek-5.2.0.tar.gz
>   
>   # Hash for license files:
> -sha256  b2817e2fb935805ec9fc0e90c6b971efd810d9aedfc646bc5fcb535221e0266a  COPYING
> -sha256  1a451eca7b3826a7df62991ba90dd6d23ff03d28c2eefb7f8c4f8b1eac97a61b  COPYING.3rdparty
> +sha256  14c5057bb1f83c50db29323a9d5bb0f33db9c4d8b9806c070f5b0ca84f52694a  COPYING
> +sha256  5be6b90c7a563e6ee8238354f3487206e19d8f299689ff2adce7bdd1a6919ab1  COPYING-3rdparty
> diff --git a/package/zeek/zeek.mk b/package/zeek/zeek.mk
> index 584bfb0778..9c599fc22d 100644
> --- a/package/zeek/zeek.mk
> +++ b/package/zeek/zeek.mk
> @@ -4,19 +4,19 @@
>   #
>   ################################################################################
>   
> -ZEEK_VERSION = 4.1.1
> +ZEEK_VERSION = 5.2.0
>   ZEEK_SITE = https://download.zeek.org
>   ZEEK_LICENSE = \
>   	BSD-3-Clause (zeek, C++ Actor Framework, ConvertUTF.c, CardinalityCounter.cc, pybind11), \
>   	Public Domain (sqlite), \
> -	MIT (doctest, libkqueue, RapidJSON, tsl-ordered-map, bro_inet_ntop.c), \
> +	MIT (doctest, filesystem, libkqueue, RapidJSON, tsl-ordered-map, bro_inet_ntop.c), \
>   	LGPL-3.0+ (Multifast Project), \
>   	BSD-2-Clause (event.h), \
>   	BSD-3-Clause (in_cksum.cc) \
>   	BSD-4-Clause (Patricia.c, strsep.c, bsd-getopt-long.c), \
>   	Apache-2.0 (highwayhash, folly), \
>   	MPL-2.0 (mozilla-ca-list.zeek)
> -ZEEK_LICENSE_FILES = COPYING COPYING.3rdparty
> +ZEEK_LICENSE_FILES = COPYING COPYING-3rdparty
>   ZEEK_CPE_ID_VENDOR = zeek
>   ZEEK_SUPPORTS_IN_SOURCE_BUILD = NO
>   ZEEK_DEPENDENCIES = \
> @@ -45,6 +45,9 @@ ZEEK_CONF_OPTS = \
>   	-DBINPAC_EXE_PATH=$(HOST_DIR)/bin/binpac \
>   	-DBROKER_DISABLE_DOCS=ON \
>   	-DBROKER_DISABLE_TESTS=ON \
> +	-DDISABLE_SPICY=ON \
> +	-DENABLE_ZEEK_UNIT_TESTS=OFF \
> +	-DGEN_ZAM_EXE_PATH=$(HOST_DIR)/bin/gen-zam \
>   	-DINSTALL_AUX_TOOLS=ON \
>   	-DZEEK_ETC_INSTALL_DIR=/etc
>   
> @@ -79,13 +82,15 @@ ZEEK_DEPENDENCIES += musl-fts
>   ZEEK_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-lfts
>   endif
>   
> -HOST_ZEEK_MAKE_OPTS = binpac bifcl
> +HOST_ZEEK_MAKE_OPTS = binpac bifcl gen-zam
>   
>   define HOST_ZEEK_INSTALL_CMDS
>   	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/bifcl/bifcl \
>   		$(HOST_DIR)/bin/bifcl
>   	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/binpac/src/binpac \
>   		$(HOST_DIR)/bin/binpac
> +	$(INSTALL) -D -m 0755 $(HOST_ZEEK_BUILDDIR)/auxil/gen-zam/gen-zam \
> +		$(HOST_DIR)/bin/gen-zam
>   endef
>   
>   $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
