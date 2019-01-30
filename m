From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Wed, 30 Jan 2019 00:37:31 -0200
Subject: [Buildroot] [PATCH 2/2] support/testing: add atop test
References: <20190129222539.54bafd2a@windsurf>
Message-ID: <5c510deba126a_42713fb91e0de6f447919@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, Jan 29, 2019 at 07:25 PM, Thomas Petazzoni wrote:

> On Mon, 28 Jan 2019 00:14:06 -0200
> Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:
> 
>> +class TestAtop(infra.basetest.BRTest):
>> +    config = \
>> +        """
>> +        BR2_arm=y
>> +        BR2_cortex_a9=y
>> +        BR2_ARM_ENABLE_NEON=y
>> +        BR2_ARM_ENABLE_VFP=y
>> +        BR2_TOOLCHAIN_EXTERNAL=y
>> +        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
>> +        BR2_SYSTEM_DHCP="eth0"
>> +        BR2_LINUX_KERNEL=y
>> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
>> +        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
>> +        BR2_LINUX_KERNEL_DTS_SUPPORT=y
>> +        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
> 
> Is there a good reason to build the kernel as part of this test case,
> instead of using the prebuilt kernel, like most other package test
> cases are doing ?

No. My mistake, sorry.
I should had used the prebuilt armv7 kernel.
I guess I can remove all lines from BR2_TARGET_GENERIC_GETTY_PORT to
BR2_LINUX_KERNEL_INTREE_DTS_NAME.

I was (wrongly) pretty sure we always use prebuilt kernel 3.11.0 .
That's because all *-run.log for the python test cases.

This new version of atop needs kernel headers >= 3.14.
So I decided to not take the risk of having weird behaviors using an older (than
3.14) kernel.
Then I saw that the rust test case compiles kernel 4.x and decided to do the
same. I just copied the current kernel version from qemu_arm_vexpress_defconfig.

What I missed is that only the armv5 prebuilt kernel is 3.11.0 . The armv7 one
is 4.0.0 (as we can see on all *-run.log for the perl test cases) and therefore
it should work here.

Should I send a followup patch switching to prebuilt kernel?


Regards,
Ricardo
