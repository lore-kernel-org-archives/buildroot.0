From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 3 Oct 2020 22:02:06 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/supertux: fix build with RELRO
In-Reply-To: <CAPi7W824B_6qU_JKTQULqz9mJAopC5=tu3PD=GQWaE9CujZtVg@mail.gmail.com>
References: <20200914203329.3432074-1-fontaine.fabrice@gmail.com>
 <87zh58y9vb.fsf@dell.be.48ers.dk>
 <8227afb0-d29f-4ab8-93b2-eef84ccfd0da@gmail.com>
 <CAPi7W824B_6qU_JKTQULqz9mJAopC5=tu3PD=GQWaE9CujZtVg@mail.gmail.com>
Message-ID: <5bf78d9a-4741-012f-bbf9-1683447c6540@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

Le 03/10/2020 ? 21:52, Fabrice Fontaine a ?crit?:
> Hello Romain,
> 
> Le sam. 3 oct. 2020 ? 21:40, Romain Naour <romain.naour@gmail.com> a ?crit :
>>
>> Hello Fabrice,
>>
>> Le 29/09/2020 ? 15:45, Peter Korsgaard a ?crit :
>>>>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>>>
>>>  > Disable static building of external/squirrel to fix the following build
>>>  > failure with RELRO:
>>>
>>>  > /home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/8.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld:
>>>  > CMakeFiles/sq_static.dir/sq.c.o: relocation R_X86_64_32 against
>>>  > `.rodata.str1.8' can not be used when making a PIE object; recompile
>>>  > with -fPIC
>>>  > /home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/8.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld:
>>>  > final link failed: nonrepresentable section on output
>>>  > collect2: error: ld returned 1 exit status
>>>
>>>  > Fixes:
>>>  >  - http://autobuild.buildroot.org/results/46e8f5e622ce450a89bc6d70f4bfd38182557901
>>>  >  - http://autobuild.buildroot.org/results/a43720492d817e4555d728546da9114e3ccba952
>>>
>>>  > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>>>  > ---
>>>  > Changes v1 -> v2 (after review of Thomas Petazzoni):
>>>  >  - Disable static building of external/squirrel instead of adding -fPIC
>>>
>>> Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.
>>>
>>
>> This patch break supertux because libsquirrel.so.0 and libsqstdlib.so.0 are
>> missing in TARGET_DIR.
>>
>> I believe, such bundled libraries are meant to be linked statically into supertux.
>>
>> We need to revert this patch.
> Understood, I'll revert this patch.
> I opened an issue upstream: https://github.com/SuperTux/supertux/issues/1536
> One option would be to disable building of sq binary (but I don't know
> yet if it is upstreamable).

Sorry, I haven't looked how to fix the initial issue yet.

But it seems that some bundled libraries are built as a shared libraries:
[ 70%] Linking CXX shared library libsquirrel.so

We need to force CMake to build them as static libraries.

This fix is not good, but thank you for all other issues you fixed in Buildroot :)

Best regards,
Romain


>>
>> Best regards,
>> Romain
> Best Regards,
> 
> Fabrice
> 
