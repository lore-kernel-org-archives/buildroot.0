From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 27 Oct 2019 15:32:00 +0100
Subject: [Buildroot] [PATCH v2 6/7] support/scripts/qemu-boot-*: gitlab
 tests for Qemu
In-Reply-To: <20190803002437.768b3fab@windsurf.home>
References: <1557075239-30667-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1557075239-30667-7-git-send-email-jugurtha.belkalem@smile.fr>
 <20190803002437.768b3fab@windsurf.home>
Message-ID: <c1aa9ebc-3717-d53b-bd0f-5f41c28730ff@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 03/08/2019 ? 00:24, Thomas Petazzoni a ?crit?:
> Hello Jugurtha,
> 
> Didn't say it in my review of the previous patch, but I find this
> contribution very nice and useful. It will be good to have this to
> improve the testing of our Qemu defconfigs, for sure.
> 
> On Sun,  5 May 2019 18:53:58 +0200
> Jugurtha BELKALEM <jugurtha.belkalem@smile.fr> wrote:
> 
>> diff --git a/support/scripts/qemu-boot-checker.sh b/support/scripts/qemu-boot-checker.sh
>> new file mode 100755
>> index 0000000..dc79dad
>> --- /dev/null
>> +++ b/support/scripts/qemu-boot-checker.sh
>> @@ -0,0 +1,25 @@
>> +#!/usr/bin/env bash
>> +
>> +function archQemuNoSupport {
> 
> Camel-case really hurt my eyes. Also, this function is only used once,
> so it's not really useful to have a function.
> 
>> +	echo "cannot boot under qemu, support out of tree!"
>> +	exit 0
>> +}
>> +
>> +if [[ $1 = qemu* ]]; then
> 
> You should decide between [[ and [ for tests. And also, simply bail out
> when != qemu, so that you have one less indentation level.
> 
> So:
> 
> if [[ $1 != qemu* ]]; then
> 	exit 0
> fi
> 
>> +	device_name=$(echo $1  | sed -e 's#^qemu_##; s#_defconfig$##;' | sed -r 's/[_]/-/g')
> 
> Perhaps just:
> 
> 	device_name=$(echo $1 | sed -e 's,^qemu_\(.*\)_defconfig$,\1,; s/_/-/g')
> 
>> +	if [ "$device_name" = "x86-64" ]; then
>> +		device_name="x86_64"
>> +	elif [ "$device_name" = "m68k-q800" ] || [ "$device_name" = "ork1k" ]; then
>> +		archQemuNoSupport
>> +	fi
> 
> Here you can do:
> 
> 	case ${device_name} in
> 	x86-64)
> 		device_name="x86_64"
> 		;;
> 	m68k-q800)
> 	ork1k)
> 		echo "No Qemu support for ${device_name}"
> 		exit 0
> 	esac
> 
> But instead of encoding in this script which architectures can be
> tested with Qemu and which cannot, why not simply grep the defconfig
> for BR2_PACKAGE_HOST_QEMU=y ? If it has this config option, then the
> Qemu boot test can be done.
> 
> For the x86_64 case, maybe we should simply rename board/qemu/x86_64 to
> board/qemu/x86-64, so that it matches the other directories, where we
> have the same name as the defconfig, with just the _ replaced by -.
> This would entirely remove those special conditions.

Instead of renaming this directory and using the name of the defconfig file to
search for the right readme.txt containing the qemu command line to use.

We can instead add a comment in the defconfig

$ cat qemu_aarch64_virt_defconfig
# Use the Qemu command line from board/qemu/arm-vexpress/readme.txt to start Qemu.

or if we use a script launch.sh to start qemu (as suggested in the previous
patch review)

# Use the script from board/qemu/arm-vexpress/launch.sh to start Qemu.

Doing so, we don't have a naming rule between defconfig file and board/qemu
directory.

Thought ?

Romain

> 
>> +
>> +	export PATH="$2/output/host/bin:$PATH"
>> +	qemu_command_launcher=$($2/board/qemu/${device_name}/launch.sh)
> 
> Now I understand why "launch.sh" is not launching, but just echoing the
> command. Still, this isn't really nice, as a script called launch.sh
> should really launch. Another reason perhaps to simply keep the qemu
> command example in readme.txt, and extract it from there.
> 
>> +	$2/support/scripts/qemu-boot-expect.py "${qemu_command_launcher}"
>> +
>> +	if [ $? -ne 0 ]; then
>> +		echo "  booting test system ... FAILED"
>> +		exit 1
>> +	fi
>> +	echo "  booting test system ... SUCCESS"
> 
> Maybe show the "booting test system" message before the test, and the
> FAILED or SUCCESS after ? Something like this:
> 
> 	printf "  booting test system ..."
> 	$2/support/scripts/qemu-boot-expect.py "${qemu_command_launcher}"
> 	if [ $? -ne 0 ]; then
> 		printf "FAILED\n"
> 		exit 1
> 	fi
> 	printf "SUCCESS\n"	
> 
>> diff --git a/support/scripts/qemu-boot-chg-defconfig.sh b/support/scripts/qemu-boot-chg-defconfig.sh
>> new file mode 100755
>> index 0000000..868bc4e
>> --- /dev/null
>> +++ b/support/scripts/qemu-boot-chg-defconfig.sh
>> @@ -0,0 +1,11 @@
>> +#!/usr/bin/env bash
>> +
>> +if [[ $1 = qemu* ]]; then
>> +	device_name=$(echo $1  | sed -e 's#^qemu_##; s#_defconfig$##;' | sed -r 's/[_]/-/g') 
>> +	if [ "$device_name" = "x86-64" ]; then
>> +		device_name="x86_64"
> 
> The device_name is not used anywhere else in the script, so why are you
> changing it ?
> 
>> +		sed -i "s/tty1/ttyS0/" $2/configs/$1
>> +	elif [ "$device_name" = "x86" ]; then
>> +		sed -i "s/tty1/ttyS0/" $2/configs/$1
>> +	fi
> 
> Same comments as above. Also, I think this script should be run after
> the "make ${DEFCONFIG_NAME}" step in .gitlab-ci.yml, and operate on
> the .config file, not the defconfig file.
> 
> Also, a more specific sed expression would be nice. Perhaps:
> 
> 	sed -i '/^BR2_TARGET_GENERIC_GETTY_PORT/ s/tty1/ttyS0/'
> 
>> diff --git a/support/scripts/qemu-boot-expect.py b/support/scripts/qemu-boot-expect.py
>> new file mode 100755
>> index 0000000..7cd92c1
>> --- /dev/null
>> +++ b/support/scripts/qemu-boot-expect.py
>> @@ -0,0 +1,55 @@
>> +#!/usr/bin/env python
>> +#
>> +
>> +import pexpect
>> +import sys
>> +import os
>> +
>> +def checkQemuExec():
> 
> Please don't use CamelCase for function names.
> 
>> +    qemu_exec_exists = False
>> +    for dir in os.getenv("PATH").split(':'):
>> +        if (os.path.exists(os.path.join(dir, sys.argv[1].split(" ")[0]))):
>> +            qemu_exec_exists = True
>> +            break
>> +    return qemu_exec_exists
> 
> This is more complicated than it need to be:
> 
>     for dir in os.getenv("PATH").split(':'):
>         if (os.path.exists(os.path.join(dir, sys.argv[1].split(" ")[0]))):
>             return True
>     return False
> 
> will do the same.
> 
> But do we really need to check if Qemu exists ? If it doesn't the
> pexpect.spawn() will fail anyway.
> 
> In addition, you are doing the pexpect.spawn() *before* you check if
> Qemu exists, which is not very useful.
> 
> 
>> +
>> +def main():
>> +    global child
> 
> Pass child as argument to main().
> 
>> +    if(checkQemuExec()):
> 
> If you keep this function for some reason, then work the other way
> around:
> 
> 	if not checkQemuExec():	
> 		print("Cannot find Qemu executable")
> 		sys.exit(1)
> 
> so that the remainder of the function does not need to be entirely
> indented.
> 
> Could you rework this patch and the previous one to take into account
> my comments, and send a new iteration ?
> 
> Thanks a lot!
> 
> Thomas
> 
