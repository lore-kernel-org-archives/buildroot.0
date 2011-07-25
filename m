From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 25 Jul 2011 22:54:13 +0200
Subject: [Buildroot] [PATCH] inotify-tools: Add new package
In-Reply-To: <1311626319-19243-1-git-send-email-mike@mikebwilliams.com> (Mike
 Williams's message of "Mon, 25 Jul 2011 16:38:39 -0400")
References: <1311626319-19243-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <87ei1e13pm.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Williams <mike@mikebwilliams.com> writes:

 Mike> Adds support for inotify-tools, which are useful for scripting the
 Mike> Linux inotify API.

Thanks, see below for a few comments.

First of all, are you aware of busybox's inotifyd? From a quick look it
seems to do more-or-less the same as these.

 Mike> Signed-off-by: Mike Williams <mike@mikebwilliams.com>
 Mike> ---
 Mike>  package/Config.in                      |    1 +
 Mike>  package/inotify-tools/Config.in        |   10 ++++++++++
 Mike>  package/inotify-tools/inotify-tools.mk |   10 ++++++++++
 Mike>  3 files changed, 21 insertions(+), 0 deletions(-)
 Mike>  create mode 100644 package/inotify-tools/Config.in
 Mike>  create mode 100644 package/inotify-tools/inotify-tools.mk

 Mike> diff --git a/package/Config.in b/package/Config.in
 Mike> index 40f523d..b3b93b0 100644
 Mike> --- a/package/Config.in
 Mike> +++ b/package/Config.in
 Mike> @@ -474,6 +474,7 @@ source "package/dash/Config.in"
 Mike>  endif
 Mike>  source "package/dialog/Config.in"
 Mike>  source "package/file/Config.in"
 Mike> +source "package/inotify-tools/Config.in"
 Mike>  source "package/lockfile-progs/Config.in"
 Mike>  source "package/logrotate/Config.in"
 Mike>  source "package/screen/Config.in"
 Mike> diff --git a/package/inotify-tools/Config.in b/package/inotify-tools/Config.in
 Mike> new file mode 100644
 Mike> index 0000000..1e6589d
 Mike> --- /dev/null
 Mike> +++ b/package/inotify-tools/Config.in
 Mike> @@ -0,0 +1,10 @@
 Mike> +config BR2_PACKAGE_INOTIFY_TOOLS
 Mike> +	bool "inotify-tools"
 Mike> +	help
 Mike> +	 inotify-tools is a C library and a set of command-line 
 Mike> +	 programs for Linux providing a simple interface to inotify. 
 Mike> +	 These programs can be used to monitor and act upon filesystem 
 Mike> +	 events.

You're missing a space - Help text should be indented with
<tab><space><space>. You also have a trailing space at the end of each
of the help lines.

 Mike> +
 Mike> +		inotifywait  - wait for changes to files using inotify
 Mike> +		inotifywatch - gather filesystem access statistics using inotify

Please keep help lines <70 chars so they display ok in menuconfig in a
normal 80x24 window - Perhaps skip the extra indentation for these 2
lines?

Please also add an upstream URL here.

 Mike> diff --git a/package/inotify-tools/inotify-tools.mk b/package/inotify-tools/inotify-tools.mk
 Mike> new file mode 100644
 Mike> index 0000000..4ff652c
 Mike> --- /dev/null
 Mike> +++ b/package/inotify-tools/inotify-tools.mk
 Mike> @@ -0,0 +1,10 @@
 Mike> +#############################################################
 Mike> +#
 Mike> +# inotify-utils
 Mike> +# https://github.com/rvoicilas/inotify-tools

Put the url at the end of the help text in Config.in instead.

 Mike> +#############################################################
 Mike> +INOTIFY_TOOLS_VERSION = 3.14
 Mike> +INOTIFY_TOOLS_SOURCE = inotify-tools-$(INOTIFY_TOOLS_VERSION).tar.gz
 Mike> +INOTIFY_TOOLS_SITE = http://github.com/downloads/rvoicilas/inotify-tools/
 Mike> +INOTIFY_TOOLS_INSTALL_TARGET = YES

INSTALL_TARGET is default, so you can drop that - same for _SOURCE as
well.

 Mike> +$(eval $(call AUTOTARGETS,package,inotify-tools))

Otherwise it looks good, thanks. Care to fix and resend?

-- 
Bye, Peter Korsgaard
