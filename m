From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 27 Oct 2019 17:44:54 +0100
Subject: [Buildroot] [PATCH v2 5/7] board/qemu/*/launch.sh: add qemu
 launch script
In-Reply-To: <20190802235829.17b89102@windsurf.home>
References: <1557075239-30667-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1557075239-30667-6-git-send-email-jugurtha.belkalem@smile.fr>
 <20190802235829.17b89102@windsurf.home>
Message-ID: <584f74c1-c7a1-a529-a6f1-f57f4d153865@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 02/08/2019 ? 23:58, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Sun,  5 May 2019 18:53:57 +0200
> Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:
> 
>> diff --git a/board/qemu/aarch64-virt/launch.sh b/board/qemu/aarch64-virt/launch.sh
>> new file mode 100755
>> index 0000000..c6af589
>> --- /dev/null
>> +++ b/board/qemu/aarch64-virt/launch.sh
>> @@ -0,0 +1,21 @@
>> +#!/bin/bash
>> +
>> +qemu_command='qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp 1 -kernel output/images/Image -append "root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0'
>> +
>> +function DisplayReadme {
>> +	echo "Run the emulation with:
>> +
>> +${qemu_command}
>> +
>> +The login prompt will appear in the terminal that started Qemu.
>> +
>> +Tested with QEMU 2.12.0"
>> +}
>> +
>> +if [ ! -z $1 ] && [ $1 = "-h" ]
>> +then
>> +	DisplayReadme
>> +else
>> +	
>> +	echo "${qemu_command}"
>> +fi
> 
> I am not thrilled by the complexity of those scripts. Why isn't the
> script just a single line that runs Qemu ? Perhaps the only argument
> that would be sensible to have is an optional argument to pass the
> output directory.
> 
> So just:
> 
> #!/bin/bash
> qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp 1 -kernel ${0:-output}/images/Image -append "root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=${0:-output}/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0

Each time I test a Qemu defconfig I always build in a specific build directory.
So each time I have to go through this command line to replace output by
something else.

So using a script that support an optional argument to pass to the output
directory would be handy.

> 
> Would be enough. But on the other hand, in the toolchain-builders
> stuff, we simply use the existing readme.txt contents. We do this:
> 
>   test_qemu_cmd=$(grep qemu-system ${buildroot_dir}/board/qemu/${test_board_dir}/readme.txt)
> 
> And this gives us the Qemu command to run the qemu emulation. Perhaps
> we should do this as well here, and avoid the launch.sh scripts
> altogether ? In any case, we shouldn't duplicate this information
> between the launch.sh script and the readme.txt file. So if you go the
> launch.sh way, we need to adjust the readme.txt files accordingly.

Agree, so if we go to the launch.sh way, what we should keep in the readme.txt?
The only remaining information is the Qemu recommended version and a comment on
how to use the launch.sh script.

Does it worth it to keep the readme.txt beside launch.sh?

Best regards,
Romain


> 
> Best regards,
> 
> Thomas
> 
