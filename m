From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 29 Feb 2020 22:15:10 +0100
Subject: [Buildroot] Analysis of build results
In-Reply-To: <20200228160208.545a45a1@gmx.net>
References: <20200227093138.523B887666@whitealder.osuosl.org>
 <20200227234905.44125454@windsurf.home>
 <CANLo3JjxsNWX0zvULWV3L0h95wJ28F5Kf40LA169Gim=8yfxbA@mail.gmail.com>
 <20200228160208.545a45a1@gmx.net>
Message-ID: <25eb9f2e-26f8-98f4-68ce-8268b0c3ea7b@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le 28/02/2020 ? 16:02, Peter Seiderer a ?crit?:
> Hello Romain,
> 
> On Fri, 28 Feb 2020 08:32:18 +0100, Romain Naour <romain.naour@gmail.com> wrote:
> 
>>>
>>>>     arm      |         mesa3d-19.3.4          | NOK |
>>> http://autobuild.buildroot.net/results/6387b0a99e1a0922811919623d9a10b0943988df
>>> |
>>>
>>> {standard input}: Assembler messages:
>>> {standard input}:334: Error: selected processor does not support `vldm
>>> r4,{q0,q1,q2,q3}' in ARM mode
>>> {standard input}:335: Error: selected processor does not support `vst1.8
>>> d0,[r3],r2' in ARM mode
>>> {standard input}:336: Error: selected processor does not support `vst1.8
>>> d1,[r3],r2' in ARM mode
>>> {standard input}:337: Error: selected processor does not support `vst1.8
>>> d2,[r3],r2' in ARM mode
>>>
>>> Bad stuff happens when building the vc4 driver. It probably needs some
>>> minimal ARM architecture variant.
>>>
>>
>> I believe we should re-add the dependency on neon for vc4 driver. There is
>> -mfpu=neon added by the build system.
> 
> The BR2_ARM_CPU_HAS_NEON dependency was dropped with commit [1] because mesa3d
> commit [2] added a compile time detected neon support, in the meantime this
> was changed to a runtime detection [3] and finally enabled for the meson
> cross compile build with commit [4] (assuming toolchain support for the
> neon assembler instructions)...

Thank you for the detailed explanation.

I saw the commit [4] and conclude that upstream mesa3d now require neon support
when vc4 driver is enabled.

> 
> Maybe the compile error could be fixed by re-adding partly the compile time
> check for the neon support (tested):
> 
> --- mesa3d-19.3.4/src/broadcom/common/v3d_cpu_tiling.h_orig	2020-02-28 14:47:44.232634657 +0100
> +++ mesa3d-19.3.4/src/broadcom/common/v3d_cpu_tiling.h	2020-02-28 14:49:21.518425222 +0100
> @@ -31,7 +31,7 @@
>  v3d_load_utile(void *cpu, uint32_t cpu_stride,
>                 void *gpu, uint32_t gpu_stride)
>  {
> -#if defined(V3D_BUILD_NEON) && defined(PIPE_ARCH_ARM)
> +#if defined(V3D_BUILD_NEON) && defined(__ARM_ARCH) && __ARM_ARCH >= 7
>          if (gpu_stride == 8) {
>                  __asm__ volatile (
>                          /* Load from the GPU in one shot, no interleave, to
> @@ -141,7 +141,7 @@
>  v3d_store_utile(void *gpu, uint32_t gpu_stride,
>                  void *cpu, uint32_t cpu_stride)
>  {
> -#if defined(V3D_BUILD_NEON) && defined(PIPE_ARCH_ARM)
> +#if defined(V3D_BUILD_NEON) && defined(__ARM_ARCH) && __ARM_ARCH >= 7
>          if (gpu_stride == 8) {
>                  __asm__ volatile (
>                          /* Load each 8-byte line from cpu-side source,
> 

But -mfpu=neon is still present on the command line.

Do you think if the neon support can be handled/forced by a new meson option?

Best regards,
Romain

> Regards,
> Peter
> 
> [1] https://git.buildroot.net/buildroot/commit/package/mesa3d?id=350cb0d32ece533b9723a5f3ca6fbf7e6f071c90
> [2] https://cgit.freedesktop.org/mesa/mesa/commit/?h=17.1&id=4d30024238efa829cabc72c1601beeee18c3dbf2
> [3] https://cgit.freedesktop.org/mesa/mesa/commit/?h=staging/19.3&id=ece06defe77a77d2db40abeddee5a2e0e45654ce
> [4] https://cgit.freedesktop.org/mesa/mesa/commit/?id=932ed9c00b99e6ec92146ec9e820f546cf3e6551
> 
>>
>> Romain
> 
