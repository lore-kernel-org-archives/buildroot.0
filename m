From: Ed Sutter <ed.sutter@alcatel-lucent.com>
Date: Wed, 08 Jan 2014 08:31:44 -0500
Subject: [Buildroot] command line regular expression substitution fails
In-Reply-To: <CAOkaJuVFmrrfda=vG-+06vJp7_jJvhnCAzJy8RJKZ8BxE6XKWA@mail.gmail.com>
References: <52CC7292.306@alcatel-lucent.com>
 <CAOkaJuVFmrrfda=vG-+06vJp7_jJvhnCAzJy8RJKZ8BxE6XKWA@mail.gmail.com>
Message-ID: <52CD5340.2090200@alcatel-lucent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,
Thanks, I rebuilt my rootfs starting from scratch (just to make sure I 
didn't accidentally
change something in .config).  Problem persists...
Verbosely here are the changes I made:
$ make menuconfig...
#   Target ARM (Little-Endian)
#   Target Cortex A-9
#   Under toolchain:
#       External
#       Sourcery Codebench ARM 2013.05
#       Downloaded and installed
#   Under System Configuration, chose ttymxc0 as the Port to run a getty 
(login prompt) on,
#   Under Target Packages->Filesystem and Flash utilities: enable 
dosfstools and e2fsprogs
#   Under Filesystem Images, selected Output cpio - gzipped; tar the 
root filesystem
$ make busybox-menuconfig...
#    Linux System Utilities ---> [*] fdisk

The iMX6 is a Cortex A9; however, looking at my notes, I see that the 
instructions
I got this from say to use Cortex A8.  When I make that one change, this 
problem goes away...
How is it that changing from A9 (valid for iMX6) to A8 would affect 
command line regular
expression parsing?
Ed

> Hi Ed,
>
> I've run into this issue on a different SOC. In my case the problem 
> was my target architecture variant was set to one newer than what my 
> cpu actually was.
>
> I stopped looking into the problem after I discovered this, so I don't 
> have a good understanding of *why* it failed in this manner.
>
> If you can send the buildroot config and more details about your SOC 
> that might help.
>
> Good luck,
>
> -psanford
>
>
> On Tue, Jan 7, 2014 at 1:33 PM, Ed Sutter 
> <ed.sutter at alcatel-lucent.com <mailto:ed.sutter@alcatel-lucent.com>> 
> wrote:
>
>     Hi,
>     I'm using buildroot for the first time to set up rootfs on an iMX6
>     based platform.  I've been debugging a startup issue and just realized
>     that the the line...
>
>     >
>     >for i in /etc/init.d/S??* ;do
>     >
>     in /etc/init.d/rcS is failing because "S??*" is not being replaced by
>     the files that match that expression.  Then I just tried doing
>     something
>     simple on the command line...
>
>     >
>     >#  ls /bin/m*
>     >ls: /bin/m* : No such file or directory
>     >
>
>     and I see that fails as well.  I'm guessing this is some kind of
>     busybox
>     configuration (regex/readline/etc..) issue, but since I got it all
>     through buildroot,
>     I figured I'd try here first.
>     Any ideas?
>     Thanks in advance,
>     Ed
>
>
>     _______________________________________________
>     buildroot mailing list
>     buildroot at busybox.net <mailto:buildroot@busybox.net>
>     http://lists.busybox.net/mailman/listinfo/buildroot
>
>
