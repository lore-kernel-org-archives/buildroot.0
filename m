From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 12 Nov 2018 08:42:29 -0600
Subject: [Buildroot] [PATCH] libsemanage: define installation location
 of semanage.conf for host
In-Reply-To: <20181109215730.30795-1-thomas.petazzoni@bootlin.com>
References: <20181109215730.30795-1-thomas.petazzoni@bootlin.com>
Message-ID: <CANQCQpa5Nf1WBvX5dNo9_kxBHK5fps0nKzjv2KZEF=OTrUMKiA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


On Fri, Nov 9, 2018 at 3:57 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> When /etc/selinux/semanage.conf does not exist, libsemanage tries to
> overwrite it. For the target package, it works fine because $(DESTDIR)
> is taken into account.
>
> However, for the host package, $(DESTDIR) is empty, and the location
> used for /etc/selinux/semanage.conf is not affected by $(PREFIX). This
> causes host-libsemanage to try to install /etc/selinux/semanage.conf,
> which obviously fails with:
>
>   test -f /etc/selinux/semanage.conf || install -m 644 -D semanage.conf /etc/selinux/semanage.conf
>   install: cannot create directory '/etc/selinux': Permission denied
>
> To fix this, this commit passes DEFAULT_SEMANAGE_CONF_LOCATION in the
> make options when building/installing host-libsemanage, providing a
> path to semanage.conf that Buildroot can write to.
>
> Fixes:
>
>   http://autobuild.buildroot.net/results/cd27e3c66274622d0c3dd5a601a36efb1bc45011/
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>

> ---
>  package/libsemanage/libsemanage.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
> index d554a33356..bbde50f49f 100644
> --- a/package/libsemanage/libsemanage.mk
> +++ b/package/libsemanage/libsemanage.mk
> @@ -31,7 +31,8 @@ HOST_LIBSEMANAGE_DEPENDENCIES = host-bison host-audit host-libsepol host-libseli
>  HOST_LIBSEMANAGE_MAKE_OPTS += \
>         $(HOST_CONFIGURE_OPTS) \
>         PREFIX=$(HOST_DIR) \
> -       SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/"
> +       SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/" \
> +       DEFAULT_SEMANAGE_CONF_LOCATION=$(HOST_DIR)/etc/selinux/semanage.conf
>
>  ifeq ($(BR2_PACKAGE_PYTHON3),y)
>  HOST_LIBSEMANAGE_DEPENDENCIES += host-python3
> --
> 2.14.5
>


--
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / RC Linux Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
