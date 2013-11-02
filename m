From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Nov 2013 11:06:58 +0100
Subject: [Buildroot] Default target file system permissions
In-Reply-To: <1383379999.4041.2.camel@bender>
References: <1383379999.4041.2.camel@bender>
Message-ID: <20131102110658.779bbcb5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sven Neumann,

On Sat, 02 Nov 2013 09:13:19 +0100, Sven Neumann wrote:

> I've been debugging some problems with our buildroot builds lately and
> found them to be caused by too restrictive permissions on the target
> file system. Pretty much all files and directories, unless specified
> explicitly in system/device_table.txt are only readable by the owner
> (root). This causes problems with samba (/var/nmbd not accessible by
> nmbd), dbus services (dbus daemon can not access the service files) and
> so on. Basically only services that are running as root can work
> correctly, because for other users the system is pretty much
> inaccessible. I've come across this mail on the mailing-list which seems
> related, but couldn't find an answer:
> http://buildroot-busybox.2317881.n4.nabble.com/Default-target-file-system-permissions-td39088.html
> I've also tried changing the umask on our buildslaves but that didn't
> help.
> 
> Here's how the root folder on our target file-system looks like: 
> 
> drwxr-xr-x   20 root     root          4096 Dec  7  1999 .
> drwxr-xr-x   20 root     root          4096 Dec  7  1999 ..
> drwx------    2 root     root          4096 Dec  7  1999 bin
> drwxr-xr-x    2 root     root          4096 Nov 30  1999 boot
> drwxr-xr-x    5 root     root          4096 Dec 30  1999 data
> drwxr-xr-x   10 root     root         12600 Dec  7  1999 dev
> drwxr-xr-x   15 root     root          4096 Dec  7  1999 etc
> drwx------    3 root     root          4096 Dec  7  1999 home
> drwx------    4 root     root          4096 Dec  7  1999 lib
> lrwxrwxrwx    1 root     root            11 Oct 31 20:26 linuxrc ->
> bin/busybox
> drwx------    2 root     root          4096 Dec  7  1999 media
> drwx------    2 root     root          4096 Dec  7  1999 mnt
> drwx------    2 root     root          4096 Dec  7  1999 opt
> dr-xr-xr-x   62 root     root             0 Dec  7  1999 proc
> drwx------    2 root     root          4096 Oct 31 22:09 root
> lrwxrwxrwx    1 root     root             3 Oct 31 18:39 run -> tmp
> drwx------    2 root     root          4096 Dec  7  1999 sbin
> dr-xr-xr-x   11 root     root             0 Dec  7  1999 sys
> drwxrwxrwt   12 root     root           800 Oct 31 21:51 tmp
> drwx------    7 root     root          4096 Dec  7  1999 usr
> drwxr-xr-x    7 root     root          4096 Dec  7  1999 var

Interesting, because here I don't have the same behavior:

drwxrwxr-x 2 root root 1420 nov.   1 13:24 bin
drwxr-xr-x 3 root root  100 nov.   1 13:24 dev
drwxr-xr-x 5 root root  500 nov.   1 13:24 etc
drwxrwxr-x 4 root root   80 nov.   1 13:24 home
drwxrwxr-x 2 root root  540 nov.   1 13:24 lib
lrwxrwxrwx 1 root root    3 nov.   1 13:22 lib32 -> lib
lrwxrwxrwx 1 root root   11 nov.   1 13:24 linuxrc -> bin/busybox
drwxrwxr-x 2 root root   40 oct.  27 12:37 media
drwxrwxr-x 2 root root   40 oct.  27 12:37 mnt
drwxrwxr-x 2 root root   40 oct.  27 12:37 opt
drwxrwxr-x 2 root root   40 oct.  27 12:37 proc
drwx------ 2 root root  100 oct.  27 12:37 root
lrwxrwxrwx 1 root root    3 oct.  27 12:37 run -> tmp
drwxrwxr-x 2 root root  940 nov.   1 13:24 sbin
drwxrwxr-x 2 root root   40 oct.  27 12:37 sys
drwxrwxrwt 3 root root   60 nov.   1 13:24 tmp
drwxrwxr-x 6 root root  140 nov.   1 13:24 usr
drwxrwxr-x 4 root root  220 nov.   1 13:24 var

How are the permissions of the directories/files in system/skeleton/ in
your Buildroot sources?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
