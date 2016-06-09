From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 22:31:38 +0200
Subject: [Buildroot] [PATCH v2 next 1/2] openmpi: new package
In-Reply-To: <1463742061-56758-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1463742061-56758-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160609223138.3dfb4b8f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vicente,

On Fri, 20 May 2016 12:01:00 +0100, Vicente Olivert Riera wrote:

> diff --git a/package/openmpi/0001-vt_iowrap.c-check-if-fgetc-and-fputc-have-been-alrea.patch b/package/openmpi/0001-vt_iowrap.c-check-if-fgetc-and-fputc-have-been-alrea.patch
> new file mode 100644
> index 0000000..00562d0
> --- /dev/null
> +++ b/package/openmpi/0001-vt_iowrap.c-check-if-fgetc-and-fputc-have-been-alrea.patch
> @@ -0,0 +1,48 @@
> +From 56a27e5dce8fc78941f26ccb0e688f331fb0641e Mon Sep 17 00:00:00 2001
> +From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> +Date: Tue, 17 May 2016 20:46:11 +0100
> +Subject: [PATCH] vt_iowrap.c: check if fgetc and fputc have been already
> + defined

This patch is only needed to make the "Vampirtrace" stuff build, and
this is just in the "contrib" part of OpenMPI. So instead of adding a
patch, I've disabled VampirTrace by passing --disable-vt. Let me know
if you really needed VampirTrace. In the mean time, feel free to submit
your patch upstream so that we can re-enable the feature later on.

> +config BR2_PACKAGE_OPENMPI_EXTRACONF
> +	string "Additional parameters for ./configure"
> +	default ""
> +	help
> +	  Extra parameters that will be appended to openmpi's
> +	  ./configure commandline.

I really don't like this thing, since many of the configure options
imply a dependency on another package, which needs to be expressed in
the .mk file. So I've dropped this option, and I prefer to see
additional options being added gradually, depending on the needs. There
are indeed lots of options, but I am not sure we will actually have a
sub-option for each of them in Buildroot.

> +OPENMPI_VERSION_MAJOR = 1.10
> +OPENMPI_VERSION = $(OPENMPI_VERSION_MAJOR).2
> +OPENMPI_SITE = https://www.open-mpi.org/software/ompi/v$(OPENMPI_VERSION_MAJOR)/downloads
> +OPENMPI_SOURCE = openmpi-$(OPENMPI_VERSION).tar.bz2
> +OPENMPI_LICENSE = BSD

BSD is never a correct value. The right value here was BSD-3c.

Applied with those changes, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
