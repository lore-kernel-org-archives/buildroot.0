From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 13 Jun 2016 17:51:50 -0400
Subject: [Buildroot] [PATCH v3 1/1] fwup: blanked out MANS to avoid
 running help2man
In-Reply-To: <20160613052640.6977-1-jordan@yelloz.me>
References: <20160613031101.27646-1-jordan@yelloz.me>
 <20160613052640.6977-1-jordan@yelloz.me>
Message-ID: <CA+-urNQTQdVJqimMzBEJG3i7-cAEbvPirPJJZ-+-WZ_fEZ52yQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jordan,

On Mon, Jun 13, 2016 at 1:26 AM, Jordan Yelloz <jordan@yelloz.me> wrote:
> If you have help2man installed, the build system will try to run
> help2man on the target fwup binary which should not be expected to work.
>
> Also, prevented anything but the fwup binary from being installed.
>
> Signed-off-by: Jordan Yelloz <jordan@yelloz.me>
> ---
>  package/fwup/fwup.mk | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
> index 0f857fc..26463e2 100644
> --- a/package/fwup/fwup.mk
> +++ b/package/fwup/fwup.mk
> @@ -10,6 +10,8 @@ FWUP_LICENSE = Apache-2.0
>  FWUP_LICENSE_FILES = LICENSE
>  FWUP_DEPENDENCIES = libconfuse libarchive libsodium
>  FWUP_AUTORECONF = YES
> +FWUP_MAKE_OPTS = MANS=

How about the following for disabling 'help2man'?

# help2man doesn't work when cross compiling
FWUP_CONF_ENV = ac_cv_path_HELP2MAN=''

This is similar to what's done for the torsmo package, and it seems a
little more obvious in purpose.

> +FWUP_INSTALL_TARGET_OPTS = install-exec DESTDIR=$(TARGET_DIR)

The only other file that should be installed is the bash completions
file. That's automatically removed from the target unless you have
bash enabled.

>
>  define FWUP_ADD_M4_DIR
>         mkdir -p $(@D)/m4
> --
> 2.8.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
