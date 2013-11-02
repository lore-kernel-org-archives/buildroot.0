From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 02 Nov 2013 23:23:49 +0100
Subject: [Buildroot] Default target file system permissions
In-Reply-To: <1383259334.10813.7.camel@bender>
References: <1383259334.10813.7.camel@bender>
Message-ID: <52757B75.2040907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31/10/13 23:42, Sven Neumann wrote:
> Hi,
>
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

  As mentioned in that mail, the problem is that you have a restrictive 
umask set. Therefore, all files that are created by buildroot get this 
umask applied.

  I don't really see a solution. For starters, your filesystem skeleton 
(in system/skeleton) probably already has wrong permissions. So even if 
we'd reset the umask within the buildroot build, the skeleton would still 
be installed with the wrong permissions.

  I think the only thing we can do is to add a faq entry to the 
documentation.

  Regards,
  Arnout


>
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
>
>
> So are the restrictive permissions on the target file-system intentional
> and how I can change this situation?
>
>
> Regards,
> Sven
>
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
