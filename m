From: Mason <slash.tmp@free.fr>
Date: Tue, 12 Jan 2016 23:20:29 +0100
Subject: [Buildroot] [PATCH] linux-fusion: fix several build issues
In-Reply-To: <20160112174251.7280fdf3@free-electrons.com>
References: <56951746.4070806@free.fr>
 <20160112174251.7280fdf3@free-electrons.com>
Message-ID: <56957C2D.4060901@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/01/2016 17:42, Thomas Petazzoni wrote:

> We need your real name here to accept your patches. See
> http://lxr.free-electrons.com/source/Documentation/SubmittingPatches#L448.

Do you mean my full name, not just my first name?

> Please generate the patches with 'git format-patch -N' so that we don't
> have numbered patches.

OK.

> We also need a SoB line inside the patches.

OK.

> Can you try instead to replace '%ld' by '%tu'. Apparently, according to
> lib/vsprintf.c, %t is the proper format specifier for ptrdiff_t.

Erf, I had missed that, as the documentation isn't up-to-date.
https://www.kernel.org/doc/Documentation/printk-formats.txt

However, if I do use a specific kernel feature, the module
will no longer build for earlier kernels, while a cast
works "everywhere".

I tried tracing the history of the %t spec in printk.
I found 4370aa4aa753 (dated 2009-03-06) i.e. since 2.6.30

What do you think?

>> +-#if defined(CONFIG_TREE_RCU) || defined(CONFIG_TREE_PREEMPT_RCU) || defined(CONFIG_TINY_RCU) || defined(rcu_read_lock)
>> ++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,18) || defined(rcu_read_lock)
> 
> Are you sure it is good to keep the defined(rcu_read_lock) test ? This
> only works if rcu_read_lock is a macro, not if it's an inline function.
> If tasklisk_lock is available up to 2.6.18, then why not simply keep
> the version-based condition?

AFAICT, the rcu_read_lock macro was introduced in the 2.5 dev cycle.
bc33f24bdca8 changed rcu_read_lock from a macro to an inline function
since 2.6.32

It's possible e.g. kernel 2.6.16 (one of the first LTS kernels IIUC)
had both rcu_read_lock available, and tasklist_lock exported.

On the other hand, if both methods are available, I'm not sure which
was better. Do you have a strong opinion on the subject?

Thanks for the review.

Regards.
