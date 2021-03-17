From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 17 Mar 2021 17:57:07 +0100
Subject: [Buildroot] [PATCH v2 3/6] toolchain: introduce
 BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27100
In-Reply-To: <20210314230544.20b9191f@windsurf.home>
References: <20210310091453.23611-1-giulio.benetti@benettiengineering.com>
 <20210310091453.23611-4-giulio.benetti@benettiengineering.com>
 <20210314230544.20b9191f@windsurf.home>
Message-ID: <14e8fc61-c8bb-a97b-84d3-2394f1db03a9@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 3/14/21 11:05 PM, Thomas Petazzoni wrote:
> On Wed, 10 Mar 2021 10:14:50 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> On OpenRisc binutils it still present ld bug 27100 leading to a package
>> openal to fail building:
>> http://autobuild.buildroot.net/results/c05/c053b9e191b31f0b1f8f8c902b602e187f714dc0/
>>
>> The bug was already reported and it's been updated:
>> https://sourceware.org/bugzilla/show_bug.cgi?id=27100
> 
> How do you know it is this bug? The "final link failed: bad value"
> message is pretty generic. 

You're right, that is not the entire message, it's:
'''
/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: 
CMakeFiles/OpenAL.dir/al/source.cpp.o: pc-relative relocation against 
dynamic symbol alSourcePlayv
/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/9.3.0/../../../../or1k-buildroot-linux-uclibc/bin/ld: 
final link failed: bad value
'''

and that a package's issue. I think I've added by mistake openal failure 
as a test-case but it's not.

>Did you actually check that those issues no
> longer appear with binutils 2.36 ?
>> +# https://sourceware.org/bugzilla/show_bug.cgi?id=27100
>> +# Affect toolchains built with binutils 2.33.1 (fixed in binutils 2.36)
>> +config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27100
>> +	bool
>> +	default y if BR2_or1k && !BR2_BINUTILS_VERSION_2_36_X
> 
> Obviously, an annoying problem is that the BR2_BINUTILS_VERSION_2_36_X
> part of the condition does not take into account external toolchains.
> So for external toolchains that have binutils >= 2.36, we still won't
> be able to build those packages.
> 
> But oh well, for something like OpenRISC, this is perhaps an acceptable
> trade-off.
> 
> Thomas
> 

-- 
Giulio Benetti
Benetti Engineering sas
