From: Luca Ellero <luca.ellero@brickedbrain.com>
Date: Thu, 12 May 2016 16:59:18 +0200
Subject: [Buildroot] uClibc debug symbols
In-Reply-To: <20160512154148.66906dd2@free-electrons.com>
References: <ddfc826b-9bf7-38c8-a442-bea33bf05621@brickedbrain.com>
 <20160511233304.2c528c3b@gmx.net>
 <38268c60-77cb-a127-4d16-35ea58fc5766@brickedbrain.com>
 <20160512154148.66906dd2@free-electrons.com>
Message-ID: <2dbe4eba-67f7-c8c5-1551-b8a31439b6c6@brickedbrain.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
thank you for your detailed reply.

On 12/05/2016 15:41, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 12 May 2016 12:23:52 +0200, Luca Ellero wrote:
>
>> ifeq ($(BR2_ENABLE_DEBUG),y)
>> GLIBC_EXTRA_CFLAGS += -g
>> endif
>>
>> But I cannot find anything similar in UClibc.
>
> Right, we should add explicit handling for BR2_ENABLE_DEBUG in the
> uClibc package.
>
>> So my questions are:
>> - what is the clean way to enable debug symbols on all packages (or at
>> least on some of them)?
>
> Enabling BR2_ENABLE_DEBUG, as you did.
>
>> - what is the purpose of BR2_ENABLE_DEBUG if it doesn't enable debug on
>> all packages?
>
> The main thing that BR2_ENABLE_DEBUG does is to enable the following
> piece of code from package/Makefile.in:
>
> ifeq ($(BR2_DEBUG_1),y)
> TARGET_DEBUGGING = -g1
> endif
> ifeq ($(BR2_DEBUG_2),y)
> TARGET_DEBUGGING = -g2
> endif
> ifeq ($(BR2_DEBUG_3),y)
> TARGET_DEBUGGING = -g3
> endif
>
> [...]
>
> TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
> TARGET_CXXFLAGS = $(TARGET_CFLAGS)
>
> So TARGET_CFLAGS and TARGET_CXXFLAGS will contain -g1, -g2 or -g3
> depending on the debugging "level" requested.
>
> Then, it all depends on each package whether it properly observes
> TARGET_CFLAGS/TARGET_CXXFLAGS. I think most autotools-based packages
> should behave fine, and all CMake-based packages should also behave
> fine.
>
> However, for other packages (mainly the ones that use the
> generic-package infrastructure), it is very possible that they don't
> pass TARGET_CFLAGS/TARGET_CXXFLAGS everywhere.
>
> Actually, a very useful check to add at the end of the Buidroot build
> would be to verify that all binaries have debugging symbols in
> STAGING_DIR when BR2_ENABLE_DEBUG=y. This way, the autobuilders would
> automatically catch packages that don't behave properly. Adding this
> check is probably easy. Fixing the issues that will be found by this
> check might prove to be more difficult, however.

Can you please suggest a way to check whether binaries have debugging 
symbols? So, maybe, we can send patches.

I've tried:
objdump -h ... | grep debug
but it doesn't seem to always behave reliably.

Thank you

Best regards
Luca Ellero
