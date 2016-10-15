From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Oct 2016 17:17:21 +0200
Subject: [Buildroot] [PATCH v3 1/8] package/pkg-cmake.mk: fix build type
 and optimization flags
In-Reply-To: <20161015124429.181dcdb8@free-electrons.com>
References: <20161015094437.6989-1-s.martin49@gmail.com>
 <20161015094437.6989-2-s.martin49@gmail.com>
 <20161015122557.25fd074f@free-electrons.com>
 <CAHXCMM+1cbRY11V4cKHB=dCScSG7KGGraFz2NkWsWH+1tiG7XQ@mail.gmail.com>
 <20161015124429.181dcdb8@free-electrons.com>
Message-ID: <b4e38028-b0ae-1496-c37d-baba84126144@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-10-16 12:44, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat, 15 Oct 2016 12:34:29 +0200, Samuel Martin wrote:
> 
>>> Can't we tell CMake to not do all this crap, and simply not add
>>> -g/-O<x> options by itself ?  
>>
>> As discussed IRL, this solution is kind of the optimal one, not the
>> best one but the one that is the closest to what BR is trying to do in
>> all cases.
> 
> Just to expand on that, a few more details from our discussions:
> 
>  - If we don't pass a CMAKE_BUILD_TYPE, then CMake doesn't pass any
>    compiler flags. This would be ideal, but unfortunately some packages
>    force their own build type in their CMakeLists.txt), and in this case
>    CMake passes its own compiler flags. Which would mean some packages
>    may always be built in debug mode, or always be built in release,
>    depending on what they have chosen in their CMakeLists.txt to be the
>    default, and this wouldn't be affected by the Buildroot
>    configuration.
> 
>    Due to this, we *want* to force CMAKE_BUILD_TYPE, as it ensures all
>    CMake packages are built in a way that is as close as possible to
>    the selected Buildroot configuration.
> 
>  - There is no way to tell CMake to not pass compiler flags and to
>    ignore the build type written in the CMakeLists.txt file. We could
>    patch CMake for that, but we are now using the system-provided cmake
>    when it's available, so we can hardly relying on cmake patching.
> 
> Bottom line: your patch is indeed the best we can do. It's not perfect,
> but we can't easily do better.

 We can do better :-)

 My proposal:

- Set build type either to Debug or Release depending on the chosen options. It
might make sense to use MinSizeRel if the user chose no debug and -Os and
RelWithDebInfo if the user chose debug and -O2 or -O3.

- Override the flags that CMake adds with our debug/optimize flags in the
toolchain.cmake file. CMake uses the variables
CMAKE_${lang}_FLAGS_${buildtype}_INIT which are defined in
Modules/Compiler/GNU.cmake and AFAICS we can override these.

 I'm not sure if we should override all the flags, or just the one for the
default buildtype we chose. I lean towards the latter.

 Regards,
 Arnout

> 
> Thanks,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
