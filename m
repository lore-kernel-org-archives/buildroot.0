Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FD0FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:38:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC0AC60524
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC0AC60524
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8525982F50;
	Thu, 14 Oct 2021 21:38:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YNhduKP1pVSr; Thu, 14 Oct 2021 21:38:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77B0482F80;
	Thu, 14 Oct 2021 21:38:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3BC421BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3806682F80
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:38:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K_tZiZ31LawF for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:38:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99D9182F50
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:38:14 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id i20so28896147edj.10
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 14:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZGcWK+MwbpBqJ+muIMK1s9HvWseVb1utThINw0IVkAE=;
 b=N1Ww4GiJB8O3FbrlqFcY46jywwGoJmgYm1d/QrzaeNsbGODjcVSjlJMDXcMs2/YSWy
 nFs6XTwjGxdGf3wSyVf8YR3DBwTdOoP96+nFm4KlmAhKmKtiPe1EBSPVIiisjnYAxmgm
 8FAvDkqIxT2gjIbUT5hHtjAiOp4HroIT4TOA1FnDSXOlDXHpJPvo8f2uC44MjDrdYA7t
 SScw1460migTSwwe/zOsLzuAQ8lBs64mXBDZI02rX4dxRVFYtOeb7KvDc2bYq4LTr8kF
 i2kLBIUfJYWVieT+PhrnU9w7L2nJzgkRXE0QjQhh2lpGsx7FRDY5U/rXY4yQ3Gv4AoyE
 GP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZGcWK+MwbpBqJ+muIMK1s9HvWseVb1utThINw0IVkAE=;
 b=cXKF25FG9E1QPbL73wlseVL9r62/3JweByd5lJ1ki2A0j0HnqB8pGdnoWgPLWO0N3n
 P9jDbuTfr04nSsTpx7H4rUsasY2PJ8DEqS9ujWoXTzmVFEYg6ebyfjUtG5/Wgj8e8pJa
 Xjg9wKAPxLgN8t17qg11G39mdafdpQl9aLz7gYMg7swAuliwPqdm+GbzOPAu18GFQGlr
 ERh6WMKzYWrsWdGV7tJAW0gHaC6BC5dLiArJZPLpFaQ+H1BBs+4znDhswJRTP5ipTPFm
 orKjaBd59z5Ofq+4Cvxf4rWbbfv+e788jUPz7hY4Nq+DBHUF8swKzus0AU98xkPy6WFl
 kk4Q==
X-Gm-Message-State: AOAM530nhcCMrnylgp0JUoCYf4EbeLKwFu5+MZZViK7sezXyLf2lBZNr
 nf6lLRej2sc2W/zf9liBZdH5Fw==
X-Google-Smtp-Source: ABdhPJw8RpQB9oSZZ+7qM1iYa4j8gaKnU+dVEcVVauG+T81miGqe3uBEj82E/kodsETD9o0jnTWcTA==
X-Received: by 2002:a17:906:b819:: with SMTP id
 dv25mr1958967ejb.21.1634247492737; 
 Thu, 14 Oct 2021 14:38:12 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id o3sm2683159ejg.52.2021.10.14.14.38.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 14:38:12 -0700 (PDT)
Message-ID: <e1505245-c64d-fa97-b8b9-b10610755eff@mind.be>
Date: Thu, 14 Oct 2021 23:38:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
References: <20211009205523.3137859-1-aduskett@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211009205523.3137859-1-aduskett@gmail.com>
Subject: Re: [Buildroot] [PATCH 00/20] package/python3: bump to version 3.10
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/10/2021 22:55, Adam Duskett wrote:
> In the following patch series python3 (eventually) gets bumped to version 3.10
> 
> - The first parts involve updating packages that are not compatible with 3.10.
>    Either by updating versions or adding patches.
> 
> - Then I fix a typo in python-pathvalidate

I didn't see that one. Is it 576440a1d8138f5b1bd4985e6244d001ef553cc4?

> - Then I complain about python-setuptools and split add support for both
>    setuptools 48 (compatible with python2) and 58 (compatible with python3.10)

  Do you think it's worth ditching python2 before merging this series? Or do we 
just merge as is and ditch python2 later?

> - Finally I update python3 to 3.10
> 
> This patch series has been tested against every python2 and python3 unit-test
> available in buildroot, including against https://patchwork.ozlabs.org/project/buildroot/patch/20211006203823.2740442-1-yann.morin.1998@free.fr/
> 
> In addition, I also selected *EVERY* python module to ensure all of them at
> least build against python3.10, and everything passes.
> 
> Finally, I ran a test-pkg -a on python3.10 to ensure that this didn't break any
> other platforms.
> 
> Adam Duskett (20):
>    package/dbus-python: bump to version 1.2.18
>    package/kmod: bump to version 29
>    package/python-crossbar: bump to version 21.3.1
>    package/python-git: bump to version 3.1.24
>    package/python-gobject: bump to version 3.42.0
>    package/python-ipython: bump to version 7.28.0
>    package/python-libusb1: bump to version 2.0.1
>    package/python-lmdb: bump to version 1.2.1

  First 7 applied to master, thanks.

  Regards,
  Arnout

>    package/python-dataclasses: new package
>    package/python-pydantic: bump to version 1.8.2
>    package/python-txtorcon: bump to version 21.1.0
>    package/python-watchdog: bump to version 2.1.6
>    package/util-linux: bump to version 2.37.2
>    package/python-certifi: add host variant
>    package/python-matplotlib: bump to version 3.4.3
>    package/python-numpy: bump to version 1.21.2
>    package/python-django-enumfields: bump to version 2.1.1
>    package/python-pyalsa: add
>      0001-fix-pytuple-set-item-usage-no-return-value.patch
>    package/python-setuptools: bump to version 58.2.0 and split python2
>      version
>    package/python3: bump to version 3.10
> 
>   package/Config.in                             |   1 +
>   package/dbus-python/dbus-python.hash          |   2 +-
>   package/dbus-python/dbus-python.mk            |   2 +-
>   package/kmod/kmod.hash                        |   2 +-
>   package/kmod/kmod.mk                          |   2 +-
>   package/python-certifi/python-certifi.mk      |   1 +
>   .../0002-Remove-idna-requirement.patch        |  10 +-
>   package/python-crossbar/python-crossbar.hash  |   4 +-
>   package/python-crossbar/python-crossbar.mk    |   4 +-
>   package/python-dataclasses/Config.in          |   6 +
>   .../python-dataclasses.hash                   |   5 +
>   .../python-dataclasses/python-dataclasses.mk  |  14 ++
>   .../python-django-enumfields.hash             |   6 +-
>   .../python-django-enumfields.mk               |   4 +-
>   package/python-git/python-git.hash            |   2 +-
>   package/python-git/python-git.mk              |   2 +-
>   package/python-gobject/python-gobject.hash    |   4 +-
>   package/python-gobject/python-gobject.mk      |   6 +-
>   package/python-ipython/python-ipython.hash    |   4 +-
>   package/python-ipython/python-ipython.mk      |   4 +-
>   package/python-libusb1/python-libusb1.hash    |   4 +-
>   package/python-libusb1/python-libusb1.mk      |   4 +-
>   package/python-lmdb/python-lmdb.hash          |   4 +-
>   package/python-lmdb/python-lmdb.mk            |   4 +-
>   .../0001-Fix-invalid-inclusion-headers.patch  |  29 ---
>   ...st-11983-from-anntzer-builddepchecks.patch | 170 ------------------
>   package/python-matplotlib/Config.in           |   2 +
>   .../python-matplotlib/python-matplotlib.hash  |   2 +-
>   .../python-matplotlib/python-matplotlib.mk    |  14 +-
>   package/python-matplotlib/setup.cfg           |  10 ++
>   package/python-numpy/python-numpy.hash        |  11 +-
>   package/python-numpy/python-numpy.mk          |  16 +-
>   ...tuple-set-item-usage-no-return-value.patch |  48 +++++
>   package/python-pydantic/Config.in             |   2 +
>   package/python-pydantic/python-pydantic.hash  |   6 +-
>   package/python-pydantic/python-pydantic.mk    |   4 +-
>   .../{ => 44.0.0}/0001-add-executable.patch    |   0
>   .../{ => 44.0.0}/python-setuptools.hash       |   0
>   .../58.2.0/0001-add-executable.patch          |  72 ++++++++
>   .../58.2.0/python-setuptools.hash             |   4 +
>   .../python-setuptools/python-setuptools.mk    |  13 +-
>   package/python-txtorcon/python-txtorcon.hash  |   4 +-
>   package/python-txtorcon/python-txtorcon.mk    |   4 +-
>   package/python-watchdog/python-watchdog.hash  |  11 +-
>   package/python-watchdog/python-watchdog.mk    |   4 +-
>   .../0001-add-executable.patch                 |   2 +-
>   .../python3-setuptools.hash                   |   2 +-
>   .../python3-setuptools/python3-setuptools.mk  |  14 +-
>   ...e-the-build-of-pyc-files-conditional.patch |   6 +-
>   ...taddrinfo-configure-test-when-cross-.patch |   2 +-
>   ...re-to-disable-the-build-of-certain-e.patch |  16 +-
>   ...y-header-paths-for-cross-compilation.patch |  52 +++---
>   ...ook-in-usr-lib-termcap-for-libraries.patch |   4 +-
>   .../0006-Don-t-add-multiarch-paths.patch      |   2 +-
>   .../0007-Abort-on-failed-module-build.patch   |   2 +-
>   ...locale-and-set-to-default-when-addin.patch |   2 +-
>   ...Add-importlib-fix-for-PEP-3147-issue.patch |   6 +-
>   ...-disable-installation-of-test-module.patch | 117 ------------
>   ...0013-Add-an-option-to-disable-pydoc.patch} |  49 ++---
>   ...14-Add-an-option-to-disable-lib2to3.patch} |  83 ++++-----
>   ...ption-to-disable-the-sqlite3-module.patch} |  46 ++---
>   ...-an-option-to-disable-the-tk-module.patch} |  61 +++----
>   ...option-to-disable-the-curses-module.patch} |  37 ++--
>   ...0018-Add-an-option-to-disable-expat.patch} |  43 ++---
>   ...Add-an-option-to-disable-CJK-codecs.patch} |   2 +-
>   ...> 0020-Add-an-option-to-disable-NIS.patch} |   2 +-
>   ...dd-an-option-to-disable-unicodedata.patch} |   2 +-
>   ... 0022-Add-an-option-to-disable-IDLE.patch} |  51 +++---
>   ...23-Add-an-option-to-disable-decimal.patch} |   6 +-
>   ...n-to-disable-the-ossaudiodev-module.patch} |   2 +-
>   ...n-option-to-disable-openssl-support.patch} |   6 +-
>   ...tion-to-disable-the-readline-module.patch} |   6 +-
>   ...o-disable-zlib-bzip2-and-xz-modules.patch} |   6 +-
>   ...hon-config.sh-don-t-reassign-prefix.patch} |   4 +-
>   ...Fix-cross-compiling-the-uuid-module.patch} |   2 +-
>   ...dd-an-option-to-disable-uuid-module.patch} |   6 +-
>   ...fix-building-on-older-distributions.patch} |   0
>   ...p-CC-print-multiarch-output-for-mus.patch} |   2 +-
>   ...on-to-disable-the-berkeleydb-module.patch} |   6 +-
>   ...ng-doesn-t-set-errno-when-encryptio.patch} |   0
>   ...eration-error-in-_ExecutorManagerTh.patch} |   0
>   package/python3/python3.hash                  |   8 +-
>   package/python3/python3.mk                    |   4 +-
>   package/util-linux/util-linux.hash            |   4 +-
>   package/util-linux/util-linux.mk              |   2 +-
>   85 files changed, 533 insertions(+), 661 deletions(-)
>   create mode 100644 package/python-dataclasses/Config.in
>   create mode 100644 package/python-dataclasses/python-dataclasses.hash
>   create mode 100644 package/python-dataclasses/python-dataclasses.mk
>   delete mode 100644 package/python-matplotlib/0001-Fix-invalid-inclusion-headers.patch
>   delete mode 100644 package/python-matplotlib/0002-Merge-pull-request-11983-from-anntzer-builddepchecks.patch
>   create mode 100644 package/python-matplotlib/setup.cfg
>   create mode 100644 package/python-pyalsa/0001-fix-pytuple-set-item-usage-no-return-value.patch
>   rename package/python-setuptools/{ => 44.0.0}/0001-add-executable.patch (100%)
>   rename package/python-setuptools/{ => 44.0.0}/python-setuptools.hash (100%)
>   create mode 100644 package/python-setuptools/58.2.0/0001-add-executable.patch
>   create mode 100644 package/python-setuptools/58.2.0/python-setuptools.hash
>   delete mode 100644 package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
>   rename package/python3/{0014-Add-an-option-to-disable-pydoc.patch => 0013-Add-an-option-to-disable-pydoc.patch} (74%)
>   rename package/python3/{0015-Add-an-option-to-disable-lib2to3.patch => 0014-Add-an-option-to-disable-lib2to3.patch} (67%)
>   rename package/python3/{0016-Add-option-to-disable-the-sqlite3-module.patch => 0015-Add-option-to-disable-the-sqlite3-module.patch} (63%)
>   rename package/python3/{0017-Add-an-option-to-disable-the-tk-module.patch => 0016-Add-an-option-to-disable-the-tk-module.patch} (52%)
>   rename package/python3/{0018-Add-an-option-to-disable-the-curses-module.patch => 0017-Add-an-option-to-disable-the-curses-module.patch} (64%)
>   rename package/python3/{0019-Add-an-option-to-disable-expat.patch => 0018-Add-an-option-to-disable-expat.patch} (76%)
>   rename package/python3/{0020-Add-an-option-to-disable-CJK-codecs.patch => 0019-Add-an-option-to-disable-CJK-codecs.patch} (94%)
>   rename package/python3/{0021-Add-an-option-to-disable-NIS.patch => 0020-Add-an-option-to-disable-NIS.patch} (95%)
>   rename package/python3/{0022-Add-an-option-to-disable-unicodedata.patch => 0021-Add-an-option-to-disable-unicodedata.patch} (95%)
>   rename package/python3/{0023-Add-an-option-to-disable-IDLE.patch => 0022-Add-an-option-to-disable-IDLE.patch} (69%)
>   rename package/python3/{0024-Add-an-option-to-disable-decimal.patch => 0023-Add-an-option-to-disable-decimal.patch} (95%)
>   rename package/python3/{0025-Add-an-option-to-disable-the-ossaudiodev-module.patch => 0024-Add-an-option-to-disable-the-ossaudiodev-module.patch} (97%)
>   rename package/python3/{0026-Add-an-option-to-disable-openssl-support.patch => 0025-Add-an-option-to-disable-openssl-support.patch} (89%)
>   rename package/python3/{0027-Add-an-option-to-disable-the-readline-module.patch => 0026-Add-an-option-to-disable-the-readline-module.patch} (90%)
>   rename package/python3/{0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch => 0027-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch} (92%)
>   rename package/python3/{0029-python-config.sh-don-t-reassign-prefix.patch => 0028-python-config.sh-don-t-reassign-prefix.patch} (97%)
>   rename package/python3/{0030-Fix-cross-compiling-the-uuid-module.patch => 0029-Fix-cross-compiling-the-uuid-module.patch} (96%)
>   rename package/python3/{0031-Add-an-option-to-disable-uuid-module.patch => 0030-Add-an-option-to-disable-uuid-module.patch} (88%)
>   rename package/python3/{0032-fix-building-on-older-distributions.patch => 0031-fix-building-on-older-distributions.patch} (100%)
>   rename package/python3/{0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch => 0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch} (98%)
>   rename package/python3/{0034-Add-an-option-to-disable-the-berkeleydb-module.patch => 0033-Add-an-option-to-disable-the-berkeleydb-module.patch} (88%)
>   rename package/python3/{0035-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch => 0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} (100%)
>   rename package/python3/{0036-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch => 0035-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch} (100%)
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
