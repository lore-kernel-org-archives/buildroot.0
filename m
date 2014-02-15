From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 15 Feb 2014 08:03:48 +0100
Subject: [Buildroot] adding support for a new board
In-Reply-To: <52FF012D.3090807@gmail.com>
References: <52FF012D.3090807@gmail.com>
Message-ID: <CAAXf6LXc-4KOLhTkuVF4mQoGieJtjerfAcDLeRiqZrh62VwVMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marco,

On Sat, Feb 15, 2014 at 6:54 AM, Marco Trapanese
<marcotrapanese@gmail.com> wrote:
> Hello,
> I'm reading through the documentation how to add a support for a board.
> In particular I need to run buildroot on this board:
>
> http://www.advantech.com/products/1-2JKBYZ/ARK-1120F/mod_4be6fe03-9aa1-4097-a9b1-8977a7a49289.aspx
>
> The buildroot documentation says: "[...] create a normal Buildroot
> configuration that builds a basic system for the hardware: toolchain,
> kernel, bootloader, filesystem and a simple Busybox-only userspace. "
>
> Is there any step-by-step tutorial to help during the configuration of
> mandatory parameters?
> I'm not sure which ones I should check and what information I need to know
> how to set them.
>


I don't really know of some step-by-step tutorial, but here are some hints:

Google for this board, chances are that other people have already
brought it up, so unless you want the learning experience, you could
benefit from their work.

Take it in steps, focus on one thing at the time. It doesn't make
sense to tweak the busybox configuration if you don't yet know if the
kernel will boot.

If you already have a system that boots (with the shipped
bootloader/kernel etc) you could start by focusing on building the
kernel. The bootloader step can be tricky depending on the board, and
if you don't even get past that it is very discouraging. So if you can
keep the current working bootloader at first, you can try using your
custom buildroot-built kernel.

It's important to gather some details: what SoC is on the board (name,
codename) and what is the exact CPU type inside of it. This is
information you will need for both the toolchain, buildroot and kernel
configuration.

If you already have a booting kernel, you may be able to extract its
configuration file from any of these places:
- software distribution shipped with the product or on the official website
- zcat /proc/config.gz on the target system
- extracting it offline from a linux kernel image (there is a script
in the linux kernel scripts directory, something with ikconfig.
- reading the boot log to try and identify the needed components. Do
realize that the shipped kernel may be much bigger that really needed.

The second and third method depend on the fact that the kernel is
configured with support for IKCONFIG, which may not be the case.


Once you have a booting kernel, my suggestion would be to proceed with
userland initialization, but you may of course also choose to do the
bootloader first.

Good luck,
Thomas
