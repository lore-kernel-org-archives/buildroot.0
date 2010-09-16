From: William Wagner <will_wagner@carallon.com>
Date: Thu, 16 Sep 2010 12:41:09 +0100
Subject: [Buildroot] external toolchain question
In-Reply-To: <20100916110442.29178d68@surf>
References: <4C910D9F.2060308@carallon.com>
	<20100915211903.6097235c@surf>	<4C91CF3F.5050007@carallon.com>
	<20100916110442.29178d68@surf>
Message-ID: <4C920255.80602@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  On 16/09/2010 10:04, Thomas Petazzoni wrote:
> On Thu, 16 Sep 2010 09:03:11 +0100
> William Wagner<will_wagner@carallon.com>  wrote:
>
>> With libstdc++ in /usr/lib on target but /lib in staging I was
>> getting an error in gdb when it tried to load libstdc++, moving the
>> library fixed the problem.
> Hum, right, ok.
>
> The old behaviour was to find each library in staging/ and then copy it
> to the same location in target/. Unfortunately, it was causing problems
> with Buildroot toolchains, because in those, libstdc++ was neither in
> lib/ or in usr/lib, but in usr/<tuple>/lib. Therefore, I moved to a
> strategy that consists in having a fixed destination for the library on
> the target filesystem. This was implemented by
> ecb7642cce36bc68d93f0eee677adc7da538228d.
>
> However, later on, to fix other issues, also related to libstdc++, I
> modified the build procedure for Buildroot toolchains so that a
> <tuple>/lib ->  lib/ is created, as other toolchain building systems are
> doing. This was implemented in
> 3c77bab2eeace3ee675bd745ca335fa3dd1630bb. The result is that libstdc++
> is back into a usual location in Buildroot toolchains, so we could in
> fact more or less revert ecb7642cce36bc68d93f0eee677adc7da538228d and
> make sure that libraries are at the same location in both staging/ and
> target/. I'll cook a patch for this.

Have now also tried a code sourcery toolchain which puts libstdc++ in 
/usr/lib and if they don't match again get the error.

We could change copy_toolchain_lib_root so that it puts the libraries in 
the corresponding location it finds them in rather than currently 
searching in three locations but always copying to the specified one.

> Thanks for the report!
>
> Thomas

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
