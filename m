From: Tiju Jacob <jacob_tiju@yahoo.com>
Date: Tue, 15 Apr 2008 17:38:37 +0530 (IST)
Subject: [Buildroot] Mount_filesystem_s3c2440
Message-ID: <854271.68256.qm@web94114.mail.in2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Joe,

> 1. is it really a valid shellscript as set by buildroot?
Yes, It is a valid shell script. It is as follows.

for i in /etc/init.d/S??* ;do

     # Ignore dangling symlinks (if any).
     [ ! -f "$i" ] && continue

     case "$i" in
    *.sh)
        # Source shell script for speed.
        (
        trap - INT QUIT TSTP
        set start
        . $i
        )
        ;;
    *)
        # No sh extension, so fork subprocess.
        $i start
        ;;
    esac
done


> 2. does your inittab really put a getty/shell onto your (pretty unusual) 
> console, e.g. something like:
> ttySAC0::respawn:/sbin/getty -L ttysac0 115200 vt100 (probably)
> near line 30 in the standard buildroot inittab?

No it does not have. And I uncommented the line saying:
ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100
and the output:
.....
registered taskstats version 1
Freeing init memory: 1032K
Can't open /dev/ttyS0: No such device or address
Can't open /dev/ttyS0: No such device or address
Can't open /dev/ttyS0: No such device or address                                                              

Then I added the line:
ttySAC0::respawn:/sbin/getty -L ttySAC0 115200 vt100
and the output:
....
registered taskstats version 1
Freeing init memory: 1032K
Can't open /dev/ttySAC0: No such file or directory
Can't open /dev/ttySAC0: No such file or directory
Can't open /dev/ttySAC0: No such file or directory 

> 3. what happens if you give init=/bin/sh as a kernel parameter?
Same output.

What do I do to redirect the console to ttySAC0? I think that is the problem, right?

Thanks in advance.
Tiju




      Check out the all-new face of Yahoo! India. Go to http://in.yahoo.com/
