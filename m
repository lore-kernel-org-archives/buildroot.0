From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 7 Dec 2010 08:26:31 +0100
Subject: [Buildroot] [PATCH 09/55] Stop referencing the crazy
 target/device stuff
In-Reply-To: <20101206204339.44533180@surf>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<47aba834b9147ad9a3ee0a32a08cd21763b0d4c8.1291582351.git.thomas.petazzoni@free-electrons.com>
	<AANLkTik7fEm_DTts5a=o-ooC2DOvTJyvhJc9f4ZA5qq4@mail.gmail.com>
	<20101206204339.44533180@surf>
Message-ID: <AANLkTikq-exQbC1vA965hRN0g-G2qiOoJ-BdAwmsiCZm@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, (this will become confusing for other readers :-p )

On Mon, Dec 6, 2010 at 8:43 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello Thomas,
>
> On Mon, 6 Dec 2010 08:35:32 +0100
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> wrote:
>
>> How then would you add board-specific configuration options?
>> Suppose that for a certain board you can enable or disable a certain
>> feature. Previously, you'd add such an option in the board-specific
>> Config.in file, which was included via the manufacturer-specific
>> Config.in file, which was included from target/device/Config.in.
>> Now that all these are being removed, what's the strategy?
>
> Could you give examples of what these options would be ? I think it
> would depend on which options we're talking about, I don't have a
> generic answer to this question.
>
> At least in the existing target/device/*/Config.in files, there were no
> such options.

For example, in a manufacturer specific Config.in file, I added an
option for a new board. This board has two variants, each having a
different processor architecture. Other than that, the selection of
components for the root filesystem, the kernel etc. would all be the
same (except for the kernel configuration).
By adding 'depends on' and 'default' options to the config, I could
make the selection for the right board variant automatic based on the
global buildroot architecture selection.

e.g.
config MYBOARD
    config MYBOARD_PPC
        depends on MYBOARD && BR2_powerpc
        default y if BR2_powerpc

    config MYBOARD_X86
        depends on MYBOARD && BR2_i386
        default y if BR2_i386

Then, based on the above selection, I'd automatically determine the board name:

config BR2_BOARD_NAME
    default "myboard_ppc" if MYBOARD_PPC
    default "myboard_x86" if MYBOARD_X86

config BR2_BOARD_PATH
    default "target/device/<manufacturer>/$(BR2_BOARD_NAME)"



Additionally, I liked the idea of 'status' targets in the board
Makefiles. These targets print out certain configuration variables,
e.g. the Linux kernel used, the name of the board selected, etc.
This may not need to be in a board-specific file, but in my opinion
this is worth implementing globally. Do you agree?

>
>> Related to this: previously some target/device/*/Config.in files added
>> configuration options called BR2_BOARD_NAME and BR2_BOARD_PATH. These
>> could be referenced from other configuration options, for example in
>> target/linux/Config.in.advanced, as the default Linux configuration
>> file. Is this mechanism still supported, or is there an alternative?
>
> target/linux/Config.in.advanced does not exist anymore.
>
> In the U-Boot or Linux configuration, if you need to reference
> something in the board-specific directory, just use
> "board/<vendor>/<boardname>/something". For example, in the mini2440
> defconfig:
>
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/friendlyarm/mini2440/linux-2.6.32.2.config"

The disadvantage of this is that the above configuration setting needs
to change if the board name changes. If the board name is abstracted
in a variable like BR2_BOARD_NAME, the setting stays the same
(although of course the expanded string is different). This makes
configuration files more generic.
Here again, having a board name setting may be something that can be
moved to the global buildroot settings, available for every board.
What do you think?

Thanks,
Thomas
