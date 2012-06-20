From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Jun 2012 00:48:32 +0200
Subject: [Buildroot] [PATCH V2] p910nd: Add p910nd lightweight
	printserver
In-Reply-To: <1340040989-19507-1-git-send-email-david.c.purdy@gmail.com>
References: <1340040989-19507-1-git-send-email-david.c.purdy@gmail.com>
Message-ID: <4FE25340.20202@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/18/12 19:36, Dave Purdy wrote:
> Changes since V1:
> 	-p910nd.mk : Fixed source/site, removed need for patch, decrufted.
> 	-S55p910nd initscript: Reworked for start-stop-daemon usage,
> 	 added some basic sanity checks for config-file, lock-dir&  run-dir,
> 	 cleaned up structure and readability, removed cruft,
> 	 changed do_stop so that it scans run-dir for pid-files instead of
> 	 looking at the config file, reworked do_start to ensure that each
> 	 instance of p910nd has its correct/unique process-name and pid-file,
> 	 and added a restart option.
> 	-p910nd.conf : Added clarifying documentation RE format of args/options
> 	-RETESTED: with a fresh rootfs build, with different daemon instances
> 	 (e.g. p9102d), on various devices (e.g. /dev/usb/lp3) - all successful

  Patch changelog is normally put after the Signed-off-by, separated by --- (like
the diffstat).  This way, it is not included when the patch is committed to git.

>
>
> Signed-off-by: Dave Purdy<david.c.purdy@gmail.com>
[snip]
> --- /dev/null
> +++ b/package/p910nd/S55p910nd
> @@ -0,0 +1,76 @@
> +#!/bin/sh
> +#
> +#   /etc/init.d/[S55]p910nd
> +#   initscript to start p910nd printer daemon, with match pid-files and process-names
> +
> +
> +CONFIG=/etc/p910nd.conf
> +RUN_D=/var/run
> +P910ND=/usr/sbin/p910nd
> +SUBSYS=/var/lock/subsys

  I guess this means that the -DLOCKFILE_DIR=... in CFLAGS didn't work?
That's a pity, because I don't really like adding a /tmp/subsys directory...
BTW, the variable is better called LOCK_D similar to RUN_D.

> +
> +# check if /etc/p910nd.conf exists, print message&  exit if it doesn't
> +[ ! -f $CONFIG ]&&  ( echo "The config file /etc/p910nd.conf is missing... exiting now."&&  exit 0 )

  I would remove this test.  stop is still relevant if the config file is missing,
and the test is anyway repeated in do_start.

> +
> +#  description of config line format for /etc/p910nd.conf
> +#  each configuration line must have form
> +#  N  [-b]  -f<printer_device>  , where N is the port number [0|1|2], -b enables bidirectional traffic,
> +#                                 and -f specifies a printer device
> +#
> +#  examples:
> +#  0 -b -f /dev/usb/lp0
> +# (listen on port 9100, with bidirectional traffic, use /dev/usb/lp0, pid-file p9100d.pid)
> +#
> +#  2  -f /dev/usb/lp3
> +# (listen on port 9102, use /dev/usb/lp3, pid-file p9102d.pid)
> +
> +
> +# check if /var/run exists, create it if not
> +[ ! -d $RUN_D ]&&  mkdir -p $RUN_D

  Not really needed; /var/run is in the skeleton (and a symlink to /tmp instead of directory).
Other init scripts (e.g. S01logging) don't have this check.

> +
> +# check if /var/lock/subsys exists, create it if not
> +[ ! -d $SUBSYS ]&&  mkdir -p $SUBSYS
> +
> +do_start() {
> +	[ -f $CONFIG ]&&  ( while read PORT OPTIONS; do
> +   		case "$PORT" in
> +    			""|\#*)
> +     			continue;
> +   		esac
> +		P910XD_PID="p910"$PORT"d.pid"	# create the correct pid-filename, e.g. p9102d.pid
> +		P910ND_ARGS=" $OPTIONS $PORT"
> +		start-stop-daemon -m -p  $RUN_D/$P910XD_PID -S -x $P910ND -- $P910ND_ARGS
> +		echo "starting p910nd with options" $OPTIONS "on port" $PORT "with pid-file" $P910XD_PID

  You don't have to stop the quotes around the variables:
echo "starting p910nd with options $OPTIONS on port $PORT with pid-file $P910XD_PID"

> +   		if [ $? -ne 0 ]; then
> +    			exit 1
> +		fi
> +  	done
> +	)<  $CONFIG
> + 	exit 0
> +}
> +
> +do_stop() {
> +        for PID_F in $RUN_D/p910?d.pid; do
> +                start-stop-daemon -q -K -p $PID_F
> +		rm $PID_F&&  echo "stopping p910nd instance with pid-file" $PID_F

  I would do the echo before sending the kill.  Also it shouldn't depend on
the success of the rm.  BTW, doesn't start-stop-daemon remove the pid file?

> +        done
> +}
[snip]
> +define P910ND_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/p910nd $(TARGET_DIR)/usr/sbin/p910nd
> +	$(INSTALL) -m 0644 -D package/p910nd/p910nd.conf $(TARGET_DIR)/etc/p910nd.conf

  Installation of the configuration file should not be done if it already exists.  In all
likelihood, the user will override the default configuration file with another one that
comes from a custom skeleton, a configuration package, or a post-build script.  In the
first two cases, a rebuild of the p910nd package would remove the user's configuration
file.

  Also, it would be nicer if the order of -D and -m was the same in all install lines.
-m 0644 -D is the order that is usually used.

> +	$(INSTALL) -m 0755 -D package/p910nd/S55p910nd $(TARGET_DIR)/etc/init.d/S55p910nd
> +endef
> +
> +$(eval $(call GENTARGETS))

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
