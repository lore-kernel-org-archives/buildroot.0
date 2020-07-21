From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Mon, 20 Jul 2020 20:57:25 -0500
Subject: [Buildroot] [PATCH v2] package/resiprocate: new package
In-Reply-To: <20200720222812.0d6432bc@windsurf.home>
References: <20200720143245.48783-1-ryan.barnett@rockwellcollins.com>
 <20200720222812.0d6432bc@windsurf.home>
Message-ID: <CAMQcK5Kh4eeiN1Fm0=14JFsOzgtdoHHR+mFxHjpPMWQVBazXDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Jul 20, 2020 at 3:30 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Mon, 20 Jul 2020 09:32:45 -0500
> Ryan Barnett <ryan.barnett@rockwellcollins.com> wrote:
>
> > reSIProcate is a framework that aims to fully implement the SIP
> > protocol in first class C++. It is intended for use in other
> > applications, such as the repro SIP proxy.
> >
> > Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
>
> I've applied after doing a number of changes, see below.
>
> >  package/Config.in                    |  1 +
> >  package/resiprocate/Config.in        | 48 ++++++++++++++++++++++++++++
> >  package/resiprocate/resiprocate.hash |  4 +++
> >  package/resiprocate/resiprocate.mk   | 47 +++++++++++++++++++++++++++
> >  4 files changed, 100 insertions(+)
>
> An entry in the DEVELOPERS file was missing, so I added one.
>
> > diff --git a/package/resiprocate/Config.in b/package/resiprocate/Config.in
> > new file mode 100644
> > index 0000000000..fc44a6a30f
> > --- /dev/null
> > +++ b/package/resiprocate/Config.in
> > @@ -0,0 +1,48 @@
> > +config BR2_PACKAGE_RESIPROCATE
> > +     bool "resiprocate"
> > +     depends on BR2_INSTALL_LIBSTDCPP
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS
> > +     depends on BR2_USE_WCHAR
> > +     depends on BR2_USE_MMU # fork()
> > +     select BR2_PACKAGE_C_ARES
> > +     help
> > +       reSIProcate is a framework that aims to fully implement the
> > +       SIP protocol in first class C++. It is intended for use in
> > +       other applications, such as the repro SIP proxy.
> > +
> > +       By default this package provides the core libraries: librutil
> > +       (utilities), libresip (SIP stack/RFC compliant message
> > +       parsing) and libdum (SIP Dialog Usage Manager, a state
> > +       machine for SIP dialogs).
> > +
> > +       https://www.resiprocate.org/
> > +
> > +comment "resiprocate needs a toolchain w/ C++, threads, wchar"
> > +     depends on BR2_USE_MMU
> > +     depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
>
> This comment was not placed correctly: placed between the main option
> and the sub-options, it breaks the indentation of the sub-options in
> menuconfig. So I moved it earlier in the file.

Thank you for pointing this out and the explanation. I noticed that
they were not intended as sub-options but could did not know why they
were not intended

> > +
> > +if BR2_PACKAGE_RESIPROCATE
> > +
> > +config BR2_PACKAGE_RESIPROCATE_DTLS_SUPPORT
> > +     bool "Enable DTLS support"
> > +     select BR2_PACKAGE_OPENSSL
> > +     help
> > +       Enable DTLS support (requires OpenSSL)
>
> I haven't changed this, but I'm wondering if it makes sense to have a
> separate option for this. You already have an optional dependency on
> OpenSSL. How much more size does --with-dtls takes ?

The reason that I created this option was so that when selected, it
will also select/enable OpenSSL features for the package. As far as
size improvements, there are none:

Build with only enabling BR2_PACKAGE_RESIPROCATE (size in bytes):

    3168800 Jul 20 20:06 output/target/usr/lib/libresip-1.12.so*

Build with BR2_PACKAGE_RESIPROCATE_DTLS_SUPPORT (size in bytes):

    3168800 Jul 20 20:29 output/target/usr/lib/libresip-1.12.so*

Do you just prefer this option is removed?

>
> > diff --git a/package/resiprocate/resiprocate.hash b/package/resiprocate/resiprocate.hash
> > new file mode 100644
> > index 0000000000..03336c64a2
> > --- /dev/null
> > +++ b/package/resiprocate/resiprocate.hash
> > @@ -0,0 +1,4 @@
> > +# http://list.resiprocate.org/pipermail/resiprocate-announce/2020-May/000000.html
> > +sha256  046826503d3c8682ae0e42101b28f903c5f988235f1ff4a98dbfb9066d0d3d49  resiprocate-1.12.0.tar.gz
> > +# Locally Computed
> > +sha256  16b0fd1938a10fcd145904cc2dad74500fef9d27fc15b44cf8e8f92011f94d35  COPYING
> > diff --git a/package/resiprocate/resiprocate.mk b/package/resiprocate/resiprocate.mk
> > new file mode 100644
> > index 0000000000..3a17c888e3
> > --- /dev/null
> > +++ b/package/resiprocate/resiprocate.mk
> > @@ -0,0 +1,47 @@
> > +################################################################################
> > +#
> > +# resiprocate
> > +#
> > +################################################################################
> > +
> > +RESIPROCATE_VERSION = 1.12.0
> > +RESIPROCATE_SITE =  $(call github,resiprocate,resiprocate,resiprocate-$(RESIPROCATE_VERSION))
>
> This didn't work, as it doesn't give the same hash as the official
> release tarball, so I switched to using the official release tarball.

I apologize for this - since this was developed behind a firewall, I
had to use a web browser to download the tar file and place it on my
build server. Initially there was an issue when trying to download the
tar.gz file using Chrome as it would download the file already
extracted. This is because the HTTP request reply header contains
'content-encoding: gzip' which chrome automatically decompresses the
file. I had temporarily switch to Github to try the issue until I
track the issue down to this by using Firefox:

https://superuser.com/questions/940605/chromium-prevent-unpacking-tar-gz

> > +# For complete details see https://www.resiprocate.org/License
> > +RESIPROCATE_LICENSE = VSL-1.0, BSD-3-Clause
> > +RESIPROCATE_LICENSE_FILES = COPYING
> > +RESIPROCATE_INSTALL_STAGING = YES
> > +
> > +# Utilize c-ares from buildroot instead built in ARES library
> > +# NOTE: resiprocate doesn't support --without-<feature> syntax as it will try
> > +#       to build with package if specified
>
> Is this something that could be reported upstream, and fixed ?

Issue has been reported upstream in the following GitHub issue:

https://github.com/resiprocate/resiprocate/issues/155

>
> > +RESIPROCATE_DEPENDENCIES = c-ares
> > +RESIPROCATE_CONF_OPTS = -with-c-ares \
> > +     --with-sysroot="$(STAGING_DIR)"
> > +
> > +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> > +RESIPROCATE_DEPENDENCIES += openssl host-pkgconf
> > +RESIPROCATE_CONF_OPTS += --with-ssl
> > +# Configure.ac does not include '-lz' when statically linking against openssl
> > +RESIPROCATE_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
>
> Upstream configure.ac is already using PKG_CHECK_MODULES(), so it could
> be improved to use that as well for OpenSSL.

I can look at creating a patch for this in the future.

Thanks again for the review and fix the minor issues.

-Ryan
