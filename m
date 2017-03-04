From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 4 Mar 2017 13:48:13 +0100
Subject: [Buildroot] [PATCH] qemu: disable Qemu user-land emulation for
 uClibc toolchains
In-Reply-To: <20170304115409.0e798143@free-electrons.com>
References: <1488619059-1499-1-git-send-email-francois.perrad@gadz.org>
 <20170304115409.0e798143@free-electrons.com>
Message-ID: <CAB0FRsv9jWu7fJe+XU4gb9OTBeywNU=WGsrhrMise+wOBxB=DQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-03-04 11:54 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Sat,  4 Mar 2017 10:17:39 +0100, Francois Perrad wrote:
>> fixes:
>> http://autobuild.buildroot.org/results/69c/69c66f1876f0d8dba1bd71ee109df371577d8dda
>
> This error happens in ARM only code, so I believe disabling it on all
> architectures is probably a bit too much. In addition, the fix is most
> likely trivial, and probably looks like this:
>
> diff --git a/user-exec.c b/user-exec.c
> index 6db0758..2b3d116 100644
> --- a/user-exec.c
> +++ b/user-exec.c
> @@ -409,7 +409,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
>
>  #if defined(__NetBSD__)
>      pc = uc->uc_mcontext.__gregs[_REG_R15];
> -#elif defined(__GLIBC__) && (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
> +#elif defined(__GLIBC__) && !defined(__UCLIBC__) && (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
>      pc = uc->uc_mcontext.gregs[R15];
>  #else
>      pc = uc->uc_mcontext.arm_pc;
>
> Could you have a try with this?
>
> Adding Waldemar in Cc: since it's a uClibc related issue.
>

When the issue with 'struct sigcontext' is fixed, another one occurs:
build/qemu-2.8.0/linux-user/syscall.c:6865:23: error: 'struct timex'
has no member named 'tai'
     __put_user(host_tx->tai, &target_tx->tai);
                       ^
The member 'tai' exists in linux/timex.h but not in sys/timex.h
with the toolchain from
http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2017.02-rc1-70-g7612a7d.tar.bz2

Fran?ois

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
