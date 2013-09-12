From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 11 Sep 2013 22:20:16 -0500
Subject: [Buildroot] [PATCH v2 5/7] libpng12: new package
In-Reply-To: <523000A3.9000909@mind.be>
References: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
 <1378441521-10050-6-git-send-email-spenser@gillilanding.com>
 <20130908190457.6406d70d@skate> <523000A3.9000909@mind.be>
Message-ID: <CAEBucnAgG1nLsFcMhOR=M_ZHcw5CziMx-M6aU4j-J1RA5qNA5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout,

On Wed, Sep 11, 2013 at 12:33 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 08/09/13 19:04, Thomas Petazzoni wrote:
>>
>> Dear Spenser Gilliland,
>>
>> On Thu,  5 Sep 2013 23:25:19 -0500, Spenser Gilliland wrote:
>>
>>> +config BR2_PACKAGE_LIBPNG12
>>> +       bool "libpng"
>>
>>
>> Maybe:
>>
>>         bool "libpng12"
>>
>>> +       select BR2_PACKAGE_ZLIB
>>> +       help
>>> +         Library for handling PNG (Portable Network Graphics)
>>> +         images. This installs the 1.2.x series.  Different versions of
>>> +         libpng have different APIs.
>>> +
>>> +         http://www.libpng.org/
>>> diff --git a/package/libpng12/libpng12.mk b/package/libpng12/libpng12.mk
>>> new file mode 100644
>>> index 0000000..39094f2
>>> --- /dev/null
>>> +++ b/package/libpng12/libpng12.mk
>>> @@ -0,0 +1,18 @@
>>>
>>> +################################################################################
>>> +#
>>> +# libpng12
>>> +#
>>>
>>> +################################################################################
>>> +
>>> +LIBPNG12_VERSION = 1.2.50
>>> +LIBPNG12_SERIES = 12
>
>
>  Since the 12 is hardcoded in the package name, it is pretty silly to have
> this as a variable. It's there for consistency with libpng itself, but I
> don't think that that is required.
>
>
>>> +LIBPNG12_SOURCE = libpng-$(LIBPNG12_VERSION).tar.bz2
>>> +LIBPNG12_SITE =
>>> http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG12_SERIES)/$(LIBPNG12_VERSION)
>>> +LIBPNG12_LICENSE = libpng license
>>> +LIBPNG12_LICENSE_FILES = LICENSE
>>> +LIBPNG12_INSTALL_STAGING = YES
>>> +LIBPNG12_DEPENDENCIES = host-pkgconf zlib
>>> +LIBPNG12_CONFIG_SCRIPTS = libpng$(LIBPNG12_SERIES)-config libpng-config
>>
>>
>> This last one annoys me a bit: if both libpng and libpng12 install
>> libpng-config, it means that another package that runs libpng-config to
>> find out where libpng is and how to link against it will either be
>> linked against the modern libpng or the older libpng12 depending on
>> which one was installed.
>>
>> Since libpng12 is only installed for compatibility reasons with some
>> packages, I would therefore suggest that we do not install
>> libpng-config in libpng12.mk (and ensure that nothing installed by
>> libpng12 can conflict with the real libpng installation).
>
>
>  Sounds correct to me. It is making things more complex, of course, because
> you need something like:
>
> LIBPNG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG12),libpng12)
>
> in libpng.mk.
>
>  Or else you have to override the install commands, or patch the Makefile.

Will fix using method above. (also the glaring omission in kconfig
option name is fixed)

>
>  Regards,
>  Arnout
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F



-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
