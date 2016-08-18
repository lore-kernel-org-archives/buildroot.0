From: Lothar Felten <lothar.felten@gmail.com>
Date: Thu, 18 Aug 2016 23:45:50 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/simh: new package
In-Reply-To: <CAHXCMM+DYv=eLuD_vuOjEZeeS2YAaEWrBb7UaEC+mrXC0tWndg@mail.gmail.com>
References: <1471437282-14799-1-git-send-email-lothar.felten@gmail.com>
 <CAHXCMM+DYv=eLuD_vuOjEZeeS2YAaEWrBb7UaEC+mrXC0tWndg@mail.gmail.com>
Message-ID: <90a44a07-7766-cf32-959c-d05de9eb0afd@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On 17.08.2016 22:07, Samuel Martin wrote:
> Hi,
>
>
> Buildroot automatically and always adds -D_LARGEFILE64_SOURCE flag.
> For a long-run patch, I would prefer the largefile check on the toolchain.
>
>> ++      find_library(MATH_LIBRARY m)
>
> Where is MATH_LIBRARY used?
> Is math lib. required? If so, add the required option to the
> find_package (see [1]).

lib math  is used in the main simulator.
I'd build a library but the main simulator has options which are 
selected by the target simulator at compile time.

I could not find a matching module for find_package in cmake-3.5 
(cmake/Modules/Find???.cmake)

Should I keep find_library?


>> ++find_library(PCAP_LIBRARY pcap)
>
> You may want to add the quiet option to find_package [1].
>
>> ++find_library(PTHREAD_LIBRARY pthread)
>
> Ditto

I replaced this one by pkg_check_modules(LIBPCAP libpcap)
It works in buildroot but not in ubuntu 14.04 beacuse the .pc file is 
missing.

For the libraries I now use:

find_package(Threads)

pkg_check_modules(LIBPNG libpng)
pkg_check_modules(SDL2 sdl2)
pkg_check_modules(LIBPCREPOSIX libpcreposix)
pkg_check_modules(LIBPCAP libpcap)

find_library(DL_LIBRARY dl)
find_library(RT_LIBRARY rt)
find_library(MATH_LIBRARY m)


[snip]

>
> s/\<m\>/${MATH_LIBRARY}/
> This target_link_library should be nested in a if(UNIX)-block.
>

I build many targets and I need to add libm to all of them. I haven't 
found a way to do target_link_library( * ${MATH_LIBRARY}) (i.e. for all 
targets)

Because there are other libs to add to each simulator, I wrote this 
function:

function(target_link_system_libs target)
	foreach(loop_var ${SYSTEM_LIBS})
		target_link_libraries(${target} ${loop_var})
	endforeach(loop_var)
endfunction()

and call that one for each target:

if(BUILD_I1620)
	add_executable(i1620 ${i1620_source_files} ${simulator_source_files})
	target_link_system_libs(i1620)
	install (TARGETS i1620 DESTINATION bin)
endif(BUILD_I1620)

Is there a better way to do this?

[snip]

>> +
>> diff --git a/package/simh/Config.in b/package/simh/Config.in
>> new file mode 100644
>> index 0000000..e38044a
>> --- /dev/null
>> +++ b/package/simh/Config.in
>> @@ -0,0 +1,10 @@
>> +config BR2_PACKAGE_SIMH
>> +       bool "simh"
>> +       depends on BR2_USE_MMU # fork()
>
> Missing conditional dependency on thread support.
>

I'll add the options:
   network support (depends libpcap and pthreads)
   video support (depends SDL2)	

>> +       help
>> +         SIMH is a highly portable, multi-system simulator.
>> +         Optional network support requires libpcap and pthreads, video
>> +         support requires libSDL2.
>> +         Only a subset of the available simulators is built.
>> +
>> +         http://simh.trailing-edge.com
>> diff --git a/package/simh/simh.hash b/package/simh/simh.hash
>> new file mode 100644
>> index 0000000..cb6aeac
>> --- /dev/null
>> +++ b/package/simh/simh.hash
>> @@ -0,0 +1,2 @@
>> +# Locally computed:
>> +sha256
> 508667d212c572d3a5bdbd78a6d5d9fc0923784d5a7f06e01f3bf9c27f514bbd
> simh-946bfd329f9f6624364b266dc66005151c3fc018.tar.gz
>> diff --git a/package/simh/simh.mk <http://simh.mk>
> b/package/simh/simh.mk <http://simh.mk>
>> new file mode 100644
>> index 0000000..1b576f7
>> --- /dev/null
>> +++ b/package/simh/simh.mk <http://simh.mk>
>> @@ -0,0 +1,18 @@
>>
> +################################################################################
>> +#
>> +# simh
>> +#
>>
> +################################################################################
>> +
>> +SIMH_VERSION = 946bfd329f9f6624364b266dc66005151c3fc018
>> +SIMH_SITE = $(call github,simh,simh,$(SIMH_VERSION))
>> +SIMH_LICENSE = MIT, GPLv2, zlib license
>> +SIMH_LICENSE_FILES = doc/simh.doc Intel-Systems/common/i8088.c
> sim_video.c
>> +
>> +define SIMH_MOVE_MAKEFILE
>> +       mv $(@D)/makefile $(@D)/_simh_makefile
>
> I think this hook is not needed since the generated makefile will be
> named Makefile, so the case difference should not confuse make.
>

cmake generates Makefile (uppercase), simh has a makefile (lowercase).
For make the lowercase one has higher priority.
I found another way: out-of-source build.
I added SIMH_SUPPORTS_IN_SOURCE_BUILD = NO

(this also fixes the alpha binary conflicting with the alpha subdir, a 
simh project specific issue)

>> +endef
>> +
>> +SIMH_PRE_BUILD_HOOKS += SIMH_MOVE_MAKEFILE
>
> Missing conditional (and implicit) dependencies on libpcap and sdl2 at
> least.
>

simh will compile w/o libpcap, pthreads and SDL2.
I'll add the options in Config.in and appropriate DEPENDENCIES=.

>> +
>> +$(eval $(cmake-package))
>> --
>> 1.9.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net <mailto:buildroot@busybox.net>
>> http://lists.busybox.net/mailman/listinfo/buildroot
> <http://lists.busybox.net/mailman/listinfo/buildroot>
>
> [1] https://cmake.org/cmake/help/v3.5/command/find_package.html
> <https://cmake.org/cmake/help/v3.5/command/find_package.html>
> [2] https://cmake.org/cmake/help/v3.5/module/FindPkgConfig.html
> <https://cmake.org/cmake/help/v3.5/module/FindPkgConfig.html>
>
>
> Regards,
>
> --
> Samuel

Thanks,
Lothar
