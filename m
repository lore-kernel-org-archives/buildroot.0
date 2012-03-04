From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 4 Mar 2012 16:13:47 +0100
Subject: [Buildroot] [PATCHv2] qt: Add option to build and install tools
	on the target
In-Reply-To: <1330830287-1502-1-git-send-email-ismael.luceno@gmail.com>
References: <1330830287-1502-1-git-send-email-ismael.luceno@gmail.com>
Message-ID: <201203041613.48008.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 04 March 2012 04:04:47 Ismael Luceno wrote:
> 
> Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 A few comments below, but nothing critical.

> ---
>  package/qt/Config.in |   23 +++++++++++++++++++++++
>  package/qt/qt.mk     |   10 ++++++++++
>  2 files changed, 33 insertions(+), 0 deletions(-)
> 
> diff --git a/package/qt/Config.in b/package/qt/Config.in
> index 3a552d0..e2c7400 100644
> --- a/package/qt/Config.in
> +++ b/package/qt/Config.in
> @@ -16,6 +16,29 @@ config BR2_PACKAGE_QT_DEBUG
>  	help
>  	  If unsure, say N.
>  
> +menuconfig BR2_PACKAGE_QT_TOOLS
> +	bool "Compile and install tools"
> +	depends on BR2_PACKAGE_QT_SQL_MODULE && BR2_PACKAGE_QT_GUI_MODULE

 This is annoying...  SQL is only needed for assistant and designer, not
for qtconfig or qmlplugindump.  Is there a possibility to tell qt to just
build the selected tools?  That probably requires hacking 
tools/tools.pro...

 Maybe add to the help text of the comment, that sql isn't actually 
needed except for building.


> +
> +if BR2_PACKAGE_QT_TOOLS
> +
> +config BR2_PACKAGE_QT_TOOLS_QTCONFIG
> +       bool "qtconfig"
> +       depends on BR2_PACKAGE_QT_GUI_X11

 Doesn't qtconfig work in qws?


[snip]
> @@ -514,6 +520,9 @@ endef
>  
>  QT_INSTALL_LIBS    += QtCore
>  QT_HOST_PROGRAMS   += moc rcc qmake lrelease
> +QT_TARGET_PROGRAMS += $(if $(BR2_PACKAGE_QT_TOOLS_QTCONFIG),qtconfig) \
> +		      $(if $(BR2_PACKAGE_QT_TOOLS_QMLVIEWER),qmlviewer) \
> +		      $(if $(BR2_PACKAGE_QT_TOOLS_QMLPLUGINDUMP),qmlplugindump)

 Personally, I prefer the
QT_TARGET_PROGRAMS-$(BR2_PACKAGE_QT_TOOLS_QTCONFIG) += qtconfig
approach, but that's a matter of taste I guess.

>  
>  ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
>  QT_INSTALL_LIBS    += QtGui
> @@ -583,6 +592,7 @@ define QT_INSTALL_STAGING_CMDS
>  	$(MAKE) -C $(@D) install
>  	mkdir -p $(HOST_DIR)/usr/bin
>  	mv $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_HOST_PROGRAMS)) $(HOST_DIR)/usr/bin
> +	mv $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_TARGET_PROGRAMS)) $(TARGET_DIR)/usr/bin

 (so that would mean putting $(QT_TARGET_PROGRAMS-y) here)

>  	rm -rf $(HOST_DIR)/usr/mkspecs
>  	mv $(STAGING_DIR)/usr/mkspecs $(HOST_DIR)/usr
>  	$(QT_INSTALL_QT_CONF)
> 


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
