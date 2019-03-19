From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Mar 2019 13:50:40 +0100
Subject: [Buildroot] [RFC PATCH] package/libcamera: Add libcamera package
In-Reply-To: <20190319110326.15153-1-kieran.bingham@ideasonboard.com>
References: <20190319110326.15153-1-kieran.bingham@ideasonboard.com>
Message-ID: <20190319125040.GA2702@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kieran, All,

On 2019-03-19 11:03 +0000, Kieran Bingham spake thusly:
>   http://libcamera.org/
> 
> Cameras are complex devices that need heavy hardware image processing
> operations. Control of the processing is based on advanced algorithms
> that must run on a programmable processor. This has traditionally been
> implemented in a dedicated MCU in the camera, but in embedded devices
> algorithms have been moved to the main CPU to save cost. Blurring the
                                                           ^^^^^^^^
I see what you did there! ;-)

> boundary between camera devices and Linux often left the user with no
> other option than a vendor-specific closed-source solution.
> 
> To address this problem the Linux media community has very recently
> started collaboration with the industry to develop a camera stack that
> will be open-source-friendly while still protecting vendor core IP.
> libcamera was born out of that collaboration and will offer modern
> camera support to Linux-based systems, including traditional Linux
> distributions, ChromeOS and Android.

While I appreciate the blurb about the context around libcamera, what I
find even more interesting in a commit log is an explanations about the
complexity of the packaging in Buildrot, and why such or such hack was
done.

Here, you don't seem to have much to say, though, except...

> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
> We do not yet have an official 'release', so I'm sending this as an
> early RFC, with
>   LIBCAMERA_VERSION = origin/master
> and no .hash file.

... this blurb would have had its place in the commit log:

    The project has not made an official release as of yet, so we're
    using the latest sha1 from master.

which is about the only thing that I find important for a commit in
Buildroot.

> Is this still suitable to go in and be updated when we have a tagged
> release later?

As I explained on IRC, using a branch name is not acceptable, because it
does not work as you think it would, as explaiend in the manual (quting
here for your convenience):

    Note: Using a branch name as FOO_VERSION is not supported, because it
    does not and can not work as people would expect it should:

     1. due to local caching, Buildroot will not re-fetch the repository, so
        people who expect to be able to follow the remote repository would be
        quite surprised and disappointed;
     2. because two builds can never be perfectly simultaneous, and because
        the remote repository may get new commits on the branch anytime, two
        users, using the same Buildroot tree and building the same
        configuration, may get different source, thus rendering the build non
        reproducible, and people would be quite surprised and disappointed. 

So, use a sha1. ;-)

>  DEVELOPERS                     |  3 +++
>  package/Config.in              |  1 +
>  package/libcamera/Config.in    | 11 +++++++++++
>  package/libcamera/libcamera.mk | 13 +++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 package/libcamera/Config.in
>  create mode 100644 package/libcamera/libcamera.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c91325e28486..5bcdf208a62b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1260,6 +1260,9 @@ F:	package/ramsmp/
>  N:	Kevin Joly <kevin.joly@sensefly.com>
>  F:	package/libgphoto2/
>  
> +N:	Kieran Bingham <kieran.bingham@ideasonboard.com>
> +F:	package/libcamera/

Nice, thanks! :-)

> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> new file mode 100644
> index 000000000000..c80f58c00f17
> --- /dev/null
> +++ b/package/libcamera/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_LIBCAMERA
> +	bool "libcamera"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
> +	depends on BR2_PACKAGE_HAS_UDEV
> +	help
> +	  libcamera provides a software stack to support complex devices that
> +	  need heavy hardware image processing operations.

Did you pass this package through utils/check-package?

    package/libcamera/Config.in:8: help text: <tab><2 spaces><62 chars>
    (http://nightly.buildroot.org/#writing-rules-config-in)
    24 lines processed
    1 warnings generated

Also, as you already discovered, it's nice to pass a new package through
utils/test-pkg as well (and although not mandatory, it's nice to provide
that report after the --- line.)

> +	  http://www.libcamera.org/
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> new file mode 100644
> index 000000000000..4d908c7a3645
> --- /dev/null
> +++ b/package/libcamera/libcamera.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# libcamera
> +#
> +################################################################################
> +
> +LIBCAMERA_VERSION = origin/master
> +LIBCAMERA_SITE = git://linuxtv.org/libcamera.git

Please use the https (or http) URI, as people usually can't use the git
protocol from behind nasty corporate-class firewalls.

> +LIBCAMERA_SITE_METHOD = git
> +LIBCAMERA_DEPENDENCIES = udev
> +LIBCAMERA_LICENSE = LGPL-2.0+

This is not LGPL-2.0+, but LGPL-2.1+

There are actually 2 other licenses applicable to this package: GPLv2.0+
and CC-BY-SA-4.0 (or later?).

We usually specify what part of the package they apply to (correct me
if/where I am wrong):

    LIBCAMERA_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (utils, test), CC-By_SA-4.0 (doc)

Please also specify the files that contain the license texts:

    LIBCAMERA_LICENSE_FILES = \
        licenses/cc-by-sa-v4.0.txt \
        licenses/developer-certificate-of-origin.txt \
        licenses/gnu-gpl-2.0.txt \
        licenses/gnu-lgpl-2.1.txt

Thanks! :-)

Regards,
Yann E. MORIN.

> +
> +$(eval $(meson-package))
> -- 
> 2.19.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
