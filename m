From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Jul 2011 15:03:54 +0200
Subject: [Buildroot] [PATCH] inotify-tools: Add new package
In-Reply-To: <1311630415-633-1-git-send-email-mike@mikebwilliams.com> (Mike
 Williams's message of "Mon, 25 Jul 2011 17:46:55 -0400")
References: <1311630415-633-1-git-send-email-mike@mikebwilliams.com>
Message-ID: <87hb6942it.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mike" == Mike Williams <mike@mikebwilliams.com> writes:

 Mike> Adds support for inotify-tools, which are useful for scripting the
 Mike> Linux inotify API.

Thanks, committed with minor tweaks (see below)

 Mike> +++ b/package/inotify-tools/Config.in
 Mike> @@ -0,0 +1,10 @@
 Mike> +config BR2_PACKAGE_INOTIFY_TOOLS
 Mike> +	bool "inotify-tools"
 Mike> +	help
 Mike> +	  inotify-tools is a C library and a set of command-line
 Mike> +	  programs for Linux providing a simple interface to inotify.
 Mike> +	  These programs can be used to monitor and act upon
 Mike> +	  filesystem events. Provides the 'inotifywait' and 'inotifywatch'
 Mike> +		binaries.

Here the build fails with:

inotifytools.c: In function 'inotifytools_watch_recursively_with_exclude':
inotifytools.c:1312: error: storage size of 'my_stat' isn't known
inotifytools.c:1319: warning: implicit declaration of function 'lstat64'
inotifytools.c: In function 'isdir':
inotifytools.c:1598: error: storage size of 'my_stat' isn't known
make[5]: *** [inotifytools.lo] Error 1

So you need largefile support in the toolchain, and the package should
depend on BR2_LARGEFILE.

-- 
Bye, Peter Korsgaard
