From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sat, 25 Apr 2020 14:59:27 +0200
Subject: [Buildroot] [PATCH v2] package/environment-setup: new package
In-Reply-To: <VI1PR02MB59352FFCB613D9A3DAF52F1ADCD10@VI1PR02MB5935.eurprd02.prod.outlook.com>
References: <20200418142951.15630-1-angelo@amarulasolutions.com>
 <VI1PR02MB59352FFCB613D9A3DAF52F1ADCD10@VI1PR02MB5935.eurprd02.prod.outlook.com>
Message-ID: <CA+_SqVZ0sJMafrk=q9vonhCwkbttkW2XrONi1g6yJ1PNhhn+gg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 25, 2020 at 11:28 AM Mircea GLIGA <mgliga@bitdefender.com> wrote:
>
> Angello, All,
>
> ________________________________________
> From: buildroot <buildroot-bounces@busybox.net> on behalf of Angelo Compagnucci <angelo.compagnucci@gmail.com>
> Sent: Saturday, April 18, 2020 17:29
> To: buildroot at buildroot.org
> Cc: Angelo Compagnucci
> Subject: [Buildroot] [PATCH v2] package/environment-setup: new package
>
> Install an helper script to setup a build environment
> based on buildroot. It's useful when you export an sdk
> and want to use buildroot to build an external project.
>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
> Changelog:
> v1->v2:
>  * Moved from echo to printf (Yann)
>  * removed sh extension (Yann)
>  * Adding missing script
>
> Some of the reason I kept several things the way I originally planned:
>
>  * I kept it being a package because it doesn't fit in any other tool:
>    indeed this script changes your curent PATH and exports some variables
>    that can be used for anything. Think of qmake or cmake or a package
>    that doesn't have any build system at all. It has some features geared
>    also towards autotools software but I keep planning others.
>  * I kept the script being installed in host root: other build system does that
>    and I want this script to mimic other build systems.
>  * I kept looping in TARGET_CONFIGURE_OPTS, indeed it produces a more clean
>    environment script at the end. For the problem arised by Yann: variables in
>    TARGET_CONFIGURE_OPTS _are_ properly escaped, indeed if not they were a
>    big source of problems on each ./configure invocation due to the fact they are
>    injected on the ./configure commandline invocation.
>  * I kept the PS1: this script heavily mess with the path, it is expected by the
>    user running it, but it can be very confusing being on a shell that
>    doesn't behaves like your normal shell. So having a different PS1 helps
>    remembering you are running into the buildroot shell and not into an ordinary
>    one (other build systems does the same).
>  * I kept the manual entry: I think that the most documentation the better.
>
>  docs/manual/using-buildroot-toolchain.txt     |  7 ++++
>  package/Config.in                             |  1 +
>  package/environment-setup/Config.in           |  6 ++++
>  package/environment-setup/environment-setup   | 17 ++++++++++
>  .../environment-setup/environment-setup.mk    | 32 +++++++++++++++++++
>  5 files changed, 63 insertions(+)
>  create mode 100644 package/environment-setup/Config.in
>  create mode 100644 package/environment-setup/environment-setup
>  create mode 100644 package/environment-setup/environment-setup.mk
>
> diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.txt
> index 0c0c35fced..e2697d19ac 100644
> --- a/docs/manual/using-buildroot-toolchain.txt
> +++ b/docs/manual/using-buildroot-toolchain.txt
> @@ -27,6 +27,13 @@ Upon extracting the SDK tarball, the user must run the script
>  +relocate-sdk.sh+ (located at the top directory of the SDK), to make
>  sure all paths are updated with the new location.
>
> +For your convenience, by selecting the package BR2_PACKAGE_ENVIRONMENT_SETUP,
> +you can have a +setup-environment.sh+ script installed in +output/host/+.
> +This script can be sourced with +. your/sdk/path/environment-setup+ to launch
> +the buildroot shell. Inside this shell, you will find an environment already
> +set up with the correct PATH, the complete list of +target configure+
> +variables and some useful commands like the +configure+ alias.
> +
>  Alternatively, if you just want to prepare the SDK without generating
>  the tarball (e.g. because you will just be moving the +host+ directory,
>  or will be generating the tarball on your own), Buildroot also allows
> diff --git a/package/Config.in b/package/Config.in
> index ccf54f2417..eff51d7451 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1949,6 +1949,7 @@ menu "Miscellaneous"
>         source "package/collectl/Config.in"
>         source "package/domoticz/Config.in"
>         source "package/empty/Config.in"
> +       source "package/environment-setup/Config.in"
>         source "package/gnuradio/Config.in"
>         source "package/googlefontdirectory/Config.in"
>         source "package/gqrx/Config.in"
> diff --git a/package/environment-setup/Config.in b/package/environment-setup/Config.in
> new file mode 100644
> index 0000000000..f0fcc7d0f8
> --- /dev/null
> +++ b/package/environment-setup/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_ENVIRONMENT_SETUP
> +       bool "Environment setup"
> +       help
> +         Install an helper script to setup a build environment
> +         based on buildroot. It's useful when you export an sdk
> +         and want to use buildroot to build an external project
> diff --git a/package/environment-setup/environment-setup b/package/environment-setup/environment-setup
> new file mode 100644
> index 0000000000..c8ee7aaa0b
> --- /dev/null
> +++ b/package/environment-setup/environment-setup
> @@ -0,0 +1,17 @@
> +cat <<'EOF'
> + _           _ _     _                 _
> +| |__  _   _(_) | __| |_ __ ___   ___ | |_
> +| '_ \| | | | | |/ _` | '__/ _ \ / _ \| __|
> +| |_) | |_| | | | (_| | | | (_) | (_) | |_
> +|_.__/ \__,_|_|_|\__,_|_|  \___/ \___/ \__| shell
> +
> +       Making embedded Linux easy!
> +
> +Some tips:
> +* PATH is now pointing to the HOST_DIR path
> +* Target configure options are already exported
> +* You can do "./configure $CONFIGURE_FLAGS"
> +* Alternatively, you can use the "configure" alias
> +
> +EOF
> +SDK_PATH=$(dirname "${BASH_SOURCE[0]}")
>
> Doing it like this would make it dependent on how/where(as in working dir) you sourced it.
> So, for it to work from every directory I would have to source it with the full path, e.g.
> `. /home/user/project/br/output/environment-setup`
>
> Sourcing it like this doesn't work as expected: `. environment-setup`
> For it to work the SDK_PATH should contain the absolute path.

Goof catch, fixed in V4.

>
> diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
> new file mode 100644
> index 0000000000..b5438b389a
> --- /dev/null
> +++ b/package/environment-setup/environment-setup.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# environment-setup
> +#
> +################################################################################
> +
> +ENVIRONMENT_SETUP_FILE = $(HOST_DIR)/environment-setup
> +ENVIRONMENT_SETUP_SED_EXP = --expression='s+$(HOST_DIR)+\$$SDK_PATH+g'
> +
> +define ENVIRONMENT_SETUP_INSTALL_TARGET_CMDS
> +       cp package/environment-setup/environment-setup $(ENVIRONMENT_SETUP_FILE)
> +       for var in $(TARGET_CONFIGURE_OPTS); do \
> +               printf "export \"%s\"\n" \
> +                       "$$(sed $(ENVIRONMENT_SETUP_SED_EXP) <<< $$var)" \
> +                               >> $(ENVIRONMENT_SETUP_FILE); \
> +       done
> +       printf "export \"CROSS_COMPILE=$(TARGET_CROSS)\"\n" \
> +               "$$(sed $(ENVIRONMENT_SETUP_SED_EXP) <<< $$var)" \
> +                       >> $(ENVIRONMENT_SETUP_FILE)
> +       printf "export \"CONFIGURE_FLAGS=--target=$(GNU_TARGET_NAME) \
> +               --host=$(GNU_TARGET_NAME) \
> +               --build=$(GNU_HOST_NAME) \
> +               --prefix=/usr \
> +               --exec-prefix=/usr \
> +               --sysconfdir=/etc \
> +               --localstatedir=/var \
> +               --program-prefix=\"\n" >> $(ENVIRONMENT_SETUP_FILE)
> +       printf "alias configure=\"./configure \$${CONFIGURE_FLAGS}\"\n" >> $(ENVIRONMENT_SETUP_FILE)
> +       printf "PS1=\"\[\e[32m\]buildroot-$(BR2_VERSION)\[\e[m\]:\[\e[34m\]\w\[\e[m\]\$$ \"" >> $(ENVIRONMENT_SETUP_FILE)
>
> I would not mess with the PS1 shell, the argument that others do it, it's not a technical argument.
> I have a custom PS1 with git branch info, timestamps etc, loosing that information doesn't help.

I don't think we are talking about a technicality here, indeed from a
technical point of view, the thing is working.

The problem is mostly from the user experience point of view. I think
that any tech-savvy user can understand how to open another shell on
another tab and use its own carefully crafted PS1.
Moreover, he knows also how to write a sourcing script for his own needs.

What I'm talking about here is the average sdk user (whit which I work
the most) that doesn't know the details and the only thing he wants is
to be able to compile his software with a buildroot generated sdk as
he does in yocto.

I think that for the sake of better user experience we can accept that
the buildroot shell will have a proper PS1.

Nonetheless, is happened even to me to be pretty confused about why my
software was running with an incompatible python version (before
adding that PS1) and it took me a few minutes to realize that I had a
completely different PATH.

>
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.17.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
> ________________________
> This email was scanned by Bitdefender
