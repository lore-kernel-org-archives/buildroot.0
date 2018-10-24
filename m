From: Ferdinand van Aartsen <ferdinand@ombud.nl>
Date: Wed, 24 Oct 2018 12:10:33 +0200
Subject: [Buildroot] [RFC PATCH 1/1] libffi: v3.2.1 doesn't support
 riscv targets yet
In-Reply-To: <81a2a99d-9d72-7821-e7c1-9a09d76d77e5@mind.be>
References: <20181023214409.6818-1-ferdinand@ombud.nl>
 <81a2a99d-9d72-7821-e7c1-9a09d76d77e5@mind.be>
Message-ID: <8dc3b6276000fb8009013463a775ae86@ombud.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle schreef op 2018-10-24 02:24:
> Hi Ferdinand,
> 
>  I'm afraid you made some unfortunate choices for the autobuild
> failures to fix :-)
> 
> 

Oh well, that's what happens when you're looking for a place in the
sandbox that hasn't been claimed yet. To be sure, I did ask about this
on irc, and trawled through the mailing list, without seeing any
indication that anyone was working on it.


> On 10/23/18 10:44 PM, Ferdinand van Aartsen wrote:
>> Fixes:
>> http://autobuild.buildroot.org/?reason=libffi-3.2.1&arch=riscv64
>> ---
>> 
>> The upcoming version 3.3.0 will support riscv [1], so this patch would
>> be temporary. Do we wait for that release, or should we explicitly
>> disable libffi for riscv in the meantime?
>> 
>> [1] 
>> https://github.com/libffi/libffi/commit/3840d49aaa831d649b1597518a2903dfed0d57f3
> 
>  Just backporting that patch is also a possibility.
> 

I assumed that would be out of scope, but Buildroot really is an
all-encompassing project. That's what I like about it.

>> 
>> ---
>>  package/libffi/Config.in | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/package/libffi/Config.in b/package/libffi/Config.in
>> index 6edf570baf..26255bb4a4 100644
>> --- a/package/libffi/Config.in
>> +++ b/package/libffi/Config.in
>> @@ -1,6 +1,7 @@
>>  config BR2_PACKAGE_LIBFFI
>>  	bool "libffi"
>>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>> +	depends on !BR2_riscv
> 
>  The problem is that this creates a Config.in dependency cycle, because 
> there
> are other packages (e.g. libglib2) that don't have this !riscv 
> dependency and
> that select libffi. Just try it: select libglib2 on a riscv 
> architecture and
> after exiting menuconfig you'll see a warning message. This will 
> eventually lead
> to a build failure because it will still try to build libffi.
> 
>  So what you should do in theory is to propagate that dependency to all 
> packages
> that select libffi, and propagate it further to all packages selecting 
> those
> packages, etc.
> 
>  Unfortunately that is hardly feasible. libglib2 selects libffi, and 
> there are
> almost 100 packages that select libglib2...
> 
>  There are in fact already a few architectures that are not supported 
> by libffi.
> To avoid failures with those, we just blacklist them in the autobuild 
> script -
> see lines 258-267 in utils/genrandconfig. So the easiest solution is to 
> add a
> blacklist there.
> 
>  If you *do* feel up to it to generate a patch that touches roughly 150
> Config.in files, you're welcome to do so! The proper approach to do 
> that would
> be as follows: in libffi, start the Config.in file with:
> 
> config BR2_PACKAGE_LIBFFI_ARCH_SUPPORTS
> 	bool
> 	default y
> 	depends on !BR2_sh2a
> 	depends on !BR2_ARM_CPU_ARMV7M
> 	depends on !BR2_riscv
> 
> config BR2_PACKAGE_LIBFFI
> 	bool "libffi"
> 	depends on BR2_PACKAGE_LIBFFI_ARCH_SUPPORTS
> 	depends on BR2_TOOLCHAIN_HAS_THREADS
> 
> comment "libffi needs a toolchain w/ threads"
> 	depends on BR2_PACKAGE_LIBFFI_ARCH_SUPPORTS
> 	depends on !BR2_TOOLCHAIN_HAS_THREADS
> 
> 
>  Then, each package that selects libffi should get the following as its 
> first
> dependency:
> 
> 	depends on BR2_PACKAGE_LIBFFI_ARCH_SUPPORTS # libffi
> 
> And each package that recursively selects it, e.g. a package that
> selects libglib2:
> 
> 	depends on BR2_PACKAGE_LIBFFI_ARCH_SUPPORTS # libglib2 -> libffi
> 
> This dependency should also be added to the toolchain comments of
> those packages.
> 
> 
>  Personally, I would be fine with doing this gradually, i.e. it is not 
> needed to
> fix all 150 packages in a single commit. Indeed, the build is already 
> broken
> anyway, so if this is shown as a circular dependency warning or as a 
> build
> failure of libffi doesn't matter that much.
> 
> 

I hadn't yet realised that dependencies override each other that way.
I'll start mapping out the territory, and work on a gradual approach.

Ferdinand

>>  	help
>>  	  The libffi library provides a portable, high level
>>  	  programming interface to various calling conventions. This
>> @@ -11,3 +12,5 @@ config BR2_PACKAGE_LIBFFI
>> 
>>  comment "libffi needs a toolchain w/ threads"
>>  	depends on !BR2_TOOLCHAIN_HAS_THREADS
>> +comment "libffi is not supported on RISCV."
>> +	depends on BR2_riscv
> 
>  We don't show these warnings for the architecture dependencies, 
> because there
> is anyway nothing the user can do about it. Instead, we even hide the 
> other
> warnings if the package anyway can't be selected. This is why in the 
> example I
> gave above, there is only one comment, and it depends on the 
> ARCH_SUPPORTS.
> 
>  Regards,
>  Arnout
