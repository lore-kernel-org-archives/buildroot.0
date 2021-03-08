From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Mar 2021 22:55:41 +0100
Subject: [Buildroot] [RFC/next v2 1/2] package/rpi-firmware: rework
 boot/config file handling
In-Reply-To: <20210216201148.26688-1-ps.report@gmx.net>
References: <20210216201148.26688-1-ps.report@gmx.net>
Message-ID: <20210308215541.GB2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-02-16 21:11 +0100, Peter Seiderer spake thusly:
> Try to be less smart (focused on the one target/one use-case),
> instead reduce the rpi-firmware package to a selectable list
> of (verbatim) installed firmware files.
> 
> - change rpi-firmware config handling from rpi-variant/rpi-flavour
>   choices to bootcode.bin, pi-default/-extended/-cut-down and
>   pi4-/default/-extended/-cut-down selection
> 
> - add BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE option to select installable
>   config.txt file
> 
> - remove config.txt modify code/handling from raspberry post-image.sh
>   script
> 
> - add different customized config.txt files to the raspberry board
>   section
> 
> - change raspberry defconfigs to select appropiate rpi-firmware
>   and config.txt files
> 
> - change genimage-raspberrypi4.cfg/genimage-raspberrypi4-64.cfg to
>   use start4.elf and fixup4.dat
> 
> With this changes a better support for custom use-cases should
> be possible, specially multi-target SD cards as suggested by
> Stefan Agner ([1]).
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2021-February/303318.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

So I have started looking at this patch, and although I think it is
going in the right direction, there are two things I am not very happy
with...

I'm not saying they would be definite blockers, just that I'd like we
think a bit more about it.

So, the first thing that bugs me, are all the varions config.txt files
that are mostly identical, except of a few tweaks:

  - dtoverlay=miniuart-bt or not
  - arm_64bit=1 or not

And the arm_64bit=1 can be automatically added when Buildroot is
configured for BR2_aarch64=y anyway.

And of course, a single outlier, the qt5we example, that has
gpu_mem_1024=200...

Still, that makes me nervous to mostly duplicate all those config.txt...

The second thing leaves me thinking is the new config option that
points to the config.txt to use. My first reaction was 'hell-no, this
belongs to the post-image script and we should have it passed with
BR2_ROOTFS_POST_SCRIPT_ARGS="board/rpiXXX/config_XXX.txt".'

But them this means that the rpi post-image script diverges from the
others; the few others I've had a look at are just callinggenimage
without amy preparation whatsoever. The rpi one is already diverging, as
it creates a temporary empty rootpath (commit ee47fea5781) and currently
has a few options that none of the others have.

Getting rid of the existing options --miniuart, --aarch64, et al. is a
nice thing, because it helps get it more inline with the others...

But still, I am not too fond of this new BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE
option...

And really, both issues are really just me wondering if we can't do
better...

So, let's keep the qt5 example aside, and see what we can do. What if
we'd go with the following:

  - keep a single, generic config.txt in rpi-firmware, and install that,

  - if BR2_aarch64=y, add arm_64bit=1

  - add an option to rpi-firmware:

    config BR2_PKG_RPI_FW_DTOVERLAY_LIST
        string "DT overlays to load"
        depends on BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
        help
          Space-separated list of DT overlays to be loaded from config.txt.

          For example, miniuart-bt on rpi0w to restore the serial console.

    and if this option is not empty, construct the list of dtoverlay and
    add it to config.txt.

  - eventually, adapt the defconfigs with that list of dtoverlays

Thoughts?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
