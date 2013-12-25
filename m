From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 25 Dec 2013 19:42:26 +0100
Subject: [Buildroot] [RFC] python: select vs depends on
In-Reply-To: <20131224172836.GB3627@free.fr>
References: <CAAXf6LWHabEdHC4V4rzVduUqxx3a9vPjiJ91yYjs9+5UQtaFQQ@mail.gmail.com>
 <20131224172836.GB3627@free.fr>
Message-ID: <CAAXf6LUi0n6Mf0b9njsffZYcPMqCKD5ZoK41REhu_oRrJLiovA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Tue, Dec 24, 2013 at 6:28 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> On 2013-12-24 18:14 +0100, Thomas De Schampheleire spake thusly:
>> Currently, we have a dual strategy with respect to packages that have
>> optional Python support: alsa-lib uses 'depends on python' for its
>> 'python support' option, while ola uses 'select python' for its
>> 'python bindings'.
> [--SNIP--]
>> - python modules (typically named python-foo): here the current
>> strategy is to use 'depends on', and this is followed by all such
>> packages. For me, this is perfectly sane, and is (IMO) not open for
>> discussion.
>> Note: in fact, all these modules are in one 'if python' block in
>> package/Config.in, and I have prepared a patch to remove the redundant
>> 'depends on'.
>>
>> - for 'normal' packages that need python for there normal behavior, we
>> typically use 'select python'. In this case, the user may not be aware
>> of the python dependency, and requiring him/her to first enable python
>> is not logical. I think this reasoning is sane too.
>>
>> - for 'normal' packages that do not require python, but have optional
>> python support (as is the case for ola and alsa-lib), I have no strong
>> preference. Whichever is preferred by the community is ok with me, as
>> long as we keep one guideline for this case.
>
> Or what about just removing the 'depends on' or 'select' for packages
> sub-options, and just add the dependencies and options in the .mk files,
> such as:
>
> ---8<--- alsa-lib.mk ---8<---
> ifeq ($(or $(BR2_PACKAGE_PYTHON),$(BR2_PACKAGE_PYTHON3)),y)
> ALSA_LIB_CONF_OPT += \
>         --with-pythonlibs=-lpython$(PYTHON_VERSION_MAJOR) \
>         --with-pythonincludes=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
> ALSA_LIB_CFLAGS+=-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
> ALSA_LIB_DEPENDENCIES = python
> else
> ALSA_LIB_CONF_OPT += --disable-python
> endif
> ---8<--- alsa-lib.mk ---8<---
>
> And so on for other packages...
>
> We already ave this behaviour in other packages:
>   - bind adds features if openssl or libxml2 are selected
>   - libvncserver, with libgcrypt, libjpeg, or openssl
>   - libpcap, with libusb or libnl
>   - and so on. countless times...

To me that sounds fine. So for optional support of other packages, we
automatically enable it when the dependency is present, from the .mk
file, and the Config.in does not contain an explicit option.

Is this accepted by other contributors as well?

Best regards,
Thomas
