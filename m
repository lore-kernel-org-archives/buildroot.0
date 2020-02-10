From: Romain Naour <romain.naour@smile.fr>
Date: Mon, 10 Feb 2020 14:47:59 +0100
Subject: [Buildroot] [PATCH v4 6/9] board/qemu: add post-image script
 for gitlab qemu testing
In-Reply-To: <20200210140950.704d0d4b@windsurf>
References: <20200209180327.455426-1-romain.naour@smile.fr>
 <20200209180327.455426-7-romain.naour@smile.fr>
 <20200210140950.704d0d4b@windsurf>
Message-ID: <f049e76f-b96a-b355-1597-b7fda6412afe@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 10/02/2020 ? 14:09, Thomas Petazzoni a ?crit?:
> On Sun,  9 Feb 2020 19:03:24 +0100
> Romain Naour <romain.naour@smile.fr> wrote:
> 
>> This commit add the same post-image script for each qemu board
>> in order to generate start-qemu.sh in BINARIES_DIR.
>> The start-qemu.sh script can be used by Buildroot user to start
>> Qemu or by a gitlab CI.
>>
>> To find the correct qemu command line in the readme.txt, we use
>> the second post script argument which must contain "$(BR2_DEFCONFIG)"
>>
>>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>>
>> Doing a basename allow to retrieve the name of the defconfig
>> file (ex: qemu_aarch64_virt_defconfig) that should match
>> on on the "tag" previously introduced in the readme.txt.
>>
>> The script start-qemu.sh is able to modify the qemu command
>> line if CI_JOB_NAME defined in the environment. This allow
>> to disable the graphical output and redirect serial I/Os to
>> console.
>>
>> Only sh4/sh4eb needs a special handling by adding
>> "-serial stdio -display none" instead of "-display none".
>>
>> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> 
> Why is this script copied a zillion times? This looks like a
> maintenance nightmare. Why not put it in board/qemu/, and have a single
> script used by all configurations ?

I'm not sure if we should share the same post-image script for several boards.
It's not clear how we should maintain theses scripts in board directory.

For example for genimage (post-image.sh) :
board/lego/ev3/post-image.sh
board/grinn/liteboard/post-image.sh
board/nexbox/a95x/post-image.sh

This is the same script.
Maybe we need something board/common/post-image.sh ?

For Qemu board, maybe add the script in board/qemu/common/post-image.sh.

There is also a special case for sh4, so I'll add a second script to add
"-serial stdio -display none" instead of "-display none"

Best regards,
Romain

> 
> Thomas
> 
