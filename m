From: Thomas Pedersen <thomas@cozybit.com>
Date: Thu, 12 Dec 2013 11:16:32 -0800
Subject: [Buildroot] generating backports releases
In-Reply-To: <fbb8d2fd-f6e7-439c-82a2-c74a6c6225be@email.android.com>
References: <CAG6hwVOL5Ya2q_hEQGZdDP0uXvjvxKhQaJRbgy1-4PFw=FB3uA@mail.gmail.com>
 <fbb8d2fd-f6e7-439c-82a2-c74a6c6225be@email.android.com>
Message-ID: <CAG6hwVM+r=Kis_tVkkJRJNrOQDjCkLp=+wQoCk64XS__X9Vikg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 12, 2013 at 10:55 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Thomas Pedersen <thomas@cozybit.com> wrote:
>>Hi list,
>>
>>I managed to cobble together a working backports package for
>>buildroot, but it would also be convenient if buildroot could generate
>>a backports release on the fly given the right source tree and base
>>tag.
>>
>>Does anyone else agree or does this seems out of scope for the
>>buildroot project?
>
> Some more context would be nice... what is 'backports' ?

It is a package which provides a compatibility layer (compat.ko)
between certain newer kernel modules and older kernels. Useful if eg.
you want 3.12 wifi drivers on your 3.8 kernel. Typically the user
would use a backports "release" which already includes all the new
driver / subsystem / compatibility code, which is then cross-compiled
to the target architecture.

You can also generate your own backports release however, which is
useful if you'd like say 3.12 + your patches on your 3.8 kernel. The
process for generating a release then looks like:

<kernel_src> + backports.git == backports_release

where <kernel_src> is 3.12 + patches.

I was thinking of teaching buildroot how to generate a backports
release, so you could point it to your kernel source tree, and the
release generation / compilation / install happens automagically.

This is mainly due to the (pandaboard) linux kernel being regularly
fscked (MMC currently) and we don't want this to stop development of
other subsystems. The idea is then to keep one reliably booting kernel
(BR2_LINUX_KERNEL_VERSION), and another kernel tree
(BR2_BACKPORTS_KERNEL_SRC) for developing (say) wifi drivers on the
latest supported -next tag.

-- 
Thomas
