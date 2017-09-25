From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 25 Sep 2017 23:18:55 +0200
Subject: [Buildroot] [PATCH 1/1] Allow musl to build with new binutils
In-Reply-To: <20170924222003.22513-1-timothy.ty.lee@gmail.com>
References: <20170924222003.22513-1-timothy.ty.lee@gmail.com>
Message-ID: <fc351f04-83e7-3b7e-31eb-76a5baebcd06@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Timothy,

 Looks good, but one major problem below that will require a respin: you need to
add your Signed-off-by to the patch.

On 25-09-17 00:20, Timothy Lee wrote:
> New binutils cannot build musl-1.1.16 due to breakage in arm atomics asm.  This

 Can you specify which binutils version that is? Based on the log message below
it would be 2.28.

> patch from upstream musl repository is needed until musl-1.1.17 is released:
> https://git.musl-libc.org/cgit/musl/commit/?id=b261a24256792177a5f0531dbb25cc6267220ca5
> 
> Signed-off-by: Timothy Lee <timothy.ty.lee@gmail.com>
> ---
>  .../0002-arm-atomics-asm-with-new-binutils.patch   | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 package/musl/0002-arm-atomics-asm-with-new-binutils.patch
> 
> diff --git a/package/musl/0002-arm-atomics-asm-with-new-binutils.patch b/package/musl/0002-arm-atomics-asm-with-new-binutils.patch
> new file mode 100644
> index 0000000000..f0ad408687
> --- /dev/null
> +++ b/package/musl/0002-arm-atomics-asm-with-new-binutils.patch
> @@ -0,0 +1,40 @@
> +From b261a24256792177a5f0531dbb25cc6267220ca5 Mon Sep 17 00:00:00 2001
> +From: Rich Felker <dalias@aerifal.cx>
> +Date: Wed, 15 Feb 2017 17:05:50 -0500
> +Subject: fix build regression in arm atomics asm with new binutils
> +
> +binutils commit bada43421274615d0d5f629a61a60b7daa71bc15 tightened
> +immediate fixup handling in gas in such a way that the final .arch of
> +an object file must be compatible with the fixups used when the
> +instruction was assembled; this in turn broke assembling of atomics.s,
> +at least in thumb mode.
> +
> +it's not clear whether this should be considered a bug in gas, but
> +.object_arch is preferable anyway for our purpose here of controlling
> +the ISA level tag on the object file being produced, and it's the
> +intended directive for use in object files with runtime code
> +selection. research by Szabolcs Nagy confirmed that .object_arch is
> +supported in all relevant versions of binutils and clang's integrated
> +assembler.
> +
> +patch by Reiner Herrmann.

 Just like in the patch itself, you need to add your Signed-off-by here.  This
is a short way for you to assert that you are entitled to contribute the patch
under the package license.

> +---
> + src/thread/arm/atomics.s | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/thread/arm/atomics.s b/src/thread/arm/atomics.s
> +index 202faa4..101ad39 100644
> +--- a/src/thread/arm/atomics.s
> ++++ b/src/thread/arm/atomics.s
> +@@ -84,7 +84,7 @@ __a_gettp_cp15:
> + 	bx lr
> + 
> + /* Tag this file with minimum ISA level so as not to affect linking. */
> +-.arch armv4t
> ++.object_arch armv4t

 I was surprised that this problem was not discovered in
http://toolchains.free-electrons.com/ but I guess that's because the problem
only applies to ARMv4 and no ARMv4 toolchains are built. Maybe add to the commit
log that this is only for ARMv4.

 Regards,
 Arnout

> + .eabi_attribute 6,2
> + 
> + .data
> +-- 
> +cgit v0.11.2
> +
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
