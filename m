From: Mark Corbin <mark.corbin@embecosm.com>
Date: Tue, 4 Sep 2018 14:10:47 +0100
Subject: [Buildroot] [PATCH 1/1] arch: add support for RISC-V 64-bit
 (riscv64) architecture
In-Reply-To: <804d638c-2b7c-1a12-894f-fa79094d2456@mind.be>
References: <20180831091154.22530-1-mark.corbin@embecosm.com>
 <804d638c-2b7c-1a12-894f-fa79094d2456@mind.be>
Message-ID: <cba3cfaf-bd46-f41d-0392-40f6ffc5f6d8@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout

On 04/09/18 00:00, Arnout Vandecappelle wrote:
>
> On 31/08/2018 11:11, Mark Corbin wrote:
>> This enables a riscv64 system to be built with a Buildroot generated
>> toolchain (gcc >= 7.x, binutils >= 2.30, glibc only).
>>
>> This configuration has been used to successfully build a qemu-bootable
>> riscv-linux-4.15 kernel (https://github.com/riscv/riscv-linux.git).
>>
>> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
>> ---
>>  Makefile                                |   1 +
>>  arch/Config.in                          |  15 ++++
>>  arch/Config.in.riscv                    | 104 ++++++++++++++++++++++++
>>  arch/arch.mk.riscv                      |  24 ++++++
>>  package/binutils/Config.in.host         |   3 +
>>  toolchain/toolchain-buildroot/Config.in |  12 ++-
>  One more thing that is missing: in package/linux-headers/Config.in.host, you
> have to exclude all the linux versions that don't support riscv yet (i.e.
> everything before 4.15).
Is it worth doing this when you actually have to select a custom version
of headers anyway? This makes more sense to me when the necessary riscv
support makes it upstream. I think that it would be a bit messy at the
moment as I should add a restriction to stop you choosing *any* mainline
kernel version...

config BR2_KERNEL_HEADERS_4_1
??????? bool "Linux 4.1.x kernel headers"
??????? select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_1
??????? depends !BR2_riscv
.
.
etc.

...and also restrict your choice of versions for custom headers pre-4.15...

config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_14
??????? bool "4.14.x"
??????? select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
??????? depends on !BR2_riscv

.
.
etc.

Quite happy to do this if that is what is wanted.

>
>  To simplify that job, you first might want (in separate patches) some
> deprecated versions: 4.10, 4.11, 4.12, 4.13.
I'm not sure that I'd want to start deprecating header versions that
might still be being used by people.

Regards

Mark

>  Regards,
>  Arnout
>

-- 

*Mark Corbin*
Embedded Operating Systems Lead
Phone: +44 1590 610184?????Mobile: +44 7765 703479
Email: mark.corbin at embecosm.com
<mailto:mark.corbin@embecosm.com>?????Web: https://www.embecosm.com

Embecosm Logo

Embecosm Ltd., Palamos House #208, 66/67 High Street, Lymington, SO41
9AL, UK
Company No. 6577021 (England & Wales).
--
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180904/7b005ba0/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: logo.png
Type: image/png
Size: 8442 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180904/7b005ba0/attachment.png>
