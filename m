From: pborut123 <pborut123@gmail.com>
Date: Wed, 29 Jun 2016 11:28:32 +0200
Subject: [Buildroot] Buildroot package for psycopg module for Beaglebone
 black
In-Reply-To: <CAGm1_ktjXHNA8j-0VYOsn9qUhbr2xaeFMTh+RGr1qu6g2-fWow@mail.gmail.com>
References: <57725E95.3040107@gmail.com>
 <2c149f23-5762-32d8-f298-5f0af402c480@mind.be> <57737D1C.7050407@gmail.com>
 <CAGm1_ktjXHNA8j-0VYOsn9qUhbr2xaeFMTh+RGr1qu6g2-fWow@mail.gmail.com>
Message-ID: <577394C0.5050006@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yegor,

Thanks for your suggestion and explanation.
I will correct my solution and do it properly as you've pointed me to.

I have another question, if I may.
I'd like to have python-supervisor functionality in otherwise python3 
system.
Python-supervisor would be only program using python2.

Do you have suggestion on how could this be solved?

Best regards,
Borut.

On 29.6.2016 10:09, Yegor Yefremov wrote:
> On Wed, Jun 29, 2016 at 9:47 AM, pborut123 <pborut123@gmail.com> wrote:
>> Hello Arnout,
>>
>> Thank you for your answer.
>> In the mean time, I've managed to solve problem by myself.
>>
>> message 'error: option --executable not recognized' was issued from
>> python setup.py install ...options...
>> One of options was --executable=/usr/bin/python that came from buildroot's
>> main python package makefile
>> pkg-python.mk, see here excerpt:
>>
>> PKG_PYTHON_SETUPTOOLS_INSTALL_TARGET_OPTS = \
>>      --prefix=$(TARGET_DIR)/usr \
>>      --executable=/usr/bin/python \
>>      --single-version-externally-managed \
>>      --root=/
>>
>> I have removed line '--executable=/usr/bin/python' and package built
>> correctly.
>> I'm not deeply familiar with python setup system, but I guess that here must
>> be
>> some difference in installation of pure python modules and modules that use
>> cython, which is the case of psycopg2.
>> I have added several other python packages that were pure python ones
>> without problem and using original script.
>>
>> I have rebuilt whole system, having many python modules, with above change
>> without problems
>> I haven't commited that change back, so that I don't break anything else.
>> Since I've changed pkg-python.mk which is used by many python modules that I
>> didn't try, I haven't commited that change back, so that I don't break
>> anything else.
>>
>> I can do it of course.
>> Do you perhaps know, are here some rules on commits of this sort?
>>
>> Thank you and best regards,
>> Borut.
>>
>> On 29.6.2016 1:27, Arnout Vandecappelle wrote:
>>> On 28-06-16 13:25, pborut123 wrote:
>>>> Hello,
>>>>
>>>> I'm new to this mailing list, quite new to buildroot, too.
>>>> I'm trying to build distribution for Beaglebone black with Python 3.5.1
>>>> and
>>>> postgresql 9.5.2.
>>>> I want to have also psycopg2 module that is not present in current
>>>> package list.
>>>> I've tried to make my own package but I'm not successful.
>>>>
>>>> Last error, I've received from build is at installation step:
>>>>>>> python-psycopg 2.6.1 Installing to target
>>>> ...
>>>> error: option --executable not recognized
>>>    We're missing some context here: which command issued this error? It
>>> should be
>>> written a few lines above.
>>>
>>>> make: ***
>>>> [..buildroot/output/build/python-psycopg-2.6.1/.stamp_target_installed]
>>>> Error 1
>>>>
>>>> My question is if can anybody help me with this, pointing me on what I've
>>>> done
>>>> wrong.
>>>>
>>>> Here is my package code:
>>>>
>>>> PYTHON_PSYCOPG_VERSION = 2.6.1
>>>> PYTHON_PSYCOPG_SOURCE = psycopg2-$(PYTHON_PSYCOPG_VERSION).tar.gz
>>>> PYTHON_PSYCOPG_SITE = http://initd.org/psycopg/tarballs/PSYCOPG-2-6
>>>> PYTHON_PSYCOPG_LICENSE = GPLv2
>>>> PYTHON_PSYCOPG_LICENSE_FILES = LICENSE
>>>> PYTHON_PSYCOPG_SETUP_TYPE = setuptools
> psycopg needs distutils and not setuptools.
>
> You can automatically create recipes for PyPi packages. Just invoke
>
> ./support/scripts/scanpypi psycopg2
>
> and then add psycong entry into package/Config.in and fix dependencies.
>
> See http://nightly.buildroot.org/manual.html#_infrastructure_for_python_packages
> and "17.8.3. Generating a python-package from a PyPI repository" for
> details.
>
>>>> PYTHON_PSYCOPG_BUILD_OPTS = build_ext --pg-config
>>>> $(STAGING_DIR)/usr/bin/pg_config build
>>>>
>>>    You will certainly need
>>>
>>> PYTHON_PSYCOPG_DEPENDENCIES = postgresql
>>>
>>>> define PYTHON_PSYCOPG_INSTALL_CUSTOM_PG_CONFIG
>>>>       $(INSTALL) -m 0755 -D package/python-psycopg/pg_config \
>>>>           $(STAGING_DIR)/usr/bin/pg_config
>>>    Eek? Why would you want to do this? You should use the pg_config
>>> provided by
>>> postgresql, otherwise things will probably go wrong.
>>>
>>>    Regards,
>>>    Arnout
>>>
>>>
>>>> endef
>>>> PYTHON_PSYCOPG_PRE_BUILD_HOOKS += PYTHON_PSYCOPG_INSTALL_CUSTOM_PG_CONFIG
>>>> $(eval $(python-package))
>>>>
>>>> and here is missing host pg_config file, I've inserted to setup.py:
>>>>
>>>> #!/bin/sh
>>>> # I've pointed to already cross-build posgresql base directory in build
>>>> prefix=buildroot/output/build/postgresql-9.5.2/src
>>>>
>>>> case "$1" in
>>>>     --includedir)
>>>>       echo "$prefix/include"
>>>>       ;;
>>>>     --libdir)
>>>>       echo "$prefix/lib"
>>>>       ;;
>>>>     --version)
>>>>         echo "PostgreSQL 9.5.2"
>>>>       ;;
>>>>
>>>>     *)
>>>>       echo "Usage: $0 {--includedir|--libdir}"
>>>> esac
>>>>
>>>> Thank you and best regards,
>>>> Borut.
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> _______________________________________________
>>>> buildroot mailing list
>>>> buildroot at busybox.net
>>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
