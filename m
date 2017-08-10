From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Aug 2017 13:01:55 +0200
Subject: [Buildroot] Compiling buildroot for Arm "Armada 166E" Target
In-Reply-To: <20170810103329.ptwo7grhmqjoln63@tarshish>
References: <20170810071320.xvrhusojcw4dqxtu@tarshish>
 <CANK3ZEeJYeji_4Ds-kW6EXXRU3FcpXSgRaWeav96qQU6O5Jfkg@mail.gmail.com>
 <20170810072841.bs5ly52awzczejgz@tarshish>
 <CANK3ZEca7+iUwmK2Hxt60T1jAQ5eYWC9z2_XVZ+cKCLWQq=Ebg@mail.gmail.com>
 <CANK3ZEcwW1+xBazZB209PFnzpi1mmyfmEEac0CFPMYUBBmTRug@mail.gmail.com>
 <CANK3ZEeh3fd=TAKh4PB7huAh9FaBFVF9HgF_u=fAG90_saNzKg@mail.gmail.com>
 <20170810085044.3pqhvt25wlhvssna@tarshish>
 <CANK3ZEc54MP4MMy57cYoLJHnC0UWt7Q7NYNLEQ9yqWX6wva50w@mail.gmail.com>
 <20170810092224.vxecvn22telonxns@tarshish>
 <CANK3ZEd0CtMCnFtSZQWesqGkguX4BVH=7myJOzw1ih0uvpc5DQ@mail.gmail.com>
 <20170810103329.ptwo7grhmqjoln63@tarshish>
Message-ID: <2162846e-f16a-8f55-120c-da8145b9c482@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-08-17 12:33, Baruch Siach wrote:
> Hi Aseem,
> 
> On Thu, Aug 10, 2017 at 03:27:26PM +0530, Aseem Sharma wrote:
>> It still seems to be an issue with Gcc=v6.X :-(
>> In fact I have tried using all the available Gcc version from menuconfig
>> and its still fails. Following is the exact error message for your
>> reference:
>>
>> In file included from lib/xmlparse.c:36:0:
>> lib/siphash.h: In function ?sip24_final?:
>> lib/siphash.h:247:1: error: unrecognizable insn:
>>  } /* sip24_final() */
>>  ^
>> (insn 78 77 79 11 (set (reg:DI 188)
>>         (xor:DI (reg:DI 189)
>>             (const_int 255 [0xff]))) lib/siphash.h:243 -1
>>      (nil))
>> lib/siphash.h:247:1: internal compiler error: in extract_insn, at
>> recog.c:2287
>> Please submit a full bug report,
>> with preprocessed source if appropriate.
>> See <http://bugs.buildroot.net/> for instructions.
>> Makefile:213: recipe for target 'lib/xmlparse.lo' failed
>> make[1]: *** [lib/xmlparse.lo] Error 1
>> make[1]: *** Waiting for unfinished jobs....
>> make[1]: Leaving directory '/home/administrator/Downloads/buildroot_2017/
>> buildroot-2017.02.5/output/build/expat-2.2.2'
>> package/pkg-generic.mk:216: recipe for target '/home/administrator/
>> Downloads/buildroot_2017/buildroot-2017.02.5/output/
>> build/expat-2.2.2/.stamp_built' failed
>> make: *** [/home/administrator/Downloads/buildroot_2017/
>> buildroot-2017.02.5/output/build/expat-2.2.2/.stamp_built] Error 2
> I reproduced the exact same issue here on current master as of c2da653d085df1. 
> I only run 'make expat' to shorten build time.
> 
> I think you should to take this to the gcc bug tracker. I don't think any of 
> the Buildroot gcc patches have anything to do with that, but I'll let the 
> toolchain experts on the list share their opinion.

 I didn't check but I indeed doubt that any of Buildroot's gcc patches could
have anything to do with it.

 To be able to report it to the gcc bug tracker, it would have to be reproduced
with current gcc master and with a minimal piece of code that exposes the bug.
Quite a bit of work...

 Aseem, to unblock you, I think it's best if you just use the much better tested
and compatible arm926t CPU choice. It will result in slightly less efficient
code because it won't make use of the iwmmx2 instructions, but I doubt that it
will have more than a few % performance impact on generic programs.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
