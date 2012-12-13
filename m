From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Dec 2012 23:54:55 +0100
Subject: [Buildroot] [PATCH] Fix xenomai build with Linaro toolchain
In-Reply-To: <50CA5162.8090304@wanadoo.fr>
References: <50CA5162.8090304@wanadoo.fr>
Message-ID: <50CA5CBF.4020503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/12/12 23:06, Thierry Bultel wrote:
> This fixes the build with toolchains that have -mthumb by default
> (Not supported by xenomai yet)
>
>
> Signed-off-by: thierry.bultel at wanadoo.fr
> --- xenomai.mk 2012-12-13 22:48:05.841982812 +0100
> +++ xenomai.mk.orig 2012-12-13 23:01:13.473982051 +0100

  This won't apply with git am. Could you create the patch with
git send-email?

> @@ -24,6 +23,12 @@
>
> XENOMAI_CONF_OPT += --includedir=/usr/include/xenomai/
>
> +XENOMAI_CONF_ENV = \
> + CFLAGS="$(TARGET_CFLAGS) -marm"

  Wouldn't it be a good idea to make this conditional on BR2_arm? :-)

  I would also use XENOMAI_CONF_ENV +=, easier for the future.

> +
> +XENOMAI_MAKE_ENV = \
> + CFLAGS="$(TARGET_CFLAGS) -marm"

  Is this needed? Should be enough to do it in the CONF_ENV because
the CFLAGS are directly replaced in the Makefiles...


  Regards,
  Arnout

> +
> ifeq ($(BR2_HAVE_DEVFILES),)
> define XENOMAI_REMOVE_DEVFILES
> for i in xeno-config xeno-info wrap-link.sh ; do \



-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
