From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Sun, 20 Feb 2011 13:59:31 +0100
Subject: [Buildroot] device_table question
In-Reply-To: <9AC3F0E75060224C8BBC5BA2DDC8853A1F559B74@EXV1.corp.adtran.com>
References: <9AC3F0E75060224C8BBC5BA2DDC8853A1F559B74@EXV1.corp.adtran.com>
Message-ID: <AANLkTimh-oHKjexs3L7Ag1-x=R_E+Ha11kkHw4xJLh5-@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Feb 18, 2011 at 5:59 PM, ANDY KENNEDY <ANDY.KENNEDY@adtran.com> wrote:
> the comment:
>
> #<name> <type> <mode> <uid> <gid> <major> <minor> <start> <inc> <count>
>
> implies to me that if I want the device nodes:
>
> crwxrwxrwx 1 root root 254, ?0 2010-12-22 23:27 mydev1
> crwxrwxrwx 1 root root 254, ?1 2010-12-22 23:27 mydev2
> crwxrwxrwx 1 root root 254, ?2 2010-12-22 23:27 mydev3
>
>
> I should be able to create an entry in the file along the lines of:
>
> mydev ? ?c ? ? ?666 ? ?0 ? ? ? ? ? 254 ? ? 0 ? ? ? ?1 ? ? ?1 ? ? 24
>
> My assumption is:
>
> Name = base name of the device
> Type = type of file (char special)
> mode = permissions
> uid ?= owner of the file
> gid ?= group associated with the file
> major= Device major number
> minor= Start of the minor numbers (in this case minor 0 = mydev1)
> start= Start of the named numbers (in this case mydev1)
> inc ?= iteration of both minor numbers and named numbers
> count= how many device to make.
>
> FYI I have tried it this way as well as
>
> mydev ? ?c ? ? ?666 ? ?0 ? ? ? ? ? 254 ? ? 1 ? ? ? ?0 ? ? ?1 ? ? 24
>
> What I end up with is
>
> crwxrwxrwx 1 root root 254, ?0 2010-12-22 23:27 mydev0
> crwxrwxrwx 1 root root 254, ?1 2010-12-22 23:27 mydev1
> crwxrwxrwx 1 root root 254, ?2 2010-12-22 23:27 mydev2
>
> Which is undesirable for me.
>
> Question: ?Are my expectations wrong are is fakeroot/make_devs
> wrong?

I tried your scenario with the following device table line:

/dev/mybetterdev         c       640     0       0       230     0
  1       1       10

which resulted in:

crw-r----- 1 root root 230, 0 2011-02-20 10:42 /mnt/dev/mybetterdev1
crw-r----- 1 root root 230, 1 2011-02-20 10:42 /mnt/dev/mybetterdev2
crw-r----- 1 root root 230, 2 2011-02-20 10:42 /mnt/dev/mybetterdev3
crw-r----- 1 root root 230, 3 2011-02-20 10:42 /mnt/dev/mybetterdev4
crw-r----- 1 root root 230, 4 2011-02-20 10:42 /mnt/dev/mybetterdev5
crw-r----- 1 root root 230, 5 2011-02-20 10:42 /mnt/dev/mybetterdev6
crw-r----- 1 root root 230, 6 2011-02-20 10:42 /mnt/dev/mybetterdev7
crw-r----- 1 root root 230, 7 2011-02-20 10:42 /mnt/dev/mybetterdev8
crw-r----- 1 root root 230, 8 2011-02-20 10:42 /mnt/dev/mybetterdev9

This is what you wanted, right?

Note that you seem to have forgotten one field in your device table
lines: I count only 9 fields, while you should have 10 (or is this a
typeover mistake?)

The above was tested with Buildroot 2010.05.

Best regards,
Thomas
