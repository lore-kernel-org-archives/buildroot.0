From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 10 Oct 2020 11:04:52 -0600
Subject: [Buildroot] [PATCH v2 1/1] package/e2fsprogs: disable e2scrub
In-Reply-To: <1600656534.31411.3.camel@aliyun.com>
References: <1600333425.32426.1.camel@aliyun.com>
 <20200917213935.67fc4894@windsurf.hq.k.grp>
 <1600394250.18560.2.camel@aliyun.com> <20200920211236.GK2422@scaer>
 <1600656534.31411.3.camel@aliyun.com>
Message-ID: <CADvTj4qKpm9OjF=-HchedZYEJLXT7uTuC5NdvYw2xf_TCo8jwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 20, 2020 at 8:49 PM Tian Yuanhao via buildroot
<buildroot@busybox.net> wrote:
>
> e2scrub_all depends on coreutils' readlink. If you use busybox's
> readlink, you will see the following error:
>
>         readlink: invalid option -- 'e'
>
> Embedded systems usually don't install e2scrub, which is useless without
> LVM.
>
> Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/e2fsprogs/e2fsprogs.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> index eb82a55..44413ba 100644
> --- a/package/e2fsprogs/e2fsprogs.mk
> +++ b/package/e2fsprogs/e2fsprogs.mk
> @@ -73,6 +73,10 @@ E2FSPROGS_INSTALL_STAGING_OPTS = \
>         DESTDIR=$(STAGING_DIR) \
>         install-libs
>
> +# Disable e2scrub as we don't need it.
> +E2FSPROGS_MAKE_OPTS = E2SCRUB_DIR=
> +E2FSPROGS_INSTALL_TARGET_OPTS = E2SCRUB_DIR= DESTDIR=$(TARGET_DIR) install
> +
We want to disable e2scrub from running when it will fail but I'm not sure
we should unconditionally disable it for cases when it would function.
Can we make the cron/udev/service installation conditional on e2scrub
dependencies being present.

I think you can disable it from running with these configure options, these
should probably also be conditional and depend on systemd crond and udev
support:
--with-crond-dir=no
--with-udev-rules-dir=no
--with-systemd-unit-dir=no
>  # Package does not build in parallel due to improper make rules
>  define HOST_E2FSPROGS_INSTALL_CMDS
>         $(HOST_MAKE_ENV) $(MAKE1) -C $(@D) install install-libs
> --
> 2.7.4
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
