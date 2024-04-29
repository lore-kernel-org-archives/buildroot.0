Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF22C4345F
	for <buildroot@archiver.kernel.org>; Mon, 29 Apr 2024 14:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AFF540096;
	Mon, 29 Apr 2024 14:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIFWSLEULa2R; Mon, 29 Apr 2024 14:48:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2103440506
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2103440506;
	Mon, 29 Apr 2024 14:48:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E5971BF488
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 14:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DD58607E0
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 14:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WeAbgdfqsx3s for <buildroot@lists.busybox.net>;
 Mon, 29 Apr 2024 14:48:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=vfazio@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A45D16080C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A45D16080C
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A45D16080C
 for <buildroot@buildroot.org>; Mon, 29 Apr 2024 14:48:13 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56e48d0a632so7088065a12.2
 for <buildroot@buildroot.org>; Mon, 29 Apr 2024 07:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714402091; x=1715006891;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ly9mkKumKqIIamjbQfwqWcFboB2o1VOpfRnNRr5PNLE=;
 b=cjnNgV0KJGWsDosXB+8Lfued1YrBwdc/+JQ6uZf5eS4OLKgt9ImSt9EuznFGdRqZLU
 ZyaebzK7y+R0MJsqoxm6AtRmT6U2c2Pyh5lLr/AK4TVtZS11+2i0V5TwD7jyNBL6FaHy
 6O0NyltaV9cFLhSBNa28cwlpJlokhLEJ+mc4Xdt63ikk8FVUYWyciu2vLo0gIqj4XY7e
 YUKzCfdR7PO03o3l2DMaQmrmEDHvpvVB/YuP9nJ6oPxvVbevo7bvzuB/MBWuY5ZaHwCx
 LGGLzgztTzUmhDHy3z5xuxoJi/dyp07dkfmt9HckliRHCw9XYZVtoaabZ9VRsr0p7iEp
 veZQ==
X-Gm-Message-State: AOJu0YyV1GhMylMFPcjIJj5+YhCCQvj41qCHk2TS3UMlDmvrpdSBpsnB
 5N34Nq8nJvK6BsE9PgMoBpATU1P9S1iA6v4+MgGB++9+NH2AyNx1wDEg3129NA6cORPmqVHRAv4
 aJoi4Ewo9GmSlZPn4jvXykKTUL2U=
X-Google-Smtp-Source: AGHT+IGXWjZHq/lZElAFyYVNPfnCeikI6aV2wHDPbAuhHTFzcvOPg8xM/stbTGX3hkSKXhnYXV4EpiXV9YXtHPvD6Eg=
X-Received: by 2002:a50:c34d:0:b0:572:4e6b:958 with SMTP id
 q13-20020a50c34d000000b005724e6b0958mr9293976edb.2.1714402091259; Mon, 29 Apr
 2024 07:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240428024210.11950-1-vfazio@gmail.com>
 <Zi9g19sCVPBE8Oin@landeda>
In-Reply-To: <Zi9g19sCVPBE8Oin@landeda>
From: Vincent Fazio <vfazio@gmail.com>
Date: Mon, 29 Apr 2024 09:48:00 -0500
Message-ID: <CAOrEah64qKk0gWL-6-VdXi22HkaybgMaAF1Lfq9tbNU7bJnUQQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714402091; x=1715006891; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ly9mkKumKqIIamjbQfwqWcFboB2o1VOpfRnNRr5PNLE=;
 b=YB/R09YjdBsmsn3dJlCpP27KeAGfXeBXtv8OIx/B1AcEazwHb7dvMsR6v35BhPZS7e
 ANFuJq1FHXOIVD7ikNiJjiiT6IYb4GEXUMDdKXT3FxXha0XCdRX0afa1O7gfeIS0T/WZ
 Y7QjNZ0Furpzz+9i4C4FMGHFBAAhKwdE9cAYCzo4jf78jH0jmpJ5yVBcrE1rvtWOyZF3
 riji6W4rFFAZDet8t78kVn23IsawjuECkvz+/0bhi+lVAic+1YV7CpLNI3MXrgwtiC0a
 efD7xWiHpbBHYd8SBTXEgTaS47uVLirPz3gxtFuXWAR9+kkXxf1OGdKuT2W4LvlVqepc
 dfNQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YB/R09Yj
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: drop unnecessary
 patches
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3019759719142894738=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3019759719142894738==
Content-Type: multipart/alternative; boundary="000000000000a6de4506173d57ee"

--000000000000a6de4506173d57ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yann,

On Mon, Apr 29, 2024 at 3:57=E2=80=AFAM Yann E. MORIN <yann.morin.1998@free=
.fr>
wrote:

> Vincent, All,
>
> Thanks for tackling this python mess!
>
> On 2024-04-27 21:42 -0500, Vincent Fazio spake thusly:
> > Patches 0004 and 0009 relied upon environment variables that were no
> > longer set after python3-010-distutils-cross-compilation-support.patch
> > was dropped during the transition to Python 3.4 in commit 0d327c26.
>
> 0004 and 0009 use the _python_sysroot env variable, and it is still set
> in the environment when we build python packages:
>
>     $ git grep -n _python_sysroot
>     package/pkg-python.mk:45:       _python_sysroot=3D$(STAGING_DIR) \
>
> It is totally possible that those patches are no longer needed for other
> reasons, though, but not that one.
>
>

Nice catch... I ran a build, some unit tests, and some old failing configs
and
didn't see issues so I will look at the history of these patches to see wha=
t
caused their inclusion and see if I can either reproduce them or account
for why
they are no longer needed.

For now, I will not plan to split them off since renumbering the patches is
a
PITA and I'd rather that only be done once.


Regards,
> Yann E. MORIN.
>
> > Patches 0010 and 0026 (see [0] [1] [2]) can be removed due to a fix
> > introduced in 3.7 [3].
> >
> > Patch 0029 can be dropped since commit 3fed4245 removed the dependency
> > on a host provided python to build host-python3.
> >
> > [0]: https://github.com/python/cpython/issues/67096
> > [1]: https://github.com/python/cpython/issues/75894
> > [2]: https://github.com/python/cpython/issues/66338
> > [3]:
> https://github.com/python/cpython/commit/14086cfc5eed8c5e78342d79e5db87a1=
35d75fa8
> >
> > Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> > ---
> >  .checkpackageignore                           | 51 +++++++-------
> >  ...y-header-paths-for-cross-compilation.patch | 69 -------------------
> >  ...ok-in-usr-lib-termcap-for-libraries.patch} |  0
> >  ...h =3D> 0005-Don-t-add-multiarch-paths.patch} |  0
> >  ...> 0006-Abort-on-failed-module-build.patch} |  0
> >  ...tch =3D> 0007-Serial-ioctl-workaround.patch} |  0
> >  ...0008-Add-an-option-to-disable-pydoc.patch} |  0
> >  ...09-Add-an-option-to-disable-lib2to3.patch} |  0
> >  ...e-shebang-of-Python-scripts-for-cros.patch | 35 ----------
> >  ...ption-to-disable-the-sqlite3-module.patch} |  0
> >  ...ig.sh.in-ensure-sed-invocations-only.patch | 67 ------------------
> >  ...-an-option-to-disable-the-tk-module.patch} |  0
> >  ...option-to-disable-the-curses-module.patch} |  0
> >  ...0013-Add-an-option-to-disable-expat.patch} |  0
> >  ...Add-an-option-to-disable-CJK-codecs.patch} |  0
> >  ...> 0015-Add-an-option-to-disable-NIS.patch} |  0
> >  ...dd-an-option-to-disable-unicodedata.patch} |  0
> >  ... 0017-Add-an-option-to-disable-IDLE.patch} |  0
> >  ...18-Add-an-option-to-disable-decimal.patch} |  0
> >  ...n-to-disable-the-ossaudiodev-module.patch} |  0
> >  ...n-option-to-disable-openssl-support.patch} |  0
> >  ...tion-to-disable-the-readline-module.patch} |  0
> >  ...o-disable-zlib-bzip2-and-xz-modules.patch} |  0
> >  ...dd-an-option-to-disable-uuid-module.patch} |  0
> >  ...p-CC-print-multiarch-output-for-mus.patch} |  0
> >  ...on-to-disable-the-berkeleydb-module.patch} |  0
> >  ...ng-doesn-t-set-errno-when-encryptio.patch} |  0
> >  ...thon-config.sh-don-t-reassign-prefix.patch | 53 --------------
> >  ...ss-compiles-when-host-and-target-us.patch} |  0
> >  ...-fix-building-on-older-distributions.patch | 47 -------------
> >  30 files changed, 23 insertions(+), 299 deletions(-)
> >  delete mode 100644
> package/python3/0004-Adjust-library-header-paths-for-cross-compilation.pa=
tch
> >  rename
> package/python3/{0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch =
=3D>
> 0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch} (100%)
> >  rename package/python3/{0006-Don-t-add-multiarch-paths.patch =3D>
> 0005-Don-t-add-multiarch-paths.patch} (100%)
> >  rename package/python3/{0007-Abort-on-failed-module-build.patch =3D>
> 0006-Abort-on-failed-module-build.patch} (100%)
> >  rename package/python3/{0008-Serial-ioctl-workaround.patch =3D>
> 0007-Serial-ioctl-workaround.patch} (100%)
> >  rename package/python3/{0011-Add-an-option-to-disable-pydoc.patch =3D>
> 0008-Add-an-option-to-disable-pydoc.patch} (100%)
> >  rename package/python3/{0012-Add-an-option-to-disable-lib2to3.patch =
=3D>
> 0009-Add-an-option-to-disable-lib2to3.patch} (100%)
> >  delete mode 100644
> package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros=
.patch
> >  rename
> package/python3/{0013-Add-option-to-disable-the-sqlite3-module.patch =3D>
> 0010-Add-option-to-disable-the-sqlite3-module.patch} (100%)
> >  delete mode 100644
> package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only=
.patch
> >  rename
> package/python3/{0014-Add-an-option-to-disable-the-tk-module.patch =3D>
> 0011-Add-an-option-to-disable-the-tk-module.patch} (100%)
> >  rename
> package/python3/{0015-Add-an-option-to-disable-the-curses-module.patch =
=3D>
> 0012-Add-an-option-to-disable-the-curses-module.patch} (100%)
> >  rename package/python3/{0016-Add-an-option-to-disable-expat.patch =3D>
> 0013-Add-an-option-to-disable-expat.patch} (100%)
> >  rename package/python3/{0017-Add-an-option-to-disable-CJK-codecs.patch
> =3D> 0014-Add-an-option-to-disable-CJK-codecs.patch} (100%)
> >  rename package/python3/{0018-Add-an-option-to-disable-NIS.patch =3D>
> 0015-Add-an-option-to-disable-NIS.patch} (100%)
> >  rename package/python3/{0019-Add-an-option-to-disable-unicodedata.patc=
h
> =3D> 0016-Add-an-option-to-disable-unicodedata.patch} (100%)
> >  rename package/python3/{0020-Add-an-option-to-disable-IDLE.patch =3D>
> 0017-Add-an-option-to-disable-IDLE.patch} (100%)
> >  rename package/python3/{0021-Add-an-option-to-disable-decimal.patch =
=3D>
> 0018-Add-an-option-to-disable-decimal.patch} (100%)
> >  rename
> package/python3/{0022-Add-an-option-to-disable-the-ossaudiodev-module.pat=
ch
> =3D> 0019-Add-an-option-to-disable-the-ossaudiodev-module.patch} (100%)
> >  rename
> package/python3/{0023-Add-an-option-to-disable-openssl-support.patch =3D>
> 0020-Add-an-option-to-disable-openssl-support.patch} (100%)
> >  rename
> package/python3/{0024-Add-an-option-to-disable-the-readline-module.patch =
=3D>
> 0021-Add-an-option-to-disable-the-readline-module.patch} (100%)
> >  rename
> package/python3/{0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.pa=
tch
> =3D> 0022-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch} (100%)
> >  rename package/python3/{0027-Add-an-option-to-disable-uuid-module.patc=
h
> =3D> 0023-Add-an-option-to-disable-uuid-module.patch} (100%)
> >  rename
> package/python3/{0029-configure.ac-fixup-CC-print-multiarch-output-for-mu=
s.patch
> =3D> 0024-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch} (10=
0%)
> >  rename
> package/python3/{0030-Add-an-option-to-disable-the-berkeleydb-module.patc=
h
> =3D> 0025-Add-an-option-to-disable-the-berkeleydb-module.patch} (100%)
> >  rename
> package/python3/{0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encrypti=
o.patch
> =3D> 0026-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} (10=
0%)
> >  delete mode 100644
> package/python3/0026-python-config.sh-don-t-reassign-prefix.patch
> >  rename
> package/python3/{0032-gh-115382-Fix-cross-compiles-when-host-and-target-u=
s.patch
> =3D> 0027-gh-115382-Fix-cross-compiles-when-host-and-target-us.patch} (10=
0%)
> >  delete mode 100644
> package/python3/0028-fix-building-on-older-distributions.patch
> >
> > diff --git a/.checkpackageignore b/.checkpackageignore
> > index 1b336ce7a3..eec47fdaa4 100644
> > --- a/.checkpackageignore
> > +++ b/.checkpackageignore
> > @@ -1045,34 +1045,29 @@
> package/python-ws4py/0001-Adjust-ws4py-for-Python-3.7-syntax.patch
> lib_patch.Ups
> >  package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
> lib_patch.Upstream
> >
> package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-=
.patch
> lib_patch.Upstream
> >
> package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e=
.patch
> lib_patch.Upstream
> >
> -package/python3/0004-Adjust-library-header-paths-for-cross-compilation.p=
atch
> lib_patch.Upstream
> > -package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
> lib_patch.Upstream
> > -package/python3/0006-Don-t-add-multiarch-paths.patch lib_patch.Upstrea=
m
> > -package/python3/0007-Abort-on-failed-module-build.patch
> lib_patch.Upstream
> > -package/python3/0008-Serial-ioctl-workaround.patch lib_patch.Upstream
> >
> -package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cro=
s.patch
> lib_patch.Upstream
> >
> -package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-onl=
y.patch
> lib_patch.Upstream
> > -package/python3/0011-Add-an-option-to-disable-pydoc.patch
> lib_patch.Upstream
> > -package/python3/0012-Add-an-option-to-disable-lib2to3.patch
> lib_patch.Upstream
> > -package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch
> lib_patch.Upstream
> > -package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
> lib_patch.Upstream
> > -package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
> lib_patch.Upstream
> > -package/python3/0016-Add-an-option-to-disable-expat.patch
> lib_patch.Upstream
> > -package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
> lib_patch.Upstream
> > -package/python3/0018-Add-an-option-to-disable-NIS.patch
> lib_patch.Upstream
> > -package/python3/0019-Add-an-option-to-disable-unicodedata.patch
> lib_patch.Upstream
> > -package/python3/0020-Add-an-option-to-disable-IDLE.patch
> lib_patch.Upstream
> > -package/python3/0021-Add-an-option-to-disable-decimal.patch
> lib_patch.Upstream
> >
> -package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.pat=
ch
> lib_patch.Upstream
> > -package/python3/0023-Add-an-option-to-disable-openssl-support.patch
> lib_patch.Upstream
> > -package/python3/0024-Add-an-option-to-disable-the-readline-module.patc=
h
> lib_patch.Upstream
> >
> -package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.pa=
tch
> lib_patch.Upstream
> > -package/python3/0026-python-config.sh-don-t-reassign-prefix.patch
> lib_patch.Upstream
> > -package/python3/0027-Add-an-option-to-disable-uuid-module.patch
> lib_patch.Upstream
> > -package/python3/0028-fix-building-on-older-distributions.patch
> lib_patch.Upstream
> >
> -package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mu=
s.patch
> lib_patch.Upstream
> >
> -package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patc=
h
> lib_patch.Upstream
> >
> -package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encrypti=
o.patch
> lib_patch.Upstream
> > +package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch
> lib_patch.Upstream
> > +package/python3/0005-Don-t-add-multiarch-paths.patch lib_patch.Upstrea=
m
> > +package/python3/0006-Abort-on-failed-module-build.patch
> lib_patch.Upstream
> > +package/python3/0007-Serial-ioctl-workaround.patch lib_patch.Upstream
> > +package/python3/0008-Add-an-option-to-disable-pydoc.patch
> lib_patch.Upstream
> > +package/python3/0009-Add-an-option-to-disable-lib2to3.patch
> lib_patch.Upstream
> > +package/python3/0010-Add-option-to-disable-the-sqlite3-module.patch
> lib_patch.Upstream
> > +package/python3/0011-Add-an-option-to-disable-the-tk-module.patch
> lib_patch.Upstream
> > +package/python3/0012-Add-an-option-to-disable-the-curses-module.patch
> lib_patch.Upstream
> > +package/python3/0013-Add-an-option-to-disable-expat.patch
> lib_patch.Upstream
> > +package/python3/0014-Add-an-option-to-disable-CJK-codecs.patch
> lib_patch.Upstream
> > +package/python3/0015-Add-an-option-to-disable-NIS.patch
> lib_patch.Upstream
> > +package/python3/0016-Add-an-option-to-disable-unicodedata.patch
> lib_patch.Upstream
> > +package/python3/0017-Add-an-option-to-disable-IDLE.patch
> lib_patch.Upstream
> > +package/python3/0018-Add-an-option-to-disable-decimal.patch
> lib_patch.Upstream
> >
> +package/python3/0019-Add-an-option-to-disable-the-ossaudiodev-module.pat=
ch
> lib_patch.Upstream
> > +package/python3/0020-Add-an-option-to-disable-openssl-support.patch
> lib_patch.Upstream
> > +package/python3/0021-Add-an-option-to-disable-the-readline-module.patc=
h
> lib_patch.Upstream
> >
> +package/python3/0022-Add-options-to-disable-zlib-bzip2-and-xz-modules.pa=
tch
> lib_patch.Upstream
> > +package/python3/0023-Add-an-option-to-disable-uuid-module.patch
> lib_patch.Upstream
> >
> +package/python3/0024-configure.ac-fixup-CC-print-multiarch-output-for-mu=
s.patch
> lib_patch.Upstream
> >
> +package/python3/0025-Add-an-option-to-disable-the-berkeleydb-module.patc=
h
> lib_patch.Upstream
> >
> +package/python3/0026-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encrypti=
o.patch
> lib_patch.Upstream
> >  package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.patch
> lib_patch.Upstream
> >
> package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-header-for-CLONE_.pa=
tch
> lib_patch.Upstream
> >
> package/qextserialport/0001-Create-a-main-include-file-QExtSerialPort.pat=
ch
> lib_patch.Upstream
> > diff --git
> a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.=
patch
> b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.=
patch
> > deleted file mode 100644
> > index 9a55d2582d..0000000000
> > ---
> a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.=
patch
> > +++ /dev/null
> > @@ -1,69 +0,0 @@
> > -From 132b9dca3bb4d4682f7e318648ce11e1abb31b62 Mon Sep 17 00:00:00 2001
> > -From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > -Date: Wed, 23 Dec 2015 11:33:14 +0100
> > -Subject: [PATCH] Adjust library/header paths for cross-compilation
> > -
> > -When cross-compiling third-party extensions, the get_python_inc() or
> > -get_python_lib() can be called, to return the path to headers or
> > -libraries. However, they use the sys.prefix of the host Python, which
> > -returns incorrect paths when cross-compiling (paths pointing to host
> > -headers and libraries).
> > -
> > -In order to fix this, we introduce the _python_sysroot, _python_prefix
> > -and _python_exec_prefix variables, that allow to override these
> > -values, and get correct header/library paths when cross-compiling
> > -third-party Python modules.
> > -
> > -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > -Signed-off-by: Adam Duskett <aduskett@gmail.com>
> > -Refresh for 3.10.0
> > ----
> > - Lib/distutils/command/build_ext.py |  5 ++++-
> > - Lib/sysconfig.py                   | 15 +++++++++++----
> > - 2 files changed, 15 insertions(+), 5 deletions(-)
> > -
> > -diff --git a/Lib/distutils/command/build_ext.py
> b/Lib/distutils/command/build_ext.py
> > -index f287b34998..298234d6a1 100644
> > ---- a/Lib/distutils/command/build_ext.py
> > -+++ b/Lib/distutils/command/build_ext.py
> > -@@ -234,7 +234,10 @@ def finalize_options(self):
> > -         if (sysconfig.get_config_var('Py_ENABLE_SHARED')):
> > -             if not sysconfig.python_build:
> > -                 # building third party extensions
> > --
> self.library_dirs.append(sysconfig.get_config_var('LIBDIR'))
> > -+                libdir =3D sysconfig.get_config_var('LIBDIR')
> > -+                if "_python_sysroot" in os.environ:
> > -+                    libdir =3D os.environ.get("_python_sysroot") + li=
bdir
> > -+                self.library_dirs.append(libdir)
> > -             else:
> > -                 # building python standard extensions
> > -                 self.library_dirs.append('.')
> > -diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py
> > -index ebe3711827..6328ec41af 100644
> > ---- a/Lib/sysconfig.py
> > -+++ b/Lib/sysconfig.py
> > -@@ -168,10 +168,17 @@ def joinuser(*args):
> > - _PY_VERSION =3D sys.version.split()[0]
> > - _PY_VERSION_SHORT =3D f'{sys.version_info[0]}.{sys.version_info[1]}'
> > - _PY_VERSION_SHORT_NO_DOT =3D
> f'{sys.version_info[0]}{sys.version_info[1]}'
> > --_PREFIX =3D os.path.normpath(sys.prefix)
> > --_BASE_PREFIX =3D os.path.normpath(sys.base_prefix)
> > --_EXEC_PREFIX =3D os.path.normpath(sys.exec_prefix)
> > --_BASE_EXEC_PREFIX =3D os.path.normpath(sys.base_exec_prefix)
> > -+if "_python_sysroot" in os.environ:
> > -+    _sysroot=3Dos.environ.get('_python_sysroot')
> > -+    _PREFIX =3D os.path.normpath(_sysroot +
> os.environ.get('_python_prefix'))
> > -+    _EXEC_PREFIX =3D os.path.normpath(_sysroot +
> os.environ.get('_python_exec_prefix'))
> > -+    _BASE_PREFIX =3D _PREFIX
> > -+    _BASE_EXEC_PREFIX =3D _EXEC_PREFIX
> > -+else:
> > -+    _PREFIX =3D os.path.normpath(sys.prefix)
> > -+    _EXEC_PREFIX =3D os.path.normpath(sys.exec_prefix)
> > -+    _BASE_PREFIX =3D os.path.normpath(sys.base_prefix)
> > -+    _BASE_EXEC_PREFIX =3D os.path.normpath(sys.base_exec_prefix)
> > - _CONFIG_VARS =3D None
> > - _USER_BASE =3D None
> > -
> > ---
> > -2.34.1
> > -
> > diff --git
> a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
> b/package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch
> > similarity index 100%
> > rename from
> package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
> > rename to
> package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libraries.patch
> > diff --git a/package/python3/0006-Don-t-add-multiarch-paths.patch
> b/package/python3/0005-Don-t-add-multiarch-paths.patch
> > similarity index 100%
> > rename from package/python3/0006-Don-t-add-multiarch-paths.patch
> > rename to package/python3/0005-Don-t-add-multiarch-paths.patch
> > diff --git a/package/python3/0007-Abort-on-failed-module-build.patch
> b/package/python3/0006-Abort-on-failed-module-build.patch
> > similarity index 100%
> > rename from package/python3/0007-Abort-on-failed-module-build.patch
> > rename to package/python3/0006-Abort-on-failed-module-build.patch
> > diff --git a/package/python3/0008-Serial-ioctl-workaround.patch
> b/package/python3/0007-Serial-ioctl-workaround.patch
> > similarity index 100%
> > rename from package/python3/0008-Serial-ioctl-workaround.patch
> > rename to package/python3/0007-Serial-ioctl-workaround.patch
> > diff --git a/package/python3/0011-Add-an-option-to-disable-pydoc.patch
> b/package/python3/0008-Add-an-option-to-disable-pydoc.patch
> > similarity index 100%
> > rename from package/python3/0011-Add-an-option-to-disable-pydoc.patch
> > rename to package/python3/0008-Add-an-option-to-disable-pydoc.patch
> > diff --git a/package/python3/0012-Add-an-option-to-disable-lib2to3.patc=
h
> b/package/python3/0009-Add-an-option-to-disable-lib2to3.patch
> > similarity index 100%
> > rename from package/python3/0012-Add-an-option-to-disable-lib2to3.patch
> > rename to package/python3/0009-Add-an-option-to-disable-lib2to3.patch
> > diff --git
> a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cr=
os.patch
> b/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cr=
os.patch
> > deleted file mode 100644
> > index eff8fc7694..0000000000
> > ---
> a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cr=
os.patch
> > +++ /dev/null
> > @@ -1,35 +0,0 @@
> > -From 2439bd2ed5dbdd7e5fda15adefd0f6f1b047ec1b Mon Sep 17 00:00:00 2001
> > -From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> > -Date: Wed, 23 Dec 2015 11:44:30 +0100
> > -Subject: [PATCH] Do not adjust the shebang of Python scripts for
> > - cross-compilation
> > -
> > -The copy_scripts() method in distutils copies the scripts listed in
> > -the setup file and adjusts the first line to refer to the current
> > -Python interpreter. When cross-compiling, this means that the adjusted
> > -shebang refers to the host Python interpreter.
> > -
> > -This patch modifies copy_scripts() to preserve the shebang when
> > -cross-compilation is detected.
> > -
> > -Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
> > ----
> > - Lib/distutils/command/build_scripts.py | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/Lib/distutils/command/build_scripts.py
> b/Lib/distutils/command/build_scripts.py
> > -index ccc70e6465..d6d54195c1 100644
> > ---- a/Lib/distutils/command/build_scripts.py
> > -+++ b/Lib/distutils/command/build_scripts.py
> > -@@ -91,7 +91,7 @@ def copy_scripts(self):
> > -                     adjust =3D True
> > -                     post_interp =3D match.group(1) or b''
> > -
> > --            if adjust:
> > -+            if adjust and not '_python_sysroot' in os.environ:
> > -                 log.info("copying and adjusting %s -> %s", script,
> > -                          self.build_dir)
> > -                 updated_files.append(outfile)
> > ---
> > -2.34.1
> > -
> > diff --git
> a/package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch
> b/package/python3/0010-Add-option-to-disable-the-sqlite3-module.patch
> > similarity index 100%
> > rename from
> package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch
> > rename to
> package/python3/0010-Add-option-to-disable-the-sqlite3-module.patch
> > diff --git
> a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-on=
ly.patch
> b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-on=
ly.patch
> > deleted file mode 100644
> > index f26ee85b61..0000000000
> > ---
> a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-on=
ly.patch
> > +++ /dev/null
> > @@ -1,67 +0,0 @@
> > -From 55ef5552e4ee60266e3299f253bec3b13785e585 Mon Sep 17 00:00:00 2001
> > -From: Peter Korsgaard <peter@korsgaard.com>
> > -Date: Thu, 20 Nov 2014 13:24:59 +0100
> > -Subject: [PATCH] Misc/python-config.sh.in: ensure sed invocations only
> match
> > - beginning of strings
> > -
> > -The build/real prefix handling using sed breaks if build !=3D real and=
 the
> > -standard include / lib directories are used ($prefix/include and
> $prefix/lib).
> > -
> > -E.G.
> > -
> > -prefix_build=3D"/usr", libdir=3D"$prefix/lib", includedir=3D"$prefix/i=
nclude".
> > -
> > -If this gets installed with make DESTDIR=3D"/foo" install, then we end=
 up
> with
> > -prefix_real =3D prefix =3D "/foo/usr" as expected, but
> > -includedir=3D"/foo/foo/usr/include" and libdir=3D"/foo/foo/usr/lib" be=
cause
> of
> > -the double sed invocation (prefix is already expanded).  Work around i=
t
> by
> > -ensuring we only match the beginning of the string.
> > -
> > -Submitted upstream: http://bugs.python.org/issue22907
> > -
> > -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> > ----
> > - Misc/python-config.sh.in | 13 +++++++------
> > - 1 file changed, 7 insertions(+), 6 deletions(-)
> > -
> > -diff --git a/Misc/python-config.sh.in b/Misc/python-config.sh.in
> > -index 2602fe24c0..a1bc3cd5f7 100644
> > ---- a/Misc/python-config.sh.in
> > -+++ b/Misc/python-config.sh.in
> > -@@ -24,18 +24,19 @@ installed_prefix ()
> > -     echo $RESULT
> > - }
> > -
> > -+prefix_build=3D"@prefix@"
> > - prefix_real=3D$(installed_prefix "$0")
> > -
> > - # Use sed to fix paths from their built-to locations to their
> installed-to
> > - # locations. Keep prefix & exec_prefix using their original values in
> case
> > - # they are referenced in other configure variables, to prevent double
> > - # substitution, issue #22140.
> > --prefix=3D"@prefix@"
> > --exec_prefix=3D"@exec_prefix@"
> > -+prefix=3D$(echo "$prefix_build" | sed "s#^$prefix_build#$prefix_real#=
")
> > -+exec_prefix=3D$(echo "$exec_prefix_build" | sed
> "s#^$exec_prefix_build#$prefix_real#")
> > - exec_prefix_real=3D${prefix_real}
> > --includedir=3D$(echo "@includedir@" | sed "s#$prefix#$prefix_real#")
> > --libdir=3D$(echo "@libdir@" | sed "s#$prefix#$prefix_real#")
> > --CFLAGS=3D$(echo "@CFLAGS@" | sed "s#$prefix#$prefix_real#")
> > -+includedir=3D$(echo "@includedir@" | sed
> "s#^$prefix_build#$prefix_real#")
> > -+libdir=3D$(echo "@libdir@" | sed "s#^$prefix_build#$prefix_real#")
> > -+CFLAGS=3D$(echo "@CFLAGS@" | sed "s#^$prefix_build#$prefix_real#")
> > - VERSION=3D"@VERSION@"
> > - LIBM=3D"@LIBM@"
> > - LIBC=3D"@LIBC@"
> > -@@ -49,7 +50,7 @@ OPT=3D"@OPT@"
> > - PY_ENABLE_SHARED=3D"@PY_ENABLE_SHARED@"
> > - LDVERSION=3D"@LDVERSION@"
> > - LIBDEST=3D${prefix_real}/lib/python${VERSION}
> > --LIBPL=3D$(echo "@LIBPL@" | sed "s#$prefix#$prefix_real#")
> > -+LIBPL=3D$(echo "@LIBPL@" | sed "s#^$prefix_build#$prefix_real#")
> > - SO=3D"@EXT_SUFFIX@"
> > - PYTHONFRAMEWORK=3D"@PYTHONFRAMEWORK@"
> > - INCDIR=3D"-I$includedir/python${VERSION}${ABIFLAGS}"
> > ---
> > -2.34.1
> > -
> > diff --git
> a/package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
> b/package/python3/0011-Add-an-option-to-disable-the-tk-module.patch
> > similarity index 100%
> > rename from
> package/python3/0014-Add-an-option-to-disable-the-tk-module.patch
> > rename to
> package/python3/0011-Add-an-option-to-disable-the-tk-module.patch
> > diff --git
> a/package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
> b/package/python3/0012-Add-an-option-to-disable-the-curses-module.patch
> > similarity index 100%
> > rename from
> package/python3/0015-Add-an-option-to-disable-the-curses-module.patch
> > rename to
> package/python3/0012-Add-an-option-to-disable-the-curses-module.patch
> > diff --git a/package/python3/0016-Add-an-option-to-disable-expat.patch
> b/package/python3/0013-Add-an-option-to-disable-expat.patch
> > similarity index 100%
> > rename from package/python3/0016-Add-an-option-to-disable-expat.patch
> > rename to package/python3/0013-Add-an-option-to-disable-expat.patch
> > diff --git
> a/package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
> b/package/python3/0014-Add-an-option-to-disable-CJK-codecs.patch
> > similarity index 100%
> > rename from
> package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch
> > rename to package/python3/0014-Add-an-option-to-disable-CJK-codecs.patc=
h
> > diff --git a/package/python3/0018-Add-an-option-to-disable-NIS.patch
> b/package/python3/0015-Add-an-option-to-disable-NIS.patch
> > similarity index 100%
> > rename from package/python3/0018-Add-an-option-to-disable-NIS.patch
> > rename to package/python3/0015-Add-an-option-to-disable-NIS.patch
> > diff --git
> a/package/python3/0019-Add-an-option-to-disable-unicodedata.patch
> b/package/python3/0016-Add-an-option-to-disable-unicodedata.patch
> > similarity index 100%
> > rename from
> package/python3/0019-Add-an-option-to-disable-unicodedata.patch
> > rename to package/python3/0016-Add-an-option-to-disable-unicodedata.pat=
ch
> > diff --git a/package/python3/0020-Add-an-option-to-disable-IDLE.patch
> b/package/python3/0017-Add-an-option-to-disable-IDLE.patch
> > similarity index 100%
> > rename from package/python3/0020-Add-an-option-to-disable-IDLE.patch
> > rename to package/python3/0017-Add-an-option-to-disable-IDLE.patch
> > diff --git a/package/python3/0021-Add-an-option-to-disable-decimal.patc=
h
> b/package/python3/0018-Add-an-option-to-disable-decimal.patch
> > similarity index 100%
> > rename from package/python3/0021-Add-an-option-to-disable-decimal.patch
> > rename to package/python3/0018-Add-an-option-to-disable-decimal.patch
> > diff --git
> a/package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.pa=
tch
> b/package/python3/0019-Add-an-option-to-disable-the-ossaudiodev-module.pa=
tch
> > similarity index 100%
> > rename from
> package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.patc=
h
> > rename to
> package/python3/0019-Add-an-option-to-disable-the-ossaudiodev-module.patc=
h
> > diff --git
> a/package/python3/0023-Add-an-option-to-disable-openssl-support.patch
> b/package/python3/0020-Add-an-option-to-disable-openssl-support.patch
> > similarity index 100%
> > rename from
> package/python3/0023-Add-an-option-to-disable-openssl-support.patch
> > rename to
> package/python3/0020-Add-an-option-to-disable-openssl-support.patch
> > diff --git
> a/package/python3/0024-Add-an-option-to-disable-the-readline-module.patch
> b/package/python3/0021-Add-an-option-to-disable-the-readline-module.patch
> > similarity index 100%
> > rename from
> package/python3/0024-Add-an-option-to-disable-the-readline-module.patch
> > rename to
> package/python3/0021-Add-an-option-to-disable-the-readline-module.patch
> > diff --git
> a/package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.p=
atch
> b/package/python3/0022-Add-options-to-disable-zlib-bzip2-and-xz-modules.p=
atch
> > similarity index 100%
> > rename from
> package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules.pat=
ch
> > rename to
> package/python3/0022-Add-options-to-disable-zlib-bzip2-and-xz-modules.pat=
ch
> > diff --git
> a/package/python3/0027-Add-an-option-to-disable-uuid-module.patch
> b/package/python3/0023-Add-an-option-to-disable-uuid-module.patch
> > similarity index 100%
> > rename from
> package/python3/0027-Add-an-option-to-disable-uuid-module.patch
> > rename to package/python3/0023-Add-an-option-to-disable-uuid-module.pat=
ch
> > diff --git
> a/package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-m=
us.patch
> b/package/python3/0024-configure.ac-fixup-CC-print-multiarch-output-for-m=
us.patch
> > similarity index 100%
> > rename from
> package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for-mus=
.patch
> > rename to
> package/python3/0024-configure.ac-fixup-CC-print-multiarch-output-for-mus=
.patch
> > diff --git
> a/package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.pat=
ch
> b/package/python3/0025-Add-an-option-to-disable-the-berkeleydb-module.pat=
ch
> > similarity index 100%
> > rename from
> package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.patch
> > rename to
> package/python3/0025-Add-an-option-to-disable-the-berkeleydb-module.patch
> > diff --git
> a/package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encrypt=
io.patch
> b/package/python3/0026-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encrypt=
io.patch
> > similarity index 100%
> > rename from
> package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio=
.patch
> > rename to
> package/python3/0026-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio=
.patch
> > diff --git
> a/package/python3/0026-python-config.sh-don-t-reassign-prefix.patch
> b/package/python3/0026-python-config.sh-don-t-reassign-prefix.patch
> > deleted file mode 100644
> > index b6bfb010a0..0000000000
> > --- a/package/python3/0026-python-config.sh-don-t-reassign-prefix.patch
> > +++ /dev/null
> > @@ -1,53 +0,0 @@
> > -From 755fb526a62df2a73560f42184db8aadb6899bb0 Mon Sep 17 00:00:00 2001
> > -From: Matt Weber <matthew.weber@rockwellcollins.com>
> > -Date: Fri, 6 Oct 2017 09:54:15 -0500
> > -Subject: [PATCH] python-config.sh: don't reassign ${prefix}
> > -
> > -When prefix is set to a path like /usr during crossbuild
> > -the sed operations end up executing twice, once for the prefix
> > -reassignment and another for includedir if it is set as a string
> > -including the ${prefix} variable.  This results in an issue
> > -when the build directory is under /usr.
> > -
> > -This patch updates the remaining location which uses the prefix
> > -variable to also sed and update to use the real path.
> > -
> > -Upstream bug report:
> > -https://bugs.python.org/issue31713
> > -
> > -Buildroot bug:
> > -https://bugs.busybox.net/show_bug.cgi?id=3D10361
> > -
> > -Fixes failures like the following:
> > -dbus-python-1.2.4 | NOK |
> http://autobuild.buildroot.net/results/758858efa97b6273c1b470513f5492258a=
6d8853
> > -
> > -Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > ----
> > - Misc/python-config.sh.in | 4 ++--
> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/Misc/python-config.sh.in b/Misc/python-config.sh.in
> > -index a1bc3cd5f7..164d2d3603 100644
> > ---- a/Misc/python-config.sh.in
> > -+++ b/Misc/python-config.sh.in
> > -@@ -31,7 +31,7 @@ prefix_real=3D$(installed_prefix "$0")
> > - # locations. Keep prefix & exec_prefix using their original values in
> case
> > - # they are referenced in other configure variables, to prevent double
> > - # substitution, issue #22140.
> > --prefix=3D$(echo "$prefix_build" | sed "s#^$prefix_build#$prefix_real#=
")
> > -+prefix=3D$prefix_build
> > - exec_prefix=3D$(echo "$exec_prefix_build" | sed
> "s#^$exec_prefix_build#$prefix_real#")
> > - exec_prefix_real=3D${prefix_real}
> > - includedir=3D$(echo "@includedir@" | sed
> "s#^$prefix_build#$prefix_real#")
> > -@@ -49,7 +49,7 @@ LDLIBRARY=3D"@LDLIBRARY@"
> > - OPT=3D"@OPT@"
> > - PY_ENABLE_SHARED=3D"@PY_ENABLE_SHARED@"
> > - LDVERSION=3D"@LDVERSION@"
> > --LIBDEST=3D${prefix_real}/lib/python${VERSION}
> > -+LIBDEST=3D$( echo "${prefix}/lib/python${VERSION}" | sed
> "s#^$prefix_build#$prefix_real#")
> > - LIBPL=3D$(echo "@LIBPL@" | sed "s#^$prefix_build#$prefix_real#")
> > - SO=3D"@EXT_SUFFIX@"
> > - PYTHONFRAMEWORK=3D"@PYTHONFRAMEWORK@"
> > ---
> > -2.34.1
> > -
> > diff --git
> a/package/python3/0032-gh-115382-Fix-cross-compiles-when-host-and-target-=
us.patch
> b/package/python3/0027-gh-115382-Fix-cross-compiles-when-host-and-target-=
us.patch
> > similarity index 100%
> > rename from
> package/python3/0032-gh-115382-Fix-cross-compiles-when-host-and-target-us=
.patch
> > rename to
> package/python3/0027-gh-115382-Fix-cross-compiles-when-host-and-target-us=
.patch
> > diff --git
> a/package/python3/0028-fix-building-on-older-distributions.patch
> b/package/python3/0028-fix-building-on-older-distributions.patch
> > deleted file mode 100644
> > index 4541b31c5f..0000000000
> > --- a/package/python3/0028-fix-building-on-older-distributions.patch
> > +++ /dev/null
> > @@ -1,47 +0,0 @@
> > -From e52e2c5e3df4bc3d2ff07ecb3b8e2a9099ea1631 Mon Sep 17 00:00:00 2001
> > -From: Adam Duskett <aduskett@gmail.com>
> > -Date: Thu, 16 Aug 2018 14:52:37 -0700
> > -Subject: [PATCH] fix building on older distributions
> > -
> > -Python > 3.6.3 calls os.replace in the update_file.py script, during t=
he
> > -regen-importlib phase of the build process.
> > -
> > -According to Doc/whatsnew/3.3.rst line 1631, os.replace acts in the sa=
me
> > -way as os.rename, however, it is now cross-platform compatible for
> Windows.
> > -
> > -Because BuildRoot is guaranteed only to be built in  POSIX environment=
,
> it is
> > -safe to change os.replace back to os.rename.
> > -
> > -This change fixes building on older systems such as CentOS7, that only
> come
> > -with python 2.
> > -
> > -Signed-off-by: Adam Duskett <aduskett@gmail.com>
> > ----
> > - Tools/scripts/update_file.py | 4 ++--
> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/Tools/scripts/update_file.py b/Tools/scripts/update_file.=
py
> > -index b4182c1d0c..ab443cb1a6 100644
> > ---- a/Tools/scripts/update_file.py
> > -+++ b/Tools/scripts/update_file.py
> > -@@ -53,7 +53,7 @@ def update_file_with_tmpfile(filename, tmpfile, *,
> create=3DFalse):
> > -         if not create:
> > -             raise  # re-raise
> > -         outcome =3D 'created'
> > --        os.replace(tmpfile, filename)
> > -+        os.rename(tmpfile, filename)
> > -     else:
> > -         with targetfile:
> > -             old_contents =3D targetfile.read()
> > -@@ -62,7 +62,7 @@ def update_file_with_tmpfile(filename, tmpfile, *,
> create=3DFalse):
> > -         # Now compare!
> > -         if old_contents !=3D new_contents:
> > -             outcome =3D 'updated'
> > --            os.replace(tmpfile, filename)
> > -+            os.rename(tmpfile, filename)
> > -         else:
> > -             outcome =3D 'same'
> > -             os.unlink(tmpfile)
> > ---
> > -2.34.1
> > -
> > --
> > 2.34.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------=
------'
>

--000000000000a6de4506173d57ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yann,<br></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, Apr 29, 2024 at 3:57=E2=80=AFAM Yann=
 E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">yann.morin.1998@fr=
ee.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Vincent, All, <br>
<br>
Thanks for tackling this python mess!<br>
<br>
On 2024-04-27 21:42 -0500, Vincent Fazio spake thusly:<br>
&gt; Patches 0004 and 0009 relied upon environment variables that were no<b=
r>
&gt; longer set after python3-010-distutils-cross-compilation-support.patch=
<br>
&gt; was dropped during the transition to Python 3.4 in commit 0d327c26.<br=
>
<br>
0004 and 0009 use the _python_sysroot env variable, and it is still set<br>
in the environment when we build python packages:<br>
<br>
=C2=A0 =C2=A0 $ git grep -n _python_sysroot<br>
=C2=A0 =C2=A0 package/<a href=3D"http://pkg-python.mk:45" rel=3D"noreferrer=
" target=3D"_blank">pkg-python.mk:45</a>:=C2=A0 =C2=A0 =C2=A0 =C2=A0_python=
_sysroot=3D$(STAGING_DIR) \ <br>
<br>
It is totally possible that those patches are no longer needed for other<br=
>
reasons, though, but not that one.<br>
<br></blockquote><div><br></div><div><br></div><div>Nice catch... I ran a b=
uild, some unit tests, and some old failing configs and<br>didn&#39;t see i=
ssues so I will look at the history of these patches to see what<br>caused =
their inclusion and see if I can either reproduce them or account for why<b=
r>they are no longer needed.<br><br>For now, I will not plan to split them =
off since renumbering the patches is a<br>PITA and I&#39;d rather that only=
 be done once.</div><div>=C2=A0</div><div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; Patches 0010 and 0026 (see [0] [1] [2]) can be removed due to a fix<br=
>
&gt; introduced in 3.7 [3].<br>
&gt; <br>
&gt; Patch 0029 can be dropped since commit 3fed4245 removed the dependency=
<br>
&gt; on a host provided python to build host-python3.<br>
&gt; <br>
&gt; [0]: <a href=3D"https://github.com/python/cpython/issues/67096" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/python/cpython/issues/670=
96</a><br>
&gt; [1]: <a href=3D"https://github.com/python/cpython/issues/75894" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/python/cpython/issues/758=
94</a><br>
&gt; [2]: <a href=3D"https://github.com/python/cpython/issues/66338" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/python/cpython/issues/663=
38</a><br>
&gt; [3]: <a href=3D"https://github.com/python/cpython/commit/14086cfc5eed8=
c5e78342d79e5db87a135d75fa8" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/python/cpython/commit/14086cfc5eed8c5e78342d79e5db87a135d75fa8</a=
><br>
&gt; <br>
&gt; Signed-off-by: Vincent Fazio &lt;<a href=3D"mailto:vfazio@gmail.com" t=
arget=3D"_blank">vfazio@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .checkpackageignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 51 +++++++-------<br>
&gt;=C2=A0 ...y-header-paths-for-cross-compilation.patch | 69 -------------=
------<br>
&gt;=C2=A0 ...ok-in-usr-lib-termcap-for-libraries.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...h =3D&gt; 0005-Don-t-add-multiarch-paths.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...&gt; 0006-Abort-on-failed-module-build.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...tch =3D&gt; 0007-Serial-ioctl-workaround.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...0008-Add-an-option-to-disable-pydoc.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...09-Add-an-option-to-disable-lib2to3.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...e-shebang-of-Python-scripts-for-cros.patch | 35 ----------<br=
>
&gt;=C2=A0 ...ption-to-disable-the-sqlite3-module.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...ig.sh.in-ensure-sed-invocations-only.patch | 67 -------------=
-----<br>
&gt;=C2=A0 ...-an-option-to-disable-the-tk-module.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...option-to-disable-the-curses-module.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...0013-Add-an-option-to-disable-expat.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...Add-an-option-to-disable-CJK-codecs.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...&gt; 0015-Add-an-option-to-disable-NIS.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...dd-an-option-to-disable-unicodedata.patch} |=C2=A0 0<br>
&gt;=C2=A0 ... 0017-Add-an-option-to-disable-IDLE.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...18-Add-an-option-to-disable-decimal.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...n-to-disable-the-ossaudiodev-module.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...n-option-to-disable-openssl-support.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...tion-to-disable-the-readline-module.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...o-disable-zlib-bzip2-and-xz-modules.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...dd-an-option-to-disable-uuid-module.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...p-CC-print-multiarch-output-for-mus.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...on-to-disable-the-berkeleydb-module.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...ng-doesn-t-set-errno-when-encryptio.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...thon-config.sh-don-t-reassign-prefix.patch | 53 -------------=
-<br>
&gt;=C2=A0 ...ss-compiles-when-host-and-target-us.patch} |=C2=A0 0<br>
&gt;=C2=A0 ...-fix-building-on-older-distributions.patch | 47 -------------=
<br>
&gt;=C2=A0 30 files changed, 23 insertions(+), 299 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 package/python3/0004-Adjust-library-header-pa=
ths-for-cross-compilation.patch<br>
&gt;=C2=A0 rename package/python3/{0005-Don-t-look-in-usr-lib-termcap-for-l=
ibraries.patch =3D&gt; 0004-Don-t-look-in-usr-lib-termcap-for-libraries.pat=
ch} (100%)<br>
&gt;=C2=A0 rename package/python3/{0006-Don-t-add-multiarch-paths.patch =3D=
&gt; 0005-Don-t-add-multiarch-paths.patch} (100%)<br>
&gt;=C2=A0 rename package/python3/{0007-Abort-on-failed-module-build.patch =
=3D&gt; 0006-Abort-on-failed-module-build.patch} (100%)<br>
&gt;=C2=A0 rename package/python3/{0008-Serial-ioctl-workaround.patch =3D&g=
t; 0007-Serial-ioctl-workaround.patch} (100%)<br>
&gt;=C2=A0 rename package/python3/{0011-Add-an-option-to-disable-pydoc.patc=
h =3D&gt; 0008-Add-an-option-to-disable-pydoc.patch} (100%)<br>
&gt;=C2=A0 rename package/python3/{0012-Add-an-option-to-disable-lib2to3.pa=
tch =3D&gt; 0009-Add-an-option-to-disable-lib2to3.patch} (100%)<br>
&gt;=C2=A0 delete mode 100644 package/python3/0009-Do-not-adjust-the-sheban=
g-of-Python-scripts-for-cros.patch<br>
&gt;=C2=A0 rename package/python3/{0013-Add-option-to-disable-the-sqlite3-m=
odule.patch =3D&gt; 0010-Add-option-to-disable-the-sqlite3-module.patch} (1=
00%)<br>
&gt;=C2=A0 delete mode 100644 package/python3/0010-Misc-python-config.sh.in=
-ensure-sed-invocations-only.patch<br>
&gt;=C2=A0 rename package/python3/{0014-Add-an-option-to-disable-the-tk-mod=
ule.patch =3D&gt; 0011-Add-an-option-to-disable-the-tk-module.patch} (100%)=
<br>
&gt;=C2=A0 rename package/python3/{0015-Add-an-option-to-disable-the-curses=
-module.patch =3D&gt; 0012-Add-an-option-to-disable-the-curses-module.patch=
} (100%)<br>
&gt;=C2=A0 rename package/python3/{0016-Add-an-option-to-disable-expat.patc=
h =3D&gt; 0013-Add-an-option-to-disable-expat.patch} (100%)<br>
&gt;=C2=A0 rename package/python3/{0017-Add-an-option-to-disable-CJK-codecs=
.patch =3D&gt; 0014-Add-an-option-to-disable-CJK-codecs.patch} (100%)<br>
&gt;=C2=A0 rename package/python3/{0018-Add-an-option-to-disable-NIS.patch =
=3D&gt; 0015-Add-an-option-to-disable-NIS.patch} (100%)<br>
&gt;=C2=A0 rename package/python3/{0019-Add-an-option-to-disable-unicodedat=
a.patch =3D&gt; 0016-Add-an-option-to-disable-unicodedata.patch} (100%)<br>
&gt;=C2=A0 rename package/python3/{0020-Add-an-option-to-disable-IDLE.patch=
 =3D&gt; 0017-Add-an-option-to-disable-IDLE.patch} (100%)<br>
&gt;=C2=A0 rename package/python3/{0021-Add-an-option-to-disable-decimal.pa=
tch =3D&gt; 0018-Add-an-option-to-disable-decimal.patch} (100%)<br>
&gt;=C2=A0 rename package/python3/{0022-Add-an-option-to-disable-the-ossaud=
iodev-module.patch =3D&gt; 0019-Add-an-option-to-disable-the-ossaudiodev-mo=
dule.patch} (100%)<br>
&gt;=C2=A0 rename package/python3/{0023-Add-an-option-to-disable-openssl-su=
pport.patch =3D&gt; 0020-Add-an-option-to-disable-openssl-support.patch} (1=
00%)<br>
&gt;=C2=A0 rename package/python3/{0024-Add-an-option-to-disable-the-readli=
ne-module.patch =3D&gt; 0021-Add-an-option-to-disable-the-readline-module.p=
atch} (100%)<br>
&gt;=C2=A0 rename package/python3/{0025-Add-options-to-disable-zlib-bzip2-a=
nd-xz-modules.patch =3D&gt; 0022-Add-options-to-disable-zlib-bzip2-and-xz-m=
odules.patch} (100%)<br>
&gt;=C2=A0 rename package/python3/{0027-Add-an-option-to-disable-uuid-modul=
e.patch =3D&gt; 0023-Add-an-option-to-disable-uuid-module.patch} (100%)<br>
&gt;=C2=A0 rename package/python3/{0029-configure.ac-fixup-CC-print-multiar=
ch-output-for-mus.patch =3D&gt; 0024-configure.ac-fixup-CC-print-multiarch-=
output-for-mus.patch} (100%)<br>
&gt;=C2=A0 rename package/python3/{0030-Add-an-option-to-disable-the-berkel=
eydb-module.patch =3D&gt; 0025-Add-an-option-to-disable-the-berkeleydb-modu=
le.patch} (100%)<br>
&gt;=C2=A0 rename package/python3/{0031-lib-crypt-uClibc-ng-doesn-t-set-err=
no-when-encryptio.patch =3D&gt; 0026-lib-crypt-uClibc-ng-doesn-t-set-errno-=
when-encryptio.patch} (100%)<br>
&gt;=C2=A0 delete mode 100644 package/python3/0026-python-config.sh-don-t-r=
eassign-prefix.patch<br>
&gt;=C2=A0 rename package/python3/{0032-gh-115382-Fix-cross-compiles-when-h=
ost-and-target-us.patch =3D&gt; 0027-gh-115382-Fix-cross-compiles-when-host=
-and-target-us.patch} (100%)<br>
&gt;=C2=A0 delete mode 100644 package/python3/0028-fix-building-on-older-di=
stributions.patch<br>
&gt; <br>
&gt; diff --git a/.checkpackageignore b/.checkpackageignore<br>
&gt; index 1b336ce7a3..eec47fdaa4 100644<br>
&gt; --- a/.checkpackageignore<br>
&gt; +++ b/.checkpackageignore<br>
&gt; @@ -1045,34 +1045,29 @@ package/python-ws4py/0001-Adjust-ws4py-for-Pyt=
hon-3.7-syntax.patch lib_patch.Ups<br>
&gt;=C2=A0 package/python3/0001-Make-the-build-of-pyc-files-conditional.pat=
ch lib_patch.Upstream<br>
&gt;=C2=A0 package/python3/0002-Disable-buggy_getaddrinfo-configure-test-wh=
en-cross-.patch lib_patch.Upstream<br>
&gt;=C2=A0 package/python3/0003-Add-infrastructure-to-disable-the-build-of-=
certain-e.patch lib_patch.Upstream<br>
&gt; -package/python3/0004-Adjust-library-header-paths-for-cross-compilatio=
n.patch lib_patch.Upstream<br>
&gt; -package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patc=
h lib_patch.Upstream<br>
&gt; -package/python3/0006-Don-t-add-multiarch-paths.patch lib_patch.Upstre=
am<br>
&gt; -package/python3/0007-Abort-on-failed-module-build.patch lib_patch.Ups=
tream<br>
&gt; -package/python3/0008-Serial-ioctl-workaround.patch lib_patch.Upstream=
<br>
&gt; -package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-=
cros.patch lib_patch.Upstream<br>
&gt; -package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-=
only.patch lib_patch.Upstream<br>
&gt; -package/python3/0011-Add-an-option-to-disable-pydoc.patch lib_patch.U=
pstream<br>
&gt; -package/python3/0012-Add-an-option-to-disable-lib2to3.patch lib_patch=
.Upstream<br>
&gt; -package/python3/0013-Add-option-to-disable-the-sqlite3-module.patch l=
ib_patch.Upstream<br>
&gt; -package/python3/0014-Add-an-option-to-disable-the-tk-module.patch lib=
_patch.Upstream<br>
&gt; -package/python3/0015-Add-an-option-to-disable-the-curses-module.patch=
 lib_patch.Upstream<br>
&gt; -package/python3/0016-Add-an-option-to-disable-expat.patch lib_patch.U=
pstream<br>
&gt; -package/python3/0017-Add-an-option-to-disable-CJK-codecs.patch lib_pa=
tch.Upstream<br>
&gt; -package/python3/0018-Add-an-option-to-disable-NIS.patch lib_patch.Ups=
tream<br>
&gt; -package/python3/0019-Add-an-option-to-disable-unicodedata.patch lib_p=
atch.Upstream<br>
&gt; -package/python3/0020-Add-an-option-to-disable-IDLE.patch lib_patch.Up=
stream<br>
&gt; -package/python3/0021-Add-an-option-to-disable-decimal.patch lib_patch=
.Upstream<br>
&gt; -package/python3/0022-Add-an-option-to-disable-the-ossaudiodev-module.=
patch lib_patch.Upstream<br>
&gt; -package/python3/0023-Add-an-option-to-disable-openssl-support.patch l=
ib_patch.Upstream<br>
&gt; -package/python3/0024-Add-an-option-to-disable-the-readline-module.pat=
ch lib_patch.Upstream<br>
&gt; -package/python3/0025-Add-options-to-disable-zlib-bzip2-and-xz-modules=
.patch lib_patch.Upstream<br>
&gt; -package/python3/0026-python-config.sh-don-t-reassign-prefix.patch lib=
_patch.Upstream<br>
&gt; -package/python3/0027-Add-an-option-to-disable-uuid-module.patch lib_p=
atch.Upstream<br>
&gt; -package/python3/0028-fix-building-on-older-distributions.patch lib_pa=
tch.Upstream<br>
&gt; -package/python3/0029-configure.ac-fixup-CC-print-multiarch-output-for=
-mus.patch lib_patch.Upstream<br>
&gt; -package/python3/0030-Add-an-option-to-disable-the-berkeleydb-module.p=
atch lib_patch.Upstream<br>
&gt; -package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encry=
ptio.patch lib_patch.Upstream<br>
&gt; +package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libraries.patc=
h lib_patch.Upstream<br>
&gt; +package/python3/0005-Don-t-add-multiarch-paths.patch lib_patch.Upstre=
am<br>
&gt; +package/python3/0006-Abort-on-failed-module-build.patch lib_patch.Ups=
tream<br>
&gt; +package/python3/0007-Serial-ioctl-workaround.patch lib_patch.Upstream=
<br>
&gt; +package/python3/0008-Add-an-option-to-disable-pydoc.patch lib_patch.U=
pstream<br>
&gt; +package/python3/0009-Add-an-option-to-disable-lib2to3.patch lib_patch=
.Upstream<br>
&gt; +package/python3/0010-Add-option-to-disable-the-sqlite3-module.patch l=
ib_patch.Upstream<br>
&gt; +package/python3/0011-Add-an-option-to-disable-the-tk-module.patch lib=
_patch.Upstream<br>
&gt; +package/python3/0012-Add-an-option-to-disable-the-curses-module.patch=
 lib_patch.Upstream<br>
&gt; +package/python3/0013-Add-an-option-to-disable-expat.patch lib_patch.U=
pstream<br>
&gt; +package/python3/0014-Add-an-option-to-disable-CJK-codecs.patch lib_pa=
tch.Upstream<br>
&gt; +package/python3/0015-Add-an-option-to-disable-NIS.patch lib_patch.Ups=
tream<br>
&gt; +package/python3/0016-Add-an-option-to-disable-unicodedata.patch lib_p=
atch.Upstream<br>
&gt; +package/python3/0017-Add-an-option-to-disable-IDLE.patch lib_patch.Up=
stream<br>
&gt; +package/python3/0018-Add-an-option-to-disable-decimal.patch lib_patch=
.Upstream<br>
&gt; +package/python3/0019-Add-an-option-to-disable-the-ossaudiodev-module.=
patch lib_patch.Upstream<br>
&gt; +package/python3/0020-Add-an-option-to-disable-openssl-support.patch l=
ib_patch.Upstream<br>
&gt; +package/python3/0021-Add-an-option-to-disable-the-readline-module.pat=
ch lib_patch.Upstream<br>
&gt; +package/python3/0022-Add-options-to-disable-zlib-bzip2-and-xz-modules=
.patch lib_patch.Upstream<br>
&gt; +package/python3/0023-Add-an-option-to-disable-uuid-module.patch lib_p=
atch.Upstream<br>
&gt; +package/python3/0024-configure.ac-fixup-CC-print-multiarch-output-for=
-mus.patch lib_patch.Upstream<br>
&gt; +package/python3/0025-Add-an-option-to-disable-the-berkeleydb-module.p=
atch lib_patch.Upstream<br>
&gt; +package/python3/0026-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encry=
ptio.patch lib_patch.Upstream<br>
&gt;=C2=A0 package/qemu/0001-tests-fp-disable-fp-bench-build-by-default.pat=
ch lib_patch.Upstream<br>
&gt;=C2=A0 package/qemu/0002-softmmu-qemu-seccomp.c-add-missing-header-for-=
CLONE_.patch lib_patch.Upstream<br>
&gt;=C2=A0 package/qextserialport/0001-Create-a-main-include-file-QExtSeria=
lPort.patch lib_patch.Upstream<br>
&gt; diff --git a/package/python3/0004-Adjust-library-header-paths-for-cros=
s-compilation.patch b/package/python3/0004-Adjust-library-header-paths-for-=
cross-compilation.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 9a55d2582d..0000000000<br>
&gt; --- a/package/python3/0004-Adjust-library-header-paths-for-cross-compi=
lation.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,69 +0,0 @@<br>
&gt; -From 132b9dca3bb4d4682f7e318648ce11e1abb31b62 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@free-el=
ectrons.com" target=3D"_blank">thomas.petazzoni@free-electrons.com</a>&gt;<=
br>
&gt; -Date: Wed, 23 Dec 2015 11:33:14 +0100<br>
&gt; -Subject: [PATCH] Adjust library/header paths for cross-compilation<br=
>
&gt; -<br>
&gt; -When cross-compiling third-party extensions, the get_python_inc() or<=
br>
&gt; -get_python_lib() can be called, to return the path to headers or<br>
&gt; -libraries. However, they use the sys.prefix of the host Python, which=
<br>
&gt; -returns incorrect paths when cross-compiling (paths pointing to host<=
br>
&gt; -headers and libraries).<br>
&gt; -<br>
&gt; -In order to fix this, we introduce the _python_sysroot, _python_prefi=
x<br>
&gt; -and _python_exec_prefix variables, that allow to override these<br>
&gt; -values, and get correct header/library paths when cross-compiling<br>
&gt; -third-party Python modules.<br>
&gt; -<br>
&gt; -Signed-off-by: Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzon=
i@free-electrons.com" target=3D"_blank">thomas.petazzoni@free-electrons.com=
</a>&gt;<br>
&gt; -Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:aduskett@gmail.com"=
 target=3D"_blank">aduskett@gmail.com</a>&gt;<br>
&gt; -Refresh for 3.10.0<br>
&gt; ----<br>
&gt; - Lib/distutils/command/build_ext.py |=C2=A0 5 ++++-<br>
&gt; - Lib/sysconfig.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 15 +++++++++++----<br>
&gt; - 2 files changed, 15 insertions(+), 5 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/Lib/distutils/command/build_ext.py b/Lib/distutils/comma=
nd/build_ext.py<br>
&gt; -index f287b34998..298234d6a1 100644<br>
&gt; ---- a/Lib/distutils/command/build_ext.py<br>
&gt; -+++ b/Lib/distutils/command/build_ext.py<br>
&gt; -@@ -234,7 +234,10 @@ def finalize_options(self):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sysconfig.get_config_var(&#39;P=
y_ENABLE_SHARED&#39;)):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not sysconfig.pyth=
on_build:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# build=
ing third party extensions<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.library=
_dirs.append(sysconfig.get_config_var(&#39;LIBDIR&#39;))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libdir =3D s=
ysconfig.get_config_var(&#39;LIBDIR&#39;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;_py=
thon_sysroot&quot; in os.environ:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 libdir =3D os.environ.get(&quot;_python_sysroot&quot;) + libdir<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.library=
_dirs.append(libdir)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# build=
ing python standard extensions<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.li=
brary_dirs.append(&#39;.&#39;)<br>
&gt; -diff --git a/Lib/sysconfig.py b/Lib/sysconfig.py<br>
&gt; -index ebe3711827..6328ec41af 100644<br>
&gt; ---- a/Lib/sysconfig.py<br>
&gt; -+++ b/Lib/sysconfig.py<br>
&gt; -@@ -168,10 +168,17 @@ def joinuser(*args):<br>
&gt; - _PY_VERSION =3D sys.version.split()[0]<br>
&gt; - _PY_VERSION_SHORT =3D f&#39;{sys.version_info[0]}.{sys.version_info[=
1]}&#39;<br>
&gt; - _PY_VERSION_SHORT_NO_DOT =3D f&#39;{sys.version_info[0]}{sys.version=
_info[1]}&#39;<br>
&gt; --_PREFIX =3D os.path.normpath(sys.prefix)<br>
&gt; --_BASE_PREFIX =3D os.path.normpath(sys.base_prefix)<br>
&gt; --_EXEC_PREFIX =3D os.path.normpath(sys.exec_prefix)<br>
&gt; --_BASE_EXEC_PREFIX =3D os.path.normpath(sys.base_exec_prefix)<br>
&gt; -+if &quot;_python_sysroot&quot; in os.environ:<br>
&gt; -+=C2=A0 =C2=A0 _sysroot=3Dos.environ.get(&#39;_python_sysroot&#39;)<b=
r>
&gt; -+=C2=A0 =C2=A0 _PREFIX =3D os.path.normpath(_sysroot + os.environ.get=
(&#39;_python_prefix&#39;))<br>
&gt; -+=C2=A0 =C2=A0 _EXEC_PREFIX =3D os.path.normpath(_sysroot + os.enviro=
n.get(&#39;_python_exec_prefix&#39;))<br>
&gt; -+=C2=A0 =C2=A0 _BASE_PREFIX =3D _PREFIX<br>
&gt; -+=C2=A0 =C2=A0 _BASE_EXEC_PREFIX =3D _EXEC_PREFIX<br>
&gt; -+else:<br>
&gt; -+=C2=A0 =C2=A0 _PREFIX =3D os.path.normpath(sys.prefix)<br>
&gt; -+=C2=A0 =C2=A0 _EXEC_PREFIX =3D os.path.normpath(sys.exec_prefix)<br>
&gt; -+=C2=A0 =C2=A0 _BASE_PREFIX =3D os.path.normpath(sys.base_prefix)<br>
&gt; -+=C2=A0 =C2=A0 _BASE_EXEC_PREFIX =3D os.path.normpath(sys.base_exec_p=
refix)<br>
&gt; - _CONFIG_VARS =3D None<br>
&gt; - _USER_BASE =3D None<br>
&gt; - <br>
&gt; --- <br>
&gt; -2.34.1<br>
&gt; -<br>
&gt; diff --git a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-li=
braries.patch b/package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libr=
aries.patch<br>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0005-Don-t-look-in-usr-lib-termcap-for-lib=
raries.patch<br>
&gt; rename to package/python3/0004-Don-t-look-in-usr-lib-termcap-for-libra=
ries.patch<br>
&gt; diff --git a/package/python3/0006-Don-t-add-multiarch-paths.patch b/pa=
ckage/python3/0005-Don-t-add-multiarch-paths.patch<br>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0006-Don-t-add-multiarch-paths.patch<br>
&gt; rename to package/python3/0005-Don-t-add-multiarch-paths.patch<br>
&gt; diff --git a/package/python3/0007-Abort-on-failed-module-build.patch b=
/package/python3/0006-Abort-on-failed-module-build.patch<br>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0007-Abort-on-failed-module-build.patch<br=
>
&gt; rename to package/python3/0006-Abort-on-failed-module-build.patch<br>
&gt; diff --git a/package/python3/0008-Serial-ioctl-workaround.patch b/pack=
age/python3/0007-Serial-ioctl-workaround.patch<br>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0008-Serial-ioctl-workaround.patch<br>
&gt; rename to package/python3/0007-Serial-ioctl-workaround.patch<br>
&gt; diff --git a/package/python3/0011-Add-an-option-to-disable-pydoc.patch=
 b/package/python3/0008-Add-an-option-to-disable-pydoc.patch<br>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0011-Add-an-option-to-disable-pydoc.patch<=
br>
&gt; rename to package/python3/0008-Add-an-option-to-disable-pydoc.patch<br=
>
&gt; diff --git a/package/python3/0012-Add-an-option-to-disable-lib2to3.pat=
ch b/package/python3/0009-Add-an-option-to-disable-lib2to3.patch<br>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0012-Add-an-option-to-disable-lib2to3.patc=
h<br>
&gt; rename to package/python3/0009-Add-an-option-to-disable-lib2to3.patch<=
br>
&gt; diff --git a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-=
scripts-for-cros.patch b/package/python3/0009-Do-not-adjust-the-shebang-of-=
Python-scripts-for-cros.patch<br>
&gt; deleted file mode 100644<br>
&gt; index eff8fc7694..0000000000<br>
&gt; --- a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts=
-for-cros.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,35 +0,0 @@<br>
&gt; -From 2439bd2ed5dbdd7e5fda15adefd0f6f1b047ec1b Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Christophe Vu-Brugier &lt;<a href=3D"mailto:cvubrugier@fastmail=
.fm" target=3D"_blank">cvubrugier@fastmail.fm</a>&gt;<br>
&gt; -Date: Wed, 23 Dec 2015 11:44:30 +0100<br>
&gt; -Subject: [PATCH] Do not adjust the shebang of Python scripts for<br>
&gt; - cross-compilation<br>
&gt; -<br>
&gt; -The copy_scripts() method in distutils copies the scripts listed in<b=
r>
&gt; -the setup file and adjusts the first line to refer to the current<br>
&gt; -Python interpreter. When cross-compiling, this means that the adjuste=
d<br>
&gt; -shebang refers to the host Python interpreter.<br>
&gt; -<br>
&gt; -This patch modifies copy_scripts() to preserve the shebang when<br>
&gt; -cross-compilation is detected.<br>
&gt; -<br>
&gt; -Signed-off-by: Christophe Vu-Brugier &lt;<a href=3D"mailto:cvubrugier=
@fastmail.fm" target=3D"_blank">cvubrugier@fastmail.fm</a>&gt;<br>
&gt; ----<br>
&gt; - Lib/distutils/command/build_scripts.py | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/Lib/distutils/command/build_scripts.py b/Lib/distutils/c=
ommand/build_scripts.py<br>
&gt; -index ccc70e6465..d6d54195c1 100644<br>
&gt; ---- a/Lib/distutils/command/build_scripts.py<br>
&gt; -+++ b/Lib/distutils/command/build_scripts.py<br>
&gt; -@@ -91,7 +91,7 @@ def copy_scripts(self):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0adjust =3D True<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0post_interp =3D match.group(1) or b&#39;&#39;<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if adjust:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if adjust and not &#39;_py=
thon_sysroot&#39; in os.environ:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=
=3D"http://log.info" rel=3D"noreferrer" target=3D"_blank">log.info</a>(&quo=
t;copying and adjusting %s -&gt; %s&quot;, script,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 self.build_dir)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0updated=
_files.append(outfile)<br>
&gt; --- <br>
&gt; -2.34.1<br>
&gt; -<br>
&gt; diff --git a/package/python3/0013-Add-option-to-disable-the-sqlite3-mo=
dule.patch b/package/python3/0010-Add-option-to-disable-the-sqlite3-module.=
patch<br>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0013-Add-option-to-disable-the-sqlite3-mod=
ule.patch<br>
&gt; rename to package/python3/0010-Add-option-to-disable-the-sqlite3-modul=
e.patch<br>
&gt; diff --git a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-=
invocations-only.patch b/package/python3/0010-Misc-python-config.sh.in-ensu=
re-sed-invocations-only.patch<br>
&gt; deleted file mode 100644<br>
&gt; index f26ee85b61..0000000000<br>
&gt; --- a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocat=
ions-only.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,67 +0,0 @@<br>
&gt; -From 55ef5552e4ee60266e3299f253bec3b13785e585 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com" targ=
et=3D"_blank">peter@korsgaard.com</a>&gt;<br>
&gt; -Date: Thu, 20 Nov 2014 13:24:59 +0100<br>
&gt; -Subject: [PATCH] Misc/<a href=3D"http://python-config.sh.in" rel=3D"n=
oreferrer" target=3D"_blank">python-config.sh.in</a>: ensure sed invocation=
s only match<br>
&gt; - beginning of strings<br>
&gt; -<br>
&gt; -The build/real prefix handling using sed breaks if build !=3D real an=
d the<br>
&gt; -standard include / lib directories are used ($prefix/include and $pre=
fix/lib).<br>
&gt; -<br>
&gt; -E.G.<br>
&gt; -<br>
&gt; -prefix_build=3D&quot;/usr&quot;, libdir=3D&quot;$prefix/lib&quot;, in=
cludedir=3D&quot;$prefix/include&quot;.<br>
&gt; -<br>
&gt; -If this gets installed with make DESTDIR=3D&quot;/foo&quot; install, =
then we end up with<br>
&gt; -prefix_real =3D prefix =3D &quot;/foo/usr&quot; as expected, but<br>
&gt; -includedir=3D&quot;/foo/foo/usr/include&quot; and libdir=3D&quot;/foo=
/foo/usr/lib&quot; because of<br>
&gt; -the double sed invocation (prefix is already expanded).=C2=A0 Work ar=
ound it by<br>
&gt; -ensuring we only match the beginning of the string.<br>
&gt; -<br>
&gt; -Submitted upstream: <a href=3D"http://bugs.python.org/issue22907" rel=
=3D"noreferrer" target=3D"_blank">http://bugs.python.org/issue22907</a><br>
&gt; -<br>
&gt; -Signed-off-by: Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.=
com" target=3D"_blank">peter@korsgaard.com</a>&gt;<br>
&gt; ----<br>
&gt; - Misc/<a href=3D"http://python-config.sh.in" rel=3D"noreferrer" targe=
t=3D"_blank">python-config.sh.in</a> | 13 +++++++------<br>
&gt; - 1 file changed, 7 insertions(+), 6 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/Misc/<a href=3D"http://python-config.sh.in" rel=3D"noref=
errer" target=3D"_blank">python-config.sh.in</a> b/Misc/<a href=3D"http://p=
ython-config.sh.in" rel=3D"noreferrer" target=3D"_blank">python-config.sh.i=
n</a><br>
&gt; -index 2602fe24c0..a1bc3cd5f7 100644<br>
&gt; ---- a/Misc/<a href=3D"http://python-config.sh.in" rel=3D"noreferrer" =
target=3D"_blank">python-config.sh.in</a><br>
&gt; -+++ b/Misc/<a href=3D"http://python-config.sh.in" rel=3D"noreferrer" =
target=3D"_blank">python-config.sh.in</a><br>
&gt; -@@ -24,18 +24,19 @@ installed_prefix ()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0echo $RESULT<br>
&gt; - }<br>
&gt; - <br>
&gt; -+prefix_build=3D&quot;@prefix@&quot;<br>
&gt; - prefix_real=3D$(installed_prefix &quot;$0&quot;)<br>
&gt; - <br>
&gt; - # Use sed to fix paths from their built-to locations to their instal=
led-to<br>
&gt; - # locations. Keep prefix &amp; exec_prefix using their original valu=
es in case<br>
&gt; - # they are referenced in other configure variables, to prevent doubl=
e<br>
&gt; - # substitution, issue #22140.<br>
&gt; --prefix=3D&quot;@prefix@&quot;<br>
&gt; --exec_prefix=3D&quot;@exec_prefix@&quot;<br>
&gt; -+prefix=3D$(echo &quot;$prefix_build&quot; | sed &quot;s#^$prefix_bui=
ld#$prefix_real#&quot;)<br>
&gt; -+exec_prefix=3D$(echo &quot;$exec_prefix_build&quot; | sed &quot;s#^$=
exec_prefix_build#$prefix_real#&quot;)<br>
&gt; - exec_prefix_real=3D${prefix_real}<br>
&gt; --includedir=3D$(echo &quot;@includedir@&quot; | sed &quot;s#$prefix#$=
prefix_real#&quot;)<br>
&gt; --libdir=3D$(echo &quot;@libdir@&quot; | sed &quot;s#$prefix#$prefix_r=
eal#&quot;)<br>
&gt; --CFLAGS=3D$(echo &quot;@CFLAGS@&quot; | sed &quot;s#$prefix#$prefix_r=
eal#&quot;)<br>
&gt; -+includedir=3D$(echo &quot;@includedir@&quot; | sed &quot;s#^$prefix_=
build#$prefix_real#&quot;)<br>
&gt; -+libdir=3D$(echo &quot;@libdir@&quot; | sed &quot;s#^$prefix_build#$p=
refix_real#&quot;)<br>
&gt; -+CFLAGS=3D$(echo &quot;@CFLAGS@&quot; | sed &quot;s#^$prefix_build#$p=
refix_real#&quot;)<br>
&gt; - VERSION=3D&quot;@VERSION@&quot;<br>
&gt; - LIBM=3D&quot;@LIBM@&quot;<br>
&gt; - LIBC=3D&quot;@LIBC@&quot;<br>
&gt; -@@ -49,7 +50,7 @@ OPT=3D&quot;@OPT@&quot;<br>
&gt; - PY_ENABLE_SHARED=3D&quot;@PY_ENABLE_SHARED@&quot;<br>
&gt; - LDVERSION=3D&quot;@LDVERSION@&quot;<br>
&gt; - LIBDEST=3D${prefix_real}/lib/python${VERSION}<br>
&gt; --LIBPL=3D$(echo &quot;@LIBPL@&quot; | sed &quot;s#$prefix#$prefix_rea=
l#&quot;)<br>
&gt; -+LIBPL=3D$(echo &quot;@LIBPL@&quot; | sed &quot;s#^$prefix_build#$pre=
fix_real#&quot;)<br>
&gt; - SO=3D&quot;@EXT_SUFFIX@&quot;<br>
&gt; - PYTHONFRAMEWORK=3D&quot;@PYTHONFRAMEWORK@&quot;<br>
&gt; - INCDIR=3D&quot;-I$includedir/python${VERSION}${ABIFLAGS}&quot;<br>
&gt; --- <br>
&gt; -2.34.1<br>
&gt; -<br>
&gt; diff --git a/package/python3/0014-Add-an-option-to-disable-the-tk-modu=
le.patch b/package/python3/0011-Add-an-option-to-disable-the-tk-module.patc=
h<br>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0014-Add-an-option-to-disable-the-tk-modul=
e.patch<br>
&gt; rename to package/python3/0011-Add-an-option-to-disable-the-tk-module.=
patch<br>
&gt; diff --git a/package/python3/0015-Add-an-option-to-disable-the-curses-=
module.patch b/package/python3/0012-Add-an-option-to-disable-the-curses-mod=
ule.patch<br>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0015-Add-an-option-to-disable-the-curses-m=
odule.patch<br>
&gt; rename to package/python3/0012-Add-an-option-to-disable-the-curses-mod=
ule.patch<br>
&gt; diff --git a/package/python3/0016-Add-an-option-to-disable-expat.patch=
 b/package/python3/0013-Add-an-option-to-disable-expat.patch<br>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0016-Add-an-option-to-disable-expat.patch<=
br>
&gt; rename to package/python3/0013-Add-an-option-to-disable-expat.patch<br=
>
&gt; diff --git a/package/python3/0017-Add-an-option-to-disable-CJK-codecs.=
patch b/package/python3/0014-Add-an-option-to-disable-CJK-codecs.patch<br>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0017-Add-an-option-to-disable-CJK-codecs.p=
atch<br>
&gt; rename to package/python3/0014-Add-an-option-to-disable-CJK-codecs.pat=
ch<br>
&gt; diff --git a/package/python3/0018-Add-an-option-to-disable-NIS.patch b=
/package/python3/0015-Add-an-option-to-disable-NIS.patch<br>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0018-Add-an-option-to-disable-NIS.patch<br=
>
&gt; rename to package/python3/0015-Add-an-option-to-disable-NIS.patch<br>
&gt; diff --git a/package/python3/0019-Add-an-option-to-disable-unicodedata=
.patch b/package/python3/0016-Add-an-option-to-disable-unicodedata.patch<br=
>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0019-Add-an-option-to-disable-unicodedata.=
patch<br>
&gt; rename to package/python3/0016-Add-an-option-to-disable-unicodedata.pa=
tch<br>
&gt; diff --git a/package/python3/0020-Add-an-option-to-disable-IDLE.patch =
b/package/python3/0017-Add-an-option-to-disable-IDLE.patch<br>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0020-Add-an-option-to-disable-IDLE.patch<b=
r>
&gt; rename to package/python3/0017-Add-an-option-to-disable-IDLE.patch<br>
&gt; diff --git a/package/python3/0021-Add-an-option-to-disable-decimal.pat=
ch b/package/python3/0018-Add-an-option-to-disable-decimal.patch<br>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0021-Add-an-option-to-disable-decimal.patc=
h<br>
&gt; rename to package/python3/0018-Add-an-option-to-disable-decimal.patch<=
br>
&gt; diff --git a/package/python3/0022-Add-an-option-to-disable-the-ossaudi=
odev-module.patch b/package/python3/0019-Add-an-option-to-disable-the-ossau=
diodev-module.patch<br>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0022-Add-an-option-to-disable-the-ossaudio=
dev-module.patch<br>
&gt; rename to package/python3/0019-Add-an-option-to-disable-the-ossaudiode=
v-module.patch<br>
&gt; diff --git a/package/python3/0023-Add-an-option-to-disable-openssl-sup=
port.patch b/package/python3/0020-Add-an-option-to-disable-openssl-support.=
patch<br>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0023-Add-an-option-to-disable-openssl-supp=
ort.patch<br>
&gt; rename to package/python3/0020-Add-an-option-to-disable-openssl-suppor=
t.patch<br>
&gt; diff --git a/package/python3/0024-Add-an-option-to-disable-the-readlin=
e-module.patch b/package/python3/0021-Add-an-option-to-disable-the-readline=
-module.patch<br>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0024-Add-an-option-to-disable-the-readline=
-module.patch<br>
&gt; rename to package/python3/0021-Add-an-option-to-disable-the-readline-m=
odule.patch<br>
&gt; diff --git a/package/python3/0025-Add-options-to-disable-zlib-bzip2-an=
d-xz-modules.patch b/package/python3/0022-Add-options-to-disable-zlib-bzip2=
-and-xz-modules.patch<br>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0025-Add-options-to-disable-zlib-bzip2-and=
-xz-modules.patch<br>
&gt; rename to package/python3/0022-Add-options-to-disable-zlib-bzip2-and-x=
z-modules.patch<br>
&gt; diff --git a/package/python3/0027-Add-an-option-to-disable-uuid-module=
.patch b/package/python3/0023-Add-an-option-to-disable-uuid-module.patch<br=
>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0027-Add-an-option-to-disable-uuid-module.=
patch<br>
&gt; rename to package/python3/0023-Add-an-option-to-disable-uuid-module.pa=
tch<br>
&gt; diff --git a/package/python3/0029-configure.ac-fixup-CC-print-multiarc=
h-output-for-mus.patch b/package/python3/0024-configure.ac-fixup-CC-print-m=
ultiarch-output-for-mus.patch<br>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0029-configure.ac-fixup-CC-print-multiarch=
-output-for-mus.patch<br>
&gt; rename to package/python3/0024-configure.ac-fixup-CC-print-multiarch-o=
utput-for-mus.patch<br>
&gt; diff --git a/package/python3/0030-Add-an-option-to-disable-the-berkele=
ydb-module.patch b/package/python3/0025-Add-an-option-to-disable-the-berkel=
eydb-module.patch<br>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0030-Add-an-option-to-disable-the-berkeley=
db-module.patch<br>
&gt; rename to package/python3/0025-Add-an-option-to-disable-the-berkeleydb=
-module.patch<br>
&gt; diff --git a/package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errn=
o-when-encryptio.patch b/package/python3/0026-lib-crypt-uClibc-ng-doesn-t-s=
et-errno-when-encryptio.patch<br>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0031-lib-crypt-uClibc-ng-doesn-t-set-errno=
-when-encryptio.patch<br>
&gt; rename to package/python3/0026-lib-crypt-uClibc-ng-doesn-t-set-errno-w=
hen-encryptio.patch<br>
&gt; diff --git a/package/python3/0026-python-config.sh-don-t-reassign-pref=
ix.patch b/package/python3/0026-python-config.sh-don-t-reassign-prefix.patc=
h<br>
&gt; deleted file mode 100644<br>
&gt; index b6bfb010a0..0000000000<br>
&gt; --- a/package/python3/0026-python-config.sh-don-t-reassign-prefix.patc=
h<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,53 +0,0 @@<br>
&gt; -From 755fb526a62df2a73560f42184db8aadb6899bb0 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Matt Weber &lt;<a href=3D"mailto:matthew.weber@rockwellcollins.=
com" target=3D"_blank">matthew.weber@rockwellcollins.com</a>&gt;<br>
&gt; -Date: Fri, 6 Oct 2017 09:54:15 -0500<br>
&gt; -Subject: [PATCH] python-config.sh: don&#39;t reassign ${prefix}<br>
&gt; -<br>
&gt; -When prefix is set to a path like /usr during crossbuild<br>
&gt; -the sed operations end up executing twice, once for the prefix<br>
&gt; -reassignment and another for includedir if it is set as a string<br>
&gt; -including the ${prefix} variable.=C2=A0 This results in an issue<br>
&gt; -when the build directory is under /usr.<br>
&gt; -<br>
&gt; -This patch updates the remaining location which uses the prefix<br>
&gt; -variable to also sed and update to use the real path.<br>
&gt; -<br>
&gt; -Upstream bug report:<br>
&gt; -<a href=3D"https://bugs.python.org/issue31713" rel=3D"noreferrer" tar=
get=3D"_blank">https://bugs.python.org/issue31713</a><br>
&gt; -<br>
&gt; -Buildroot bug:<br>
&gt; -<a href=3D"https://bugs.busybox.net/show_bug.cgi?id=3D10361" rel=3D"n=
oreferrer" target=3D"_blank">https://bugs.busybox.net/show_bug.cgi?id=3D103=
61</a><br>
&gt; -<br>
&gt; -Fixes failures like the following:<br>
&gt; -dbus-python-1.2.4 | NOK | <a href=3D"http://autobuild.buildroot.net/r=
esults/758858efa97b6273c1b470513f5492258a6d8853" rel=3D"noreferrer" target=
=3D"_blank">http://autobuild.buildroot.net/results/758858efa97b6273c1b47051=
3f5492258a6d8853</a><br>
&gt; -<br>
&gt; -Signed-off-by: Matthew Weber &lt;<a href=3D"mailto:matthew.weber@rock=
wellcollins.com" target=3D"_blank">matthew.weber@rockwellcollins.com</a>&gt=
;<br>
&gt; ----<br>
&gt; - Misc/<a href=3D"http://python-config.sh.in" rel=3D"noreferrer" targe=
t=3D"_blank">python-config.sh.in</a> | 4 ++--<br>
&gt; - 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/Misc/<a href=3D"http://python-config.sh.in" rel=3D"noref=
errer" target=3D"_blank">python-config.sh.in</a> b/Misc/<a href=3D"http://p=
ython-config.sh.in" rel=3D"noreferrer" target=3D"_blank">python-config.sh.i=
n</a><br>
&gt; -index a1bc3cd5f7..164d2d3603 100644<br>
&gt; ---- a/Misc/<a href=3D"http://python-config.sh.in" rel=3D"noreferrer" =
target=3D"_blank">python-config.sh.in</a><br>
&gt; -+++ b/Misc/<a href=3D"http://python-config.sh.in" rel=3D"noreferrer" =
target=3D"_blank">python-config.sh.in</a><br>
&gt; -@@ -31,7 +31,7 @@ prefix_real=3D$(installed_prefix &quot;$0&quot;)<br=
>
&gt; - # locations. Keep prefix &amp; exec_prefix using their original valu=
es in case<br>
&gt; - # they are referenced in other configure variables, to prevent doubl=
e<br>
&gt; - # substitution, issue #22140.<br>
&gt; --prefix=3D$(echo &quot;$prefix_build&quot; | sed &quot;s#^$prefix_bui=
ld#$prefix_real#&quot;)<br>
&gt; -+prefix=3D$prefix_build<br>
&gt; - exec_prefix=3D$(echo &quot;$exec_prefix_build&quot; | sed &quot;s#^$=
exec_prefix_build#$prefix_real#&quot;)<br>
&gt; - exec_prefix_real=3D${prefix_real}<br>
&gt; - includedir=3D$(echo &quot;@includedir@&quot; | sed &quot;s#^$prefix_=
build#$prefix_real#&quot;)<br>
&gt; -@@ -49,7 +49,7 @@ LDLIBRARY=3D&quot;@LDLIBRARY@&quot;<br>
&gt; - OPT=3D&quot;@OPT@&quot;<br>
&gt; - PY_ENABLE_SHARED=3D&quot;@PY_ENABLE_SHARED@&quot;<br>
&gt; - LDVERSION=3D&quot;@LDVERSION@&quot;<br>
&gt; --LIBDEST=3D${prefix_real}/lib/python${VERSION}<br>
&gt; -+LIBDEST=3D$( echo &quot;${prefix}/lib/python${VERSION}&quot; | sed &=
quot;s#^$prefix_build#$prefix_real#&quot;)<br>
&gt; - LIBPL=3D$(echo &quot;@LIBPL@&quot; | sed &quot;s#^$prefix_build#$pre=
fix_real#&quot;)<br>
&gt; - SO=3D&quot;@EXT_SUFFIX@&quot;<br>
&gt; - PYTHONFRAMEWORK=3D&quot;@PYTHONFRAMEWORK@&quot;<br>
&gt; --- <br>
&gt; -2.34.1<br>
&gt; -<br>
&gt; diff --git a/package/python3/0032-gh-115382-Fix-cross-compiles-when-ho=
st-and-target-us.patch b/package/python3/0027-gh-115382-Fix-cross-compiles-=
when-host-and-target-us.patch<br>
&gt; similarity index 100%<br>
&gt; rename from package/python3/0032-gh-115382-Fix-cross-compiles-when-hos=
t-and-target-us.patch<br>
&gt; rename to package/python3/0027-gh-115382-Fix-cross-compiles-when-host-=
and-target-us.patch<br>
&gt; diff --git a/package/python3/0028-fix-building-on-older-distributions.=
patch b/package/python3/0028-fix-building-on-older-distributions.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 4541b31c5f..0000000000<br>
&gt; --- a/package/python3/0028-fix-building-on-older-distributions.patch<b=
r>
&gt; +++ /dev/null<br>
&gt; @@ -1,47 +0,0 @@<br>
&gt; -From e52e2c5e3df4bc3d2ff07ecb3b8e2a9099ea1631 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Adam Duskett &lt;<a href=3D"mailto:aduskett@gmail.com" target=
=3D"_blank">aduskett@gmail.com</a>&gt;<br>
&gt; -Date: Thu, 16 Aug 2018 14:52:37 -0700<br>
&gt; -Subject: [PATCH] fix building on older distributions<br>
&gt; -<br>
&gt; -Python &gt; 3.6.3 calls os.replace in the update_file.py script, duri=
ng the<br>
&gt; -regen-importlib phase of the build process.<br>
&gt; -<br>
&gt; -According to Doc/whatsnew/3.3.rst line 1631, os.replace acts in the s=
ame<br>
&gt; -way as os.rename, however, it is now cross-platform compatible for Wi=
ndows.<br>
&gt; -<br>
&gt; -Because BuildRoot is guaranteed only to be built in=C2=A0 POSIX envir=
onment, it is<br>
&gt; -safe to change os.replace back to os.rename.<br>
&gt; -<br>
&gt; -This change fixes building on older systems such as CentOS7, that onl=
y come<br>
&gt; -with python 2.<br>
&gt; -<br>
&gt; -Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:aduskett@gmail.com"=
 target=3D"_blank">aduskett@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - Tools/scripts/update_file.py | 4 ++--<br>
&gt; - 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/Tools/scripts/update_file.py b/Tools/scripts/update_file=
.py<br>
&gt; -index b4182c1d0c..ab443cb1a6 100644<br>
&gt; ---- a/Tools/scripts/update_file.py<br>
&gt; -+++ b/Tools/scripts/update_file.py<br>
&gt; -@@ -53,7 +53,7 @@ def update_file_with_tmpfile(filename, tmpfile, *, =
create=3DFalse):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not create:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise=C2=A0 # re-rais=
e<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0outcome =3D &#39;created&#39;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.replace(tmpfile, filename)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.rename(tmpfile, filename)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with targetfile:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0old_contents =3D targ=
etfile.read()<br>
&gt; -@@ -62,7 +62,7 @@ def update_file_with_tmpfile(filename, tmpfile, *, =
create=3DFalse):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Now compare!<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if old_contents !=3D new_contents:<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0outcome =3D &#39;upda=
ted&#39;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.replace(tmpfile, filena=
me)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.rename(tmpfile, filenam=
e)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0outcome =3D &#39;same=
&#39;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.unlink(tmpfile)<br=
>
&gt; --- <br>
&gt; -2.34.1<br>
&gt; -<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div></div>

--000000000000a6de4506173d57ee--

--===============3019759719142894738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3019759719142894738==--
