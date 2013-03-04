From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Mar 2013 21:37:38 +0100
Subject: [Buildroot] [PATCH v2] aircrack-ng: new package
In-Reply-To: <1361213385-27005-1-git-send-email-laurent.cans@gmail.com>
 (Laurent Cans's message of "Mon, 18 Feb 2013 19:49:45 +0100")
References: <1361213385-27005-1-git-send-email-laurent.cans@gmail.com>
Message-ID: <87sj4a9a0d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Laurent" == Laurent Cans <laurent.cans@gmail.com> writes:

 Laurent> Aircrack-ng is a set of tools for auditing wireless security.
 Laurent> Signed-off-by: Laurent Cans <laurent.cans@gmail.com>


 Laurent> ---
 Laurent> Changelog v1 -> v2:
 Laurent>  * Fix misspelling in package dependency
 Laurent>  * Add comment on largefile support needs
 Laurent>  * Use latest stable version instead of svn version
 Laurent>  * Correct license
 Laurent>  * Improve libsql dependency checking and support
 Laurent>  * Pass configure option by environment variable when it is possible
 Laurent>  * Wrap lines at 80 characters
 Laurent>  package/Config.in                  |    1 +
 Laurent>  package/aircrack-ng/Config.in      |   13 +++++++++++
 Laurent>  package/aircrack-ng/aircrack-ng.mk |   43 ++++++++++++++++++++++++++++++++++++
 Laurent>  3 files changed, 57 insertions(+)
 Laurent>  create mode 100644 package/aircrack-ng/Config.in
 Laurent>  create mode 100644 package/aircrack-ng/aircrack-ng.mk

 Laurent> diff --git a/package/Config.in b/package/Config.in
 Laurent> index faee5c3..a055827 100644
 Laurent> --- a/package/Config.in
 Laurent> +++ b/package/Config.in
 Laurent> @@ -611,6 +611,7 @@ source "package/sound-theme-freedesktop/Config.in"
 Laurent>  endmenu
 
 Laurent>  menu "Networking applications"
 Laurent> +source "package/aircrack-ng/Config.in"
 Laurent>  source "package/argus/Config.in"
 Laurent>  source "package/arptables/Config.in"
 Laurent>  source "package/avahi/Config.in"
 Laurent> diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
 Laurent> new file mode 100644
 Laurent> index 0000000..8ff50a8
 Laurent> --- /dev/null
 Laurent> +++ b/package/aircrack-ng/Config.in
 Laurent> @@ -0,0 +1,13 @@
 Laurent> +config BR2_PACKAGE_AIRCRACK_NG
 Laurent> +	bool "aircrack-ng"
 Laurent> +	depends on BR2_LARGEFILE
 Laurent> +	select BR2_PACKAGE_OPENSSL
 Laurent> +	select BR2_PACKAGE_IW

I've added a comment explaining that iw is only a runtime dependency.

 Laurent> +define AIRCRACK_NG_BUILD_CMDS
 Laurent> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)\
 Laurent> +		$(AIRCRACK_NG_MAKE_OPTS) all

I had build errors caused by race conditions, so I've changed all the
MAKE's to MAKE1.

Committed with these changes, thanks.

-- 
Bye, Peter Korsgaard
