From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 09 Apr 2014 01:20:15 +0200
Subject: [Buildroot] [lttng-dev] [PATCH 1/1] Disable liblttng-ust-dl if
 dlinfo is not available in C library.
In-Reply-To: <20140408172442.GB3199@free.fr>
References: <1396818161-20204-1-git-send-email-romain.naour@openwide.fr>
 <794709247.8287.1396903345152.JavaMail.zimbra@efficios.com>
 <53430E92.9060401@openwide.fr>
 <CAFXXi0kAZJDD7ygqs493ZPvJHMpkeuMTDvxHqMg9B722pJHHxQ@mail.gmail.com>
 <20140408172442.GB3199@free.fr>
Message-ID: <5344842F.3070901@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon, Yann,

Le 08/04/2014 19:24, Yann E. MORIN a ?crit :
> Simon, All,
>
> On 2014-04-08 13:03 -0400, Simon Marchi spake thusly:
>> Hi Romain,
>>
>> It seems like with that commit, dlinfo is not found even on a glibc
>> based system, where it is present.
>>
>> See https://bugs.lttng.org/issues/778
>>
>> Do you have a suggestion to fix that ?
> I think we should use AC_CHECK_DECL instead of AC_CHECK_FUNCS.
>
> dlinfo is in dlfcn.h so we need a check that allows us to include that
> header, and we must check for that header first, of course. So, maybe
> something like (completely untested, directly written in the mail):
>
>      AC_CHECK_HEADER([dlfcn.h])
>      AS_IF([test "${ac_cv_header_dlfcn_h}" = "yes"],
>            [AC_CHECK_DECL([dlinfo],,,[dlfcn.h])],
>            [ac_cv_have_decl_dlinfo="no"])
>      AM_CONDITIONAL([HAVE_DLINFO], [test "${ac_cv_have_decl_dlinfo}" = "yes"])
>
> But I'm no expert in autoconf, so the actual solution may be slightly
> different.
>
> Regards,
> Yann E. MORIN.
>
Sorry for the mistake, here is a new try:


AC_CHECK_HEADER([dlfcn.h])
AS_IF([test "${ac_cv_header_dlfcn_h}" = "yes"],
     [AC_CHECK_DECLS([RTLD_DI_LINKMAP],,,
         [#define _GNU_SOURCE /* Required on Linux to get GNU extensions */
         #include <dlfcn.h>])
     ],
     [ac_cv_have_decl_RTLD_DI_LINKMAP="no"])
AM_CONDITIONAL([HAVE_DLINFO], [test "${ac_cv_have_decl_RTLD_DI_LINKMAP}" 
= "yes"])


I can't use dlinfo directly here because it isdetected
even if it is not available in uClibc. (detected fromust-dlfcn.h ?)
So, I use RTLD_DI_LINKMAP which is not defined in uClibc.

I'll send the patch later (after doing some test)

Best regards,
Romain Naour
