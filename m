From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Mar 2016 10:46:58 +0100
Subject: [Buildroot] [PATCH] gcc/gcc-final: pass TARGET_CFLAGS flags to
 configure with --enable-cxx-flags
In-Reply-To: <CAMo8BfKG3bf9EA+Xi3C2R=8JLZV7EO0o9R_r4depM3dMYPrs+A@mail.gmail.com>
References: <1433169427-7527-1-git-send-email-jcmvbkbc@gmail.com>
 <20160109220852.GE3444@free.fr> <56DF5EBF.20409@mind.be>
 <CAMo8BfKG3bf9EA+Xi3C2R=8JLZV7EO0o9R_r4depM3dMYPrs+A@mail.gmail.com>
Message-ID: <56E14292.6090209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/10/16 10:37, Max Filippov wrote:
> Arnout, Yann,
>
> On Wed, Mar 9, 2016 at 2:22 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 01/09/16 23:08, Yann E. MORIN wrote:
>>> On 2015-06-01 17:37 +0300, Max Filippov spake thusly:
>>>>
>>>> Currently only TARGET_ABI flags are passed to the final compiler
>>>> configure script and only when building for Xtensa. Since libstdc++ is a
>>>> normal library it should be built with full TARGET_CFLAGS on all
>>>> targets.
>>>>
>>>> Pass TARGET_CFLAGS flags to gcc-final configure script for all targets
>>>> in the --enable-cxx-flags parameter.
>>>>
>>>> Suggested-by: Arnout Vandecappelle <arnout@mind.be>
>>>> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
>>>
>>>
>>> So, I finally had a look at this patch. I've tested it to build a
>>> gcc-4.9 + glibc-2.21 + binutils-2.24 toolchain with C++ support, which
>>> then was used to suessfully build Qt5base (which is quite a heavy C++
>>> user).
>>>
>>> However, I'd like to understand what this is all about.
>>>
>>> In gcc.mk, we do:
>>>
>>>       GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
>>>       [...]
>>>       HOST_GCC_COMMON_CONF_ENV +=
>>> CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
>>>
>>> So it looks like we were already passing the proper CXXFLAGS to gcc (we
>>> only filter-out problematic flags, like -Os on broken gcc-4.5 for PPC).
>>>
>>> So, what are we supposed to gain/loose with this change?
>>>
>>> As a side note, we should not have to pass TARGET_ABI either, since it
>>> is part of TARGET_CFLAGS and as shown above, it is already part of the
>>> CFLAGS_FOR_TARGET that we pass gcc.
>>>
>>> Any explanations? Something that I missed?
>>
>>
>>   I checked in the gcc source and also couldn't find a reason why the
>> CXXFLAGS_FOR_TARGET wouldn't work. Since you haven't replied to this, I've
>> marked your patch as rejected in patchwork. If you do still fel it is
>> warranted, please repost with a satisfactory explanation.
>
> Sorry, took me too long to answer the first mail.
>
> AFAICS neither gcc-4.8.x nor gcc-4.9.x propagate CXXFLAGS_FOR_TARGET
> to CXXFLAGS for builds of libstdc++. gcc-5.x however does.

  Of course, I only checked the source of gcc-5.x :-)

> Compare the following build log excerpts for libstdc++ of gcc-4.8, gcc-4.9 and
> gcc-5 (I've reverted 2dcab526a97d and c44cf2cc97df before running these builds):
>
[snip]
> With --enable-cxx-flags="$(TARGET_CFLAGS)" in the
> HOST_GCC_FINAL_CONF_OPTS make invocation lines are the same,
> but makefiles in libstdc++ differ by the EXTRA_CXX_FLAGS.
>
> OTOH since flags propagation is fixed in gcc-5.x maybe backporting
> that fix is the right thing?

  If the backport is easy, by all means go for it. It's not as if we don't have 
gcc patches already :-)

  If the backport turns out to be difficult, I'm OK with taking your original 
patch (because even on gcc5 it doesn't change anything in practice). But it 
needs a comment mentioning this version dependency, so that the workaround can 
be removed when 4.9 is removed from buildroot.

  Regards,
  Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
