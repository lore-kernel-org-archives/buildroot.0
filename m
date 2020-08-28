From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 28 Aug 2020 10:08:08 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-08-18
In-Reply-To: <a40c1a30-520a-4d98-b3eb-a96141a26dbe@mind.be>
References: <5f3cda7b.1c69fb81.e5841.2292SMTPIN_ADDED_MISSING@mx.google.com>
 <1af22d4f-2280-749b-351a-819d245251c5@ideasonboard.com>
 <a40c1a30-520a-4d98-b3eb-a96141a26dbe@mind.be>
Message-ID: <dc83fa13-373b-2e42-ecde-da1e9741fa50@ideasonboard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thanks for following up,

On 28/08/2020 08:20, Arnout Vandecappelle wrote:
> 
> 
> On 19/08/2020 11:51, Kieran Bingham wrote:
>> Hi Thomas, Fabrice,
>>
>> This autobuilder failure is still on going for M68k
>>
>> It relates to an assertion which only seems to fire on the m68k
>> regarding a ControlValue which we serialise, and therefore (currently)
>> require to know it's exact size.
>>
>>
>> -Wnon-virtual-dtor -Wextra -Werror -std=c++14 -O3 -Wno-unused-parameter
>> -include config.h -faligned-new -fPIC -pthread -MD -MQ
>> src/libcamera/libcamera.so.p/controls.cpp.o -MF
>> src/libcamera/libcamera.so.p/controls.cpp.o.d -o
>> src/libcamera/libcamera.so.p/controls.cpp.o -c ../src/libcamera/controls.cpp
>> ../src/libcamera/controls.cpp:92:36: error: static assertion failed:
>> Invalid size of ControlValue class
>>  static_assert(sizeof(ControlValue) == 16, "Invalid size of ControlValue
>> class");
>>
>> I assumed that this happens because the m68k is 32 bit, but of course we
>> already successfully compile on other 32 bit architectures, so I'm not
>> sure of the underlying change of size.
> 
>  I haven't looked at it at all, but if ControlValue is a struct, it's more
> likely caused by padding.

Well, it's a class, but indeed - it looks like this one has some various
bitfields defined which may have been packed differently on m68k:

private:
	ControlType type_ : 8;
	bool isArray_;
	std::size_t numElements_ : 32;
	union {
		uint64_t value_;
		void *storage_;
	};

It looks like it recently underwent a small adjustment to these fields
for 32-bit x86 already:

https://git.linuxtv.org/libcamera.git/commit/?id=0028536d70c79ebabf11f77cc2df965181509297


But given the following:

> pahole -C ControlValue ./build/src/libcamera/libcamera.so
<stripping out unnecessary output>

> 	enum ControlType   type_:8;                      /*     0: 0  4 */
> 	/* Bitfield combined with next fields */
> 	bool                       isArray_;             /*     1     1 */
> 	/* Bitfield combined with previous fields */
> 	size_t                     numElements_:32;      /*     0:16  8 */
> 	/* XXX 16 bits hole, try to pack */
> 	union {
> 		uint64_t           value_;               /*     8     8 */
> 		void *             storage_;             /*     8     8 */
> 	};                                               /*     8     8 */
> 	/* size: 16, cachelines: 1, members: 4 */
> 	/* sum members: 9 */
> 	/* sum bitfield members: 40 bits, bit holes: 1, sum bit holes: 16 bits */
> 	/* last cacheline: 16 bytes */
> };

I bet the m68k has packed that 16-bit hole giving us a storage of only
12 bytes, vs 16 on other architectures.


Hard to see without having a binary to run pahole on.

Anyway, I think we can call this a corner case, and not something we're
going to expect to run on.


>> Anyway, I'm quite certain we wouldn't expect libcamera to run on an
>> m68k. What's the easiest way to disable libcamera support for that target?
>>
>> Should the have an architecture specific depends on !m68k or such in
>> Config.in, or is there a better way to handle this?
> 
>  Yes, if you don't want to bother with fixing an issue, just add a !m68k with a
> small comment (e.g. "# Invalid size of ControlValue") and all of the explanation
> above in the commit message.

So I suspect a !m68k is currently the easiest short-term step forwards here.

I don't want to go messing around with the size of the ControlValue
right now, but I do also wonder if the assertion couldn't just be removed.

Anyone (on the libcamera team) with any opinion regarding this
assertion? Keep / Remove?


The todo sounds like the main concern is keeping this structure as small
as possible because we'll likely have a lot of them, vs ensuring it
stays consistent as it will cause ABI breakage if it changes. Though I
suspect we would have other places where we hit ABI changes - so I
wonder if we could find some better tooling to determine the ABI state
across the whole library ?

--
Kieran



>  Regards,
>  Arnout
> 
>>
>> Regards
>> --
>> Kieran
>>
>>
>>
>> On 19/08/2020 08:53, Thomas Petazzoni wrote:
>>> Hello,
>>>
>>> Autobuilder failures
>>> ====================
>>>
>>> Below is a list of build failures reported by the Buildroot
>>> autobuilders in relation to packages or CPU
>>> architectures you are in charge of. Please help us
>>> improving the quality of Buildroot by investigating
>>> those build failures and sending patches to fix
>>> them.Thanks!
>>>
>>> Results for the 'next' branch
>>> -----------------------------
>>>
>>> Build failures related to your packages:
>>>
>>>     arch     |             reason             |                                       url                                      
>>> -------------+--------------------------------+---------------------------------------------------------------------------------
>>>     m68k     | libcamera-565f95d64ff92e871... | http://autobuild.buildroot.net/results/40e8facc805b3eaac5fe6c95db0cd7b756eb1f18
>>>
>>>
>>

-- 
Regards
--
Kieran
