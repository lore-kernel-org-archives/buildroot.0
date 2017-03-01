From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 1 Mar 2017 20:52:27 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/sdl2: disable altivec
 built-in function for PowerPC
In-Reply-To: <20170301021311.GA13728@tungsten.ozlabs.ibm.com>
References: <20170228232453.3550-1-romain.naour@gmail.com>
 <20170301021311.GA13728@tungsten.ozlabs.ibm.com>
Message-ID: <82dda896-2811-a049-ff52-23b06ce2015a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sam,

Le 01/03/2017 ? 03:13, Sam Bobroff a ?crit :
> On Wed, Mar 01, 2017 at 12:24:52AM +0100, Romain Naour wrote:
>> As reported in this bug report [1], altivec support in SDL break
>> arbitrary C++ code.
>>
>> Issue reported by test-pkg script while testing supertux package:
>>     error: could not convert 'true' from 'bool' to '__vector(4) __bool int'
>>
>> [1] https://bugs.debian.org/cgi-bin/bugreport.cgi/?bug=770670
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: Sam Bobroff <sam.bobroff@au1.ibm.com>
> 
> Hi Romain,
> 
> If you want to keep alitvec support on you can probably work around this
> problem by using -std=gnu99 (which I used for mpv, see
> package/mpv/0002-fix-powerpc64-altivec.patch).

Thanks for the help!

But the error come from a C++ build :
In file included from
output/build/supertux-0.5.1/external/tinygettext/src/dictionary_manager.cpp:30:0:
output/build/supertux-0.5.1/external/tinygettext/include/tinygettext/po_parser.hpp:50:96:
error: could not convert ?true? from ?bool? to ?__vector(4) __bool int?
   POParser(const std::string& filename, std::istream& in_, Dictionary& dict_,
bool use_fuzzy = true);

What do you think about removing altivec.h from SDL_cpuinfo.h as suggested in
the bug report ?

Otherwise, I'm not using a powerpc so we can keep altivec support disabled for
now...

Best regards,
Romain

> 
> Cheers,
> Sam.
> 
>> ---
>>  package/sdl2/sdl2.mk | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
>> index d2ee50d..628d906 100644
>> --- a/package/sdl2/sdl2.mk
>> +++ b/package/sdl2/sdl2.mk
>> @@ -23,6 +23,16 @@ SDL2_CONF_OPTS += \
>>  # We must enable static build to get compilation successful.
>>  SDL2_CONF_OPTS += --enable-static
>>  
>> +# From https://bugs.debian.org/cgi-bin/bugreport.cgi/?bug=770670
>> +# "The problem lies within SDL_cpuinfo.h.  It includes altivec.h, which by
>> +# definition provides an unconditional vector, pixel and bool define in
>> +# standard-c++ mode.  In GNU-c++ mode this names are only defined
>> +# context-sensitive by cpp.  SDL_cpuinfo.h is included by SDL.h.
>> +# Including altivec.h makes arbitrary code break."
>> +ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
>> +SDL2_CONF_OPTS += --disable-altivec
>> +endif
>> +
>>  ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
>>  SDL2_DEPENDENCIES += udev
>>  SDL2_CONF_OPTS += --enable-libudev
>> -- 
>> 2.9.3
> 
