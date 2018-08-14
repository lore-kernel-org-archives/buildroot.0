From: Mark Corbin <mark.corbin@embecosm.com>
Date: Tue, 14 Aug 2018 13:35:37 +0100
Subject: [Buildroot] Setting Defaults for RISCV64 Architecture
In-Reply-To: <20180814140305.0184f5a1@windsurf>
References: <862bfe2f-fc60-ead9-2b63-b6a0f23c59cd@embecosm.com>
 <20180814140305.0184f5a1@windsurf>
Message-ID: <29a7876d-c734-e09c-4e60-8d62e08c7775@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

On 14/08/18 13:03, Thomas Petazzoni wrote:
> Hello Mark,
>
> On Tue, 14 Aug 2018 10:39:01 +0100, Mark Corbin wrote:
>
>> I am working on adding RISCV64 support to Buildroot
> Nice!
>
>> and was wondering how best to set some of the defaults when the
>> riscv64 architecture is selected.
>>
>> The two issues that I currently have are that the version of binutils
>> needs to be 2.30 (or greater) and that the kernel needs to be a custom
>> version from the riscv git repo (the 4.17 mainline kernel doesn't
>> appear to have full riscv support).
>>
>> In both of these cases I could either:
>>
>> a) Add some architecture specific options to the 'Config.in' files,
>> i.e. packages/binutils/Config.in.host and linux/Config.in, to select
>> the appropriate default versions/values .
>> or
>> b)? Set the appropriate variables in a board or architecture specific
>> '_defconfig' file, e.g.
>> ??? ??? BR2_BINUTILS_VERSION_2_30_X=y
>> ??? ??? BR2_LINUX_KERNEL=y
>> ??? ??? BR2_LINUX_KERNEL_CUSTOM_GIT=y
>> ??? ???
>> BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/riscv/riscv-linux.git"
>> ??? ??? BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="riscv-linux-4.15"
>>
>> I think that I prefer option a) as option b) would require a specific
>> config to be selected every time rather than just working by default
>> when you set the Target Architecture.
> Yes, in general (a) is preferred, as a defconfig is just an "example"
> configuration, and nothing prevents a user from not using some existing
> example configuration: he can instead start from scratch his
> Buildroot configuration, and we should ensure that only valid
> configurations can be created by the user.
>
> For binutils, things are pretty easy, since
> package/binutils/Config.in.host already hides/show some binutils
> versions depending on the architecture. For example,
> BR2_BINUTILS_VERSION_2_28_X is not visible on the ARC architecture.
That's good - I will go ahead and update Config.in.host for binutils.
>
> For the Linux kernel itself, there isn't really a problem, as we allow
> the user to select the Linux kernel version/source with lots of freedom
> (arbitrary official version from kernel.org, arbitrary commit/tag from
> a Git repository, arbitrary tarball, etc.).
I know that the options are pretty flexible,? but is there a good way to
preselect the correct version for riscv64? At the moment the default is
'Latest version (4.17)' and the user would have to go and reconfigure
this by hand to point at the custom git repo.
>
> However, there is a problem for the kernel headers. If the recently
> released 4.18 kernel still doesn't have what's need for RISCV64, then I
> guess we'll have to temporarily add a special Linux kernel headers
> version in package/linux-headers/Config.in.host for RISCV64.
Is this for building the toolchain? I'll have to take a look and think
about adding a custom version.

Thanks

Mark
>
> Best regards,
>
> Thomas

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: pEpkey.asc
Type: application/pgp-keys
Size: 3139 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180814/e19c2323/attachment.key>
