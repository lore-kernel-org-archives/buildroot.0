From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 11:33:03 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-09-17
In-Reply-To: <20190919203518.2c215f09@gmx.net>
References: <20190918061626.A01A88614D@whitealder.osuosl.org>
 <20190919203518.2c215f09@gmx.net>
Message-ID: <1c2981e0-a4d8-2408-e0c0-f08eaed4f338@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/09/2019 20:35, Peter Seiderer wrote:
> Hello,
> 
> On Wed, 18 Sep 2019 06:16:20 -0000, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
>> Hello,
>>
>> Autobuild statistics for 2019-09-17
>> ===============================
> [...]
>>
>>     arch     |             reason             | OK? |                                       url                                       | orph?
>> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
>>     arm      |           apr-1.7.0            | NOK | http://autobuild.buildroot.net/results/4da73982f160305ac2d5d2b4f615fa98eec5a7a3 |     
> 
> From build/apr-1.7.0/config.log:
> 
> configure:24288: checking whether int64_t and long long use fmt %lld
> configure:24320: /home/seiderer/Work/Buildroot/build_arm_apr_001/host/bin/arm-linux-gcc -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os    -Werror -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DLINUX -D_REENTRANT -D_GNU_SOURCE conftest.c >&5
> In file included from /home/seiderer/Work/Buildroot/build_arm_apr_001/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/sys/types.h:26:0,
>                  from conftest.c:147:
> /home/seiderer/Work/Buildroot/build_arm_apr_001/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/features.h:218:5: error: #warning requested reentrant code, but thread support was disabled [-Werror=cpp]
>  #   warning requested reentrant code, but thread support was disabled
>      ^~~~~~~
> cc1: all warnings being treated as errors
> configure:24320: $? = 1
> configure: failed program was:
> [...]
> |
> |    #include <sys/types.h>
> | #include <stdio.h>
> | #ifdef HAVE_STDINT_H
> | #include <stdint.h>
> | #endif
> |
> |    int main(int argc, const char *const *argv) {
> |
> |     int64_t chk1, *ptr1;
> |     long long chk2, *ptr2 = &chk1;
> |     ptr1 = &chk2;
> |     *ptr1 = *ptr2 = 0;
> |     printf("%lld %lld", chk1, chk2);
> |
> |       return 0; }
> |
> configure:24330: result: no
> 
> The test failure is a result of a toolchain without threads '# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS is not set'
> and the given '-D_REENTRANT' compile flag (the same test without '-D_REENTRANT' compiles fine) plus '-Werror'...

 So the problem is that apr adds this -D_REENTRANT unconditionally on linux
(cfr. build/apr_hints.m4). That suggests two possible solutions:

- patch apr_hints.m4 to not add -D_REENTRANT, and add it when we have threads.

- bypass the hints entirely by setting apr_preload_done=yes in the environment,
and manually passing -DLINUX -D_GNU_SOURCE and a conditional -DREENTRANT in CFLAGS.


 Regards,
 Arnout


> 
> Disable apr for toolchains without thread support?
> 
> Regards,
> Peter
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
