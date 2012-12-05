From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Dec 2012 08:42:00 -0800
Subject: [Buildroot] [PATCH 3/4] linenoise: new package
In-Reply-To: <1354551135-30056-3-git-send-email-francois.perrad@gadz.org>
 (Francois Perrad's message of "Mon, 3 Dec 2012 17:12:13 +0100")
References: <1354551135-30056-1-git-send-email-francois.perrad@gadz.org>
 <1354551135-30056-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <87sj7ka1t3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 Francois> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 Francois> ---
 Francois>  package/Config.in                             |    1 +
 Francois>  package/linenoise/Config.in                   |    6 ++++
 Francois>  package/linenoise/linenoise-get-columns.patch |   17 ++++++++++
 Francois>  package/linenoise/linenoise.mk                |   45 +++++++++++++++++++++++++
 Francois>  4 files changed, 69 insertions(+)
 Francois>  create mode 100644 package/linenoise/Config.in
 Francois>  create mode 100644 package/linenoise/linenoise-get-columns.patch
 Francois>  create mode 100644 package/linenoise/linenoise.mk

 Francois> diff --git a/package/linenoise/linenoise-get-columns.patch b/package/linenoise/linenoise-get-columns.patch
 Francois> new file mode 100644
 Francois> index 0000000..180d1c3
 Francois> --- /dev/null
 Francois> +++ b/package/linenoise/linenoise-get-columns.patch
 Francois> @@ -0,0 +1,17 @@
 Francois> +see http://github.com/antirez/linenoise/pull/31

It would still be good to describe what it does and why.


 Francois> +
 Francois> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 Francois> +
 Francois> +Index: b/linenoise.c
 Francois> +===================================================================
 Francois> +--- a/linenoise.c
 Francois> ++++ b/linenoise.c
 Francois> +@@ -182,7 +182,7 @@
 Francois> + static int getColumns(void) {
 Francois> +     struct winsize ws;
 Francois> + 
 Francois> +-    if (ioctl(1, TIOCGWINSZ, &ws) == -1) return 80;
 Francois> ++    if (ioctl(1, TIOCGWINSZ, &ws) == -1 || ws.ws_col == 0) return 80;
 Francois> +     return ws.ws_col;
 Francois> + }
 Francois> + 
 Francois> diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
 Francois> new file mode 100644
 Francois> index 0000000..e7b6124
 Francois> --- /dev/null
 Francois> +++ b/package/linenoise/linenoise.mk
 Francois> @@ -0,0 +1,45 @@
 Francois> +#############################################################
 Francois> +#
 Francois> +# linenoise
 Francois> +#
 Francois> +#############################################################
 Francois> +LINENOISE_VERSION = g8c9b481
 Francois> +LINENOISE_SITE = http://github.com/antirez/linenoise/tarball/master
 Francois> +LINENOISE_LICENSE = BSD-2c
 Francois> +LINENOISE_INSTALL_STAGING = YES
 Francois> +
 Francois> +define LINENOISE_BUILD_CMDS
 Francois> +	cd $(@D); $(TARGET_CC) $(TARGET_CFLAGS) -c linenoise.c
 Francois> +	cd $(@D); $(TARGET_AR) rcu liblinenoise.a linenoise.o
 Francois> +	cd $(@D); $(TARGET_CC) $(TARGET_CFLAGS) -o linenoise_example example.c -L. -llinenoise

Does it make sense to build and install the example? If it does, it
should also use $(TARGET_LDFLAGS).


-- 
Bye, Peter Korsgaard
