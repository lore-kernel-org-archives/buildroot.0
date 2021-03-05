From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 5 Mar 2021 09:01:14 +0100
Subject: [Buildroot] Analysis of build results for 2021-03-03
In-Reply-To: <20210304222634.GP2275@scaer>
References: <20210304081519.C821B4B530@smtp4.osuosl.org>
 <20210304224926.45aa4056@windsurf.home> <20210304222634.GP2275@scaer>
Message-ID: <f764044e-5e2a-1851-2e36-46fe35542c32@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

On 3/4/21 11:26 PM, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2021-03-04 22:49 +0100, Thomas Petazzoni spake thusly:
>>>    riscv64    |      fuse-overlayfs-1.4.0      | NOK | http://autobuild.buildroot.net/results/cfef18f3adf51edaedbbd193efbff19aebdfe508 |
>>
>> This is a bug in uClibc: it implements renameat() only if the
>> SYS_renameat system call exists. If only the SYS_renameat2 system call
>> exists, the renameat() function is not implemented. Musl does this
>> correctly:
>>
>> int renameat(int oldfd, const char *old, int newfd, const char *new)
>> {
>> #ifdef SYS_renameat
>>          return syscall(SYS_renameat, oldfd, old, newfd, new);
>> #else
>>          return syscall(SYS_renameat2, oldfd, old, newfd, new, 0);
>> #endif
>> }
>>
>> uclibc needs to be patched here.
> 
> But what about external toolchains? We can't know whether they would
> carry such a patch or not...
> 
>>>    aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/739d625673f9b2ce2d915ecdc21910c62618d145 |
>>> microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b1779a7d46f6ee9c06864c3ca252f1cdad47cf08 |
>>>      i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a5fe402e3f4e538eb4584f345b029ef12ad43348 |
>>>      arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/abd3f886335f146ff6f16370484106bd8a205bda |
>> What do we do with this? The only way to solve that is to have the
>> Cargo vendoring support, which we won't have for 2021.02. Should we
>> drop this package ?
> 
> I am all in favour of dropping sentry-cli. It is a host-only package
> with no in-tree users. When it was submitted, no rationale was given to
> justify for having it upstream (although I suspect it may be helpfull
> with traces generated with sentry-native).
> 
> In any case, this package is not playing nice with our infra, and our
> infra is not ready to accomodate such a package yet.
> 
> Let's drop it for now...
> 
> Since you have it in your vendoring branch, you can still keep uisng it
> to validate your code.
> 
>>>     nios2     |         libgeos-3.9.0          | NOK | http://autobuild.buildroot.net/results/a05fdf1958f93a206c5c66c7f636b6650683626d | ORPH
>> Some more nios2 toolchain issue.
>> Should we get rid of nios2 support entirely ?
> 
> How prevalent is nios2? What's the support in the kernel? Some time ago,
> quite a few old architectures were dropped; IIR, a few others were put
> on trial to see if they were really still alive (but apart an LWN
> article https://lwn.net/Articles/748074/ I can't find that list...)

I think that(time allowing) we can get rid of it the same way as 
Microblaze. During the last year it seems that Microblaze build failure 
disappeared, only libgeos came out. But it's trivial to provide a patch 
to work it around with -O0. If Nios gcc bugs can be worked around that 
way I would keep it, as well as OpenRisc.
What about that?

>>>      arm      | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/d9b9a4b7c3660bd730a19ab09e44f24bc29e3f40 | ORPH
>>>      arm      | toolchain-external-linaro-a... | NOK | http://autobuild.buildroot.net/results/13f9a551f5ac911e7daa2a382b0683d81486cffa | ORPH
>> toolchain is gone ?
> 
> I can get it from here;
> 
>      wget 'https://releases.linaro.org/components/toolchain/binaries/7.3-2018.05/arm-linux-gnueabihf/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz'
>      --2021-03-04 23:03:07--  https://releases.linaro.org/components/toolchain/binaries/7.3-2018.05/arm-linux-gnueabihf/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz
>      Resolving releases.linaro.org (releases.linaro.org)...
>      52.215.200.125
>      Connecting to releases.linaro.org (releases.linaro.org)|52.215.200.125|:443... connected.
>      HTTP request sent, awaiting response... 302 Found
>      Location: https://publishing-ie-linaro-org.s3.amazonaws.com/releases/components/toolchain/binaries/7.3-2018.05/arm-linux-gnueabihf/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz?Signature=qIOVqoIXcsiFVTalQoTG%2FdNwu9A%3D&Expires=1614895479&AWSAccessKeyId=AKIAIELXV2RYNAHFUP7A [following]
>      --2021-03-04 23:03:09--  https://publishing-ie-linaro-org.s3.amazonaws.com/releases/components/toolchain/binaries/7.3-2018.05/arm-linux-gnueabihf/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz?Signature=qIOVqoIXcsiFVTalQoTG%2FdNwu9A%3D&Expires=1614895479&AWSAccessKeyId=AKIAIELXV2RYNAHFUP7A
>      Resolving publishing-ie-linaro-org.s3.amazonaws.com (publishing-ie-linaro-org.s3.amazonaws.com)... 52.218.41.226
>      Connecting to publishing-ie-linaro-org.s3.amazonaws.com (publishing-ie-linaro-org.s3.amazonaws.com)|52.218.41.226|:443... connected.
>      HTTP request sent, awaiting response... 200 OK
>      Length: 107031352 (102M) [application/octet-stream]
>      Saving to: ?gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz?
> 
>      gcc-linaro-7.3.1-2018.05-x 100%[=====================================>] 102.07M  17.0MB/s    in 5.8s
> 
>      2021-03-04 23:03:15 (17.5 MB/s) - ?gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf.tar.xz? saved [107031352/107031352]
> 
> Temporary glitch in the network? Goblins? ;-)

:-)

Micronova IT should get rid of that Firewall issue.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
