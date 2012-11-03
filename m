From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 Nov 2012 17:46:51 +0100
Subject: [Buildroot] [PATCHv3] QtSerialPort: new package
In-Reply-To: <20121029154949.GA15033@localhost.comm5.com.br> (Thiago
 A. Correa's message of "Mon, 29 Oct 2012 13:49:49 -0200")
References: <20121029154949.GA15033@localhost.comm5.com.br>
Message-ID: <87y5iiy6pw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Correa <thiago.correa@gmail.com> writes:

Hi,

 Thiago> Signed-off-by: Thiago A. Correa <thiago.correa@gmail.com>
 Thiago> ---
 Thiago>  package/Config.in                    |    1 +
 Thiago>  package/qtserialport/Config.in       |   12 +++++++++++
 Thiago>  package/qtserialport/qtserialport.mk |   35 ++++++++++++++++++++++++++++++++++
 Thiago>  3 files changed, 48 insertions(+), 0 deletions(-)
 Thiago>  create mode 100644 package/qtserialport/Config.in
 Thiago>  create mode 100644 package/qtserialport/qtserialport.mk

 Thiago> diff --git a/package/Config.in b/package/Config.in
 Thiago> index 331d879..e869c8a 100644
 Thiago> --- a/package/Config.in
 Thiago> +++ b/package/Config.in
 Thiago> @@ -133,6 +133,7 @@ source "package/sdl_gfx/Config.in"
 Thiago>  comment "other GUIs"
 Thiago>  source "package/efl/Config.in"
 Thiago>  source "package/qt/Config.in"
 Thiago> +source "package/qtserialport/Config.in"
 Thiago>  source "package/x11r7/Config.in"

Thomas a while ago posted patches for qtextserialport:

http://patchwork.ozlabs.org/patch/162431/

What is the relation between qtserialport and qtextserialport? Do we
need both?

 Thiago> +++ b/package/qtserialport/qtserialport.mk
 Thiago> @@ -0,0 +1,35 @@
 Thiago> +#############################################################
 Thiago> +#
 Thiago> +# QtSerialPort 
 Thiago> +#
 Thiago> +#############################################################
 Thiago> +QTSERIALPORT_VERSION = e831107f468618881e435932c8a42404c1dde13c
 Thiago> +QTSERIALPORT_SITE = git://gitorious.org/qtplayground/qtserialport.git
 Thiago> +QTSERIALPORT_LICENSE = LGPLv2
 Thiago> +QTSERIALPORT_LICENSE_FILES = LICENSE.LGPL
 Thiago> +QTSERIALPORT_INSTALL_STAGING = YES
 Thiago> +
 Thiago> +QTSERIALPORT_DEPENDENCIES = qt udev
 Thiago> +
 Thiago> +QTSERIALPORT_LDFLAGS = $(TARGET_LDFLAGS)
 Thiago> +
 Thiago> +define QTSERIALPORT_CONFIGURE_CMDS
 Thiago> +	(cd $(@D); \
 Thiago> +		$(QT_QMAKE) -recursive CONFIG+=release)
 Thiago> +endef
 Thiago> +
 Thiago> +define QTSERIALPORT_BUILD_CMDS
 Thiago> +	$(MAKE) -C $(@D)/src
 Thiago> +endef
 Thiago> +
 Thiago> +define QTSERIALPORT_INSTALL_STAGING_CMDS
 Thiago> +	$(MAKE) -C $(@D)/src install
 Thiago> +	mv $(HOST_DIR)/usr/include/QtAddOnSerialPort $(STAGING_DIR)/usr/include/

That seems funky. Why is it installing under HOST_DIR in the first
place?

 Thiago> +endef
 Thiago> +
 Thiago> +define QTSERIALPORT_INSTALL_TARGET_CMDS
 Thiago> +	cp -dpfr $(STAGING_DIR)/usr/lib/libSerialPort.so.* \
 Thiago> +	$(TARGET_DIR)/usr/lib

Normally we install headers to target as well. Does the makefile install
target not support DESTDIR?

-- 
Bye, Peter Korsgaard
