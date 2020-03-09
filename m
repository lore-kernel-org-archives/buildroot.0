From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 09 Mar 2020 06:22:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd: add fdisk support
In-Reply-To: <20200308231822.38941-1-james.hilliard1@gmail.com>
References: <20200308231822.38941-1-james.hilliard1@gmail.com>
Message-ID: <87tv2yw420.fsf@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi James,

On Mon, Mar 09 2020, James Hilliard wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/systemd/systemd.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 22165de2c1..526c749191 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -125,6 +125,12 @@ else
>  SYSTEMD_CONF_OPTS += -Dpam=false
>  endif
>
> +ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBFDISK),y)
> +SYSTEMD_CONF_OPTS += -Dfdisk=true
> +else
> +SYSTEMD_CONF_OPTS += -Dfdisk=false

Since BR2_PACKAGE_UTIL_LINUX_BINARIES -> BR2_PACKAGE_UTIL_LINUX_LIBFDISK
is selected, the 'else' part is dead code. I'd rather have
BR2_PACKAGE_SYSTEMD select BR2_PACKAGE_UTIL_LINUX_LIBFDISK directly, and
make -Dfdisk=true unconditional.

baruch

> +endif
> +
>  ifeq ($(BR2_PACKAGE_VALGRIND),y)
>  SYSTEMD_DEPENDENCIES += valgrind
>  SYSTEMD_CONF_OPTS += -Dvalgrind=true


--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
