From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 25 Mar 2016 23:05:11 +0100
Subject: [Buildroot] [PATCH] owfs: add sysv init scripts
In-Reply-To: <87k2kqffxr.fsf@dell.be.48ers.dk>
References: <1458936050-10660-1-git-send-email-arnout@mind.be>
 <87k2kqffxr.fsf@dell.be.48ers.dk>
Message-ID: <56F5B617.4080605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/25/16 21:41, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
>
>   > owserver is started unconditionally, but it needs the device(s) to
>   > be specified at startup. Therefore a check for non-empty OWSERVER_ARGS
>   > is added to the owserver start script.
>
>   > owfs is started only if is built. It will connect to the owserver.
>   > It will try to load the fuse module; if fuse is built-in or already
>   > loaded, modprobe -q will fail silently.
>
>   > Users who want a setup without owserver need to remove the owserver
>   > init script post-build and need to give appropriate defaults to owfs.
>
>   > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> Looks good, except:
>
>> diff --git a/package/owfs/S30owfs b/package/owfs/S30owfs
>   > new file mode 100755
>   > index 0000000..552eb75
>   > --- /dev/null
>   > +++ b/package/owfs/S30owfs
>   > @@ -0,0 +1,32 @@
>   > +NAME="owfs"
>   > +DAEMON="/usr/bin/${NAME}"
>   > +PID_F="/run/${NAME}.pid"
>   > +MOUNTPOINT="/dev/1wire"
>   > +SERVER="localhost:4304"
>
> I've never used owfs, but /dev/1wire sounds like an odd mount point to
> me. I would have expected something under /mnt?

  /dev/1wire is what is used by the bundled debian init scripts. I didn't use 
the bundled init scripts because they are slightly more complicated than what we 
need and I wanted to add some features, like loading the fuse module.

  /mnt is annoying, because some scripts will (temporarily) mount something on 
/mnt (without subdir), thus hiding anything else mounted there. For example, 
many of our board readme's say to mount /dev/mmcblk0p1 /mnt as part of creating 
the SD card.

  In addition, owfs exports access to devices, so /dev seems like an appropriate 
place. /mnt, to me, is for mounting actual storage filesystems.

  I've also considered /sys/fs which already gets a couple of pseudofilesystems 
mounted on it, and the owfs nodes are a bit similar to sysfs nodes. However, 
/sys/fs really is for metadata of filesystems, not for adding actual devices.

  The contents of owfs really should be in /sys/devices. However, the 
organisation of the owfs tree is not really that similar to the sysfs tree, so 
it's not a great fit either.

  So, taking all of that into account, I chose to stick to the /dev/1wire that 
is also used by the bundled debian init scripts.

>
> Googling around, I see the manual page suggests /mnt/1wire:
>
> http://owfs.org/index.php?page=owfs
>
> You will need to create the mount point during build time though, as
> /mnt might not be writable.

  Oh yeah, another reason to put it on /dev or /sys.

>
> The point of sourcing /etc/default/owfs is so the user can override the
> defaults. How about sticking the MOUNTPOINT / SERVER into a OWFS_ARGS or
> at least prefixing the variables with OWFS?

  Yes, that's a good idea. I'm on it.

  Regards,
  Arnout

>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
