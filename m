From: Esben Haabendal <esben@geanix.com>
Date: Mon, 23 Sep 2019 09:05:20 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/python-scipy: new package
In-Reply-To: <da494137-121b-101c-b71a-04601589e55d@smile.fr> (Romain Naour's
 message of "Fri, 20 Sep 2019 19:18:27 +0200")
References: <20190920163656.6388-1-esben@geanix.com>
 <20190920163656.6388-4-esben@geanix.com>
 <da494137-121b-101c-b71a-04601589e55d@smile.fr>
Message-ID: <8736gn7arz.fsf@geanix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain

Romain Naour <romain.naour@smile.fr> writes:

> There is a previous contribution to add python-scipy from Alexandre Payen:
> http://patchwork.ozlabs.org/patch/1141144/
>
> It would be great if you can work with Alexandre on python-scipy package.

Sounds good.

Alexandre, do you have time to work on this?

> Le 20/09/2019 ? 18:36, Esben Haabendal a ?crit?:
>> ---
>>  DEVELOPERS                             |  1 +
>>  package/Config.in                      |  1 +
>>  package/python-scipy/Config.in         | 21 +++++++++++++++
>>  package/python-scipy/python-scipy.hash |  9 +++++++
>>  package/python-scipy/python-scipy.mk   | 37 ++++++++++++++++++++++++++
>>  5 files changed, 69 insertions(+)
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
>> index 000000000000..5b8192266843
>> --- /dev/null
>> +++ b/package/python-scipy/Config.in
>> @@ -0,0 +1,21 @@
>> +config BR2_PACKAGE_PYTHON_SCIPY
>> +	bool "python-scipy"
>> +	depends on BR2_PACKAGE_PYTHON3
>> +	depends on BR2_TOOLCHAIN_HAS_FORTRAN
>> +	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>> +	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
>> +	select BR2_PACKAGE_HOST_PYTHON_CYTHON
>> +	select BR2_PACKAGE_HOST_PYTHON_NUMPY
>
> There is no such option, the dependency is trigged by adding host-python-numpy
> in DEPENDENCIES;

Ah, I wasn't aware of how host-foo packages in DEPENDENCIES works.
I will remove the bogus select.

>> +	select BR2_PACKAGE_PYTHON_NUMPY
>> +	select BR2_PACKAGE_OPENBLAS
>> +	select BR2_PACKAGE_CLAPACK
>
> Python-scipy can be used with lapack instead of Clapack.
> Clapack is not maintained any more and really out of date.

Yes, but as we currently only supports clapack for python-numpy builds,
It seems a bit odd to do it different for python-scipy.

What about adding python-scipy first, and then extending both
python-numpy and python-scipy to support lapack as (an up-to-date)
alternative to clapack afterwards?

> OpenBlas is using a bundled version of Lapack when gFortran compiler
> is available. Clapack is an old f2c'ed version of lapack, so it can be
> used without a Fortran Compiler. Since Python-scipy depends on
> Fortran, Clapack can be removed from python-scipy.
>
> Actually there is an existing issue (discussed during the Buildroot
> hackathon) on *blas providers. We need to fix this before adding new
> packages using *blas libraries :-/

Ok, so where does this place this work on python-scipy for now?
Is it a 100% no-go until *blas providers are reworked?

I think it would be a shame to block python-scipy, as it is pretty
useful package, and the effort to take it in (looking at this patch
series) is pretty minimal.

/Esben
