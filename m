From: Belisko Marek <marek.belisko@gmail.com>
Date: Sun, 3 Feb 2013 21:44:23 +0100
Subject: [Buildroot] [PATCH v2 5/6] lvm2: Compile and install
	application library.
In-Reply-To: <878v755vj5.fsf@dell.be.48ers.dk>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
 <1357591399-3566-6-git-send-email-marek.belisko@open-nandra.com>
 <878v755vj5.fsf@dell.be.48ers.dk>
Message-ID: <CAAfyv3429jDJubewvPwB6ePtJa96h1sKq0MT0jqJg+KSAAK4fQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sun, Feb 3, 2013 at 3:20 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Marek" == Marek Belisko <marek.belisko@open-nandra.com> writes:
>
>  Marek> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
>  Marek> ---
>  Marek>  package/lvm2/Config.in |    6 ++++++
>  Marek>  package/lvm2/lvm2.mk   |    8 +++++++-
>  Marek>  2 files changed, 13 insertions(+), 1 deletion(-)
>
>  Marek> diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
>  Marek> index 30af14e..bb41c0a 100644
>  Marek> --- a/package/lvm2/Config.in
>  Marek> +++ b/package/lvm2/Config.in
>  Marek> @@ -21,5 +21,11 @@ config BR2_PACKAGE_LVM2_DMSETUP_ONLY
>  Marek>         help
>  Marek>           Install dmsetup only and skip the LVM2 suite.
>
>  Marek> +config BR2_PACKAGE_LVM2_APP_LIBRARY
>  Marek> +       bool "install application library"
>
> This option doesn't make much sense in combination with DMSETUP_ONLY, so
> I've made it depend on !DMSETUP_ONLY
This patch was from v2 and was dropped in v3 because it wasn't necessary.
Please see http://lists.busybox.net/pipermail/buildroot/2013-January/065740.html
I've tested it also with fresh build and it was working without this patch.
>
>
>  Marek> +       depends on BR2_PACKAGE_LVM2
>  Marek> +       help
>  Marek> +         Install application library (liblvm2app2).
>  Marek> +
>  Marek>  comment "lvm2 requires a toolchain with LARGEFILE support"
>  Marek>          depends on !BR2_LARGEFILE
>  Marek> diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
>  Marek> index f54caa4..213ef65 100644
>  Marek> --- a/package/lvm2/lvm2.mk
>  Marek> +++ b/package/lvm2/lvm2.mk
>  Marek> @@ -21,7 +21,7 @@ LVM2_BINS = \
>
>  Marek>  # Make sure that binaries and libraries are installed with write
>  Marek>  # permissions for the owner.
>  Marek> -LVM2_CONF_OPT += --enable-write_install --enable-pkgconfig
>  Marek> +LVM2_CONF_OPT += --enable-write_install --enable-pkgconfig --enable-applib
>
> We should only enable it if _APP_LIBRARY is enabled.
>
>
>
>  Marek>  # LVM2 uses autoconf, but not automake, and the build system does not
>  Marek>  # take into account the CC passed at configure time.
>  Marek> @@ -41,6 +41,12 @@ LVM2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install_device-mapper
>  Marek>  LVM2_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install_device-mapper
>  Marek>  endif
>
>  Marek> +ifeq ($(BR2_PACKAGE_LVM2_APP_LIBRARY),y)
>  Marek> +LVM2_MAKE_OPT += liblvm
>  Marek> +LVM2_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
>  Marek> +LVM2_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
>
> And then this isn't needed.
>
> Committed with these fixes, thanks.
>
> --
> Bye, Peter Korsgaard

Thanks,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
