From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Feb 2013 13:45:47 +0100
Subject: [Buildroot] [PATCH 1/1] openpgm: new package
In-Reply-To: <1360585826-17996-1-git-send-email-alexander.lukichev@gmail.com>
References: <1360585826-17996-1-git-send-email-alexander.lukichev@gmail.com>
Message-ID: <20130211134547.02bedae4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexander Lukichev,

On Mon, 11 Feb 2013 14:30:26 +0200, Alexander Lukichev wrote:
> From: Alexander Lukichev <alexander.lukichev@espotel.com>
> 
> OpenPGM is an open source implementation of the Pragmatic General
> Multicast (PGM) specification in RFC 3208 available at www.ietf.org.
> It may be required for PGM/EPGM support in ZeroMQ library. This
> adds version 5.1.118-1~dfsg of the package, required by
> zeromq-2.2.0. It also adds a patch for cross-compilation of
> more recent 5.2.121~dfsg version.

We no longer want to have patches that contain the package version in
their filename.

Any reason not to package the most recent version available? Are there
incompatibilities between 5.1.118 and 5.2.121 that makes 5.2.121
unusable for zeromq?

> diff --git a/package/openpgm/openpgm-5.1.118-1~dfsg-cross-compile.patch b/package/openpgm/openpgm-5.1.118-1~dfsg-cross-compile.patch
> new file mode 100644
> index 0000000..2e16c0d
> --- /dev/null
> +++ b/package/openpgm/openpgm-5.1.118-1~dfsg-cross-compile.patch
> @@ -0,0 +1,13 @@
> +diff -uNrp a/configure.ac b/configure.ac
> +--- a/configure.ac	2012-11-07 14:19:08.835373674 +0200
> ++++ b/configure.ac	2012-11-07 14:19:25.481620103 +0200
> +@@ -284,7 +284,8 @@ AC_RUN_IFELSE(
> + 	[AC_MSG_RESULT([yes])
> + 		pgm_unaligned_pointers=yes],
> + 	[AC_MSG_RESULT([no])
> +-		pgm_unaligned_pointers=no])
> ++		pgm_unaligned_pointers=no],
> ++	pgm_unaligned_pointers=yes)

Are we sure that pgm_unaligned_pointers=yes will be valid on all
architectures?

Rather than hardcoding this, I would prefer if it was possible to pass
a variable in the configure script environment to tell the result of
this test. We could then maybe have a chance to upstream the patch.


> diff --git a/package/openpgm/openpgm.mk b/package/openpgm/openpgm.mk
> new file mode 100644
> index 0000000..ed9c041
> --- /dev/null
> +++ b/package/openpgm/openpgm.mk
> @@ -0,0 +1,23 @@
> +#############################################################
> +#
> +# openpgm
> +#
> +#############################################################
> +
> +OPENPGM_VERSION = 5.1.118-1~dfsg
> +OPENPGM_SOURCE = libpgm-$(OPENPGM_VERSION).tar.gz

Strange, the project is called openpgm but the tarball is named libpgm?
Usually, we try to use the upstream name, but here it's unclear if we
should choose libpgm or openpgm. Does the openpgm projects delivers
something else than libpgm?

> +OPENPGM_SITE = http://openpgm.googlecode.com/files/
> +OPENPGM_INSTALL_STAGING = YES
> +OPENPGM_DEPENDENCIES = 

Not needed if it's empty.

You should also add the OPENPGM_LICENSE and OPENPGM_LICENSE_FILES
variables.

> +OPENPGM_AUTORECONF = YES

Since the source code comes as a tarball, it's uncommon to have to do
an autoreconf. Could you add a comment right before this line that
explains why it is needed?

> +OPENPGM_CONF_ENV = ac_cv_file__proc_cpuinfo=yes ac_cv_file__dev_rtc=no \
> +                   ac_cv_file__dev_hpet=no
> +
> +define OPENPGM_EXTRACT_FIX
> +	mv $(@D)/openpgm/pgm/* $(@D)
> +	rm -rf $(@D)/openpgm/pgm/
> +endef
> +
> +OPENPGM_POST_EXTRACT_HOOKS += OPENPGM_EXTRACT_FIX

Have you tried to replace this post extract fix by:

OPENPGM_SUBDIR = openpgm/pgm/

 ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
