From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Fri, 14 Feb 2014 11:15:37 -0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140214101241.27857b9e@skate>
References: <20140214073009.1D7E6102637@stock.ovh.net>
 <20140214101241.27857b9e@skate>
Message-ID: <CAAEAJfBHZ_4hSWN+boCRCvxJbFC1+T_WN=Dv3oVM2yz0z=t5JQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14 February 2014 06:12, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>>      nios2 |                     crda-1.1.3 | NOK | http://autobuild.buildroot.net/results/780c3388e408ae6479e824711b1c02fdbd34bef4/
>
> No idea what this error means. Ezequiel ?
>
> /home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.7.3/../../../../nios2-linux-gnu/bin/ld: /home/test/test/2/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/crt1.o: undefined reference to symbol '_gp'
> /home/test/test/2/output/host/opt/ext-toolchain/bin/../lib/gcc/nios2-linux-gnu/4.7.3/../../../../nios2-linux-gnu/bin/ld: note: '_gp' is defined in DSO /home/test/test/2/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/lib/libgpg-error.so.0 so try adding it to the linker command line
>

As Peter said, some issue with the compiler. This is too much for me :-)
Adding nios2 support in the internal toolchain is on my (increasingly
long) TODO list.

>>      nios2 |               e2fsprogs-1.42.9 | NOK | http://autobuild.buildroot.net/results/70a47bd7392560cbc1c64769c8357c0b4c91ca3b/
>
> Another missing syscall on NIOS II ? Ezequiel ?
>
> ../lib/libext2fs.so: undefined reference to `fallocate64'
> collect2: error: ld returned 1 exit status
>

Ah, yes. We have lots of packages failing with this issue. I think
it's some issue
with the toolchain. fallocate64 is not a system call (only fallocate
exists, AFAICS),
so this should be some libc issue.

Anybody knows better? Who implements fallocate64? What can we do to fix this
in Buildroot (using an external toolchain)?

>>      nios2 |       libnetfilter_queue-1.0.2 | NOK | http://autobuild.buildroot.net/results/3d77c91847a099b2498030505b91f3f84c81df18/
>
> Issue with kernel headers ?
>
> /home/test/test/1/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/include/libnfnetlink/linux_nfnetlink.h:6:6: error: nested redefinition of 'enum nfnetlink_groups'
> /home/test/test/1/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/include/libnfnetlink/linux_nfnetlink.h:6:6: error: redeclaration of 'enum nfnetlink_groups'
>

The kernel headers exported by CodeSourcery toolchain seem to be copied
using some braindead cp-like copy, instead of using "make headers_install".
The latter does some modification to the headers. The dhcp package also fails
because of this.

Let's put this on top of my nios2 TODO list. Can we apply the header
sanitize in Buildroot,
when we install the Sourcery toolchain?
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
