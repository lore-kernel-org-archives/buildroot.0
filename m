From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 02 Apr 2011 22:48:45 +0200
Subject: [Buildroot] [PATCH 1/2] qt: fix plugin installation and change
	plugin path
In-Reply-To: <5dc3f963b1e5b12f9a5bb7bf4972619bce18371e.1301763163.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Sat, 2 Apr 2011 18:52:51 +0200")
References: <cover.1301763163.git.thomas.petazzoni@free-electrons.com>
	<cover.1301763163.git.thomas.petazzoni@free-electrons.com>
	<5dc3f963b1e5b12f9a5bb7bf4972619bce18371e.1301763163.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87vcywz8eq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Since the conversion of Qt to GENTARGETS in
 Thomas> 421cda1fd078f5fa7902f05bd1d2021fd101d9ea, plugin installation could
 Thomas> break in some situations, for example if SQL support was enabled, but
 Thomas> without any SQL driver: the sql plugin directory doesn't exist, but
 Thomas> our qt.mk wanted to copy it.

 Thomas> This patches simplifies the plugin handling a bit, and basically
 Thomas> copies all Qt plugins installed in the $(STAGING_DIR) to the
 Thomas> $(TARGET_DIR), assuming Qt has only built and installed the needed
 Thomas> plugins.

 Thomas> Moreover, instead of installing plugins to usr/plugins, which is a odd
 Thomas> location, we install them in usr/lib/qt/plugins. This requires a small
 Thomas> patch to Qt ./configure script so that even when -hostprefix is used,
 Thomas> the -plugindir option is taken into account.

Thanks! See below for a potential problem though.


 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/qt/qt-4.7.2-configure.patch |   48 +++++++++++++++++++++++++++++++++++
 Thomas>  package/qt/qt.mk                    |   13 +++------
 Thomas>  2 files changed, 52 insertions(+), 9 deletions(-)
 Thomas>  create mode 100644 package/qt/qt-4.7.2-configure.patch

 Thomas> diff --git a/package/qt/qt-4.7.2-configure.patch b/package/qt/qt-4.7.2-configure.patch
 Thomas> new file mode 100644
 Thomas> index 0000000..cef53e3
 Thomas> --- /dev/null
 Thomas> +++ b/package/qt/qt-4.7.2-configure.patch
 Thomas> @@ -0,0 +1,48 @@
 Thomas> +Fix -hostprefix behaviour

Have you sent this patch upstream?

 
 Thomas>  # Plugin installation
 Thomas>  define QT_INSTALL_TARGET_PLUGINS
 Thomas> -	for plugin in $(QT_INSTALL_PLUGINS); do \
 Thomas> -		mkdir -p $(TARGET_DIR)/usr/plugins ; \
 Thomas> -		cp -dpfr $(STAGING_DIR)/usr/plugins/$$plugin $(TARGET_DIR)/usr/plugins/; \
 Thomas> -	done
 Thomas> +	mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins
 Thomas> +	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins

Doesn't this break if there aren't any plugins? E.G. perhaps with a
static qt build?

-- 
Bye, Peter Korsgaard
