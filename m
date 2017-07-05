From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Jul 2017 10:59:40 +0200
Subject: [Buildroot] [PATCH v6 10/10] package/qt5base: provide "qt.conf"
 to make "qmake" relocatable
In-Reply-To: <1499185359-8293-11-git-send-email-wg@grandegger.com>
References: <1499185359-8293-1-git-send-email-wg@grandegger.com>
 <1499185359-8293-11-git-send-email-wg@grandegger.com>
Message-ID: <ccd502d6-648b-7a9d-1d64-6e14eb90196f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Wolfgang,

On 04-07-17 18:22, Wolfgang Grandegger wrote:
> The file "qt.conf" can be used to override the hard-coded paths that are
> compiled into the Qt library. We need it to make "qmake" relocatable.

 All qt5 packages are failing because of this, e.g.
http://autobuild.buildroot.net/results/33e/33eb7b7ef7d232bed2432d1d44fd80a4fc8c4e2d

qt5serialport: installs files in
/accts/mlweber1/instance-2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot//accts/mlweber1/instance-2/output


 Can you have a look?

 Regards,
 Arnout

> 
> CC: Julien Corjon <corjon.j@ecagroup.com>
> CC: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
> ---
>  package/qt5/qt5base/qt.conf.in | 6 ++++++
>  package/qt5/qt5base/qt5base.mk | 8 ++++++++
>  2 files changed, 14 insertions(+)
>  create mode 100644 package/qt5/qt5base/qt.conf.in
> 
> diff --git a/package/qt5/qt5base/qt.conf.in b/package/qt5/qt5base/qt.conf.in
> new file mode 100644
> index 0000000..48e4b92
> --- /dev/null
> +++ b/package/qt5/qt5base/qt.conf.in
> @@ -0,0 +1,6 @@
> +[Paths]
> +Prefix=@@HOST_DIR@@/usr
> +Sysroot=@@STAGING_DIR@@
> +Headers=/usr/include/qt5
> +Plugins=/usr/lib/qt/plugins
> +Examples=/usr/lib/qt/examples
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 5fe8bb8..883850b 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -258,9 +258,17 @@ define QT5BASE_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
>  endef
>  
> +# The file "qt.conf" can be used to override the hard-coded paths that are
> +# compiled into the Qt library. We need it to make "qmake" relocatable.
> +define QT5BASE_INSTALL_QT_CONF
> +	sed -e "s\\@@HOST_DIR@@\\$(HOST_DIR)\\" -e "s\\@@STAGING_DIR@@\\$(STAGING_DIR)\\" \
> +		$(QT5BASE_PKGDIR)/qt.conf.in > $(HOST_DIR)/usr/bin/qt.conf
> +endef
> +
>  define QT5BASE_INSTALL_STAGING_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
>  	$(QT5_LA_PRL_FILES_FIXUP)
> +	$(QT5BASE_INSTALL_QT_CONF)
>  endef
>  
>  define QT5BASE_INSTALL_TARGET_LIBS
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
