From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 20 Nov 2018 09:11:47 -0700
Subject: [Buildroot] [PATCH 1/1] python-aiohttp: new package
In-Reply-To: <CAGm1_kuNHBwyt78tX6sUkSWwW3Vu=0vW5nJHQtjNRw4DKwRD-A@mail.gmail.com>
References: <1542657158-9559-1-git-send-email-james.hilliard1@gmail.com>
 <CAGm1_kuNHBwyt78tX6sUkSWwW3Vu=0vW5nJHQtjNRw4DKwRD-A@mail.gmail.com>
Message-ID: <CADvTj4pYDMO149H3w57TaS1YujPqiS8b27k64MOxCKo-LQBq7Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

chardet is not used if cchardet is present, see here
https://github.com/aio-libs/aiohttp/blob/76268e31630bb8615999ec40984706745f7f82d1/aiohttp/client_reqrep.py#L40-L43
On Tue, Nov 20, 2018 at 12:46 AM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> Hi James,
> On Mon, Nov 19, 2018 at 8:53 PM <james.hilliard1@gmail.com> wrote:
> >
> > From: James Hilliard <james.hilliard1@gmail.com>
> >
> > Async http client/server framework (asyncio).
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  DEVELOPERS                                 |  1 +
> >  package/Config.in                          |  1 +
> >  package/python-aiohttp/Config.in           | 14 ++++++++++++++
> >  package/python-aiohttp/python-aiohttp.hash |  5 +++++
> >  package/python-aiohttp/python-aiohttp.mk   | 14 ++++++++++++++
> >  5 files changed, 35 insertions(+)
> >  create mode 100644 package/python-aiohttp/Config.in
> >  create mode 100644 package/python-aiohttp/python-aiohttp.hash
> >  create mode 100644 package/python-aiohttp/python-aiohttp.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index f4d98d9..cfc076b 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -985,6 +985,7 @@ F:  configs/pine64_sopine_defconfig
> >
> >  N:     James Hilliard <james.hilliard1@gmail.com>
> >  F:     package/python-aiodns/
> > +F:     package/python-aiohttp/
> >  F:     package/python-async-timeout/
> >  F:     package/python-cchardet/
> >  F:     package/python-multidict/
> > diff --git a/package/Config.in b/package/Config.in
> > index 5a5d840..776691b 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -795,6 +795,7 @@ if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
> >  menu "External python modules"
> >         source "package/python-aiocoap/Config.in"
> >         source "package/python-aiodns/Config.in"
> > +       source "package/python-aiohttp/Config.in"
> >         source "package/python-alsaaudio/Config.in"
> >         source "package/python-argh/Config.in"
> >         source "package/python-arrow/Config.in"
> > diff --git a/package/python-aiohttp/Config.in b/package/python-aiohttp/Config.in
> > new file mode 100644
> > index 0000000..81862c9
> > --- /dev/null
> > +++ b/package/python-aiohttp/Config.in
> > @@ -0,0 +1,14 @@
> > +config BR2_PACKAGE_PYTHON_AIOHTTP
> > +       bool "python-aiohttp"
> > +       depends on BR2_PACKAGE_PYTHON3
> > +       select BR2_PACKAGE_PYTHON_ATTRS # runtime
> > +       select BR2_PACKAGE_PYTHON_CCHARDET if BR2_INSTALL_LIBSTDCPP # runtime
> > +       select BR2_PACKAGE_PYTHON_CHARDET if !BR2_INSTALL_LIBSTDCPP # runtime
>
> According to [1] chardet is required anyway. So should
> BR2_INSTALL_LIBSTDCPP be a global dependency for the package?
>
> [1] https://github.com/aio-libs/aiohttp/blob/master/setup.py#L88
>
> Yegor
>
> > +       select BR2_PACKAGE_PYTHON_MULTIDICT # runtime
> > +       select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
> > +       select BR2_PACKAGE_PYTHON_YARL # runtime
> > +       select BR2_PACKAGE_PYTHON_AIODNS # runtime
> > +       help
> > +         Async http client/server framework (asyncio).
> > +
> > +         https://github.com/aio-libs/aiohttp
> > diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
> > new file mode 100644
> > index 0000000..8f158af
> > --- /dev/null
> > +++ b/package/python-aiohttp/python-aiohttp.hash
> > @@ -0,0 +1,5 @@
> > +# md5, sha256 from https://pypi.org/pypi/aiohttp/json
> > +md5    80a6e0c6c452d511d1d37755d6f0995a  aiohttp-3.4.4.tar.gz
> > +sha256 51afec6ffa50a9da4cdef188971a802beb1ca8e8edb40fa429e5e529db3475fa  aiohttp-3.4.4.tar.gz
> > +# Locally computed sha256 checksums
> > +sha256 bb0c0eeae85492ebfa03442b7784d4c42a623e15346df54ae85f55df972a82af  LICENSE.txt
> > diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
> > new file mode 100644
> > index 0000000..df8bdfb
> > --- /dev/null
> > +++ b/package/python-aiohttp/python-aiohttp.mk
> > @@ -0,0 +1,14 @@
> > +################################################################################
> > +#
> > +# python-aiohttp
> > +#
> > +################################################################################
> > +
> > +PYTHON_AIOHTTP_VERSION = 3.4.4
> > +PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
> > +PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/70/27/6098b4b60a3302a97f8ec97eb85d42f55a2fa904da4a369235a8e3b84352
> > +PYTHON_AIOHTTP_SETUP_TYPE = setuptools
> > +PYTHON_AIOHTTP_LICENSE = Apache-2.0
> > +PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
> > +
> > +$(eval $(python-package))
> > --
> > 2.7.4
> >
