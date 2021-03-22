From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 22 Mar 2021 14:15:08 +0100
Subject: [Buildroot] [PATCH] package/zeromq: fix build failure due to
 binutils bug 21464
In-Reply-To: <519abe18-e47a-38f9-e659-1a6dde6cd41d@benettiengineering.com>
References: <20210314223616.5bfcc62f@windsurf.home>
 <20210317154520.1613272-1-giulio.benetti@benettiengineering.com>
 <519abe18-e47a-38f9-e659-1a6dde6cd41d@benettiengineering.com>
Message-ID: <3a252a05-54ac-24a7-a9d6-1c5a21679aee@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 3/17/21 4:49 PM, Giulio Benetti wrote:
> Hi Thomas,
> 
> On 3/17/21 4:45 PM, Giulio Benetti wrote:
>> The zeromq package exhibits binutils bug 21464 when built for the Nios2
>> architecture with optimization enabled, which causes a build failure.
>>
>> As done for other packages in Buildroot work around this gcc bug by
>> setting optimization to -O0 if BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464=y.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/ce351e0e97c2cacc17d4718d39941548c7558559
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>    package/zeromq/zeromq.mk | 10 +++++++++-
>>    1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
>> index 182699403c..135b07b6c6 100644
>> --- a/package/zeromq/zeromq.mk
>> +++ b/package/zeromq/zeromq.mk
>> @@ -23,12 +23,20 @@ ZEROMQ_CONF_ENV = libzmq_cv_sock_cloexec=yes \
>>    	libzmq_cv_tcp_keepidle=yes \
>>    	libzmq_cv_tcp_keepintvl=yes
>>    
>> +ZEROMQ_CXXFLAGS = $(TARGET_CXXFLAGS)
>> +
>>    # Internal error, aborting at dwarf2cfi.c:2752 in connect_traces
>>    # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58864
>>    ifeq ($(BR2_m68k_cf),y)
>> -ZEROMQ_CONF_OPTS += CXXFLAGS="$(TARGET_CXXFLAGS) -fno-defer-pop"
>> +ZEROMQ_CXXFLAGS += -fno-defer-pop
>> +endif
>> +
>> +ifeq ($(BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464),y)
>> +ZEROMQ_CXXFLAGS += -O0
>>    endif
>>    
>> +ZEROMQ_CONF_OPTS += CXXFLAGS="$(ZEROMQ_CXXFLAGS)"
>> +
>>    # Only tools/curve_keygen.c needs this, but it doesn't hurt to pass it
>>    # for the rest of the build as well (which automatically includes stdc++).
>>    ifeq ($(BR2_STATIC_LIBS),y)
>>
> 
> this patch works around binutils bug 21464 for this package.
> The other packages affected by binutils bug 21464 seem affected by
> another bug instead and at the moment can't be worked around, I'll try
> to find a possible work around.
> 

OpenRisc binutils 21464 bug has a fix:
https://sourceware.org/bugzilla/show_bug.cgi?id=21464

I've tested it with binutils:
- 2.32
- 2.34
- 2.35.2
- 2.36.1

and works good while building:
- protobuf
- libtheora
- zeromq

zeromq is the only package that could be worked around with -O0.

I would add patches that add patches to all binutils versions, so this 
way buildroot toolchain built by buildroot are safe, but I should tag
as buggy all the external openrisc toolchains, basically the one 
provided by Bootlin. This implies adding patches to disable building 
libtheora with all its dependencies and I can do it, or otherwise we can 
wait for Bootlin to release a new fixed openrisc toolchain, what about that?

Also, zeromq is worked around using -O0 by this:
https://patchwork.ozlabs.org/project/buildroot/patch/20210317154520.1613272-1-giulio.benetti at benettiengineering.com/

protobuf has already been disabled by this:
https://git.buildroot.net/buildroot/commit/?id=9e71b6e2cb28a66e116019bf8808fb48cef1d7b9

libtheora needs a new patch taking care of dependencies.

In the meanwhile I've provided patch with the fix for binutils:
https://patchwork.ozlabs.org/project/buildroot/patch/20210322131437.392225-1-giulio.benetti at benettiengineering.com/

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
