From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Date: Tue, 5 Jan 2016 18:50:23 +0100
Subject: [Buildroot] [PATCH 1/1] libmraa: new package
In-Reply-To: <568B12EE.30106@mind.be>
References: <1451936760-1654-1-git-send-email-pieterjan.camerlynck@gmail.com>
 <568B12EE.30106@mind.be>
Message-ID: <CAMOMa6NX6Uw+2kc=03HF2Y3u-S1m+bSa4JozcMY1dzRy6DgKgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-01-05 1:48 GMT+01:00 Arnout Vandecappelle <arnout@mind.be>:
>  Hi Pieterjan,
>
> On 04-01-16 20:46, Pieterjan Camerlynck wrote:
>> libmraa provides a unified interface for IO on Galileo, Edison,
>> Raspberry Pi and others
>>
>> Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
>> ---
>>  package/Config.in          |  1 +
>>  package/libmraa/Config.in  | 17 +++++++++++++++++
>>  package/libmraa/libmraa.mk | 22 ++++++++++++++++++++++
>>  3 files changed, 40 insertions(+)
>>  create mode 100644 package/libmraa/Config.in
>>  create mode 100644 package/libmraa/libmraa.mk
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index 442021f..52f6b5b 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -930,6 +930,7 @@ menu "Hardware handling"
>>       source "package/libiqrf/Config.in"
>>       source "package/libllcp/Config.in"
>>       source "package/libmbim/Config.in"
>> +     source "package/libmraa/Config.in"
>>       source "package/libnfc/Config.in"
>>       source "package/libpciaccess/Config.in"
>>       source "package/libphidget/Config.in"
>> diff --git a/package/libmraa/Config.in b/package/libmraa/Config.in
>> new file mode 100644
>> index 0000000..cfbe37c
>> --- /dev/null
>> +++ b/package/libmraa/Config.in
>> @@ -0,0 +1,17 @@
>> +config BR2_PACKAGE_LIBMRAA
>> +     bool "libmraa"
>> +     depends on BR2_INSTALL_LIBSTDCPP
>
>  Actually it doesn't contain any C++ code as far as I can see. So you should
> patch CMakeLists.txt to set
>
> project (mraa C)
>
> (and send that patch upstream).

You are right, the C++ api only exists of header files.

>> +     depends on BR2_TOOLCHAIN_HAS_THREADS
>> +     depends on !BR2_STATIC_LIBS
>
>  I don't see anything that would require dynamic libraries. Can you add a
> comment why this is needed?

I thought it was needed because of the following line in src/CmakeLists.txt:
add_library (mraa SHARED ${mraa_LIB_SRCS})

>> +     depends on BR2_ARM_CPU_ARMV7A || BR2_i386 || BR2_x86_64
>
>  It actually builds on any platform, except that the CMakeLists.txt explicitly
> checks for arm or x86. But there is nothing armv7-specific, and supposedly the
> library would still be useful on generic boards. So I'd just put BR2_arm.

Ok

>> +     help
>> +       Libmraa is a C/C++ library with bindings to javascript & python
>
>  Well, the js and python bindings aren't built... But that could be added in
> follow-up patches so OK.

Yes, the bindings are missing at the moment. I still need to figure
that part out.

>> +       to interface with the IO on Galileo, Edison & other platforms,
>> +       with a structured and sane API where port names/numbering matches
>> +       the board that you are on.
>> +
>> +       http://iotdk.intel.com/docs/master/mraa
>> +
>> +comment "libmraa needs a toolchain w/ C++, threads, dynamic library"
>> +     depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
>> +             || BR2_STATIC_LIBS
>> diff --git a/package/libmraa/libmraa.mk b/package/libmraa/libmraa.mk
>> new file mode 100644
>> index 0000000..099e883
>> --- /dev/null
>> +++ b/package/libmraa/libmraa.mk
>> @@ -0,0 +1,22 @@
>> +################################################################################
>> +#
>> +# libmraa
>> +#
>> +################################################################################
>> +
>> +LIBMRAA_VERSION = v0.9.0
>> +LIBMRAA_SITE = $(call github,intel-iot-devkit,mraa,$(LIBMRAA_VERSION))
>
>  Upstream calls it mraa, not libmraa, so we prefer to stick to the same name.

Ok. It's confusing because it says libmraa in the readme :-)

>  Otherwise looks good.
>
>  Regards,
>  Arnout
>
>> +LIBMRAA_LICENSE = MIT
>> +LIBMRAA_LICENSE_FILES = COPYING
>> +LIBMRAA_INSTALL_STAGING = YES
>> +
>> +LIBMRAA_CONF_OPTS += \
>> +     -DBUILDSWIG=OFF \
>> +     -DUSBPLAT=OFF \
>> +     -DFTDI4222=OFF \
>> +     -DIPK=OFF \
>> +     -DRPM=OFF \
>> +     -DENABLEEXAMPLES=OFF \
>> +     -DTESTS=OFF
>> +
>> +$(eval $(cmake-package))
>>
>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
