Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9392DE77187
	for <buildroot@archiver.kernel.org>; Wed, 18 Dec 2024 16:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3005560856;
	Wed, 18 Dec 2024 16:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ycp6MqFlFkq3; Wed, 18 Dec 2024 16:18:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF573606FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF573606FF;
	Wed, 18 Dec 2024 16:18:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 23E3DE3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 16:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 126A961405
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 16:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D7OsBVEb_ggx for <buildroot@buildroot.org>;
 Wed, 18 Dec 2024 16:18:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com;
 envelope-from=andreynech@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EC7F3606FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC7F3606FF
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC7F3606FF
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 16:18:17 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3eb3c143727so476686b6e.1
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 08:18:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734538697; x=1735143497;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AGwcgPhsIZ2yUyP7qhg9RGYsdIwSak2WfXuFazEVnB4=;
 b=f+OB4/QBvXnPvVEL20h6usDVBDYSLZKm8310x/YzKaTbTbs1FFCBrgAeOD55HGD3h/
 uWJRE6h+m84eVn1O2ivJPHyqV1BOBmr7ifbBpzQMnAMQktfgLbzHy1eAreeHHh5g35rO
 zZkvbr4xuLWC6ud98CuDKlqlQYk0s+ed/dFZ+g9mNbgZx/lUKBVCWihO23/VX/cX/IHD
 mRlf8NucL4LpSQ85MxnfstgAntHY12iMRmyn5wzanL0aZeDWHIlfTIqhWkYDj3i3FZg9
 PiF1t6BvTjsfzgSSmqGx74kGXy1X6mxk89wstUQGT7eIBA0DHyNCjCC7jT1AGXEyFRXo
 BmZA==
X-Gm-Message-State: AOJu0YzZZ1cpT8e4074gtcok/VwsjOn0TQlrajUhJYWIf46D5yeaV+2P
 vEQKbIu1aWyUL43Tg82Gd4CbGCKHuEOGI/FjSjtyF9aSHeGjMdovBW+hjptqrHUliG1ZHOHCztS
 COj11GfX+P0K0xpIh+0taj7LwS3E=
X-Gm-Gg: ASbGnctpuE6Rtlt8OHrHa3nl1qceTMoGaxQraCRNDywACYJcqQuTFWGWwrEJ9747ZgK
 63MZjU4gQVU8mMyuaMOfRGFn6QS1DrfwRpQATew==
X-Google-Smtp-Source: AGHT+IFtlvTAJlH3EwNgTJjKhZWhQp1rJY0dHB2ZdXZNe48TAMIR9GtI10JLr0bTDm4g/41aNGNKfZhb/EF52PDl0Z8=
X-Received: by 2002:a05:6808:13d3:b0:3ea:3672:e638 with SMTP id
 5614622812f47-3eccd0013c3mr2456453b6e.3.1734538696660; Wed, 18 Dec 2024
 08:18:16 -0800 (PST)
MIME-Version: 1.0
References: <CAOiXNkBXaWBGL7D2FAbs+HQ-CQvF6Gt3Xw3s3Zr8T8Br5AvoBA@mail.gmail.com>
 <be38d9eb-4d8d-4da4-bc94-e4093a79c206@mind.be>
 <CAOiXNkDqh6Q=s4o8u0SapkcajBKE=Sdd-X312N61P6md2v2EVw@mail.gmail.com>
In-Reply-To: <CAOiXNkDqh6Q=s4o8u0SapkcajBKE=Sdd-X312N61P6md2v2EVw@mail.gmail.com>
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Wed, 18 Dec 2024 17:18:05 +0100
Message-ID: <CAOiXNkAc2J9q8GkkweddmNQuBS-0L+RuGYvh4Ug94rOX8+C_GQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734538697; x=1735143497; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AGwcgPhsIZ2yUyP7qhg9RGYsdIwSak2WfXuFazEVnB4=;
 b=lrd2jFQpwe1aNQxHW+yZvwtnzWNeEDr7JyxTy+Ei1acn5iaU6i6WKM/C2NyWPzObQm
 Dyu9rP/UCGzeWChxilOTO7xylkGuMio142+QbHCD2gnSabGi0Z4/mcessstkrjTnTf8O
 +rBLmeUQTyADvoTwAcgPKOcy8Q5fKXd2RjY4VNg6b1u6z5DMwxRM96aZ4itDg0uzP2r6
 CbOJhwwoqAnGpyJtRvmcsx0y7+EyPLQWB8DihunaRrwCQI05WASakTxOIdArS01g4w6O
 n+LuyXbDOknSaa15ehxIel9KeWzBBQhK+/dJUQ+x+uJc2w25UIE7MbNwYMDXVVbPHCqG
 cnjA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lrd2jFQp
Subject: Re: [Buildroot] Problem compiling grpc package with BR 2024.11
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
Cc: Robert Rose <robertroyrose@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 18 Dec 2024 at 13:09, Andrey Nechypurenko <andreynech@gmail.com> wrote:
>
> On Mon, 16 Dec 2024 at 21:24, Arnout Vandecappelle <arnout@mind.be> wrote:
> >
> >
> >
> > On 11/12/2024 14:24, Andrey Nechypurenko wrote:
> > > Hi Buildrooters,
> > >
> > > I am trying to move our project from the older Buildroot version to
> > > 2024.11 and facing a problem compiling the grpc package. As far as I
> > > can tell, it is caused by incompatibility with the version of Abseil
> > > library (missing absl::StrXXX functions, etc.).
> > >
> > > It looks like 2024.08 does not have this problem. So my question is if
> > > someone else is facing this issue and if there is a solution for it?
> >
> >   You're not the only one, it also happens in the autobuilders[1].
> >
> >   It might be fixed with a version bump. Can you try to apply the existing
> > version bump patch[2] and see if that helps?
> >
> >   Regards,
> >   Arnout
> >
> > [1] http://autobuild.buildroot.net/?reason=grpc%25
> > [2]
> > https://patchwork.ozlabs.org/project/buildroot/patch/20241107191634.378670-3-james.hilliard1@gmail.com/
>
> Unfortunately, it still doesn't work. Building host-grpc failed:
>
> CMake Error at cmake/protobuf.cmake:58 (find_package):
>   Could not find a package configuration file provided by "Protobuf" with any
>   of the following names:
>
>     ProtobufConfig.cmake
>     protobuf-config.cmake
>
>   Add the installation prefix of "Protobuf" to CMAKE_PREFIX_PATH or set
>   "Protobuf_DIR" to a directory containing one of the above files.  If
>   "Protobuf" provides a separate development package or SDK, be sure it has
>   been installed.
> Call Stack (most recent call first):
>   CMakeLists.txt:387 (include)
>
>
> -- Configuring incomplete, errors occurred!

This problem is caused by the fact that the protobuf package is built with
autotools and not with cmake. Grpc package was looking for cmake files from
protobuf and did not find them. I was able to solve this problem by changing
protobuf package type from autotools to cmake (plus a couple of other minor
changes). I think this step makes anyway sense, because it looks like the
newer protobuf versions does not support autotools anymore and moved
completely to cmake.

With your patch mentioned above and the following changes I was able to
build the grpc package.

diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 8cd4e99e06..5fc1a20a5e 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,8 +7,8 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 21.12
-PROTOBUF_SOURCE = protobuf-cpp-3.$(PROTOBUF_VERSION).tar.gz
+PROTOBUF_VERSION = 29.1
+PROTOBUF_SOURCE = protobuf-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE =
https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
@@ -16,7 +16,8 @@ PROTOBUF_CPE_ID_VENDOR = google

 # N.B. Need to use host protoc during cross compilation.
 PROTOBUF_DEPENDENCIES = host-protobuf
-PROTOBUF_CONF_OPTS = --with-protoc=$(HOST_DIR)/bin/protoc
+PROTOBUF_CONF_OPTS += -Dprotobuf_BUILD_TESTS=OFF
-Dprotobuf_ABSL_PROVIDER=package
+HOST_PROTOBUF_CONF_OPTS += -Dprotobuf_BUILD_TESTS=OFF
-Dprotobuf_ABSL_PROVIDER=package

 PROTOBUF_CXXFLAGS = $(TARGET_CXXFLAGS)

@@ -47,5 +48,5 @@ endef

 PROTOBUF_POST_INSTALL_TARGET_HOOKS += PROTOBUF_REMOVE_UNNECESSARY_TARGET_FILES

-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))


After these changes, python-protobuf was failing :-) . So I made the
following changes which fixes the build error. But honestly I have no idea
if they are correct :-) .


diff --git a/package/python-protobuf/python-protobuf.mk
b/package/python-protobuf/python-protobuf.mk
index df90254670..e7a1cdf3fb 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -5,12 +5,12 @@
 ################################################################################

 PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
-PYTHON_PROTOBUF_SOURCE = protobuf-python-4.$(PYTHON_PROTOBUF_VERSION).tar.gz
+PYTHON_PROTOBUF_SOURCE = protobuf-$(PYTHON_PROTOBUF_VERSION).tar.gz
 PYTHON_PROTOBUF_SITE = $(PROTOBUF_SITE)
 PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
 PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
 PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
 PYTHON_PROTOBUF_SETUP_TYPE = setuptools
-PYTHON_PROTOBUF_SUBDIR = python
+PYTHON_PROTOBUF_SUBDIR = python/protobuf_distutils

 $(eval $(python-package))

I hope these observations could be helpful for corresponding package
maintainers to properly fix them.

Regards,
Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
