From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 7 Dec 2020 23:30:42 +0100
Subject: [Buildroot] [PATCH 2/5] support/scripts/gen-bootlin-toolchains:
 riscv32 use a pre-2.33 glibc version without RPC support
In-Reply-To: <20201207225015.57f53daa@windsurf.home>
References: <20201207204821.3588178-1-romain.naour@gmail.com>
 <20201207204821.3588178-2-romain.naour@gmail.com>
 <20201207225015.57f53daa@windsurf.home>
Message-ID: <11768ed6-2527-fa14-a39e-161012088d46@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 07/12/2020 ? 22:50, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Mon,  7 Dec 2020 21:48:18 +0100
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> riscv32 has been merged into glibc 2.33 where RPC support has been removed [1].
>>
>> Add a special handling for the riscv32 Bootlin bleeding-edge 2020.08-1 toolchain
>> since it used a pre-2.33 glibc version [2].
>>
>> Other glibc Bootlin toolchain use glibc 2.31 with RPC support enabled.
>>
>> This special handling must be removed when all Bootlin toolchain has been
>> rebuild with glibc > 2.32.
>>
>> [1] https://sourceware.org/pipermail/libc-announce/2020/000029.html
>> [2] https://git.buildroot.net/buildroot/commit/?id=a4889545aa653e7f001f212eda169e7d676aefc0
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>> ---
>>  support/scripts/gen-bootlin-toolchains | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
>> index fce75c51c2..645584d07e 100755
>> --- a/support/scripts/gen-bootlin-toolchains
>> +++ b/support/scripts/gen-bootlin-toolchains
>> @@ -263,8 +263,11 @@ class Toolchain:
>>                  # glibc doesn't support static only configuration
>>                  depends.append("!BR2_STATIC_LIBS")
>>                  selects.append("BR2_TOOLCHAIN_EXTERNAL_GLIBC")
>> -                # all glibc toolchains have RPC support
>> -                selects.append("BR2_TOOLCHAIN_HAS_NATIVE_RPC")
>> +
>> +                # riscv32 has been merged into glibc 2.33 where RPC support has been removed.
>> +                if not self.arch.startswith("riscv32"):
>> +                    # all glibc < 2.32 toolchains have RPC support
>> +                    selects.append("BR2_TOOLCHAIN_HAS_NATIVE_RPC")
> 
> I am not convinced by this approach, as it doesn't work when glibc 2.33
> gets used for other platforms than RISC-V 32. Instead, what we need to do is:
> 
>  (1) Fix how toolchains.bootlin.com generates its fragments to no
>      longer assume that glibc == RPC available.

Agree, but what about existing fragments ? They doesn't provide information
about RPC support. We need to patch them to add
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y like in the next patch.

> 
>  (2) Fix the gen-bootlin-toolchains script to also no longer assume
>      that glibc == RPC available, and instead use what the fragment
>      provided by toolchains.bootlin.com for each toolchain says.

Agree but the generated toolchain-external-bootlin will be wrong about RPC with
the current fragments.

What do you suggest to fix them ?

Best regards,
Romain


> 
> Best regards,
> 
> Thomas
> 
