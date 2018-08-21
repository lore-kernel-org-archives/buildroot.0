From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Aug 2018 00:24:30 +0200
Subject: [Buildroot] [PATCH] configs: solidrun_macchiatobin_marvell: fix
 u-boot build
In-Reply-To: <20180816220045.0a74a6af@windsurf>
References: <bc4ad6ef454508016634b1074fe83681946f4826.1534422853.git.baruch@tkos.co.il>
 <20180816220045.0a74a6af@windsurf>
Message-ID: <6df7964c-0845-4619-4e5e-c79438986ad1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16/08/2018 22:00, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 16 Aug 2018 15:34:13 +0300, Baruch Siach wrote:
>> U-Boot local libfdt headers conflict with host-dtc provided headers.
>> Disable host-dtc, and backport two upstream U-Boot patches to fix build
>> without external libfdt headers.
>>
>> U-Boot build still fail when the host provides its own libfdt header
>> (e.g., Debian libfdt-dev package), or when BR2_PACKAGE_HOST_DTC is
>> enabled. Fixing that seems to require much more involved code changes.
>> Fix the common case for now.
>>
>> Fixes partially:
>> https://gitlab.com/buildroot.org/buildroot/-/jobs/88314956
>>
>> Cc: Sergey Matyukevich <geomatsi@gmail.com>
>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> This issue is happening for 30-40 defconfigs. I don't think adding a
> 4500 lines patch for each defconfig is really the right solution,
> especially because it also doesn't fix the situation of someone
> building U-Boot outside of a pre-existing defconfig.

 The problem is that building of U-Boot host tools is just broken between
2017.03 (or maybe earlier) and 2018.03 (after commit b08c8c487083, which was
triggered by a report from a certain Thomas Petazzoni).

 I have experimented with changing the -isystem that we pass into HOSTCC with
various other things, but nothing really works. I see no way to force the U-Boot
build system to use its own libfdt.h and libfdt_env.h instead of the system- or
buildroot-installed version.

 Something that _might_ work is to generate a libfdt.h and libfdt_env.h
somewhere in the build directory, which contains nothing but
#include "$(UBOOT_SRCDIR)/include/libfdt.h"
and pass in -I to that directory in HOSTCC. That whole thing, of course, must be
conditional on the existence of $(UBOOT_SRCDIR)/include/libfdt.h. Complicated...

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
