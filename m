From: Esben Haabendal <esben@geanix.com>
Date: Thu, 26 Sep 2019 16:10:23 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/python-scipy: new package
In-Reply-To: <59c0bc63-5a32-eff9-a8dc-42bb9f513acd@mind.be> (Arnout
 Vandecappelle's message of "Wed, 25 Sep 2019 00:24:21 +0200")
References: <20190924143946.101846-1-esben@geanix.com>
 <20190924143946.101846-2-esben@geanix.com>
 <59c0bc63-5a32-eff9-a8dc-42bb9f513acd@mind.be>
Message-ID: <874l0ztagg.fsf@geanix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> writes:

> On 24/09/2019 16:39, Esben Haabendal wrote:
>
>  We'd like a bit more commit log to explain the intricacies of this package -
> see below.

I will try to add something...

>> ---
>>  DEVELOPERS                             |  1 +
>>  package/Config.in                      |  1 +
>>  package/python-scipy/Config.in         | 20 ++++++++++++++
>>  package/python-scipy/python-scipy.hash |  9 +++++++
>>  package/python-scipy/python-scipy.mk   | 37 ++++++++++++++++++++++++++
>>  5 files changed, 68 insertions(+)
>>  create mode 100644 package/python-scipy/Config.in
>>  create mode 100644 package/python-scipy/python-scipy.hash
>>  create mode 100644 package/python-scipy/python-scipy.mk
>> 
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index 67a0fef0886d..975a197404bb 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -723,6 +723,7 @@ F:	package/szip/
>>  N:	Esben Haabendal <esben@haabendal.dk>
>>  F:	boot/gummiboot/
>>  F:	package/python-kiwisolver/
>> +F:	package/python-scipy/
>>  
>>  N:	Etienne Carriere <etienne.carriere@linaro.org>
>>  F:	boot/optee-os/
>> diff --git a/package/Config.in b/package/Config.in
>> index dbf297f4df39..818a2abca591 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -1056,6 +1056,7 @@ menu "External python modules"
>>  	source "package/python-scapy/Config.in"
>>  	source "package/python-scapy3k/Config.in"
>>  	source "package/python-schedule/Config.in"
>> +	source "package/python-scipy/Config.in"
>>  	source "package/python-sdnotify/Config.in"
>>  	source "package/python-secretstorage/Config.in"
>>  	source "package/python-see/Config.in"
>> diff --git a/package/python-scipy/Config.in b/package/python-scipy/Config.in
>> new file mode 100644
>> index 000000000000..8396b507d2ca
>> --- /dev/null
>> +++ b/package/python-scipy/Config.in
>> @@ -0,0 +1,20 @@
>> +config BR2_PACKAGE_PYTHON_SCIPY
>> +	bool "python-scipy"
>> +	depends on BR2_PACKAGE_PYTHON3
>> +	depends on BR2_TOOLCHAIN_HAS_FORTRAN
>> +	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>> +	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
>
>  You forgot
>
>         depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC # clapack
>         depends on !BR2_m68k_cf # clapack
> 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
>
>  Also, the 4 arch dependencies should be first, and then the toolchain
> dependencies. I'm not sure where we put the python3 dependency.

I will fix that for next version.

>> +	select BR2_PACKAGE_HOST_PYTHON_CYTHON
>> +	select BR2_PACKAGE_PYTHON_NUMPY
>> +	select BR2_PACKAGE_OPENBLAS
>> +	select BR2_PACKAGE_CLAPACK
>
>  This clapack, fortran, openblas stuff really needs some explanation in the
> commit message. Why clapack and not lapack or the lapack bundled with openblas?
> Why Fortran? etc.

I will try and add something.

Actually, I don't see why openblas is needed, as clapack can provide
both blas and lapack.  Current python-numpy package uses clapack for
both, so it makes most sense to do the same here.

>> +	help
>> +	  The SciPy library is one of the core packages that make up the SciPy
>> +	  stack. It provides many user-friendly and efficient numerical
>> +	  routines such as routines for numerical integration, interpolation,
>> +	  optimization, linear algebra and statistics.
>> +
>> +	  https://www.scipy.org/scipylib/
>> +
>> +comment "python-scipy needs a toolchain w/ fortran"
>> +	depends on !BR2_TOOLCHAIN_HAS_FORTRAN
>
>  Python3 and glibc/musl dependency should be added as well, and the arch
> dependencies should be repeated. I.e.

glibc/musl dependency makes sense.  But I don't think that python3 arch
dependencies should cause a comment.  As I understand it, these comments
are meant for things that the user can easily do something about, such
as enabling a compatible toolchain.

I will add a simple comment for glibc/musl.

Do you agree?  Are there examples of other packages adding a lot of arch
dependencies to comment?

> 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
> 	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
>         depends on !BR2_powerpc || BR2_TOOLCHAIN_USES_GLIBC # clapack
>         depends on !BR2_m68k_cf # clapack
>
> 	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || \
> 		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
> 		!BR2_PACKAGE_PYTHON3
>
>> diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
>> new file mode 100644
>> index 000000000000..4ba3f286431b
>> --- /dev/null
>> +++ b/package/python-scipy/python-scipy.mk
>> @@ -0,0 +1,37 @@
>> +################################################################################
>> +#
>> +# python-scipy
>> +#
>> +################################################################################
>> +
>> +PYTHON_SCIPY_VERSION = 1.3.1
>> +PYTHON_SCIPY_SITE = $(call github,scipy,scipy,v$(PYTHON_SCIPY_VERSION))
>> +PYTHON_SCIPY_LICENSE = BSD-3-Clause, BSD-2-Clause, BSD, BSD-Style, PSF, \
>
>  PSF is no SPDX abbreviation, it's Python-2.0
>
>  However, IIUC this license only applies to the scipy-sphinx-theme, which isn't
> used in our build, so it can be removed from the license list.

Will fix.

>> +	Apache-2.0, MIT
>> +PYTHON_SCIPY_LICENSE_FILES = LICENSE.txt \
>
>  Split the line before already, so
>
> PYTHON_SCIPY_LICENSE_FILES = \
> 	LICENSE.txt \

Is this policy?  There are 23 examples of doing it that way, and 17 the
opposite.

I will change it in next version, but are you sure which way is "the
right way"?

>  Also, I think it's useful to add the LICENSES_bundled.txt, because changes in
> that file should be noticed (i.e. the hash changes).

That file is not included in this scipy release we are using.

>> +define PYTHON_SCIPY_CONFIGURE_CMDS
>> +	-rm -f $(@D)/site.cfg
>> +	echo "[DEFAULT]" >> $(@D)/site.cfg
>> +	echo "library_dirs = $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
>> +	echo "include_dirs = $(STAGING_DIR)/usr/include" >> $(@D)/site.cfg
>
>  It would also be useful to comment about the site.cfg in the commit
>  message.

I will try and add something here also.

/Esben
