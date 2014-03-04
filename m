From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 5 Mar 2014 00:23:05 +0400
Subject: [Buildroot] [PATCH] kmod: disable --gc-sections ld option when
	building for xtensa
In-Reply-To: <20140304202218.3396f4f9@skate>
References: <1393960216-18633-1-git-send-email-jcmvbkbc@gmail.com>
 <20140304202218.3396f4f9@skate>
Message-ID: <CAMo8BfLD1TPw=E2SyNUndBvRz+X_TRd=6ivwFxUapWfDm3bpuw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Mar 4, 2014 at 11:22 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Tue,  4 Mar 2014 23:10:16 +0400, Max Filippov wrote:
>> This is a workaround for the following ld issue exhibited by --gc-sections
>> option, until a proper fix for binutils is ready:
>>
>> ld: BFD (GNU Binutils) 2.22 internal error, aborting at elf32-xtensa.c line 3374 in elf_xtensa_finish_dynamic_sections
>>
>> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
>> ---
>>  package/kmod/900-disable-gc-sections.patch.xtensa | 12 ++++++++++++

[...]

> I believe there is a much simpler solution. Don't
> use any patch at all, and add:
>
> # --gc-sections triggers a bug in the current Xtensa binutils
> ifeq ($(BR2_xtensa),y)
> KMOD_CONF_ENV += cc_cv_LDFLAGS__Wl___gc_sections=no
> endif
>
> to package/kmod/kmod.mk.
>
> Can you test that it works for you, and submit the corresponding patch?

thank you for the review and for the suggested solution, it works for me
and I like it, though it doesn't look obvious. I'll submit v2.

-- 
Thanks.
-- Max
