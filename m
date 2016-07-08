From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 8 Jul 2016 12:11:56 +0200
Subject: [Buildroot] [PATCH v2 1/2] openmpi: add Fortran support for
 MIPS32
In-Reply-To: <20160708105624.534d353c@free-electrons.com>
References: <1467906454-60557-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160708105624.534d353c@free-electrons.com>
Message-ID: <577F7C6C.8050708@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 08/07/16 10:56, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 7 Jul 2016 16:47:33 +0100, Vicente Olivert Riera wrote:
>> We include a file containing cached values for Fortran tests that are
>> performed at the configure step. These tests fail when cross-compiling
>> and this is known upstream. See:
>>
>> https://www.open-mpi.org/community/lists/users/2013/01/21186.php
>>
>> In that thread the upstream maintainer admits that "cross compiling
>> OpenMPI is a known issue" and the way to workaround this is to
>> "pre-populate configure's answers to the Fortran tests (so that it
>> doesn't actually have to run anything)"
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>
> After discussing with Yann, we have changed your solution to use the
> "config cache" mechanism of autoconf, which allows to preseed in a file
> a number of configuration variables. It makes the whole thing a little
> bit cleaner. It looks like this:
>
> # Enabling Fortran support requires pre-seeding the configure script
> # with various values that cannot be guessed, so we provide cache
> # files for various architectures.
>
> ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
> ifeq ($(BR2_mips)$(BR2_mipsel),y)
> OPENMPI_FORTRAN_CONF_CACHE = package/openmpi/openmpi-mips32-fortran.cache
> else ifeq ($(BR2_mips64)$(BR2_mips64el),y)
> OPENMPI_FORTRAN_CONF_CACHE = package/openmpi/openmpi-mips64-fortran.cache
> endif
> endif
>
> ifneq ($(OPENMPI_FORTRAN_CONF_CACHE),)
> define OPENMPI_COPY_FORTRAN_CACHE
>          cp $(OPENMPI_FORTRAN_CONF_CACHE) $(@D)/openmpi-config.cache
> endef
>
> OPENMPI_POST_PATCH_HOOKS += OPENMPI_COPY_FORTRAN_CACHE
> OPENMPI_CONF_OPTS += \
>          --enable-mpi-fortran=yes \
>          --cache-file=$(@D)/openmpi-config.cache
> else
> OPENMPI_CONF_OPTS += --enable-mpi-fortran=no
> endif
>
> And the openmpi-mips*-fortran.cache simply contain the list of
> variables.
>
> I've adjusted your two commits to this mechanism, and applied.

ok, perfect. Thanks a lot.

Regards,

Vincent.

> Thanks!
>
> Thomas
>
