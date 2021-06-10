From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 10:26:27 +0200
Subject: [Buildroot] [PATCH] Config.in: disable PIC/PIE for Nios2
In-Reply-To: <20210601190021.153040-1-romain.naour@gmail.com> (Romain Naour's
 message of "Tue, 1 Jun 2021 21:00:21 +0200")
References: <20210601190021.153040-1-romain.naour@gmail.com>
Message-ID: <874ke6m8gc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Recently in Buildroot the option BR2_PIC_PIE has been enabled by default along
 > with other hardening features [1]. Since then the nios2 defconfig
 > qemu_nios2_10m50_defconfig is failing to boot due to a segfault in init program:

 > Run /init as init process
 >   with arguments:
 >     /init
 >   with environment:
 >     HOME=/
 >     TERM=linux
 > Failed to execute /init (error -12)

 > See Buildroot build log and Qemu runtime test log in build artifacts [2].

 > Analyzing one of the binary with strace show that the problem occur
 > very early when starting the new process:

 >  # strace ./busybox
 >  execve("./busybox", ["./busybox"], 0x7f91ce90 /* 10 vars */) = -1 ENOMEM
 > (Cannot allocate memory)
 >  +++ killed by SIGSEGV +++

 > Several binutils/glibc/gcc version has been tested without any success.

 > The issue has been reported to the glibc mailing list but it can be a linker
 > or kernel bug [3].

 > For the Buildroot 2021.05 release, disable BR2_PIC_PIE until the problem is
 > found and fixed.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/1285145889

 > [1] https://git.buildroot.net/buildroot/commit/?id=810ba387bec3c5b6904e8893fb4cb6f9d3717466
 > [2] https://gitlab.com/buildroot.org/buildroot/-/jobs/1285145889
 > [3] https://sourceware.org/pipermail/libc-alpha/2021-May/126912.html

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Users might try to enable BR2_PIC_PIE on 2021.02.x as well, so committed
to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
