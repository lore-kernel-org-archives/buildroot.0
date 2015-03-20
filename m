From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 23:13:42 +0100
Subject: [Buildroot] [PATCH v4 1/1] tovid: new package
In-Reply-To: <1426701612-14785-1-git-send-email-skenton@ou.edu>
References: <1426701612-14785-1-git-send-email-skenton@ou.edu>
Message-ID: <20150320231342.41bc216c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Kenton,

On Wed, 18 Mar 2015 13:00:12 -0500, Steve Kenton wrote:
> The tovid suite, also known simply as tovid, is a collection of shell
> and Python scripts for creating DVDs and (S)VCDs. It is pronounced
> "to vid" (because it converts to video disc formats).
> 
> Signed-off-by: Steve Kenton <skenton@ou.edu>

Thanks! I think we're almost there! A few remaining comments below.

> diff --git a/package/tovid/0001-manpage.patch b/package/tovid/0001-manpage.patch
> new file mode 100644
> index 0000000..4f73831
> --- /dev/null
> +++ b/package/tovid/0001-manpage.patch
> @@ -0,0 +1,26 @@
> +setup.py: disable man page to kill txt2tags SVN checkout dependency
> +
> +Signed-off-by: Steve Kenton <skenton@ou.edu>
> +
> +--- tovid-3534/setup.py.ori	2015-02-20 22:08:18.590122839 -0600
> ++++ tovid-3534/setup.py	2015-02-20 22:06:05.290120282 -0600
> +@@ -186,7 +186,7 @@ class BuildTovidInit (Command):
> + 
> + # Build tovid-init with regular 'build' command
> + build.sub_commands.append(('build_tovid_init', None))
> +-build.sub_commands.append(('build_docs', None))
> ++#build.sub_commands.append(('build_docs', None))
> + 
> + # The actual setup
> + setup(
> +@@ -244,8 +244,8 @@ setup(
> +             'src/tovid.ini',
> +         ]),
> +         # Manual page
> +-        ('share/man/man1',
> +-         ['docs/man/tovid.1']),
> ++#        ('share/man/man1',
> ++#         ['docs/man/tovid.1']),

Could you simply remove the lines instead of commenting them?

> diff --git a/package/tovid/Config.in b/package/tovid/Config.in
> new file mode 100644
> index 0000000..bb80c99
> --- /dev/null
> +++ b/package/tovid/Config.in
> @@ -0,0 +1,31 @@
> +config BR2_PACKAGE_TOVID
> +	bool "tovid"
> +	depends on BR2_USE_MMU # fork()
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_INET_IPV6 # ffmpeg
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_USE_WCHAR
> +	depends on BR2_LARGEFILE
> +	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps_ng
> +	select BR2_PACKAGE_DVDAUTHOR
> +	select BR2_PACKAGE_DVDRW_TOOLS
> +	select BR2_PACKAGE_FFMPEG
> +	select BR2_PACKAGE_IMAGEMAGICK
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_MJPEGTOOLS
> +	select BR2_PACKAGE_MPLAYER
> +	select BR2_PACKAGE_PROCPS_NG # pgrep and pkill
> +	select BR2_PACKAGE_PYTHON # this is the only build time dependency

From what I've seen, tovid works with both Python and Python 3. So I
think we should adopt the strategy of for example
package/iotop/Config.in: use a depends on. So, I think we should see:

+config BR2_PACKAGE_TOVID
+	bool "tovid"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INET_IPV6 # ffmpeg
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	depends on BR2_LARGEFILE
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	# The below dependencies are runtime dependencies only
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps_ng
+	select BR2_PACKAGE_DVDAUTHOR
+	select BR2_PACKAGE_DVDRW_TOOLS
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_IMAGEMAGICK
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_MJPEGTOOLS
+	select BR2_PACKAGE_MPLAYER
+	select BR2_PACKAGE_PROCPS_NG # pgrep and pkill
+	select BR2_PACKAGE_SOX
> +	help
> +	  The tovid suite, also known simply as tovid, is a collection of shell 
> +	  and Python scripts for creating DVDs and (S)VCDs. It is pronounced 
> +	  "to vid" (because it converts to video disc formats). 
> +
> +	  http://tovid.wikia.com/wiki/Installing_tovid
> +
> +comment "tovid needs a toolchain w/ threads, ipv6, C++, wchar, largefile"
> +	depends on BR2_USE_MMU
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS \
> +		|| !BR2_INET_IPV6 || !BR2_INSTALL_LIBSTDCPP \
> +		|| !BR2_USE_WCHAR || !BR2_LARGEFILE

And here an additional comment:

comment "tovid depends on python or python3"
	depends on !BR2_PACKAGE_PYTHON && !BR2_PACKAGE_PYTHON3

Can you test if tovid effectively works with Python 3 ?

> diff --git a/package/tovid/tovid.mk b/package/tovid/tovid.mk
> new file mode 100644
> index 0000000..259dd90
> --- /dev/null
> +++ b/package/tovid/tovid.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# tovid
> +#
> +################################################################################
> +
> +TOVID_SITE = http://tovid.googlecode.com/svn/trunk/tovid
> +TOVID_SITE_METHOD = svn
> +TOVID_VERSION = 3534
> +TOVID_LICENSE = GPLv2
> +TOVID_LICENSE_FILES = COPYING
> +TOVID_DEPENDENCIES = python

This is not needed, as python-package takes care of adding either
'python' or 'python3' to the dependencies, as needed.

> +TOVID_SETUP_TYPE = distutils
> +
> +$(eval $(python-package))



-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
