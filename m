From: Will Newton <will.newton@gmail.com>
Date: Thu, 3 Sep 2009 16:49:16 +0100
Subject: [Buildroot] times() - problem ?
In-Reply-To: <1531E53627F1F749B4FE809BF2A4EB6712C8F1@WETMEX10.loepfe.com>
References: <1531E53627F1F749B4FE809BF2A4EB6712C8F1@WETMEX10.loepfe.com>
Message-ID: <87a5b0800909030849h315329c5g712e90c1b1d92776@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 3, 2009 at 4:44 PM, Vellemans,
Noel<Noel.Vellemans@visionbms.com> wrote:
> Hi
>
>
> Don't know if this is the correct mailing-list to post this problem, if
> not... maybe someone can point me to the correct list, or even better,
> someone can point me in a direction ... Where to look for.
>
>
>
> Buildroot (release 2009.08)
> uClibc 0.9.30.1
> Busybox 1.14.3
> Kernel 2.6.28.10 (with Atmel patches)
> GCC 4.3.3
> Target AT91SAM9G20 (arm platform)
>
>
> Please have a look at the following code snapshot to 'show' the problem.
>
>
> while(1)
> {
> ? sleep(1);
> ? printf("\n[0x%lX ticks, %lu ticks, %ld
> ticks]",times(NULL),times(NULL),times(NULL));
> ? fflush(stdout);
> }
>
> // this code has the following output... ..
> /// .. Some 'good' lines removed ... But after some time ...
> [0xFFFFEEB8 ticks, 4294962872 ticks, -4424 ticks]
> [0xFFFFEF1E ticks, 4294962974 ticks, -4322 ticks]
> [0xFFFFEF84 ticks, 4294963076 ticks, -4220 ticks]
> [0xFFFFEFEA ticks, 4294963178 ticks, -4118 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0xFFFFFFFF ticks, 4294967295 ticks, -1 ticks]
> [0x40 ticks, 64 ticks, 64 ticks]
> [0xA6 ticks, 166 ticks, 166 ticks]
> [0x10C ticks, 268 ticks, 268 ticks]
> [0x172 ticks, 370 ticks, 370 ticks]
> [0x23E ticks, 574 ticks, 574 ticks]
> [0x2A4 ticks, 676 ticks, 676 ticks]
>
>
> //
> The output shows...that the timer (return value from times(NULL))
> freezes for some time.
> ( if this happens the times result is always somewhere around -4096 )
>
> There are some busybox-tools (like 'ps' and some others) that are having
> strange effects/results due to this problem.
>
>
>
> Any hints?

I believe this is caused by the way the kernel truncates a 64bit time
value to 32bit. On many architectures a negative syscall return is
treated as an error and the C library returns -1 and sets errno.

I don't know what the solution is. Some architecture get away with it
because they are 64bit, some get away with it because they have some
other method of signalling a syscall error other than a negative
return value (I believe ppc does this):

SYSCALL_DEFINE1(times, struct tms __user *, tbuf)
{
        if (tbuf) {
                struct tms tmp;

                do_sys_times(&tmp);
                if (copy_to_user(tbuf, &tmp, sizeof(struct tms)))
                        return -EFAULT;
        }
        force_successful_syscall_return();
        return (long) jiffies_64_to_clock_t(get_jiffies_64());
}
