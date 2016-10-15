From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 15 Oct 2016 12:34:29 +0200
Subject: [Buildroot] [PATCH v3 1/8] package/pkg-cmake.mk: fix build type
 and optimization flags
In-Reply-To: <20161015122557.25fd074f@free-electrons.com>
References: <20161015094437.6989-1-s.martin49@gmail.com>
 <20161015094437.6989-2-s.martin49@gmail.com>
 <20161015122557.25fd074f@free-electrons.com>
Message-ID: <CAHXCMM+1cbRY11V4cKHB=dCScSG7KGGraFz2NkWsWH+1tiG7XQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Oct 15, 2016 at 12:25 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sat, 15 Oct 2016 11:44:30 +0200, Samuel Martin wrote:
>
>> Before applying this patch, CMake packages are built with the following
>> options:
>>   * if BR2_ENABLE_DEBUG is set:
>>     The CMake build type is set to RelWithDebInfo, which means:
>>     - Optimization level is forced to: -O2;
>>     - no log nor assert due to -DNDEBUG;
>>     - BR2_DEBUG_{1..3} effect is unchanged;
>>   * otherwise:
>>     The CMake build type is set to Release, which means:
>>     - Optimization level is forced to: -O3;
>>     - no log nor assert due to -DNDEBUG (as expected).
>>   In any case, the optimization WRT the binary size is always ignored and
>>   forced.
>>
>> This change chooses the build type doing the closest thing to what
>> Buildroot attempts to do.
>>
>> Long version:
>>
>> Flags set by Buildroot depending on the configuration:
>>
>>   BR2_ENABLE_DEBUG | Optim. level   | Buildroot {C,CXX}FLAGS
>>   =================+================+=======================
>>           y        | BR2_OPTIMIZE_S | -Os -gx
>>           y        | BR2_OPTIMIZE_G | -Og -gx
>>           y        | BR2_OPTIMIZE_n | -On -gx
>>           n        | BR2_OPTIMIZE_S | -Os
>>           n        | BR2_OPTIMIZE_G | -Og
>>           n        | BR2_OPTIMIZE_n | -On
>>
>> Default flags appended by CMake depending on the build type:
>>
>>   Build type     | Flags           | Effects on {C,CXX}FLAGS
>>   ===============+=================+===========================================
>>   Debug          | -g              | Force -g, compatible with BR2_ENABLE_DEBUG
>>   MinSizeRel     | -Os -DNDEBUG    | Set -Os, compatible with BR2_OPTIMIZE_S
>>   Release        | -O3 -DNDEBUG    | Set -O3, closest to the others cases,
>>                  |                 | though the optimization level is forced.
>>   RelWithDebInfo | -O2 -g -DNDEBUG | Force -g and set -O2, not friendly with BR
>>
>> Since CMake appends its own build type flags and because of the gcc
>> option parser, the CMake flags takes precedence over the Buildroot
>> flags.
>>
>> So, this change sets the correct build type depending on the
>> BR2_ENABLE_DEBUG and BR2_OPTIMIZE_* options.
>
> Can't we tell CMake to not do all this crap, and simply not add
> -g/-O<x> options by itself ?

As discussed IRL, this solution is kind of the optimal one, not the
best one but the one that is the closest to what BR is trying to do in
all cases.

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com



-- 
Samuel
