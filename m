From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 28 Mar 2008 13:33:33 +0100
Subject: [Buildroot] Using a different kernel tree ?
References: <057401c88ff0$46259410$ad289e86@LPSC0173W>
	<20080327120639.GD13379@mx.loc>
Message-ID: <021301c890d9$3bc5c960$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Thu, Mar 27, 2008 at 10:52:22AM +0100, Guillaume Dargaud wrote:
>>Hello all,
>>I'd like to use, within buildroot, the kernel tree from 
>>git://git.xilinx.com/linux-2.6-xlnx.git instead of the vanilla tree coming 
>>with buildroot.
>>
>>How does one do that ?
> 
> The easiest approach would be to git clone that kernel and
> tar -cjf dl/linux-2.6.24.4.tar.bz2 linux-2.6-xlnx.git
> (--exclude='.git' if you don't want to write patches against it) and use
> that.
> 
>>If I just replace toolchain_build_ppc/linux-2.6.24 and/or 
>>project_build_ppc/my_project/linux-2.6.24 with the Xilinx tree, on the next 
>>"make ARCH=ppc linux26-menuconfig" it just deletes the whole directory and 
>>rebuilds it from bzcat...
>>
>>Or are there alternatives if I want to use the nice toolchain built by 
>>buildroot ?
>>
>>
>>BTW, what is the difference between toolchain_build_ppc/linux-2.6.24 and 
>>project_build_ppc/my_project/linux-2.6.24 ?
> 

The toolchain headers is generated from toolchain_build_ppc/linux-2.6.24
and the project related source tree is used for building the kernel image(s).

You can build multiple kernels for the same chip, or one kernel for
multiple chips, or combinations of above.

The following would be possible:

toolchain_build_ppc/linux-2.6.24
project_build_ppc/my_project_24__/linux-2.6.24
project_build_ppc/my_project_24_1/linux-2.6.24.1
project_build_ppc/my_project_24_2/linux-2.6.24.2
project_build_ppc/my_project_24_3/linux-2.6.24.3

This allows you to apply different patchsets for different builds.
Any package built in build_ppc/<package> have to use the same configuration
for all projects. If you need to configure them differently, then
the package needs to be built in project_build_dir/<package>.


> No, previously we only had one source-tree, but Ulf changed that for
> reasons that i do not remember offhand (conflicting patches, i.e. broken
> patches, IIRC).
> _______________________________________________




Best Regards
Ulf Samuelsson
