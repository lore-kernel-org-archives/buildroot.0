From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 13 Jul 2017 13:16:16 -0700
Subject: [Buildroot] [PATCH 1/2] Makefile: don't rely on linux-tools
 being sorted alphabetically
In-Reply-To: <CAGt4E5tgfin2Y9tZTYsJR5XH_WwGGJqsdamiDX9m3HrfZrk13Q@mail.gmail.com>
References: <20170704235445.35255-1-code@mmayer.net>
 <20170704235445.35255-2-code@mmayer.net>
 <20170705072538.GE3499@scaer> <fc53112d-c7a3-64c9-74ad-277741161711@mind.be>
 <5c9f063f-5b5c-226d-ca25-6bcb8ebf7ced@mind.be>
 <CAGt4E5ueb6x_S4ff=dAeK-x9JnO1SmhnUGz+Q3XKUtj6s24L_Q@mail.gmail.com>
 <CAGt4E5s1qdysaU2dAeYFJL_16PLxwAYWyi6yhiKsRb6wADW-5A@mail.gmail.com>
 <20170709081346.GA3196@scaer> <855c5444-80f0-491b-5d70-aef7cd13b110@mind.be>
 <20170709124124.GC3196@scaer>
 <CAGt4E5tgfin2Y9tZTYsJR5XH_WwGGJqsdamiDX9m3HrfZrk13Q@mail.gmail.com>
Message-ID: <CAGt4E5samrvKY5-kwVHuCh6KsoKnmGZsWiRNgT9xpDF=6fcbUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 9 July 2017 at 20:49, Markus Mayer <mmayer@broadcom.com> wrote:
> On 9 July 2017 at 05:41, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Arnout, All,
>>
>> On 2017-07-09 13:10 +0200, Arnout Vandecappelle spake thusly:
>>> On 09-07-17 10:13, Yann E. MORIN wrote:
>>> > Markus, All,
>>> >
>>> > On 2017-07-05 10:19 -0700, Markus Mayer spake thusly:
>>> > [--SNIP--]
>>> >> That said, and while I am a complete buildroot newbie, I do like the
>>> >> suggestion of creating sub-directories for the tools and including the
>>> >> makefiles from linux-tools.mk rather than relying on alphabetical
>>> >> sorting.
>>> >
>>> > To be sure we're on the same line: one single sub-directory with all tools
>>> > in there, not one sub-dir per tool.
>>>
>>>  Really? One sub-dir per tool would be more in-line with how we handle normal
>>> packages.
>>
>> Well, I would find it a bit over-blown to have many sub-dirs with a
>> single file (the .mk) in each.
>>
>> Unless you also expected that the big Config.in file be split too?
>>
>> I would argue against, because its fate is already a bit special: it is
>> not sourced from package/Config.in but from linux/Config.in. and I would
>> prefer we avoid a bit more complexity...
>
> Yeah, I was wondering about that myself, actually. I do agree that
> several directories containing only one file each don't seem all that
> desirable. I'll see if I can get everything to work with just a single
> sub-directory.

I think I may need some help. I started implementing the suggested
solution, but I have run into some unexpected problems.

Specifically, if I move the linux-tool-*.mk files into their own
sub-directory, all linux-tools related targets disappear. It won't
build any linux-tools during a regular run of 'make' and it will
actually say "No rule..." when explicitly asked to build linux-tools:

$ make linux-tools
umask 0022 && make -C /home/mmayer/Development/buildroot
O=/home/mmayer/Development/output/arm64/. linux-tools
make[1]: *** No rule to make target 'linux-tools'.  Stop.
Makefile:16: recipe for target '_all' failed
make: *** [_all] Error 2

Here's what I have done:

(mmayer at lbrmn-mmayer) ~/Development/buildroot$ l package/linux-tools/
total 84
drwxrwxr-x    3 mmayer mmayer  4096 Jul 13 11:38 .
drwxrwxr-x 1843 mmayer mmayer 65536 Jul 10 12:28 ..
-rw-rw-r--    1 mmayer mmayer  2577 Jul 10 11:02 Config.in
-rw-rw-r--    1 mmayer mmayer  2049 Jul 13 11:20 linux-tools.mk
drwxrwxr-x    2 mmayer mmayer  4096 Jul 13 11:20 tools

(mmayer at lbrmn-mmayer) ~/Development/buildroot$ l package/linux-tools/tools/
total 28
drwxrwxr-x 2 mmayer mmayer 4096 Jul 13 11:20 .
drwxrwxr-x 3 mmayer mmayer 4096 Jul 13 11:38 ..
-rw-rw-r-- 1 mmayer mmayer 1061 Jul 10 13:04 linux-tool-cpupower.mk
-rw-rw-r-- 1 mmayer mmayer  753 Jul 10 15:27 linux-tool-gpio.mk
-rw-rw-r-- 1 mmayer mmayer  730 Jul 10 13:04 linux-tool-iio.mk
-rw-rw-r-- 1 mmayer mmayer 4015 Jul 10 13:04 linux-tool-perf.mk
-rw-rw-r-- 1 mmayer mmayer 1469 Jul 10 13:04 linux-tool-selftests.mk

linux-tools.mk gains this new line at the very beginning:

include $(sort $(wildcard package/linux-tools/tools/*.mk))

This results in the aforementioned non-build of linux-tools. Though
when I look at all the variables, they are set properly. LINUX_TOOLS,
LINUX_TOOLS_DEPENDENCIES, etc. all have the proper values. Everything
*looks* like it should work, but somehow the linux-tools targets do
not exist, so it doesn't actually work.

I tried something else for test-purposes. If I don't put the
linux-tool-*.mk into their separate sub-directory and, instead, simply
change their extension (so they don't match the *.mk pattern in the
main Makefile), it all starts to work perfectly.

$ l package/linux-tools/
total 104
drwxrwxr-x    3 mmayer mmayer  4096 Jul 13 11:46 .
drwxrwxr-x 1843 mmayer mmayer 65536 Jul 10 12:28 ..
-rw-rw-r--    1 mmayer mmayer  2577 Jul 10 11:02 Config.in
-rw-rw-r--    1 mmayer mmayer  1061 Jul 10 13:04 linux-tool-cpupower.xmk
-rw-rw-r--    1 mmayer mmayer   753 Jul 10 15:27 linux-tool-gpio.xmk
-rw-rw-r--    1 mmayer mmayer   730 Jul 10 13:04 linux-tool-iio.xmk
-rw-rw-r--    1 mmayer mmayer  4015 Jul 10 13:04 linux-tool-perf.xmk
-rw-rw-r--    1 mmayer mmayer  1469 Jul 10 13:04 linux-tool-selftests.xmk
-rw-rw-r--    1 mmayer mmayer  2043 Jul 13 11:46 linux-tools.mk

$ grep ^include package/linux-tools/linux-tools.mk
include $(sort $(wildcard package/linux-tools/*.xmk))

So, now, everything is at the package/linux-tools level again. The sub
makefiles simply have the extension .xmk. This also ensures they don't
get picked up by the main Makefile, but by linux-tools.mk. This setup
works flawlessly.

As far as I can tell, it should make no difference if the
sub-makefiles are being included from package/linux-tools or
package/linux-tools/tools. All the make variables are being set to the
same values in both cases. Somehow, however, it doesn't generate the
proper target list in the sub-directory case, but does the right thing
if it's all in the same directory.

Does anybody have any pointers as to why this might be and what to do about it?

Thanks,
-Markus
