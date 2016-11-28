From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 28 Nov 2016 15:22:10 -0800
Subject: [Buildroot] [PATCH] autossh: honour LDFLAGS
In-Reply-To: <20161128222834.37958cd9@free-electrons.com>
References: <20161125180016.GA360@waldemar-brodkorb.de>
 <20161128222834.37958cd9@free-electrons.com>
Message-ID: <CAMo8BfKTeagcLMOG7rS0B6VnujzbjCXv7vYmxK649GeVkpZFvg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 28, 2016 at 1:28 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Fri, 25 Nov 2016 19:00:16 +0100, Waldemar Brodkorb wrote:
>> Fixes:
>>  http://autobuild.buildroot.net/results/08a458572a2e9c599dd32b837b1e5c02a6721973
>>
>> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
>> ---
>> It is indeed a change from uClibc-ng 1.0.18 and upward, but I think
>> it is the fault of the package not respecting LDFLAGS and so not
>> passing -static. I am unsure why it just worked in the past.
>> When it fails linker is doing following:
>> -lnsl -lgcc -lc -lgcc
>> When -static is used, following is passed:
>> -lnsl --start-group -lgcc -lc --end-group
>
> Applied to master.
>
> The difference in the gcc behavior is due to gcc/config/gnu-user.h:
>
> #define LINK_GCC_C_SEQUENCE_SPEC \
>   "%{static:--start-group} %G %L %{static:--end-group}%{!static:%G}"
>
> So, when you're linking dynamic, you have:
>
>         -lgcc -lc -lgcc
>
> And when you're linking statically, you have:
>
>         --start-group -lgcc -lc --end-group
>
> The --start-group/--end-group ask the linker to loop between -lgcc and
> -lc until all unresolved symbols have been resolved. So
> dl_iterate_phdr() being defined in the C library, but used in libgcc, I
> guess the dynamic way (-lgcc -lc -lgcc) doesn't work.
>
> However, this interestingly doesn't happen for other architectures such
> as ARM. Maybe dl_iterate_phdr is not used?

ARM libgcc has its own custom unwinder: unwind-arm.c, which doesn't
reference dl_iteratre_phdr, and it doesn't use unwind-dw2-fde-dip.c, which does.
But it is reproducible with MIPS.

-- 
Thanks.
-- Max
