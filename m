From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 19 Aug 2015 01:20:29 +0300
Subject: [Buildroot] [PATCH 0/4] xtensa: toolchain fix for compiling
	huge functions
In-Reply-To: <20150818212917.GG3799@free.fr>
References: <1439418003-23805-1-git-send-email-jcmvbkbc@gmail.com>
 <20150818212917.GG3799@free.fr>
Message-ID: <CAMo8Bf+d3AX471ESgdmJF6GH+39gZ0a5Wf6LYxsv3pskD4EHtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Wed, Aug 19, 2015 at 12:29 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> On 2015-08-13 01:19 +0300, Max Filippov spake thusly:
>> this series backports binutils and gcc patches that add auto-litpools option
>> and replaces text-section-literals ABI flag for xtensa with auto-litpools.
>> With that change compiling huge functions should no longer be an issue on
>> xtensa. Obviously that change will break builds with pre-built toolchain.
>
> I'm not a huge fan of this series.
>
>   - First, they are "feature patches" (even if backported) to critical
>     components (gcc, binutils).
>
>   - Then, patches 3 and 4 will break external toolchains.
>
>   - Finally, it seems to me quite some efforst for "just" one package.

Agree, except for the last point: it's actually not the first breakage
caused by huge functions, previously we had similar issues with
packages built with -O0.

> So, I'd say we wait for gcc + binutils to spew out releases with those
> changes, then we can incorporate those versions in Buildroot, and make
> OpenCV depend on _GCC_AT_LEAST_X_Y ...

Ok, though it's a bit more complex than that: we'd also need to set
TARGET_ABI depending on combination of gcc and binutils versions.

> Note: those comments are also valid for the unwind patch you sent
> later...

With that I don't agree: these are real libgcc bug fixes, they are tiny
(two of them are one-liners), they don't break builds with external
toolchain and they affect pretty much anything that uses pthread
cancellation.

-- 
Thanks.
-- Max
