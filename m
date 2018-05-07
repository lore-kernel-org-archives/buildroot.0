From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 May 2018 08:45:02 +0200
Subject: [Buildroot] Automatic module loading with mdev is broken?
In-Reply-To: <CAFr9PX=M4VCMcakZsENMXBW8Xi3BcKkrVCTdARu=nCvK-A5ovg@mail.gmail.com>
 (Daniel Palmer's message of "Sun, 6 May 2018 18:46:37 +0900")
References: <CAFr9PX=M4VCMcakZsENMXBW8Xi3BcKkrVCTdARu=nCvK-A5ovg@mail.gmail.com>
Message-ID: <87sh74nevl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Palmer <daniel@0x0f.com> writes:

 > Hi all,
 > I'm trying to get automatic module loading with mdev and it looks like
 > it was broken with this commit
 > b4fc5a180c81689a982d5c595844331684c14f51
 > (https://github.com/buildroot/buildroot/commit/b4fc5a180c81689a982d5c595844331684c14f51)
 > or has maybe regressed?

 > Anyhow the previous version of the line that the commit changed works
 > (the modules I expect to get loaded get loaded).
 > The changed version results in nothing being loaded.

 > I think it's to do with this part "xargs -0 sort -u -z". Sort is
 > taking in the big list of files correctly and sorting them but the
 > result
 > seems to still have new lines in it. So when that is passed to xargs
 > (which is expecting the items to be null terminated) again
 > to run modprobe the module aliases don't match and thus nothing gets loaded.

 > This *works* for me but I'm not sure if it's right:

Hmm, you are right. sort -z means that the lines in the input files
should be zero terminated and not newline terminated in addition to
outputting zero terminated strings.

The lines in modalias files are newline terminated, and not zero, E.G.:

hexdump -C /sys/devices/LNXSYSTM:00/LNXCPU:00/modalias
00000000  61 63 70 69 3a 4c 4e 58  43 50 55 3a 0a           |acpi:LNXCPU:.|

The modalias entries themselves afaik never contains spaces, those can
only happen in the path name to the modalias file (as b4fc5a180c81
showed):

find /sys -name modalias | xargs cat | egrep '[[:space:]]'

So I guess we can just do:

find /sys/ -name modalias -print0 | xargs -0 sort u | xargs modprobe -abq

Can you give that a try? Thanks.


 > diff --git a/package/busybox/S10mdev b/package/busybox/S10mdev
 > index 63ca955b1c..71693e7a9d 100644
 > --- a/package/busybox/S10mdev
 > +++ b/package/busybox/S10mdev
 > @@ -9,7 +9,7 @@ case "$1" in
 >        echo /sbin/mdev >/proc/sys/kernel/hotplug
 >        /sbin/mdev -s
 >        # coldplug modules
 > -       find /sys/ -name modalias -print0 | xargs -0 sort -u -z |
 > xargs -0 modprobe -abq
 > +       find /sys/ -name modalias -print0 | xargs -0 sort -u -z | tr
 > -d '\n' | xargs -0 modprobe -abq
 >        ;;
 >   stop)
 >        ;;

 > Cheers,

 > Daniel
 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
