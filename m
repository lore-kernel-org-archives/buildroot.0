From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Mar 2014 23:16:50 +0100
Subject: [Buildroot] [PATCH 08/10 v2] package/petitboot: Add petitboot,
 the userspace bootloader
In-Reply-To: <1394595957.566506.967533808031.8.gpush@pablo>
References: <1394595957.563937.119075350083.0.gpush@pablo>
 <1394595957.566506.967533808031.8.gpush@pablo>
Message-ID: <20140312221650.GB3389@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeremy, All,

On 2014-03-12 11:45 +0800, Jeremy Kerr spake thusly:
> This change adds the petitboot package, a bootloader that exists in
> userspace, and uses the kexec facility to boot into a new kernel.
[--SNIP--]
> diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
> new file mode 100644
> index 0000000..f5ffe8e
> --- /dev/null
> +++ b/package/petitboot/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_PETITBOOT
> +	bool "petitboot"
> +	depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
> +	select BR2_PACKAGE_UDEV

Package udev no longer exists. udev is now a virtual package that is
provided by eother systemd of eudev. So you can not 'select'
BR2_PACKAGE_UDEV.

You should instead use:
    depends on BR2_PACKAGE_HAS_UDEV

[--SNIP--]
> diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
> new file mode 100644
> index 0000000..8370fa2
> --- /dev/null
> +++ b/package/petitboot/petitboot.mk
> @@ -0,0 +1,64 @@
> +################################################################################
> +#
> +# petitboot
> +#
> +################################################################################
[--SNIP--]
> +define PETITBOOT_PRE_CONFIGURE_BOOTSTRAP
> +	(cd $(@D) && ./bootstrap $(PETITBOOT_BOOTSTRAP_VERSION))
> +endef
> +
> +PETITBOOT_PRE_CONFIGURE_HOOKS += PETITBOOT_PRE_CONFIGURE_BOOTSTRAP

I find it too bad that an autotools package can not be autoreconf'ed.

I've looked a bit at what this bootstrap does, and all it really is used
for is to shoehorn the veersion in configure.ac.

Since you seem to be involved in petitboot, here's a suggestion to do it
otherwise:

  - move the version stuff out of ./bootstrap, into its own script, eg.
    ./version.sh

  - change configure.ac to use AC_INIT as thus:

    AC_INIT([petitboot],
            [m4_esyscmd_s([./version.sh])],
            [Geoff Levand <geoff@infradead.org>])

Then the package will be entirely autoreconf-igurable. ;-)

I haven't looked further in the patch, just pointing out a few things I
spotted on a cursory look.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
