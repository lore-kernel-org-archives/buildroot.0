Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1765FC61DF4
	for <buildroot@archiver.kernel.org>; Fri, 24 Nov 2023 16:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97524421D1;
	Fri, 24 Nov 2023 16:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97524421D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HNBArs9VnuW4; Fri, 24 Nov 2023 16:16:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC302421B5;
	Fri, 24 Nov 2023 16:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC302421B5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 192B71BF29A
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 16:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E423D41A79
 for <buildroot@lists.busybox.net>; Fri, 24 Nov 2023 16:16:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E423D41A79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pcl6RjpOZvpU for <buildroot@lists.busybox.net>;
 Fri, 24 Nov 2023 16:16:01 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69CB841A7E
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 16:16:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69CB841A7E
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c503da4fd6so25583101fa.1
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 08:16:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700842559; x=1701447359;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r1h1NgHWEUoftj8HEWPO+aFt1R/6NsULVA+oh1/ecFo=;
 b=Ebok2UgfLkdzfwXiX6kq4p+0/rqONtA8AJW0/y03tDb7MlROG+pqKIUDgfWJRtSyPH
 78QwJFAy5aIu5jOZX89GaXKBIZ1/LPqdOjpQVVVWD3gjrbhQXCjiYrWfOz5oo64Qyrn2
 +nn9PY72SnDrtiwXyjwqX2cOv/XMns42vOMnrISP27dQVRnNHuO5djWH7Sf/YvNOvlq5
 J/qsZ3CD5tWm0xyaqFucd7uJBJtC0o0TvgZTY2bmKtR8yKazs7qaRilU3UK4JFFZcFAO
 c/bGb+/ZmVnsrkcL6jboXcKpGrdpM3dhQcOROYbG9XU7APrlwG/QSD/v592nwuvNu7zi
 McIQ==
X-Gm-Message-State: AOJu0YzBCS6c/sWWv/us6pxLlHjXNS845x9MAu3PZ3kfrqUEHdK4rqS6
 rBl5i3w3L5ocuCAs/TqBHO3hsngB1FoyaKn/a/7B0C1+
X-Google-Smtp-Source: AGHT+IG9hxT1xXqYRk8dnbK42yfLyhzuOXC5v48XoeGaH+PPQwANIWScaWxCBf4CLGSPZSM9M7KHIQ==
X-Received: by 2002:a2e:9587:0:b0:2c5:24a8:c22d with SMTP id
 w7-20020a2e9587000000b002c524a8c22dmr2584457ljh.3.1700842559018; 
 Fri, 24 Nov 2023 08:15:59 -0800 (PST)
Received: from P-NAN-KHNOUM.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 fm20-20020a05600c0c1400b0040b297fce5fsm6147325wmb.10.2023.11.24.08.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 08:15:58 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 17:15:16 +0100
Message-Id: <20231124161523.215078-1-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1700842559; x=1701447359;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r1h1NgHWEUoftj8HEWPO+aFt1R/6NsULVA+oh1/ecFo=;
 b=x49y6ISVQ0PQ7v+F1QPwKeGQMch/eHsTb6Waapm91tPMMrXaqyJ/JQM7j2nHHhkj0h
 jwMuBMklczhHyYxyOWlh81k/vs/bkgDgc5xjioT2+NyV87Kv2QoTtC57WiSC6+EHYQ/o
 tvCAxwSSS7Ld3sJxPtUJ2ysbmDgnrZH08M28qkYAIGqlpRMZabT6vomaOvivTmCXHU/d
 WkLbMBn/XINt9Z2T7gE83fWttTBGXK9sHPElsKNBJBfhJAhryAtkAu9QwzPhXPb7HS43
 OnMiIcye/PG1ZxUXwmom0I1n2lVxmYUZu++pC4+ImM6JPobM1lZsvWT48DdPir3BnqWv
 iMIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=x49y6ISV
Subject: [Buildroot] [[DO NOT MERGE] v3 0/7] Add rusticl support.
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>, romain.naour@smile.fr,
 bernd@kuhls.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This serie allows to build mesa3d with rusticl support.

Compared to the previous series, this one upgrade meson to 1.3.0
and adds a patch to allow mesa to find opencl-c-base.h on target.
Those two new patches are not meant to be merged but are here to
be discussed.

First, as described in the commit log, the patch to upgrade meson
from 1.1.1 to 1.2.0 was reverted because while building host-qemu,
the libraries were searched in the building machine. The new version
of meson fixes this issue thanks to this commit:
https://gitlab.com/qemu-project/qemu/-/commit/Fc9a809e0d28417fa1e7f7efc19f845bda4c1be9
However, this commit deals with the way glib is detected and given
to meson but doesn't affect the way meson search for libraries.
So, it can be possible that the issue is still present with other
packages. Indeed, meson shouldn't search for libraries in the
building machine even if a dependency is overridden by a package.
Here is why the upgrade have been reverted:
https://gitlab.com/buildroot.org/buildroot/-/commit/acfdf21f0b752e844a33c70a0fd2f82f4534a5a0

Secondly, the patch that defines LLVM_LIB_DIR to /usr/lib when
cross-compiling mesa is working inside buildroot but is not
accepted by upstream mesa. It is a work in progress solution.
See:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25568

Antoine Coutant (2):
  package/meson: bump version to 1.3.0
  package/llvm-project: add opencl-c-base.h on target

Romain Naour (3):
  package/pkg-meson.mk: add rust cross-compiler support
  package/spirv-llvm-translator: add target variant to provide
    LLVMSPIRVLib
  package/mesa3d: add RustiCL support

Sebastian Weyer (2):
  package/opencl-headers: new package
  package/opencl-icd-loader: new package

 DEVELOPERS                                    |  2 +
 package/Config.in                             |  3 ++
 package/llvm-project/clang/clang.mk           |  9 ++++
 ...LIB_DIR-to-usr-lib-when-cross-compil.patch | 45 +++++++++++++++++++
 package/mesa3d/Config.in                      | 19 +++++++-
 package/mesa3d/mesa3d.mk                      | 20 ++++++++-
 ...dencies-base.py-add-pkg_config_stati.patch | 29 ++++++------
 package/meson/meson.hash                      |  4 +-
 package/meson/meson.mk                        |  2 +-
 package/opencl-headers/Config.in              |  7 +++
 package/opencl-headers/opencl-headers.hash    |  3 ++
 package/opencl-headers/opencl-headers.mk      | 42 +++++++++++++++++
 package/opencl-icd-loader/Config.in           | 12 +++++
 .../opencl-icd-loader/opencl-icd-loader.hash  |  3 ++
 .../opencl-icd-loader/opencl-icd-loader.mk    | 19 ++++++++
 package/pkg-meson.mk                          | 13 ++++++
 package/spirv-llvm-translator/Config.in       | 22 +++++++++
 .../spirv-llvm-translator.mk                  | 12 ++++-
 support/misc/cross-compilation.conf.in        |  2 +
 19 files changed, 248 insertions(+), 20 deletions(-)
 create mode 100644 package/mesa3d/0005-clc-define-LLVM_LIB_DIR-to-usr-lib-when-cross-compil.patch
 create mode 100644 package/opencl-headers/Config.in
 create mode 100644 package/opencl-headers/opencl-headers.hash
 create mode 100644 package/opencl-headers/opencl-headers.mk
 create mode 100644 package/opencl-icd-loader/Config.in
 create mode 100644 package/opencl-icd-loader/opencl-icd-loader.hash
 create mode 100644 package/opencl-icd-loader/opencl-icd-loader.mk
 create mode 100644 package/spirv-llvm-translator/Config.in

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
