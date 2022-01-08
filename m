Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00060C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 10:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A64860797;
	Sat,  8 Jan 2022 10:26:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hfvVU1qrKj0K; Sat,  8 Jan 2022 10:26:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C005607AA;
	Sat,  8 Jan 2022 10:26:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D2A091BF84C
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C83A580B9E
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:26:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bHN4hq0F45J8 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 10:26:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0BFF80B6F
 for <buildroot@busybox.net>; Sat,  8 Jan 2022 10:26:43 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id u13so24727084lff.12
 for <buildroot@busybox.net>; Sat, 08 Jan 2022 02:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s1pXCxv2RW/VSBs5XB/tE95MohbiTuSDerh9GIetdZQ=;
 b=KVg71T8LneM1bL+P3EdUD4VjlO2QcFZczhrL89OJ6IM+n0dnllP0xCxa8tVx6u2Cxf
 FNaI5+o3cGRHyv+5StwcUtrdQskD4H9jN2z4q4oynsOSuVhg1eco1aMnlUBxJGlgopDm
 qtphB2EPXfZWEGI5HhL5sYpkM9ES8yr4CRHxRrbwnYFhJoMAO9l7TfVbqG0h79xFS3bK
 0z+7aivHJsxbQQ7NQH4XCiQY6/Y6Q0GzY3xuOd/Y1mXi0Pyo2Lkp4czWWU9hspbhX8WD
 RhMjFZHI4pm7TPbl+2CuGGGNxakYWDZBZw3ftgoEu1WCWnFN+Y+kdZdZ+wCd8JE+HGsJ
 bBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s1pXCxv2RW/VSBs5XB/tE95MohbiTuSDerh9GIetdZQ=;
 b=bImrLNbNDoDaoDMW/IUPecCjbjqiOaGnKTJ6HUHUs6Bz72ikdeaY10JzDzwNUcfljM
 Ir3eo3TvTNKTZMmlPVvnQR/PNvIaQY+2Pziv0NJB7Fu7F78B4js0JsZM0rxjgnnSHHBK
 kM6Bes0Z+dMHH0xiTK3wD4jhfQq6AXmhoVDDcs4OEEe2GkTtXOooLNe3E2GKpWgmR1sn
 6sAdAiU3eb/480AGpasPJW+tZkVD5zSfz5Kf40KFurgQLHMPOjjOXWL8H1zVCVYGagS0
 6tB9K7KtdRalCdfZ582bDRc6gy4ForMu3Hwp2RsDESL93ejxdYXTx6Ql3tm/SPSN3WXk
 gTQg==
X-Gm-Message-State: AOAM533Z68j1SCvow92d35A0+T8NkuuOL1m1HYDEpOkKTr3nRQ7HPqan
 fSx+0lYazwy2sp8fH+I53+vQXm3iEqnzNBe8XjQ=
X-Google-Smtp-Source: ABdhPJzI4L6eyvamo3lhtsoQJZxjcz6I1D9q1WI3kb2N4L17cSqW9Ki4c9dH2g0N0YItFLYGows+/8Oc6gLBXuhiVf0=
X-Received: by 2002:a05:651c:614:: with SMTP id
 k20mr50767642lje.54.1641637601359; 
 Sat, 08 Jan 2022 02:26:41 -0800 (PST)
MIME-Version: 1.0
References: <cae0c1b2-34bb-b1a9-f02a-9e98ddd9fbe5@ideasonboard.com>
 <20220104123901.23929-1-guillaume.bressaix@gmail.com>
 <20220104123901.23929-3-guillaume.bressaix@gmail.com>
 <267a64ba-8407-bcea-0e3b-994986433b0c@mind.be>
In-Reply-To: <267a64ba-8407-bcea-0e3b-994986433b0c@mind.be>
From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Sat, 8 Jan 2022 11:26:14 +0100
Message-ID: <CAJe0E3cmzJz77K2xDJ149xX36YVQErTjSNPLiKxiOuYxms_jMw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH v2 3/3] support/testing: add test for
 python-pybind
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
Cc: buildroot@busybox.net, tomi.valkeinen@ideasonboard.com,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============2075831170482429120=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2075831170482429120==
Content-Type: multipart/alternative; boundary="000000000000143bfe05d50f8ae2"

--000000000000143bfe05d50f8ae2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Arnout,

>In the future, please make sure that you don't claim authorship on a patch
that is actually from someone else!

well I don't understand how the first submitted test/example relates to a
real use case or demonstrates something viable.
For me pybind is a compile time feature to enhance the compiler capacity.
So I was really confused as to what was submitted 2 years ago could
actually demonstrate anything.
Hence the different and kind of tweaked approach that I proposed.

I think we will refer to these notes as the holy bible as of now
https://git.busybox.net/buildroot/commit/?id=3Da19b822239c36cb40a632899bb5c=
3e848a5fc81e

> Generated with scanpypi and converted to host.
that seems a useful tool to use

> I bumped [python-pybind] to 2.9.0 instead and applied to master, thanks.
thanks I did not know it was out there

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le ven. 7 janv. 2022 =C3=A0 22:57, Arnout Vandecappelle <arnout@mind.be> a
=C3=A9crit :

>
>
> On 04/01/2022 13:39, guillaume.bressaix@gmail.com wrote:
> > From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
> >
> > python-pybind is a header only library, most of the time used as a
> host-package,
> > to customize the host/usr/python interpreter capacity (at build time)
> with C++ based features.
> >
> > Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
>
>   I applied to master with many changes:
>
>       - Retain python3 only.
>       - python-pybind is a target package, not host.
>       - Select python-pybind instead of depend.
>       - Simplify python-pybind-example package.
>       - Check in python-pybind-example build if pybind11.get_include()
>         produces output.
>       - Don't use python3 -m pybind11 --includes: it includes the main
> python
>         includes, which are for the host, not for the target.
>       - Use TestPythonPackageBase instead of open-coding something import=
ed
>         with host python.
>
>   However, I hadn't noticed that the original author of this test was
> Adam. In
> the future, please make sure that you don't claim authorship on a patch
> that is
> actually from someone else!
>
>   Regards,
>   Arnout
>
> > ---
> > This test case enhances the /host/usr/python interpreter with a C++
> macro.
> >
> > The test delivers a C++ macro contained in its br-external/example.cpp.
> > We compile it against the host context.
> > We install it to $(HOST_DIR)/usr/lib/python3.9 as it is natively
> contained
> > in the host-python system path (import is easy).
> > The macro is an integer adder, written in C++ that we can now call in
> host-python.
> >
> > The test infrastructure should actually be declared
> "host-generic-package"
> > instead of "generic-package", to be consistent with Buildroot
> infrastructure.
> > But I am not able to get this to actually do anything, if I declare thi=
s
> package
> > as a host-generic and "Config.in.host" instead of "Config.in". To me,
> this is
> > not too important
> >
> > * TestPythonPybind allows testing for both Py2 and Py3 like it is done
> > in many other packages
> >
> > * TestPythonPybind does not inherit from TestPythonPackageBase as
> usually done
> >    (1) because I need the br2-external feature to ship the example.cpp
> containing the custom macro
> >    (2) because TestPythonPackageBase always involves the emulator, whic=
h
> we do not want in our context
> >
> > * Although TestPythonPybind does have a TestPythonBase.config base at
> the same time,
> > as it is most convenient to have a valid python context
> >
> > * TestPythonPybind uses subprocess, as similarly done in 'core' on
> 'infra' test cases,
> > because we do not involve the emulator
> >
> > * TestPythonPybind tests (1+2)=3D3 written in C++, used in Python 2/3
> > * TestPythonPybind tests a custom module attribute, written in C++, use=
d
> in Python 2/3
> >
> > ---
> >   DEVELOPERS                                    |  3 ++
> >   .../br2-external/python-pybind/Config.in      |  1 +
> >   .../br2-external/python-pybind/external.desc  |  1 +
> >   .../br2-external/python-pybind/external.mk    |  1 +
> >   .../package/python-pybind-example/Config.in   |  5 ++
> >   .../package/python-pybind-example/example.cpp | 16 +++++++
> >   .../python-pybind-example.mk                  | 47 ++++++++++++++++++
> >   .../tests/package/sample_python_pybind.py     |  4 ++
> >   .../tests/package/test_python_pybind.py       | 48 ++++++++++++++++++=
+
> >   9 files changed, 126 insertions(+)
> >   create mode 100644
> support/testing/tests/package/br2-external/python-pybind/Config.in
> >   create mode 100644
> support/testing/tests/package/br2-external/python-pybind/external.desc
> >   create mode 100644
> support/testing/tests/package/br2-external/python-pybind/external.mk
> >   create mode 100644
> support/testing/tests/package/br2-external/python-pybind/package/python-p=
ybind-example/Config.in
> >   create mode 100644
> support/testing/tests/package/br2-external/python-pybind/package/python-p=
ybind-example/example.cpp
> >   create mode 100644
> support/testing/tests/package/br2-external/python-pybind/package/python-p=
ybind-example/
> python-pybind-example.mk
> >   create mode 100644
> support/testing/tests/package/sample_python_pybind.py
> >   create mode 100644 support/testing/tests/package/test_python_pybind.p=
y
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 21e4f2a84c..130ac3db73 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -1120,6 +1120,9 @@ F:      package/liquid-dsp/
> >   F:  package/pixiewps/
> >   F:  package/python-pybind/
> >   F:  package/reaver/
> > +F:   support/testing/tests/package/br2-external/python-pybind
> > +F:   support/testing/tests/package/sample_python_pybind.py
> > +F:   support/testing/tests/package/test_python_pybind.py
> >
> >   N:  Guo Ren <ren_guo@c-sky.com>
> >   F:  arch/Config.in.csky
> > diff --git
> a/support/testing/tests/package/br2-external/python-pybind/Config.in
> b/support/testing/tests/package/br2-external/python-pybind/Config.in
> > new file mode 100644
> > index 0000000000..70c77157b3
> > --- /dev/null
> > +++ b/support/testing/tests/package/br2-external/python-pybind/Config.i=
n
> > @@ -0,0 +1 @@
> > +source
> "$BR2_EXTERNAL_PYTHON_PYBIND_PATH/package/python-pybind-example/Config.in=
"
> > diff --git
> a/support/testing/tests/package/br2-external/python-pybind/external.desc
> b/support/testing/tests/package/br2-external/python-pybind/external.desc
> > new file mode 100644
> > index 0000000000..eef5e0f5a0
> > --- /dev/null
> > +++
> b/support/testing/tests/package/br2-external/python-pybind/external.desc
> > @@ -0,0 +1 @@
> > +name: PYTHON_PYBIND
> > diff --git a/support/testing/tests/package/br2-external/python-pybind/
> external.mk b/support/testing/tests/package/br2-external/python-pybind/
> external.mk
> > new file mode 100644
> > index 0000000000..3501f3135e
> > --- /dev/null
> > +++ b/support/testing/tests/package/br2-external/python-pybind/
> external.mk
> > @@ -0,0 +1 @@
> > +include $(sort $(wildcard
> $(BR2_EXTERNAL_PYTHON_PYBIND_PATH)/package/*/*.mk))
> > diff --git
> a/support/testing/tests/package/br2-external/python-pybind/package/python=
-pybind-example/Config.in
> b/support/testing/tests/package/br2-external/python-pybind/package/python=
-pybind-example/Config.in
> > new file mode 100644
> > index 0000000000..773d021a53
> > --- /dev/null
> > +++
> b/support/testing/tests/package/br2-external/python-pybind/package/python=
-pybind-example/Config.in
> > @@ -0,0 +1,5 @@
> > +config BR2_PACKAGE_PYTHON_PYBIND_EXAMPLE
> > +     bool "python-pybind-example"
> > +     depends on BR2_PACKAGE_PYTHON_PYBIND
> > +     help
> > +       This test creates a cpp macro later used on target in python
> > diff --git
> a/support/testing/tests/package/br2-external/python-pybind/package/python=
-pybind-example/example.cpp
> b/support/testing/tests/package/br2-external/python-pybind/package/python=
-pybind-example/example.cpp
> > new file mode 100644
> > index 0000000000..f2eea8e48d
> > --- /dev/null
> > +++
> b/support/testing/tests/package/br2-external/python-pybind/package/python=
-pybind-example/example.cpp
> > @@ -0,0 +1,16 @@
> > +#include <pybind11/pybind11.h>
> > +namespace py =3D pybind11;
> > +
> > +int add (int i, int j) {
> > +    return i + j;
> > +}
> > +
> > +PYBIND11_MODULE (example, m) {
> > +    // optional module description
> > +    m.doc() =3D "pybind11 example plugin";
> > +    // test a module method
> > +    m.def("add", &add, "example::add adds two integer numbers");
> > +    // test a module attribute
> > +    py::object hello =3D py::cast("Hello World");
> > +    m.attr("says") =3D hello;
> > +}
> > diff --git
> a/support/testing/tests/package/br2-external/python-pybind/package/python=
-pybind-example/
> python-pybind-example.mk
> b/support/testing/tests/package/br2-external/python-pybind/package/python=
-pybind-example/
> python-pybind-example.mk
> > new file mode 100644
> > index 0000000000..85dd09d93f
> > --- /dev/null
> > +++
> b/support/testing/tests/package/br2-external/python-pybind/package/python=
-pybind-example/
> python-pybind-example.mk
> > @@ -0,0 +1,47 @@
> >
> +########################################################################=
########
> > +#
> > +# python-pybind-example
> > +#
> >
> +########################################################################=
########
> > +
> > +# this builds a C++ macro "add(a,b)"
> > +# that we expose to host-python with a custom install
> > +# and that the python test script will later use
> > +PYTHON_PYBIND_EXAMPLE_DEPENDENCIES =3D host-python-pybind
> > +
> > +PYTHON_PYBIND_EXAMPLE_CXX_FLAGS =3D $(HOST_CXXFLAGS)
> > +PYTHON_PYBIND_EXAMPLE_CXX_FLAGS +=3D -Wall -shared
> > +PYTHON_PYBIND_EXAMPLE_CXX_FLAGS +=3D -std=3Dc++11 -fPIC
> > +
> > +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> > +PYTHON_PYBIND_PYVER =3D python$(PYTHON3_VERSION_MAJOR)
> > +PYTHON_PYBIND_PYTHON =3D $(HOST_DIR)/usr/bin/python3
> > +else
> > +PYTHON_PYBIND_PYVER =3D python$(PYTHON_VERSION_MAJOR)
> > +PYTHON_PYBIND_PYTHON =3D $(HOST_DIR)/usr/bin/python2
> > +endif
> > +
> > +# retrieve pybind11 include paths
> > +PYTHON_PYBIND_EXAMPLE_CXX_FLAGS +=3D \
> > +     $(shell $(PYTHON_PYBIND_PYTHON) -m pybind11 --includes)
> > +
> > +# .so to be installed must have exact suffix
> > +# otherwise import() in python will not work
> > +HOST_LIB_BINARY_SUFFIX =3D \
> > +     $(shell $(PYTHON_PYBIND_PYTHON)-config --extension-suffix)
> > +
> > +define PYTHON_PYBIND_EXAMPLE_BUILD_CMDS
> > +     $(INSTALL) $(PYTHON_PYBIND_EXAMPLE_PKGDIR)/example.cpp $(@D)
> > +     cd $(@D); \
> > +                     $(HOSTCXX) $(PYTHON_PYBIND_EXAMPLE_CXX_FLAGS) \
> > +                             example.cpp -o
> example$(HOST_LIB_BINARY_SUFFIX)
> > +endef
> > +
> > +# installs into host/python sys.path
> > +# so the new macro is naturally known
> > +define PYTHON_PYBIND_EXAMPLE_INSTALL_TARGET_CMDS
> > +     $(INSTALL) -D -m 755 $(@D)/example$(HOST_LIB_BINARY_SUFFIX) \
> > +
>  $(HOST_DIR)/usr/lib/$(PYTHON_PYBIND_PYVER)/example$(HOST_LIB_BINARY_SUFF=
IX)
> > +endef
> > +
> > +$(eval $(generic-package))
> > diff --git a/support/testing/tests/package/sample_python_pybind.py
> b/support/testing/tests/package/sample_python_pybind.py
> > new file mode 100644
> > index 0000000000..605c0bab15
> > --- /dev/null
> > +++ b/support/testing/tests/package/sample_python_pybind.py
> > @@ -0,0 +1,4 @@
> > +#!/usr/bin/env python
> > +import example
> > +print(example.add(1, 2))
> > +print(example.says)
> > diff --git a/support/testing/tests/package/test_python_pybind.py
> b/support/testing/tests/package/test_python_pybind.py
> > new file mode 100644
> > index 0000000000..7a68d6512a
> > --- /dev/null
> > +++ b/support/testing/tests/package/test_python_pybind.py
> > @@ -0,0 +1,48 @@
> > +import os
> > +import infra
> > +import subprocess
> > +from tests.package.test_python import TestPythonPackageBase
> > +
> > +class TestPythonPybind (infra.basetest.BRTest):
> > +     config =3D TestPythonPackageBase.config # python minimal requirem=
ents
> > +     sample_script =3D "tests/package/sample_python_pybind.py"
> > +     # ship examples macro & installs it to host
> > +     br2_external =3D
> [infra.filepath("tests/package/br2-external/python-pybind")]
> > +
> > +class TestPythonPy2Pybind (TestPythonPybind):
> > +     __test__ =3D True
> > +     config =3D TestPythonPybind.config + \
> > +             """
> > +             BR2_PACKAGE_PYTHON=3Dy
> > +             BR2_PACKAGE_PYTHON_PYBIND=3Dy
> > +             BR2_PACKAGE_PYTHON_PYBIND_EXAMPLE=3Dy
> > +             """
> > +
> > +     def test_run(self):
> > +             host_interpreter =3D
> os.path.join(self.builddir,"host","usr","bin","python")
> > +             # test new c++->py macro exposed to host interpreter
> > +             cmd =3D [host_interpreter,
> infra.filepath(self.sample_script)]
> > +             output =3D subprocess.check_output(cmd)
> > +             result =3D int(output.splitlines()[0])
> > +             attribute =3D output.splitlines()[1].decode("utf-8")
> > +             self.assertEqual(result,3) # 2+1 using '+' macro from cpp
> > +             self.assertEqual(attribute,"Hello World") # macro special
> attribute
> > +
> > +class TestPythonPy3Pybind (TestPythonPybind):
> > +     __test__ =3D True
> > +     config =3D TestPythonPybind.config + \
> > +             """
> > +             BR2_PACKAGE_PYTHON3=3Dy
> > +             BR2_PACKAGE_PYTHON_PYBIND=3Dy
> > +             BR2_PACKAGE_PYTHON_PYBIND_EXAMPLE=3Dy
> > +             """
> > +
> > +     def test_run(self):
> > +             host_interpreter =3D
> os.path.join(self.builddir,"host","usr","bin","python")
> > +             # test new c++->py macro exposed to host interpreter
> > +             cmd =3D [host_interpreter,
> infra.filepath(self.sample_script)]
> > +             output =3D subprocess.check_output(cmd)
> > +             result =3D int(output.splitlines()[0])
> > +             attribute =3D output.splitlines()[1].decode("utf-8")
> > +             self.assertEqual(result,3) # 2+1 using '+' macro from cpp
> > +             self.assertEqual(attribute,"Hello World") # macro special
> attribute
> >
>

--000000000000143bfe05d50f8ae2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Arnout,<br><br>&gt;In the future, please make sure t=
hat you don&#39;t claim authorship on a patch that is=C2=A0actually from so=
meone else!<br><br>well I don&#39;t understand how the first submitted test=
/example relates to a real use case or demonstrates something viable.=C2=A0=
<br>For me pybind is a compile time feature to enhance the compiler capacit=
y.<br><div>So I was really confused as to what was submitted 2 years ago co=
uld actually demonstrate anything.<br>Hence the different and kind of tweak=
ed approach that I proposed.<br><br>I think we will refer to these notes as=
 the holy bible as of now=C2=A0<a href=3D"https://git.busybox.net/buildroot=
/commit/?id=3Da19b822239c36cb40a632899bb5c3e848a5fc81e">https://git.busybox=
.net/buildroot/commit/?id=3Da19b822239c36cb40a632899bb5c3e848a5fc81e</a><br=
><br>&gt; Generated with scanpypi and converted to host.<br>that seems a us=
eful tool to use<br><br></div><div>&gt; I bumped [python-pybind] to 2.9.0 i=
nstead and applied to master, thanks.<br>thanks I did not know it was out t=
here<br><br clear=3D"all"><div><div dir=3D"ltr" data-smartmail=3D"gmail_sig=
nature"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"=
><div><div><div><font face=3D"arial,helvetica,sans-serif">Guillaume W. Bres=
<br></font></div><font face=3D"arial,helvetica,sans-serif">Software enginee=
r</font><br></div><font face=3D"arial,helvetica,sans-serif"></font></div><f=
ont face=3D"arial,helvetica,sans-serif">&lt;<a href=3D"mailto:guillaume.bre=
ssaix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br>=
</font></div></div></div></div></div></div><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 7 janv.=
 2022 =C3=A0=C2=A022:57, Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@=
mind.be" target=3D"_blank">arnout@mind.be</a>&gt; a =C3=A9crit=C2=A0:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 04/01/2022 13:39, <a href=3D"mailto:guillaume.bressaix@gmail.com" target=
=3D"_blank">guillaume.bressaix@gmail.com</a> wrote:<br>
&gt; From: &quot;Guillaume W. Bres&quot; &lt;<a href=3D"mailto:guillaume.br=
essaix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br=
>
&gt; <br>
&gt; python-pybind is a header only library, most of the time used as a hos=
t-package,<br>
&gt; to customize the host/usr/python interpreter capacity (at build time) =
with C++ based features.<br>
&gt; <br>
&gt; Signed-off-by: Guillaume W. Bres &lt;<a href=3D"mailto:guillaume.bress=
aix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br>
<br>
=C2=A0 I applied to master with many changes:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 - Retain python3 only.<br>
=C2=A0 =C2=A0 =C2=A0 - python-pybind is a target package, not host.<br>
=C2=A0 =C2=A0 =C2=A0 - Select python-pybind instead of depend.<br>
=C2=A0 =C2=A0 =C2=A0 - Simplify python-pybind-example package.<br>
=C2=A0 =C2=A0 =C2=A0 - Check in python-pybind-example build if pybind11.get=
_include()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 produces output.<br>
=C2=A0 =C2=A0 =C2=A0 - Don&#39;t use python3 -m pybind11 --includes: it inc=
ludes the main python<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 includes, which are for the host, not for the t=
arget.<br>
=C2=A0 =C2=A0 =C2=A0 - Use TestPythonPackageBase instead of open-coding som=
ething imported<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 with host python.<br>
<br>
=C2=A0 However, I hadn&#39;t noticed that the original author of this test =
was Adam. In <br>
the future, please make sure that you don&#39;t claim authorship on a patch=
 that is <br>
actually from someone else!<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; ---<br>
&gt; This test case enhances the /host/usr/python interpreter with a C++ ma=
cro.<br>
&gt; <br>
&gt; The test delivers a C++ macro contained in its br-external/example.cpp=
.<br>
&gt; We compile it against the host context.<br>
&gt; We install it to $(HOST_DIR)/usr/lib/python3.9 as it is natively conta=
ined<br>
&gt; in the host-python system path (import is easy).<br>
&gt; The macro is an integer adder, written in C++ that we can now call in =
host-python.<br>
&gt; <br>
&gt; The test infrastructure should actually be declared &quot;host-generic=
-package&quot;<br>
&gt; instead of &quot;generic-package&quot;, to be consistent with Buildroo=
t infrastructure.<br>
&gt; But I am not able to get this to actually do anything, if I declare th=
is package<br>
&gt; as a host-generic and &quot;Config.in.host&quot; instead of &quot;Conf=
ig.in&quot;. To me, this is<br>
&gt; not too important<br>
&gt; <br>
&gt; * TestPythonPybind allows testing for both Py2 and Py3 like it is done=
<br>
&gt; in many other packages<br>
&gt; <br>
&gt; * TestPythonPybind does not inherit from TestPythonPackageBase as usua=
lly done<br>
&gt;=C2=A0 =C2=A0 (1) because I need the br2-external feature to ship the e=
xample.cpp containing the custom macro<br>
&gt;=C2=A0 =C2=A0 (2) because TestPythonPackageBase always involves the emu=
lator, which we do not want in our context<br>
&gt; <br>
&gt; * Although TestPythonPybind does have a TestPythonBase.config base at =
the same time,<br>
&gt; as it is most convenient to have a valid python context<br>
&gt; <br>
&gt; * TestPythonPybind uses subprocess, as similarly done in &#39;core&#39=
; on &#39;infra&#39; test cases,<br>
&gt; because we do not involve the emulator<br>
&gt; <br>
&gt; * TestPythonPybind tests (1+2)=3D3 written in C++, used in Python 2/3<=
br>
&gt; * TestPythonPybind tests a custom module attribute, written in C++, us=
ed in Python 2/3<br>
&gt; <br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 3 ++<br>
&gt;=C2=A0 =C2=A0.../br2-external/python-pybind/Config.in=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0.../br2-external/python-pybind/external.desc=C2=A0 |=C2=A0=
 1 +<br>
&gt;=C2=A0 =C2=A0.../br2-external/python-pybind/<a href=3D"http://external.=
mk" rel=3D"noreferrer" target=3D"_blank">external.mk</a>=C2=A0 =C2=A0 |=C2=
=A0 1 +<br>
&gt;=C2=A0 =C2=A0.../package/python-pybind-example/Config.in=C2=A0 =C2=A0|=
=C2=A0 5 ++<br>
&gt;=C2=A0 =C2=A0.../package/python-pybind-example/example.cpp | 16 +++++++=
<br>
&gt;=C2=A0 =C2=A0.../<a href=3D"http://python-pybind-example.mk" rel=3D"nor=
eferrer" target=3D"_blank">python-pybind-example.mk</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 47 ++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0.../tests/package/sample_python_pybind.py=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 4 ++<br>
&gt;=C2=A0 =C2=A0.../tests/package/test_python_pybind.py=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 48 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A09 files changed, 126 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 support/testing/tests/package/br2-exter=
nal/python-pybind/Config.in<br>
&gt;=C2=A0 =C2=A0create mode 100644 support/testing/tests/package/br2-exter=
nal/python-pybind/external.desc<br>
&gt;=C2=A0 =C2=A0create mode 100644 support/testing/tests/package/br2-exter=
nal/python-pybind/<a href=3D"http://external.mk" rel=3D"noreferrer" target=
=3D"_blank">external.mk</a><br>
&gt;=C2=A0 =C2=A0create mode 100644 support/testing/tests/package/br2-exter=
nal/python-pybind/package/python-pybind-example/Config.in<br>
&gt;=C2=A0 =C2=A0create mode 100644 support/testing/tests/package/br2-exter=
nal/python-pybind/package/python-pybind-example/example.cpp<br>
&gt;=C2=A0 =C2=A0create mode 100644 support/testing/tests/package/br2-exter=
nal/python-pybind/package/python-pybind-example/<a href=3D"http://python-py=
bind-example.mk" rel=3D"noreferrer" target=3D"_blank">python-pybind-example=
.mk</a><br>
&gt;=C2=A0 =C2=A0create mode 100644 support/testing/tests/package/sample_py=
thon_pybind.py<br>
&gt;=C2=A0 =C2=A0create mode 100644 support/testing/tests/package/test_pyth=
on_pybind.py<br>
&gt; <br>
&gt; diff --git a/DEVELOPERS b/DEVELOPERS<br>
&gt; index 21e4f2a84c..130ac3db73 100644<br>
&gt; --- a/DEVELOPERS<br>
&gt; +++ b/DEVELOPERS<br>
&gt; @@ -1120,6 +1120,9 @@ F:=C2=A0 =C2=A0 =C2=A0 package/liquid-dsp/<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 package/pixiewps/<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 package/python-pybind/<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 package/reaver/<br>
&gt; +F:=C2=A0 =C2=A0support/testing/tests/package/br2-external/python-pybi=
nd<br>
&gt; +F:=C2=A0 =C2=A0support/testing/tests/package/sample_python_pybind.py<=
br>
&gt; +F:=C2=A0 =C2=A0support/testing/tests/package/test_python_pybind.py<br=
>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0N:=C2=A0 Guo Ren &lt;<a href=3D"mailto:ren_guo@c-sky.com" =
target=3D"_blank">ren_guo@c-sky.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0F:=C2=A0 arch/Config.in.csky<br>
&gt; diff --git a/support/testing/tests/package/br2-external/python-pybind/=
Config.in b/support/testing/tests/package/br2-external/python-pybind/Config=
.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..70c77157b3<br>
&gt; --- /dev/null<br>
&gt; +++ b/support/testing/tests/package/br2-external/python-pybind/Config.=
in<br>
&gt; @@ -0,0 +1 @@<br>
&gt; +source &quot;$BR2_EXTERNAL_PYTHON_PYBIND_PATH/package/python-pybind-e=
xample/Config.in&quot;<br>
&gt; diff --git a/support/testing/tests/package/br2-external/python-pybind/=
external.desc b/support/testing/tests/package/br2-external/python-pybind/ex=
ternal.desc<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..eef5e0f5a0<br>
&gt; --- /dev/null<br>
&gt; +++ b/support/testing/tests/package/br2-external/python-pybind/externa=
l.desc<br>
&gt; @@ -0,0 +1 @@<br>
&gt; +name: PYTHON_PYBIND<br>
&gt; diff --git a/support/testing/tests/package/br2-external/python-pybind/=
<a href=3D"http://external.mk" rel=3D"noreferrer" target=3D"_blank">externa=
l.mk</a> b/support/testing/tests/package/br2-external/python-pybind/<a href=
=3D"http://external.mk" rel=3D"noreferrer" target=3D"_blank">external.mk</a=
><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..3501f3135e<br>
&gt; --- /dev/null<br>
&gt; +++ b/support/testing/tests/package/br2-external/python-pybind/<a href=
=3D"http://external.mk" rel=3D"noreferrer" target=3D"_blank">external.mk</a=
><br>
&gt; @@ -0,0 +1 @@<br>
&gt; +include $(sort $(wildcard $(BR2_EXTERNAL_PYTHON_PYBIND_PATH)/package/=
*/*.mk))<br>
&gt; diff --git a/support/testing/tests/package/br2-external/python-pybind/=
package/python-pybind-example/Config.in b/support/testing/tests/package/br2=
-external/python-pybind/package/python-pybind-example/Config.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..773d021a53<br>
&gt; --- /dev/null<br>
&gt; +++ b/support/testing/tests/package/br2-external/python-pybind/package=
/python-pybind-example/Config.in<br>
&gt; @@ -0,0 +1,5 @@<br>
&gt; +config BR2_PACKAGE_PYTHON_PYBIND_EXAMPLE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;python-pybind-example&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_PYTHON_PYBIND<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0This test creates a cpp macro later used o=
n target in python<br>
&gt; diff --git a/support/testing/tests/package/br2-external/python-pybind/=
package/python-pybind-example/example.cpp b/support/testing/tests/package/b=
r2-external/python-pybind/package/python-pybind-example/example.cpp<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..f2eea8e48d<br>
&gt; --- /dev/null<br>
&gt; +++ b/support/testing/tests/package/br2-external/python-pybind/package=
/python-pybind-example/example.cpp<br>
&gt; @@ -0,0 +1,16 @@<br>
&gt; +#include &lt;pybind11/pybind11.h&gt;<br>
&gt; +namespace py =3D pybind11;<br>
&gt; +<br>
&gt; +int add (int i, int j) {<br>
&gt; +=C2=A0 =C2=A0 return i + j;<br>
&gt; +}<br>
&gt; +<br>
&gt; +PYBIND11_MODULE (example, m) {<br>
&gt; +=C2=A0 =C2=A0 // optional module description<br>
&gt; +=C2=A0 =C2=A0 m.doc() =3D &quot;pybind11 example plugin&quot;;<br>
&gt; +=C2=A0 =C2=A0 // test a module method<br>
&gt; +=C2=A0 =C2=A0 m.def(&quot;add&quot;, &amp;add, &quot;example::add add=
s two integer numbers&quot;);<br>
&gt; +=C2=A0 =C2=A0 // test a module attribute<br>
&gt; +=C2=A0 =C2=A0 py::object hello =3D py::cast(&quot;Hello World&quot;);=
<br>
&gt; +=C2=A0 =C2=A0 m.attr(&quot;says&quot;) =3D hello;<br>
&gt; +}<br>
&gt; diff --git a/support/testing/tests/package/br2-external/python-pybind/=
package/python-pybind-example/<a href=3D"http://python-pybind-example.mk" r=
el=3D"noreferrer" target=3D"_blank">python-pybind-example.mk</a> b/support/=
testing/tests/package/br2-external/python-pybind/package/python-pybind-exam=
ple/<a href=3D"http://python-pybind-example.mk" rel=3D"noreferrer" target=
=3D"_blank">python-pybind-example.mk</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..85dd09d93f<br>
&gt; --- /dev/null<br>
&gt; +++ b/support/testing/tests/package/br2-external/python-pybind/package=
/python-pybind-example/<a href=3D"http://python-pybind-example.mk" rel=3D"n=
oreferrer" target=3D"_blank">python-pybind-example.mk</a><br>
&gt; @@ -0,0 +1,47 @@<br>
&gt; +#####################################################################=
###########<br>
&gt; +#<br>
&gt; +# python-pybind-example<br>
&gt; +#<br>
&gt; +#####################################################################=
###########<br>
&gt; +<br>
&gt; +# this builds a C++ macro &quot;add(a,b)&quot;<br>
&gt; +# that we expose to host-python with a custom install<br>
&gt; +# and that the python test script will later use<br>
&gt; +PYTHON_PYBIND_EXAMPLE_DEPENDENCIES =3D host-python-pybind<br>
&gt; +<br>
&gt; +PYTHON_PYBIND_EXAMPLE_CXX_FLAGS =3D $(HOST_CXXFLAGS)<br>
&gt; +PYTHON_PYBIND_EXAMPLE_CXX_FLAGS +=3D -Wall -shared<br>
&gt; +PYTHON_PYBIND_EXAMPLE_CXX_FLAGS +=3D -std=3Dc++11 -fPIC<br>
&gt; +<br>
&gt; +ifeq ($(BR2_PACKAGE_PYTHON3),y)<br>
&gt; +PYTHON_PYBIND_PYVER =3D python$(PYTHON3_VERSION_MAJOR)<br>
&gt; +PYTHON_PYBIND_PYTHON =3D $(HOST_DIR)/usr/bin/python3<br>
&gt; +else<br>
&gt; +PYTHON_PYBIND_PYVER =3D python$(PYTHON_VERSION_MAJOR)<br>
&gt; +PYTHON_PYBIND_PYTHON =3D $(HOST_DIR)/usr/bin/python2<br>
&gt; +endif<br>
&gt; +<br>
&gt; +# retrieve pybind11 include paths<br>
&gt; +PYTHON_PYBIND_EXAMPLE_CXX_FLAGS +=3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(shell $(PYTHON_PYBIND_PYTHON) -m pybind11 --inc=
ludes)<br>
&gt; +<br>
&gt; +# .so to be installed must have exact suffix<br>
&gt; +# otherwise import() in python will not work<br>
&gt; +HOST_LIB_BINARY_SUFFIX =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(shell $(PYTHON_PYBIND_PYTHON)-config --extensio=
n-suffix)<br>
&gt; +<br>
&gt; +define PYTHON_PYBIND_EXAMPLE_BUILD_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) $(PYTHON_PYBIND_EXAMPLE_PKGDIR)/exampl=
e.cpp $(@D)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cd $(@D); \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0$(HOSTCXX) $(PYTHON_PYBIND_EXAMPLE_CXX_FLAGS) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0example.cpp -o example$(HOST_LIB_BINARY_=
SUFFIX)<br>
&gt; +endef<br>
&gt; +<br>
&gt; +# installs into host/python sys.path<br>
&gt; +# so the new macro is naturally known<br>
&gt; +define PYTHON_PYBIND_EXAMPLE_INSTALL_TARGET_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 755 $(@D)/example$(HOST_LIB_BINA=
RY_SUFFIX) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(HOST_DIR)/usr/lib/$=
(PYTHON_PYBIND_PYVER)/example$(HOST_LIB_BINARY_SUFFIX)<br>
&gt; +endef<br>
&gt; +<br>
&gt; +$(eval $(generic-package))<br>
&gt; diff --git a/support/testing/tests/package/sample_python_pybind.py b/s=
upport/testing/tests/package/sample_python_pybind.py<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..605c0bab15<br>
&gt; --- /dev/null<br>
&gt; +++ b/support/testing/tests/package/sample_python_pybind.py<br>
&gt; @@ -0,0 +1,4 @@<br>
&gt; +#!/usr/bin/env python<br>
&gt; +import example<br>
&gt; +print(example.add(1, 2))<br>
&gt; +print(example.says)<br>
&gt; diff --git a/support/testing/tests/package/test_python_pybind.py b/sup=
port/testing/tests/package/test_python_pybind.py<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..7a68d6512a<br>
&gt; --- /dev/null<br>
&gt; +++ b/support/testing/tests/package/test_python_pybind.py<br>
&gt; @@ -0,0 +1,48 @@<br>
&gt; +import os<br>
&gt; +import infra<br>
&gt; +import subprocess<br>
&gt; +from tests.package.test_python import TestPythonPackageBase<br>
&gt; +<br>
&gt; +class TestPythonPybind (infra.basetest.BRTest):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0config =3D TestPythonPackageBase.config # python =
minimal requirements<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sample_script =3D &quot;tests/package/sample_pyth=
on_pybind.py&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# ship examples macro &amp; installs it to host<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0br2_external =3D [infra.filepath(&quot;tests/pack=
age/br2-external/python-pybind&quot;)]<br>
&gt; +<br>
&gt; +class TestPythonPy2Pybind (TestPythonPybind):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__test__ =3D True<br>
&gt; +=C2=A0 =C2=A0 =C2=A0config =3D TestPythonPybind.config + \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_PYTHON=3D=
y<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_PYTHON_PY=
BIND=3Dy<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_PYTHON_PY=
BIND_EXAMPLE=3Dy<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0def test_run(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host_interpreter =3D =
os.path.join(self.builddir,&quot;host&quot;,&quot;usr&quot;,&quot;bin&quot;=
,&quot;python&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# test new c++-&gt;py=
 macro exposed to host interpreter<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D [host_interpr=
eter, infra.filepath(self.sample_script)]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output =3D subprocess=
.check_output(cmd)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D int(output=
.splitlines()[0])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0attribute =3D output.=
splitlines()[1].decode(&quot;utf-8&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(resu=
lt,3) # 2+1 using &#39;+&#39; macro from cpp<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(attr=
ibute,&quot;Hello World&quot;) # macro special attribute<br>
&gt; +<br>
&gt; +class TestPythonPy3Pybind (TestPythonPybind):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__test__ =3D True<br>
&gt; +=C2=A0 =C2=A0 =C2=A0config =3D TestPythonPybind.config + \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_PYTHON3=
=3Dy<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_PYTHON_PY=
BIND=3Dy<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_PYTHON_PY=
BIND_EXAMPLE=3Dy<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0def test_run(self):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host_interpreter =3D =
os.path.join(self.builddir,&quot;host&quot;,&quot;usr&quot;,&quot;bin&quot;=
,&quot;python&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# test new c++-&gt;py=
 macro exposed to host interpreter<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D [host_interpr=
eter, infra.filepath(self.sample_script)]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output =3D subprocess=
.check_output(cmd)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D int(output=
.splitlines()[0])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0attribute =3D output.=
splitlines()[1].decode(&quot;utf-8&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(resu=
lt,3) # 2+1 using &#39;+&#39; macro from cpp<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(attr=
ibute,&quot;Hello World&quot;) # macro special attribute<br>
&gt; <br>
</blockquote></div>

--000000000000143bfe05d50f8ae2--

--===============2075831170482429120==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2075831170482429120==--

