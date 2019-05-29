From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 May 2019 22:50:35 +0200
Subject: [Buildroot] board/ci20 uboot problems due to fdt headers
In-Reply-To: <79a7e587-214c-3a9e-b846-c88bccc06c83@igalia.com>
References: <8811f1b8-8019-912c-a54a-331aabcedbd1@igalia.com>
 <230c7762-612e-6d59-5b5b-930d56a8df32@mind.be>
 <79a7e587-214c-3a9e-b846-c88bccc06c83@igalia.com>
Message-ID: <38bc5257-5fcb-625a-f2d8-8391cc0d0d5e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/05/2019 08:54, Paulo Matos wrote:
> 
> 
> On 28/05/2019 20:22, Arnout Vandecappelle wrote:
>>
>>  Indeed, it was fixed by commit bf733342324 and its follow-up f437bf547c. Which
>> Buildroot version are you using? Anything more recent than 2018.02.1 should no
>> longer have this issue.
>>
> 
> 
> Apologies for not mentioning it but I am using tip of master, which is
> why I was surprised when I saw this error come up again. Not doing
> anything special.
> 
> On arch `pacman -Ss dtc` installs /usr/include/libfdt.h, which seems to
> conflict with the ones from uboot.
> 
> Should I report this?

 You did :-)

 It can indeed easily be reproduced with the ci20 defconfig.

 The issue is that in U-Boot commit 01286329b27b27eaeda045b469d41b1d9fce545a,
$(SRCTREE) was renamed to $(srctree). So, any commit before that (i.e. any
version before 2014.04) will not match the sed pattern from our uboot.mk and
will not be fixed.

 The solution is to add an addition substitution pattern in uboot.mk that does
the same on SRCTREE instead of srctree.

 In addition, commit 0de71d507157c4bd4fddcd3a419140d2b986eed2 moved it from
libfdt to lib/libfdt. In other words, before 2010.06, the pattern matches even
less... But that's easily fixed by making the lib/ part optional.

 Oh, but actually, the fix simply doesn't work on older U-Boot versions -
Buildroot commit f437bf547ca4484 disables it if scripts/dtc/libfdt doesn't
exist... If that directory doesn't exist, the bundled libfdt.h, libfdt_env.h and
fdt.h reside in ${srctree}/include. However, that directory also contains a
bunch of files that may collide with the files from /usr/include that we want
for host compilation...

 So, I think the solution might be something like this:

define UBOOT_FIXUP_LIBFDT_INCLUDE
	$(Q)if [ -d $(@D)/scripts/dtc/libfdt ]; then \
		mkdir -p $(@D)/scripts/dtc/libfdt; \
		cd $(@D)/scripts/dts/libfdt; \
		ln -s ../../../include/fdt.h .; \
		ln -s ../../../include/libfdt*.h .; \
	fi
	$(Q)$(SED) \
		's%-I$$(srctree)/lib/libfdt%-I$$(srctree)/scripts/dtc/libfdt%' \
		's%-I$$(SRCTREE)\(/lib\)\?/libfdt%-I$$(SRCTREE)/scripts/dtc/libfdt%' \
		$(@D)/tools/Makefile
endef

 Of course, this was completely untested. Any takers to create a patch from this?

 Regards,
 Arnout
