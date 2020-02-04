From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 4 Feb 2020 18:20:42 +0100
Subject: [Buildroot] [PATCH v3 for-next 00/11] gitlab Qemu runtime
 testing
In-Reply-To: <ec140d5b-8435-a0a3-e83e-0a7845f8bf21@mind.be>
References: <20191117201909.12900-1-romain.naour@smile.fr>
 <4ae261dd-e9f5-0212-eafd-c642c21d27bf@smile.fr>
 <99a9e061-7fca-c7c0-683b-49845067ba8f@mind.be>
 <87k16s4lkk.fsf@dell.be.48ers.dk>
 <341bf831-7063-ca42-2fa1-967ce7836d92@smile.fr>
 <ec140d5b-8435-a0a3-e83e-0a7845f8bf21@mind.be>
Message-ID: <b287daf0-47d0-e264-343b-6ba3b3b27281@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

Le 04/02/2020 ? 15:31, Arnout Vandecappelle a ?crit?:
> 
> 
> On 04/02/2020 14:59, Romain Naour wrote:
>> Hi,
>>
>> Le 19/12/2019 ? 12:11, Peter Korsgaard a ?crit?:
>>>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>>>
>>> Hi,
>>>
>>>  >> I discussed about this series with Jeremy and he suggest to add the Qemu command
>>>  >> line into the Qemu's defconfig file (add a new Kconfig option).
>>>  >> With that, we can even add a new Makefile target "make run-qemu" to start Qemu
>>>  >> when the Qemu command line is set in the defconfig (this would avoid adding
>>>  >> several launch.sh script).
>>>
>>>  > So something like
>>>
>>>  > config BR2_PACKAGE_HOST_QEMU_LAUNCH_ARGS
>>>  > 	string "qemu launch command"
>>>  > 	help
>>>  > 	  Command to launch qemu. If this is defined, 'make run-qemu' can be
>>>  > 	  used to build everything and launch qemu.
>>>
>>>
>>>  > HOST_QEMU_LAUNCH_ARGS = $(call qstrip,$(BR2_PACKAGE_HOST_QEMU_LAUNCH_ARGS))
>>>  > ifneq ($(HOST_QEMU_LAUNCH_ARGS),)
>>>  > run-qemu: world
>>>  > 	$(Q)$(HOST_QEMU) <kernel args> <rootfs args> $(HOST_QEMU_LAUNCH_ARGS)
>>>  > endif
>>>
>>>  > Looks like a good idea indeed!
>>>
>>> Cute. The kernel arguments (-kernel path/to/kernel/image) could indeed
>>> probably be standardized, but we do some to have quite some variation in
>>> the rootfs arguments.
>>>
>>> But OK, we could start with just including the rootfs argument in
>>> _LAUNCH_ARGS.
>>>
>>
>> About the qemu-system-* binary, should we use the one from the host or use the
>> one from the host-qemu package? (or it depend?)
>>
>> It can be convenient to use the Qemu provided by the host since it can provide
>> full feature support. The Qemu provided by host-qemu only support some
>> dependencies but not all.
>>
>> On the other hand, the user can still use the qemu-system-* he want by not using
>> make run-qemu but using the qemu command line in the console.
> 
>  Indeed. I think the 'run-qemu' should be something completely self-contained
> and not rely on anything on the build machine.
> 
>  So I think we should use host-qemu.

Ok.

With Yann, we discussed about why adding the qemu command line in the defconfig
may be not a good idea for several reasons:

- The defconfig file contains information that is used during the build, while
running qemu is not part of the build itself.

- The readme.txt file is a documentation file that explain how to start and test
the system under Qemu. A script is not documentation that we can refer users to.

Most of the following is reasoning by Yann (and reviewed/reworked by him IRL):

We could instead use a post-build script to generate the launch.sh script into
the output directory. Thus, the script is in a know location
(output/images/launch.sh).

We still need to retrieve the command line from the readme.txt from the
board/qemu/<qemu target>/. We have to make sure to extract the Qemu command line
to be used by the script, and no a any other text present in the readme.txt.

Some readme.txt files have multiple qemu command lines, either for various
configurations (e.g. csky, one for each defconfig), or for various conditions
(e.g. the ARM V-Express TrustZone cases).

we could add a tag with the name of the defconfig file in front of each command
line in order to extract the right qemu command line. For example:

    qemu_x86_defconfig: qemu-system-i386 -M pc -kernel output/images/bzImage \
        -drive file=output/images/rootfs.ext2,if=virtio,format=raw -append \
        "rootwait root=/dev/vda console=tty1 console=ttyS0" -serial stdio \
        -net nic,model=virtio -net user

Eventually, the user can easily run that script directly from
output/build/maunch.sh (or whatever we call it). Same goes for the testing
infrastructure.

And for the infrastructure, the launcher.sh can be templatised with smartness to
remove or add incompatible options (e.g. remove -serial stdio, or force
-nographics).

Thoughts?

(Yann yields Romain's keyboard  now ;-] )

Best regards,
Romain and Yann.


>  Regards,
>  Arnout
> 
