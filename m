From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 13 Jun 2021 12:54:25 +0200
Subject: [Buildroot] [PATCH for-next 1/2] package/gdb: enable gdbserver
 support for riscv
In-Reply-To: <1efe6486-bcd9-3ddb-accd-1149c42ffc09@mind.be>
References: <20210606150351.423542-1-romain.naour@gmail.com>
 <1efe6486-bcd9-3ddb-accd-1149c42ffc09@mind.be>
Message-ID: <70ccde1c-f12f-fc1c-dec1-b1556ad76a5f@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Le 13/06/2021 ? 12:19, Arnout Vandecappelle a ?crit?:
> 
> 
> On 06/06/2021 17:03, Romain Naour wrote:
>> It turn out that gdbserver support for riscv is available since 10.1 release, since commit [1]
>>
>> When BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS is not enabled, gdb will use the stable version (9.x)
>> where gdbserver for riscv is not available.
>>
>> When BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS enabled, only allow gdb 10.1 in version choice and
>> allow enabling gdbserver for the target.
> 
>  Instead of all this complexity, I think it would be easier to just force gdb to
> version 10 on riscv:
> 
> config BR2_GDB_VERSION
>         string
>         default "arc-2020.09-release-gdb" if BR2_arc
>         default "4ecb98fbc2f94dbe01b69384afbc515107de73df" if BR2_csky
>         default "8.3.1"    if BR2_GDB_VERSION_8_3
>         default "9.2"      if BR2_GDB_VERSION_9_2 || (!BR2_PACKAGE_HOST_GDB &&
> !BR2_riscv)
>         default "10.1"     if BR2_GDB_VERSION_10 || (!BR2_PACKAGE_HOST_GDB &&
> BR2_riscv)
>         depends on BR2_PACKAGE_GDB || BR2_PACKAGE_HOST_GDB
> 
>  IMHO that will make the maintainance easier going forward: when 10 becomes the
> default, we can simply drop the riscv condition and nothing more needs to be done.

I was not sure about restrict the gdb version for riscv just because gdb 10.1
can provide gdbserver.

Alistair, is it ok for you if we only provide gdb 10.1 ?

Best regards,
Romain


> 
>  Marked as Changes Requested.
> 
>  Regards,
>  Arnout
> 
