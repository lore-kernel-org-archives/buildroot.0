Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440A9C433FE
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 22:58:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA34461053
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 22:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA34461053
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7888760663;
	Thu, 14 Oct 2021 22:58:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PSjgpheDB6ma; Thu, 14 Oct 2021 22:58:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82F3A6067A;
	Thu, 14 Oct 2021 22:58:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E9CF1BF37B
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59411400F1
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 22:58:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id INwEU7RZs7xQ for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 22:58:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC08E40018
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 22:58:52 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id v20so5164819plo.7
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 15:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Seh5NRqNtxx/O1lJcBFplLuRr/uwXIoMQs0CqFY8mA=;
 b=TwqQpy1YjWzjexT4+PWhb9RUa1i96VIezak33bqa9VRf7ctCIZ/lFEHarH2m7GnRg2
 f3X+gquEQNbSV3sIqZL42QNkqOlhkIWj3tHSStkHam9HuUB4SrKwCaAwhfXVUnMnYFuY
 vn1LpFPt6Vo+IYuS1nbY0PY6v/dW6/yKyNvR1QTE+yclnQBCbxtiwhxFhx4RZnm4TYXt
 d/o24p4T4W3L5H9CeoFP4MTz6cGs1lL9BjDV/tsBqTJ+ac7CbamT3YncIFXTsjTcN4Cn
 zieK2XKvFjg3AetB7NWVyxukwB/NF8Ojaux+AP4/iDwOOXrNQPx3up5hDRfICLTxEEfg
 zWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Seh5NRqNtxx/O1lJcBFplLuRr/uwXIoMQs0CqFY8mA=;
 b=gSASNZYtO7R9G561HXyvQsqSUpKpmCRXaK+eCaERTj7f1zBLpIzfkioouy29z4wdzM
 8Htr+lquWLYV1BZdFl+ur8BflbKv4Ow95x4atUeIxc6ts8aOr4fxHpsvoQMdkWOUWUIx
 FJF4J3hZqbeHxLwuDHaxyxEHstcAovAz68/X7gVk6qWg/exc9YJgTj/nucOUYyMLkdUT
 byXqm0mKeAcgV0xdw7Wte2xghfHLd/eeKp08UtAd4WP7q4XpOCa/qEMn0fzRJFpCglP4
 UBiRyi8HInwwEVhp7l+6OCqNlnsEZMET01jMbloCzLbeMASBgykwe1R7KjcRP8npmnPw
 z7fA==
X-Gm-Message-State: AOAM531jQ249Z0TiFvEXUqCg/P4Rv4JC10Gif1G9lsxVJSEtggUIsabN
 QdmBi9yonN/MDX86B1iwk3DZkD5uXf4=
X-Google-Smtp-Source: ABdhPJzdj//837KKX6nJtD5v1+qI4hrIkUV/g7w+LSSh9lW/KH08FuX6iEq8UsqLQbzJlbIA5dk8bw==
X-Received: by 2002:a17:90a:8b89:: with SMTP id
 z9mr9385481pjn.89.1634252331620; 
 Thu, 14 Oct 2021 15:58:51 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id w19sm10171319pjy.9.2021.10.14.15.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 15:58:51 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 15:58:38 -0700
Message-Id: <20211014225849.832479-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 00/11] package/python3: bump to version 3.10
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
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Oli Vogt <oli.vogt.pub01@gmail.com>, Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In the following patch series python3 (eventually) gets bumped to version 3.10

- The first parts involve updating packages that are not compatible with 3.10.
  Either by updating versions or adding patches.
- Then I complain about python-setuptools and split add support for both
  setuptools 48 (compatible with python2) and 58 (compatible with python3.10)
- Finally I update python3 to 3.10

This patch series has been tested against every python2 and python3 unit-test
available in buildroot, including against https://patchwork.ozlabs.org/project/buildroot/patch/20211006203823.2740442-1-yann.morin.1998@free.fr/

In addition, I also selected *EVERY* python module to ensure all of them at
least build against python3.10, and everything passes.

Finally, I ran a test-pkg -a on python3.10 to ensure that this didn't break any
other platforms.

Changes v1 -> v2:
  - Drop the new dataclasses package as it isn't necessary for python >= 3.6

Adam Duskett (11):
  package/util-linux: bump to version 2.37.2
  package/python-pydantic: bump to version 1.8.2
  package/python-txtorcon: bump to version 21.1.0
  package/python-watchdog: bump to version 2.1.6
  package/python-certifi: add host variant
  package/python-matplotlib: bump to version 3.4.3
  package/python-numpy: bump to version 1.21.2
  package/python-pyalsa: add
    0001-fix-pytuple-set-item-usage-no-return-value.patch
  package/python-django-enumfields: bump to version 2.1.1
  package/python-setuptools: bump to version 58.2.0 and split python2
    version
  package/python3: bump to version 3.10

 package/python-certifi/python-certifi.mk      |   1 +
 .../python-django-enumfields.hash             |   6 +-
 .../python-django-enumfields.mk               |   4 +-
 .../0001-Fix-invalid-inclusion-headers.patch  |  29 ---
 ...st-11983-from-anntzer-builddepchecks.patch | 170 ------------------
 package/python-matplotlib/Config.in           |   2 +
 .../python-matplotlib/python-matplotlib.hash  |   2 +-
 .../python-matplotlib/python-matplotlib.mk    |  14 +-
 package/python-matplotlib/setup.cfg           |  10 ++
 package/python-numpy/python-numpy.hash        |  11 +-
 package/python-numpy/python-numpy.mk          |  16 +-
 ...tuple-set-item-usage-no-return-value.patch |  48 +++++
 package/python-pydantic/Config.in             |   1 +
 package/python-pydantic/python-pydantic.hash  |   6 +-
 package/python-pydantic/python-pydantic.mk    |   4 +-
 .../{ => 44.0.0}/0001-add-executable.patch    |   0
 .../{ => 44.0.0}/python-setuptools.hash       |   0
 .../58.2.0/0001-add-executable.patch          |  72 ++++++++
 .../58.2.0/python-setuptools.hash             |   4 +
 .../python-setuptools/python-setuptools.mk    |  13 +-
 package/python-txtorcon/python-txtorcon.hash  |   4 +-
 package/python-txtorcon/python-txtorcon.mk    |   4 +-
 package/python-watchdog/python-watchdog.hash  |  11 +-
 package/python-watchdog/python-watchdog.mk    |   4 +-
 .../0001-add-executable.patch                 |   2 +-
 .../python3-setuptools.hash                   |   2 +-
 .../python3-setuptools/python3-setuptools.mk  |  14 +-
 ...e-the-build-of-pyc-files-conditional.patch |   6 +-
 ...taddrinfo-configure-test-when-cross-.patch |   2 +-
 ...re-to-disable-the-build-of-certain-e.patch |  16 +-
 ...y-header-paths-for-cross-compilation.patch |  52 +++---
 ...ook-in-usr-lib-termcap-for-libraries.patch |   4 +-
 .../0006-Don-t-add-multiarch-paths.patch      |   2 +-
 .../0007-Abort-on-failed-module-build.patch   |   2 +-
 ...locale-and-set-to-default-when-addin.patch |   2 +-
 ...Add-importlib-fix-for-PEP-3147-issue.patch |   6 +-
 ...-disable-installation-of-test-module.patch | 117 ------------
 ...0013-Add-an-option-to-disable-pydoc.patch} |  49 ++---
 ...14-Add-an-option-to-disable-lib2to3.patch} |  83 ++++-----
 ...ption-to-disable-the-sqlite3-module.patch} |  46 ++---
 ...-an-option-to-disable-the-tk-module.patch} |  61 +++----
 ...option-to-disable-the-curses-module.patch} |  37 ++--
 ...0018-Add-an-option-to-disable-expat.patch} |  43 ++---
 ...Add-an-option-to-disable-CJK-codecs.patch} |   2 +-
 ...> 0020-Add-an-option-to-disable-NIS.patch} |   2 +-
 ...dd-an-option-to-disable-unicodedata.patch} |   2 +-
 ... 0022-Add-an-option-to-disable-IDLE.patch} |  51 +++---
 ...23-Add-an-option-to-disable-decimal.patch} |   6 +-
 ...n-to-disable-the-ossaudiodev-module.patch} |   2 +-
 ...n-option-to-disable-openssl-support.patch} |   6 +-
 ...tion-to-disable-the-readline-module.patch} |   6 +-
 ...o-disable-zlib-bzip2-and-xz-modules.patch} |   6 +-
 ...hon-config.sh-don-t-reassign-prefix.patch} |   4 +-
 ...Fix-cross-compiling-the-uuid-module.patch} |   2 +-
 ...dd-an-option-to-disable-uuid-module.patch} |   6 +-
 ...fix-building-on-older-distributions.patch} |   0
 ...p-CC-print-multiarch-output-for-mus.patch} |   2 +-
 ...on-to-disable-the-berkeleydb-module.patch} |   6 +-
 ...ng-doesn-t-set-errno-when-encryptio.patch} |   0
 ...eration-error-in-_ExecutorManagerTh.patch} |   0
 package/python3/python3.hash                  |   8 +-
 package/python3/python3.mk                    |   4 +-
 package/util-linux/util-linux.hash            |   4 +-
 package/util-linux/util-linux.mk              |   2 +-
 64 files changed, 474 insertions(+), 629 deletions(-)
 delete mode 100644 package/python-matplotlib/0001-Fix-invalid-inclusion-headers.patch
 delete mode 100644 package/python-matplotlib/0002-Merge-pull-request-11983-from-anntzer-builddepchecks.patch
 create mode 100644 package/python-matplotlib/setup.cfg
 create mode 100644 package/python-pyalsa/0001-fix-pytuple-set-item-usage-no-return-value.patch
 rename package/python-setuptools/{ => 44.0.0}/0001-add-executable.patch (100%)
 rename package/python-setuptools/{ => 44.0.0}/python-setuptools.hash (100%)
 create mode 100644 package/python-setuptools/58.2.0/0001-add-executable.patch
 create mode 100644 package/python-setuptools/58.2.0/python-setuptools.hash
 delete mode 100644 package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
 rename package/python3/{0014-Add-an-option-to-disable-pydoc.patch => 0013-Add-an-option-to-disable-pydoc.patch} (74%)
 rename package/python3/{0015-Add-an-option-to-disable-lib2to3.patch => 0014-Add-an-option-to-disable-lib2to3.patch} (67%)
 rename package/python3/{0016-Add-option-to-disable-the-sqlite3-module.patch => 0015-Add-option-to-disable-the-sqlite3-module.patch} (63%)
 rename package/python3/{0017-Add-an-option-to-disable-the-tk-module.patch => 0016-Add-an-option-to-disable-the-tk-module.patch} (52%)
 rename package/python3/{0018-Add-an-option-to-disable-the-curses-module.patch => 0017-Add-an-option-to-disable-the-curses-module.patch} (64%)
 rename package/python3/{0019-Add-an-option-to-disable-expat.patch => 0018-Add-an-option-to-disable-expat.patch} (76%)
 rename package/python3/{0020-Add-an-option-to-disable-CJK-codecs.patch => 0019-Add-an-option-to-disable-CJK-codecs.patch} (94%)
 rename package/python3/{0021-Add-an-option-to-disable-NIS.patch => 0020-Add-an-option-to-disable-NIS.patch} (95%)
 rename package/python3/{0022-Add-an-option-to-disable-unicodedata.patch => 0021-Add-an-option-to-disable-unicodedata.patch} (95%)
 rename package/python3/{0023-Add-an-option-to-disable-IDLE.patch => 0022-Add-an-option-to-disable-IDLE.patch} (69%)
 rename package/python3/{0024-Add-an-option-to-disable-decimal.patch => 0023-Add-an-option-to-disable-decimal.patch} (95%)
 rename package/python3/{0025-Add-an-option-to-disable-the-ossaudiodev-module.patch => 0024-Add-an-option-to-disable-the-ossaudiodev-module.patch} (97%)
 rename package/python3/{0026-Add-an-option-to-disable-openssl-support.patch => 0025-Add-an-option-to-disable-openssl-support.patch} (89%)
 rename package/python3/{0027-Add-an-option-to-disable-the-readline-module.patch => 0026-Add-an-option-to-disable-the-readline-module.patch} (90%)
 rename package/python3/{0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch => 0027-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch} (92%)
 rename package/python3/{0029-python-config.sh-don-t-reassign-prefix.patch => 0028-python-config.sh-don-t-reassign-prefix.patch} (97%)
 rename package/python3/{0030-Fix-cross-compiling-the-uuid-module.patch => 0029-Fix-cross-compiling-the-uuid-module.patch} (96%)
 rename package/python3/{0031-Add-an-option-to-disable-uuid-module.patch => 0030-Add-an-option-to-disable-uuid-module.patch} (88%)
 rename package/python3/{0032-fix-building-on-older-distributions.patch => 0031-fix-building-on-older-distributions.patch} (100%)
 rename package/python3/{0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch => 0032-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch} (98%)
 rename package/python3/{0034-Add-an-option-to-disable-the-berkeleydb-module.patch => 0033-Add-an-option-to-disable-the-berkeleydb-module.patch} (88%)
 rename package/python3/{0035-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch => 0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} (100%)
 rename package/python3/{0036-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch => 0035-Fix-dictionary-iteration-error-in-_ExecutorManagerTh.patch} (100%)

-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
