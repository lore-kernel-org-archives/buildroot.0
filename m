From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 8 Dec 2010 07:57:48 +0100
Subject: [Buildroot] [PATCH 09/55] Stop referencing the crazy
 target/device stuff
In-Reply-To: <20101207211818.0e36c8ce@surf>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<47aba834b9147ad9a3ee0a32a08cd21763b0d4c8.1291582351.git.thomas.petazzoni@free-electrons.com>
	<AANLkTik7fEm_DTts5a=o-ooC2DOvTJyvhJc9f4ZA5qq4@mail.gmail.com>
	<20101206204339.44533180@surf>
	<AANLkTikq-exQbC1vA965hRN0g-G2qiOoJ-BdAwmsiCZm@mail.gmail.com>
	<20101207211818.0e36c8ce@surf>
Message-ID: <AANLkTikiJU5wRSP6axRym2W+EVbCwbQ8zSDbB+2n5bHk@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Tue, Dec 7, 2010 at 9:18 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello Thomas,
>
> On Tue, 7 Dec 2010 08:26:31 +0100
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> wrote:
>
>> Hello Thomas, (this will become confusing for other readers :-p )
>
> Yes, but it's funny :-)
>
>> > At least in the existing target/device/*/Config.in files, there
>> > were no such options.
>>
>> For example, in a manufacturer specific Config.in file, I added an
>> option for a new board. This board has two variants, each having a
>> different processor architecture. Other than that, the selection of
>> components for the root filesystem, the kernel etc. would all be the
>> same (except for the kernel configuration).
>> By adding 'depends on' and 'default' options to the config, I could
>> make the selection for the right board variant automatic based on the
>> global buildroot architecture selection.
>>
>> e.g.
>> config MYBOARD
>> ? ? config MYBOARD_PPC
>> ? ? ? ? depends on MYBOARD && BR2_powerpc
>> ? ? ? ? default y if BR2_powerpc
>>
>> ? ? config MYBOARD_X86
>> ? ? ? ? depends on MYBOARD && BR2_i386
>> ? ? ? ? default y if BR2_i386
>>
>> Then, based on the above selection, I'd automatically determine the
>> board name:
>>
>> config BR2_BOARD_NAME
>> ? ? default "myboard_ppc" if MYBOARD_PPC
>> ? ? default "myboard_x86" if MYBOARD_X86
>>
>> config BR2_BOARD_PATH
>> ? ? default "target/device/<manufacturer>/$(BR2_BOARD_NAME)"
>
> Just provide two different defconfig files for your two boards.
>
>> Additionally, I liked the idea of 'status' targets in the board
>> Makefiles. These targets print out certain configuration variables,
>> e.g. the Linux kernel used, the name of the board selected, etc.
>> This may not need to be in a board-specific file, but in my opinion
>> this is worth implementing globally. Do you agree?
>
> With my changes, there isn't anymore the concept of a "board" inside
> Buildroot, because IMO it doesn't make sense. A "board" is just a
> initial configuration file that is known to work for a particular
> hardware platform, but a defconfig file should be sufficient. So from
> that perspective, there's no way Buildroot would know the "board" name.
> The user just starts by doing :
>
> ? ? ? ?make foobar_defconfig
>
> and (s)he knows that the architecture, kernel, bootloader are correct,
> and so (s)he can go ahead with
>
> ? ? ? ?make menuconfig
>
> and add whatever software is needed for the system (s)he is building.
>
> With regard to the version of the Linux kernel selected or things like
> that, we could obviously add a "make status" thing, but I don't really
> what this would buy us compared to running "make menuconfig". And what
> do we put in this "make status" ? The version of the kernel ? Why
> only ? There should be the version of all the components, no ?
>
>> > BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/friendlyarm/mini2440/linux-2.6.32.2.config"
>>
>> The disadvantage of this is that the above configuration setting needs
>> to change if the board name changes.
>
> If the name of the board changes, you have to rename the defconfig file
> *and rename the directory. So changing two paths in the defconfig file
> shouldn't be a very big deal compared to all the renames already
> needed. And renaming a board is really a corner use case, for which
> changing two paths in a defconfig sounds reasonable.
>
>> If the board name is abstracted
>> in a variable like BR2_BOARD_NAME, the setting stays the same
>> (although of course the expanded string is different). This makes
>> configuration files more generic.
>
> Configuration files are specific to a particular board. Even their name
> is, so I don't see the point of making them whatsoever generic :-)
>
> I agree that my patch set is changing things, but that's why it has
> been written in the first place.

Ok. I can live with the new way of working. I'll go ahead and adapt
based on your replies above.

Best regards,
Thomas
