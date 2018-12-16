From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 15 Dec 2018 20:38:02 -0600
Subject: [Buildroot] [PATCH v2,
 1/1] util-linux: fix build with pkgconf 1.5.3
In-Reply-To: <20181215193756.1597-1-fontaine.fabrice@gmail.com>
References: <20181215193756.1597-1-fontaine.fabrice@gmail.com>
Message-ID: <CANQCQpY3T8Cypd_2hpMFTfOsnGU_6ivD2UBbWSX5DVxi010ENA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice,

On Sat, Dec 15, 2018 at 1:38 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
> paths found in the .pc file. This is correct when the paths refer to
> something in STAGING_DIR (e.g. libdir, includedir), but not when it
> refers to something used for the target.
>
> util-linux uses the completionsdir variable from bash-completions.pc to
> decide where to install things. Since DESTDIR is prepended to the
> install destination, this will end up in the wrong location.
>
> Until a better solution is found in pkgconf, pass the appdefaultdir to
> use explicitly instead of relying on bash-completions.pc.
>
> Fixes:
>  - http://autobuild.buildroot.org/results/caf352a66aa5bd94b93aac39a90b4fa33b39a708
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Tested fix against similar failure
http://autobuild.buildroot.org/results/12b108a6185ab96a0eb509ab0e6fe053e545c77b/

Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>

> ---
> Changes v1 -> v2 (after review of Baruch Siach):
>  - Fix typo in commit log (fwts -> util-linux)
>
>  package/util-linux/util-linux.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index c176d364ce..edbb10d1c8 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -229,6 +229,10 @@ else
>  UTIL_LINUX_CONF_OPTS += --without-audit
>  endif
>
> +ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
> +UTIL_LINUX_CONF_OPTS += --with-bashcompletiondir=/usr/share/bash-completion/completions
> +endif
> +
>  # Install PAM configuration files
>  ifeq ($(BR2_PACKAGE_UTIL_LINUX_SU)$(BR2_PACKAGE_LINUX_PAM),yy)
>  define UTIL_LINUX_INSTALL_PAMFILES
> --
> 2.14.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 

Matthew Weber | Pr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
