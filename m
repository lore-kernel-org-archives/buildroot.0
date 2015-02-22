From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 22:32:15 +0100
Subject: [Buildroot] [PATCH v2] qt-webkit-kiosk: new package
In-Reply-To: <1424578920-21071-1-git-send-email-jerome.oufella@savoirfairelinux.com>
References: <1424497549-8506-1-git-send-email-jerome.oufella@savoirfairelinux.com>
 <1424578920-21071-1-git-send-email-jerome.oufella@savoirfairelinux.com>
Message-ID: <20150222223215.701a0a03@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerome Oufella,

On Sat, 21 Feb 2015 23:22:00 -0500, Jerome Oufella wrote:
> Qt-webkit-kiosk is a simple browser working in kiosk-mode, powered by
> QtWebkit. It provides a convenient way to deploy a full-screen browser
> on embedded system platforms.
> 
> This commit adds the appropriate packaging to Buildroot, including an
> option to deploy the optional sound files.
> 
> Signed-Off-By: Jerome Oufella <jerome.oufella@savoirfairelinux.com>

Thanks for this new iteration.

Signed-Off-By: should be: Signed-off-by: ...

> diff --git a/package/qt-webkit-kiosk/Config.in b/package/qt-webkit-kiosk/Config.in
> new file mode 100644
> index 0000000..dd4b06f
> --- /dev/null
> +++ b/package/qt-webkit-kiosk/Config.in
> @@ -0,0 +1,20 @@
> +config BR2_PACKAGE_QT_WEBKIT_KIOSK
> +	bool "qt-webkit-kiosk"
> +	depends on BR2_PACKAGE_QT5
> +	select BR2_PACKAGE_QT5WEBKIT
> +	select BR2_PACKAGE_QT5MULTIMEDIA

I've done a test build, and there are some missing dependencies here.
You should also:

	select BR2_PACKAGE_QT5BASE_GUI
	select BR2_PACKAGE_QT5BASE_WIDGETS
	select BR2_PACKAGE_OPENSSL

QT5BASE_WIDGETS is not enabled by default, and is needed because
qt-webkit-kiosk uses the "printsupport" and qtwebkit widget modules,
which are only compiled if Qt5 widgets are enabled.

OpenSSL is mandatory because qt-webkit-kiosk uses QSslError
unconditionally.

I would have normally applied the patch myself and do the
proposed changes, but since I haven't had the time to finalize the
review, I thought I would simply point those issues to not forget about
them, so that you can send an updated version.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
