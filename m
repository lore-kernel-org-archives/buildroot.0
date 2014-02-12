From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 12 Feb 2014 13:44:05 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140212133153.7995b73a@skate>
References: <20140212073007.B3242100CEB@stock.ovh.net>
 <20140212093245.49e2b6ac@skate>
 <CAAXf6LXjfkZ=3_fFPowo3k2HHyUkSpiHnOfGG=HS=0icjYBXhA@mail.gmail.com>
 <20140212104745.61ea39bd@skate>
 <CAAXf6LUDUyWxQ_cf2+TapCcSoB0=HRs2_413MH_FCXN56C3R_Q@mail.gmail.com>
 <CAAXf6LXTF0XKg-pBGKhDmxV+VPULPSxhJm84UnfzUH=kGa3MNA@mail.gmail.com>
 <CAAXf6LVVkFtkFiL-9AD918JTeTPf4zgUf=RQsp4XZUOBVUaTDQ@mail.gmail.com>
 <20140212133153.7995b73a@skate>
Message-ID: <CAAXf6LV6FZJ_KdxjEZ83550vM4V8n-zaRfieZJusfdKVYxyOAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Feb 12, 2014 at 1:31 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Wed, 12 Feb 2014 13:29:35 +0100, Thomas De Schampheleire wrote:
>
>> I found this snippet:
>> AC_CHECK_LIB(c, dlopen, LIBDL="", [AC_CHECK_LIB(dl, dlopen, LIBDL="-ldl")])
>>
>> which would be used as follows in aclocal.m4:
>> -ALSA_LIBS="$ALSA_LIBS -lasound -lm -ldl -lpthread"
>> +ALSA_LIBS="$ALSA_LIBS -lasound -lm $LIBDL -lpthread"
>>
>> but aclocal.m4 seems to be regenerated with autoreconf. How can you
>> make changes in that file?
>
> You don't make changes to aclocal.m4.
>
>> I tried adding an m4 file in the m4 subdirectory, adding it to the Makefile.am.
>> But how to regenerate aclocal.m4?
>
> By running the aclocal tool.
>
> From man aclocal:
>
> """
> Generate 'aclocal.m4' by scanning 'configure.ac' or 'configure.in
> """

In alsa-utils, configure.in contains the following line:
AM_PATH_ALSA(1.0.24)

This macro is defined in aclocal.m4, and I want to change that,
because this is where the -ldl is added unconditionally.

So, if aclocal uses configure.in to generate aclocal.m4, the real
definition of AM_PATH_ALSA must be somewhere else (outside the
alsa-utils sources).

So how to change the AM_PATH_ALSA ?

Thanks,
Thomas
