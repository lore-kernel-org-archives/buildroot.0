From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 21 Nov 2017 04:56:06 +0100
Subject: [Buildroot] or1k system calls appear broken
In-Reply-To: <CACPK8Xfjvb565q5xtsN+i3VmAqnx0EH6mxBcg5CRXpsC1_urRw@mail.gmail.com>
References: <CACPK8Xfjvb565q5xtsN+i3VmAqnx0EH6mxBcg5CRXpsC1_urRw@mail.gmail.com>
Message-ID: <06A8EC8A-0A08-4632-B0C8-B4085462304E@openadk.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joel,

Stafford is working on some issues we seen with uClibc-ng and NPTL.
The testsuite showed over 100 errors. He could already identify some issues and I pushed the changes to master. Can you try uClibc-ng master and test if your problems still exist?

Sorry for topposting I have limited access to my mail account..

thanks
 Waldemar 

> Am 20.11.2017 um 14:09 schrieb Joel Stanley <joel@jms.id.au>:
> 
> Hello,
> 
> I did a build of the Buildroot Openrisc Qemu defconfig and attempted
> to run some userspace tools. They were failing in strange ways:
> 
> # ping 127.0.0.1
> PING 127.0.0.1 (127.0.0.1): 56 data bytes
> ping: clock_gettime(MONOTONIC) failed
> 
> I tested with Ubuntu's Qemu 2.10.1, and a Qemu 2.11-rc0 that I built
> myself. Buildroot is master, 2017.11-rc2-21-g250170e92252.
> 
> I'm also seeing this with my own 4.14 based kernel running on or1k
> hardware (a softcore inside a FPGA). Stafford can reproduce on
> hardware using my buildroot initrd, but his hand compiled busybox
> build is fine.
> 
> I've attached the output of strace below, which is hard to read as the
> process_vm_readv calls made by strace are failing as well.
> 
> I cross compiled some of the LTP tests and the expected-failure test
> passed, but the expected-succeeds test failed.
> 
> # clock_gettime02
> clock_gettime02    1  TFAIL  :  clock_gettime02.c:97: failed:
> TEST_ERRNO=EFAULT(14): Bad address
> clock_gettime02    2  TFAIL  :  clock_gettime02.c:97: failed:
> TEST_ERRNO=EFAULT(14): Bad address
> 
> # clock_gettime03
> clock_gettime03    1  TPASS  :  got expected failure:
> TEST_ERRNO=EFAULT(14): Bad address
> clock_gettime03    2  TPASS  :  got expected failure:
> TEST_ERRNO=EFAULT(14): Bad address
> clock_gettime03    3  TPASS  :  got expected failure:
> TEST_ERRNO=EINVAL(22): Invalid argument
> clock_gettime03    4  TPASS  :  got expected failure:
> TEST_ERRNO=EINVAL(22): Invalid argument
> clock_gettime03    5  TPASS  :  got expected failure:
> TEST_ERRNO=EFAULT(14): Bad address
> clock_gettime03    6  TPASS  :  got expected failure:
> TEST_ERRNO=EFAULT(14): Bad address
> 
> strace of clock_gettime2 shows the second argument is NULL, so the
> kernel is doing the correct thing here and returning EFAULT. The
> source shows it passing the address of a local variable.
> 
> Finally, a hand compiled test program succeeds:
> 
> #include <time.h>
> #include <errno.h>
> 
> int main()
> {
>    struct timespec ts;
>    int r = clock_gettime(CLOCK_MONOTONIC, &ts);
>    if (r < 0)
>        return errno;
>    return 0;
> }
> 
> # t
> # echo $?
> 0
> 
> Does this make sense to anyone?
> 
> Cheers,
> 
> Joel
> 
> --
> 
> # strace ping 127.0.0.1
> execve(strace: process_vm_readv: pid:83 @0x7f900c30: Invalid argument
> 0x7f900c30, strace: process_vm_readv: pid:83 @0x7f901e68: Invalid argument
> 0x7f901e68, 0x7f901e74strace: process_vm_readv: pid:83 @0x7f901e74:
> Invalid argument
> ) = 0
> readlinkat(AT_FDCWD, strace: process_vm_readv: pid:83 @0x300051e8:
> Invalid argument
> 0x300051e8, strace: process_vm_readv: pid:83 @0x7f83cb58: Invalid argument
> 0x7f83cb58, 4096) = 12
> mmap2(NULL, 8192, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS|MAP_UNINITIALIZED, -1, 0) = 0x3000a000
> openat(AT_FDCWD, strace: process_vm_readv: pid:83 @0x7f83d318: Invalid argument
> 0x7f83d318, O_RDONLY)  = 3
> fstat64(3, strace: process_vm_readv: pid:83 @0x7f83d1f8: Invalid argument
> 0x7f83d1f8)                  = 0
> mmap2(NULL, 8192, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS|MAP_UNINITIALIZED, -1, 0) = 0x3000c000
> read(3, strace: process_vm_readv: pid:83 @0x3000c000: Invalid argument
> 0x3000c000, 8192)               = 8192
> mmap2(NULL, 761856, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3000e000
> mmap2(0x3000e000, 636828, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED,
> 3, 0) = 0x3000e000
> mmap2(0x300aa000, 27060, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
> 3, 0x9a000) = 0x300aa000
> mmap2(0x300b2000, 84480, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x300b2000
> mprotect(0x3000e000, 636828, PROT_READ|PROT_WRITE|PROT_EXEC) = 0
> close(3)                                = 0
> munmap(0x3000c000, 8192)                = 0
> fstatat64(AT_FDCWD, strace: process_vm_readv: pid:83 @0x3000a358:
> Invalid argument
> 0x3000a358, strace: process_vm_readv: pid:83 @0x7f83dad4: Invalid argument
> 0x7f83dad4, 0) = 0
> mprotect(0xf6000, 8192, PROT_READ)      = 0
> mprotect(0x300aa000, 8192, PROT_READ)   = 0
> mprotect(0x30006000, 8192, PROT_READ)   = 0
> mprotect(0x3000e000, 636828, PROT_READ|PROT_EXEC) = 0
> ioctl(0, TCGETS, strace: process_vm_readv: pid:83 @0x7f83dab0: Invalid argument
> 0x7f83dab0)            = 0
> ioctl(1, TCGETS, strace: process_vm_readv: pid:83 @0x7f83dab0: Invalid argument
> 0x7f83dab0)            = 0
> getpid()                                = 83
> getrlimit(RLIMIT_STACK, strace: process_vm_readv: pid:83 @0x7f83db08:
> Invalid argument
> 0x7f83db08)     = 0
> rt_sigaction(SIGRTMIN, strace: process_vm_readv: pid:83 @0x7f83db10:
> Invalid argument
> 0x7f83db10, NULL, 8) = 0
> rt_sigaction(SIGRT_1, strace: process_vm_readv: pid:83 @0x7f83db10:
> Invalid argument
> 0x7f83db10, NULL, 8) = 0
> rt_sigaction(SIGRT_2, strace: process_vm_readv: pid:83 @0x7f83db10:
> Invalid argument
> 0x7f83db10, NULL, 8) = 0
> rt_sigprocmask(SIG_BLOCK, strace: process_vm_readv: pid:83
> @0x7f83db00: Invalid argument
> 0x7f83db00, NULL, 8) = 0
> rt_sigprocmask(SIG_UNBLOCK, strace: process_vm_readv: pid:83
> @0x7f83db00: Invalid argument
> 0x7f83db00, NULL, 8) = 0
> or1k_atomic(SWAP, 0x300ac2ac, 0x7f83da68) = 0
> or1k_atomic(SWAP, 0x300ac1d0, 0x7f83d9d8) = 0
> brk(NULL)                               = 0xfa000
> brk(0xfc000)                            = 0xfc000
> brk(0xfc000)                            = 0xfc000
> or1k_atomic(SWAP, 0x300ac1d0, 0x7f83ddb0) = 0
> or1k_atomic(SWAP, 0x300ac1d0, 0x7f83ddb0) = 0
> getuid()                                = 0
> getpid()                                = 83
> or1k_atomic(SWAP, 0x300ac1d0, 0x7f83dc74) = 0
> or1k_atomic(SWAP, 0x300ac1d0, 0x7f83dc0c) = 0
> or1k_atomic(SWAP, 0x300ac124, 0x7f83dcf0) = 0
> or1k_atomic(SWAP, 0x300ac124, 0x7f83dcf0) = 0
> write(1, strace: process_vm_readv: pid:83 @0x300b1d4c: Invalid argument
> 0x300b1d4c, 42PING 127.0.0.1 (127.0.0.1): 56 data bytes
> )                = 42
> socket(AF_INET, SOCK_RAW, IPPROTO_ICMP) = 3
> dup3(3, 0, 0)                           = 0
> close(3)                                = 0
> or1k_atomic(SWAP, 0x300ac1d0, 0x7f83dcc8) = 0
> or1k_atomic(SWAP, 0x300ac1d0, 0x7f83dcc8) = 0
> setsockopt(0, SOL_SOCKET, SO_BROADCAST, strace: process_vm_readv:
> pid:83 @0x7f83dd60: Invalid argument
> 0x7f83dd60, 4) = 0
> setsockopt(0, SOL_SOCKET, SO_RCVBUF, strace: process_vm_readv: pid:83
> @0x7f83dd70: Invalid argument
> 0x7f83dd70, 4) = 0
> rt_sigaction(SIGINT, strace: process_vm_readv: pid:83 @0x7f83dd1c:
> Invalid argument
> 0x7f83dd1c, strace: process_vm_readv: pid:83 @0x7f83dd5c: Invalid argument
> 0x7f83dd5c, 8) = 0
> clock_gettime(0x53 /* CLOCK_??? */, NULL) = -1 EINVAL (Invalid argument)
> or1k_atomic(SWAP, 0x300ac074, 0x7f83dbf4) = 0
> or1k_atomic(SWAP, 0x300ac08c, 0x7f83dbf4) = 0
> or1k_atomic(SWAP, 0x300ac124, 0x7f83dbf4) = 0
> or1k_atomic(SWAP, 0x300ac074, 0x7f83dba8) = 0
> write(2, strace: process_vm_readv: pid:83 @0x7f83dcc4: Invalid argument
> 0x7f83dcc4, 38ping: clock_gettime(MONOTONIC) failed
> )                = 38
> or1k_atomic(SWAP, 0x300ac2ac, 0x7f83dcc0) = 0
> or1k_atomic(SWAP, 0x300ac1d0, 0x7f83dc80) = 0
> or1k_atomic(SWAP, 0x300ac0e4, 0x7f83dcd0) = 0
> or1k_atomic(SWAP, 0x300ac124, 0x7f83dcd0) = 0
> or1k_atomic(SWAP, 0x300ac164, 0x7f83dcd0) = 0
> exit_group(1)                           = ?
> +++ exited with 1 +++
> 
> # strace -o test t
> strace: process_vm_readv: pid:110 @0x7fa96c30: Invalid argument
> strace: process_vm_readv: pid:110 @0x7fa97e70: Invalid argument
> strace: process_vm_readv: pid:110 @0x7fa97e78: Invalid argument
> strace: process_vm_readv: pid:110 @0x300051e8: Invalid argument
> strace: process_vm_readv: pid:110 @0x7ff28b68: Invalid argument
> strace: process_vm_readv: pid:110 @0x7ff29328: Invalid argument
> strace: process_vm_readv: pid:110 @0x7ff29208: Invalid argument
> strace: process_vm_readv: pid:110 @0x3000c000: Invalid argument
> strace: process_vm_readv: pid:110 @0x3000a350: Invalid argument
> strace: process_vm_readv: pid:110 @0x7ff29ae4: Invalid argument
> strace: process_vm_readv: pid:110 @0x7ff29ac0: Invalid argument
> strace: process_vm_readv: pid:110 @0x7ff29ac0: Invalid argument
> strace: process_vm_readv: pid:110 @0x7ff29b18: Invalid argument
> strace: process_vm_readv: pid:110 @0x7ff29b20: Invalid argument
> strace: process_vm_readv: pid:110 @0x7ff29b20: Invalid argument
> strace: process_vm_readv: pid:110 @0x7ff29b20: Invalid argument
> strace: process_vm_readv: pid:110 @0x7ff29b10: Invalid argument
> strace: process_vm_readv: pid:110 @0x7ff29b10: Invalid argument
> strace: process_vm_readv: pid:110 @0x7ff29e3c: Invalid argument
> # cat test  | grep gettime
> clock_gettime(CLOCK_MONOTONIC, 0x7ff29e3c) = 0
> # cat test
> execve(0x7fa96c30, 0x7fa97e70, 0x7fa97e78) = 0
> readlinkat(AT_FDCWD, 0x300051e8, 0x7ff28b68, 4096) = 10
> mmap2(NULL, 8192, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS|MAP_UNINITIALIZED, -1, 0) = 0x3000a000
> openat(AT_FDCWD, 0x7ff29328, O_RDONLY)  = 3
> fstat64(3, 0x7ff29208)                  = 0
> mmap2(NULL, 8192, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_ANONYMOUS|MAP_UNINITIALIZED, -1, 0) = 0x3000c000
> read(3, 0x3000c000, 8192)               = 8192
> mmap2(NULL, 761856, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x3000e000
> mmap2(0x3000e000, 636828, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED,
> 3, 0) = 0x3000e000
> mmap2(0x300aa000, 27060, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED,
> 3, 0x9a000) = 0x300aa000
> mmap2(0x300b2000, 84480, PROT_READ|PROT_WRITE,
> MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x300b2000
> mprotect(0x3000e000, 636828, PROT_READ|PROT_WRITE|PROT_EXEC) = 0
> close(3)                                = 0
> munmap(0x3000c000, 8192)                = 0
> fstatat64(AT_FDCWD, 0x3000a350, 0x7ff29ae4, 0) = 0
> mprotect(0x4000, 8192, PROT_READ)       = 0
> mprotect(0x300aa000, 8192, PROT_READ)   = 0
> mprotect(0x30006000, 8192, PROT_READ)   = 0
> mprotect(0x3000e000, 636828, PROT_READ|PROT_EXEC) = 0
> ioctl(0, TCGETS, 0x7ff29ac0)            = 0
> ioctl(1, TCGETS, 0x7ff29ac0)            = 0
> getpid()                                = 110
> getrlimit(RLIMIT_STACK, 0x7ff29b18)     = 0
> rt_sigaction(SIGRTMIN, 0x7ff29b20, NULL, 8) = 0
> rt_sigaction(SIGRT_1, 0x7ff29b20, NULL, 8) = 0
> rt_sigaction(SIGRT_2, 0x7ff29b20, NULL, 8) = 0
> rt_sigprocmask(SIG_BLOCK, 0x7ff29b10, NULL, 8) = 0
> rt_sigprocmask(SIG_UNBLOCK, 0x7ff29b10, NULL, 8) = 0
> or1k_atomic(SWAP, 0x300ac2ac, 0x7ff29a78) = 0
> or1k_atomic(SWAP, 0x300ac1d0, 0x7ff299e8) = 0
> brk(NULL)                               = 0x8000
> brk(0xa000)                             = 0xa000
> brk(0xa000)                             = 0xa000
> clock_gettime(CLOCK_MONOTONIC, 0x7ff29e3c) = 0
> or1k_atomic(SWAP, 0x300ac2ac, 0x7ff29dd8) = 0
> or1k_atomic(SWAP, 0x300ac1d0, 0x7ff29d98) = 0
> or1k_atomic(SWAP, 0x300ac0e4, 0x7ff29de8) = 0
> or1k_atomic(SWAP, 0x300ac124, 0x7ff29de8) = 0
> or1k_atomic(SWAP, 0x300ac164, 0x7ff29de8) = 0
> exit_group(0)                           = ?
> +++ exited with 0 +++
> 
