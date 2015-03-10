From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Tue, 10 Mar 2015 18:41:39 -0500
Subject: [Buildroot] [PATCH v2 1/1] Makefile: add target to clean
	targetfs
In-Reply-To: <1426015688-24902-1-git-send-email-emeric.vigier@savoirfairelinux.com>
References: <1425947100-9031-1-git-send-email-emeric.vigier@savoirfairelinux.com>
 <1426015688-24902-1-git-send-email-emeric.vigier@savoirfairelinux.com>
Message-ID: <CAMQcK5Kz4_vyCVv3Xq9Sms7UWd2Qjew1c60bXZzkfn6f40QeNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Emeric,

In the future - could you put a version - such as 'v2' - into the
title utilizing the -'-subject-prefix' parameter of git-send-email?

For details and an example see the buildroot manual and section 21.5.2:

http://nightly.buildroot.org/manual.html#submitting-patches

On Tue, Mar 10, 2015 at 2:28 PM, Emeric Vigier
<emeric.vigier@savoirfairelinux.com> wrote:
> If you had some files added to the targetfs (fs-overlay, new packages,
> ...) and you no longer need them, buildroot does not offer a simple way
> to remove these items from the output/target directory. The rule added
> by this commit allows you to clean the targetfs. Issuing 'make'
> afterward will generate a new and clean targetfs.
>
> A section in the documentation is also added. It describes few examples
> when developers could need it. 'make help' is also updated accordingly.
>
> Signed-off-by: Emeric Vigier <emeric.vigier@savoirfairelinux.com>
> ---
> Changes v1 -> v2
>   - remove non-existent .built and deprecated .stamp_installed
>     references (suggested by Baruch Siach)
>   - mention the new target in 'make help'
> ---
>  Makefile                                |  5 +++++
>  docs/manual/advanced.txt                |  2 ++
>  docs/manual/clean-target-filesystem.txt | 37 +++++++++++++++++++++++++++++++++
>  3 files changed, 44 insertions(+)
>  create mode 100644 docs/manual/clean-target-filesystem.txt

[...]

> diff --git a/docs/manual/advanced.txt b/docs/manual/advanced.txt
> index b7bfc49..1cf0427 100644
> --- a/docs/manual/advanced.txt
> +++ b/docs/manual/advanced.txt
> @@ -14,3 +14,5 @@ include::download-location.txt[]
>  include::package-make-target.txt[]
>
>  include::using-buildroot-development.txt[]
> +
> +include::clean-target-filesystem.txt[]
> diff --git a/docs/manual/clean-target-filesystem.txt b/docs/manual/clean-target-filesystem.txt
> new file mode 100644
> index 0000000..0274474
> --- /dev/null
> +++ b/docs/manual/clean-target-filesystem.txt

Would it make sense to also update the section of the manual that
talks about understand when a full-rebuild is necessary? You could
also update that section to reference this advance usage section.

http://nightly.buildroot.org/manual.html#full-rebuild

> @@ -0,0 +1,37 @@
> +// -*- mode:doc; -*-
> +// vim: set syntax=asciidoc:
> +
> +==== Clean target filesystem
> +
> +There are various cases where you would like to clean the target
> +filesystem. Especially once you understood that buildroot build system
> +is kept simple, and does not allow to uninstall files. Let's take some
> +examples:
> +
> +1. You enabled +PACKAGE_OPENSSH+ to have a SSH server running on your
> +   board. But you figure out that +sshd+ does not run well on your
> +   target's architecture. Thus you decide to disable +PACKAGE_OPENSSH+
> +   and enable +PACKAGE_DROPBEAR+ instead. You run +make+, +openssh+
> +   gets built and installed. Problem: +openssh+ files are still present
> +   in +output/target+!

One case that comes to mind here is that will this ensure that
packages are installed in the correct order with dependencies? I am
not exactly sure how the dependencies for packages works, but if you
remove all the '.stamp_target_install' will that ensure that all the
packages get installed in the correct order?

Busybox is the package that comes to my mind first that we need to
ensure the installation order. From testing your scenario outlined
above it appears that busybox gets installed before even dropbear
would get built which would ensure that any full version of busybox
would get install correctly over the symlinks to busybox.

> +2. You enabled +PACKAGE_NTPD+ and set the local timezone to
> +   +America/Montreal+ with +BR2_TARGET_LOCALTIME+ config. Then you find
> +   out that +Montreal+ local has been replaced by +Toronto+ (French
> +   looks like a rogue language). You enter +make menuconfig+, make the
> +   change, save, and run +make+ again. Problem:
> +   +output/target/etc/timezone+ still has +America/Montreal+ content!
> +
> +Solution to this is either to identify which package to reconfigure, or

I believe this first 'or' should be removed so that the sentence would read:

The solution to this is to either identify which package to
reconfigure, remove files manually, or destroy the target filesystem
and recreate it.

> +remove files manually, or destroy the target filesystem and recreate it.
> +This latter option is convenient: you don't have to care about which
> +packages to rebuild, and it is fast. Here is how to recreate your
> +target filesystem, and get rid of filesystem _stains_:
> +
> +------------------
> +make clean-target
> +make
> +------------------
> +
> ++clean-target+ removes +output/target+, tells buildroot to recreate the
> +target skeleton, and install each package again.

This is a rather simple solution to the issue of recreating a 'clean'
target filesystem so it will be interesting to hear what the
maintainers (Peter/Thomas P) opinions are on this patch.

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
