From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Mar 2016 21:41:52 +0100
Subject: [Buildroot] [PATCH] owfs: add sysv init scripts
In-Reply-To: <1458936050-10660-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Fri, 25 Mar 2016 21:00:50 +0100")
References: <1458936050-10660-1-git-send-email-arnout@mind.be>
Message-ID: <87k2kqffxr.fsf@dell.be.48ers.dk>
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
 > loaded, modprobe -q will fail silently.

 > Users who want a setup without owserver need to remove the owserver
 > init script post-build and need to give appropriate defaults to owfs.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Looks good, except:

> diff --git a/package/owfs/S30owfs b/package/owfs/S30owfs
 > new file mode 100755
 > index 0000000..552eb75
 > --- /dev/null
 > +++ b/package/owfs/S30owfs
 > @@ -0,0 +1,32 @@
 > +NAME="owfs"
 > +DAEMON="/usr/bin/${NAME}"
 > +PID_F="/run/${NAME}.pid"
 > +MOUNTPOINT="/dev/1wire"
 > +SERVER="localhost:4304"

I've never used owfs, but /dev/1wire sounds like an odd mount point to
me. I would have expected something under /mnt?

Googling around, I see the manual page suggests /mnt/1wire:

http://owfs.org/index.php?page=owfs

You will need to create the mount point during build time though, as
/mnt might not be writable.

The point of sourcing /etc/default/owfs is so the user can override the
defaults. How about sticking the MOUNTPOINT / SERVER into a OWFS_ARGS or
at least prefixing the variables with OWFS?

-- 
Bye, Peter Korsgaard
