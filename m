From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 3 Nov 2012 18:21:59 +0100
Subject: [Buildroot] [PATCHv3] QtSerialPort: new package
In-Reply-To: <87y5iiy6pw.fsf@dell.be.48ers.dk>
References: <20121029154949.GA15033@localhost.comm5.com.br>
 <87y5iiy6pw.fsf@dell.be.48ers.dk>
Message-ID: <CAGm1_kuNWVOTovggPq7CEeAJMP_PDGVXYaM+92nw6JfhcY0boA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 3, 2012 at 5:46 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thiago" == Thiago A Correa <thiago.correa@gmail.com> writes:
>
> Hi,
>
>  Thiago> Signed-off-by: Thiago A. Correa <thiago.correa@gmail.com>
>  Thiago> ---
>  Thiago>  package/Config.in                    |    1 +
>  Thiago>  package/qtserialport/Config.in       |   12 +++++++++++
>  Thiago>  package/qtserialport/qtserialport.mk |   35 ++++++++++++++++++++++++++++++++++
>  Thiago>  3 files changed, 48 insertions(+), 0 deletions(-)
>  Thiago>  create mode 100644 package/qtserialport/Config.in
>  Thiago>  create mode 100644 package/qtserialport/qtserialport.mk
>
>  Thiago> diff --git a/package/Config.in b/package/Config.in
>  Thiago> index 331d879..e869c8a 100644
>  Thiago> --- a/package/Config.in
>  Thiago> +++ b/package/Config.in
>  Thiago> @@ -133,6 +133,7 @@ source "package/sdl_gfx/Config.in"
>  Thiago>  comment "other GUIs"
>  Thiago>  source "package/efl/Config.in"
>  Thiago>  source "package/qt/Config.in"
>  Thiago> +source "package/qtserialport/Config.in"

Don't we want to pull all pure Qt libs under "Qt external packages" as
was made with Python packages in Kconfig?

>  Thiago>  source "package/x11r7/Config.in"
>
> Thomas a while ago posted patches for qtextserialport:
>
> http://patchwork.ozlabs.org/patch/162431/
>
> What is the relation between qtserialport and qtextserialport? Do we
> need both?

The situation with serial port libraries under Qt is not so simple as
with Python. I know at least 3 different libraries. So having them all
won't hurt.

>  Thiago> +++ b/package/qtserialport/qtserialport.mk
>  Thiago> @@ -0,0 +1,35 @@
>  Thiago> +#############################################################
>  Thiago> +#
>  Thiago> +# QtSerialPort
>  Thiago> +#
>  Thiago> +#############################################################
>  Thiago> +QTSERIALPORT_VERSION = e831107f468618881e435932c8a42404c1dde13c
>  Thiago> +QTSERIALPORT_SITE = git://gitorious.org/qtplayground/qtserialport.git
>  Thiago> +QTSERIALPORT_LICENSE = LGPLv2
>  Thiago> +QTSERIALPORT_LICENSE_FILES = LICENSE.LGPL
>  Thiago> +QTSERIALPORT_INSTALL_STAGING = YES
>  Thiago> +
>  Thiago> +QTSERIALPORT_DEPENDENCIES = qt udev
>  Thiago> +
>  Thiago> +QTSERIALPORT_LDFLAGS = $(TARGET_LDFLAGS)
>  Thiago> +
>  Thiago> +define QTSERIALPORT_CONFIGURE_CMDS
>  Thiago> +      (cd $(@D); \
>  Thiago> +              $(QT_QMAKE) -recursive CONFIG+=release)
>  Thiago> +endef
>  Thiago> +
>  Thiago> +define QTSERIALPORT_BUILD_CMDS
>  Thiago> +      $(MAKE) -C $(@D)/src
>  Thiago> +endef
>  Thiago> +
>  Thiago> +define QTSERIALPORT_INSTALL_STAGING_CMDS
>  Thiago> +      $(MAKE) -C $(@D)/src install
>  Thiago> +      mv $(HOST_DIR)/usr/include/QtAddOnSerialPort $(STAGING_DIR)/usr/include/
>
> That seems funky. Why is it installing under HOST_DIR in the first
> place?
>
>  Thiago> +endef
>  Thiago> +
>  Thiago> +define QTSERIALPORT_INSTALL_TARGET_CMDS
>  Thiago> +      cp -dpfr $(STAGING_DIR)/usr/lib/libSerialPort.so.* \
>  Thiago> +      $(TARGET_DIR)/usr/lib
>
> Normally we install headers to target as well. Does the makefile install
> target not support DESTDIR?
>
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
