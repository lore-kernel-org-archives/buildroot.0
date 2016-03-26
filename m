From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Mar 2016 00:53:01 +0100
Subject: [Buildroot] [PATCH v3] owfs: add sysv init scripts
In-Reply-To: <1458997246-17406-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 26 Mar 2016 14:00:46 +0100")
References: <1458997246-17406-1-git-send-email-arnout@mind.be>
Message-ID: <87oaa0dcf6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > owserver is started unconditionally, but it needs the device(s) to
 > be specified at startup. Therefore a check for non-empty OWSERVER_ARGS
 > is added to the owserver start script.

 > owfs is started only if is built. It will connect to the owserver.
 > It will try to load the fuse module; if fuse is built-in or already
 > loaded, modprobe -q will fail silently. The filesystem will be mounted
 > on /dev/1wire, because it represents the 1-wire slave devices; also,
 > the bundled Debian init scripts mount it there. We have to create that
 > directory in the init script in case of devtmpfs, and we have to create
 > it in the rootfs for static /dev; for simplicity, just do both.

 > Users who want a setup without owserver need to remove the owserver
 > init script post-build and need to give appropriate defaults to owfs.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 > ---
 > v3: Create /dev/1wire for static /dev
 > v2: Suggestions from PeterK:
 >  - prefix variables from defaults file with OWFS_;
 >  - allow defaults file to override the server with other devices;
 >  - add empty definition of OWFS_ARGS, to make it clearer that this
 >    variable can also be used in the defaults file.


 > +++ b/package/owfs/S30owfs
 > @@ -0,0 +1,33 @@
 > +NAME="owfs"
 > +DAEMON="/usr/bin/${NAME}"
 > +PID_F="/run/${NAME}.pid"
 > +OWFS_MOUNTPOINT="/dev/1wire"
 > +OWFS_DEVICES="-s localhost:4304"
 > +OWFS_ARGS=""
 > +
 > +[ -r /etc/default/${NAME} ] && . /etc/default/${NAME}
 > +
 > +case "$1" in
 > +start)
 > +	printf "Starting ${NAME}: "
 > +	# Fuse may be in a module, so try to load it
 > +	modprobe -q fuse && printf "[fuse] "
 > +	mkdir -p ${MOUNTPOINT}

This should be OWFS_MOUNTPOINT.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
