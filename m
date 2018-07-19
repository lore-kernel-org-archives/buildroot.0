From: Joel Carlson <joelsoncarl@gmail.com>
Date: Thu, 19 Jul 2018 13:21:26 -0600
Subject: [Buildroot] SSH and Root password
In-Reply-To: <HE1P18901MB009072FE239C572F867E48B797520@HE1P18901MB0090.EURP189.PROD.OUTLOOK.COM>
References: <HE1P18901MB00900DF3E3D543020508F21E97520@HE1P18901MB0090.EURP189.PROD.OUTLOOK.COM>
 <CAAjKBV818djjEi8KPipD3i7Us1WHmB62=qzYFnn+c1FFiMLbPw@mail.gmail.com>
 <HE1P18901MB009072FE239C572F867E48B797520@HE1P18901MB0090.EURP189.PROD.OUTLOOK.COM>
Message-ID: <CAAjKBV_nhD85iOE0h-tKFAygJbu47oA8H92g3_xiA_Fo+_o08A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mahin,

Try to remember to "reply all" so the mailing list gets included. =)
Also, they prefer on these lists if you reply to things immediately
after the quoted reply text (you can snip out unnecessary chunks),
rather than "top-posting" the reply.

On Thu, Jul 19, 2018 at 12:46 PM, Mahin Hannan <Mahin.hannan@outlook.com> wrote:
> Hi,
>
> OpenSSH works, I can get it up but can't log in. It says my password is
> incorrect.
>
> How did you go through your method? It's good to mention that the board I am
> working with has no display output and I don't have a serial cable at hand.

If you have a serial port available, I'd highly recommend acquiring a
cable so you can get on the system to see what it is doing.

As for my own board, I'm pretty sure the only relevant parts are:
1. My defconfig contains:
BR2_PACKAGE_OPENSSH=y
and
BR2_TARGET_GENERIC_ROOT_PASSWD="my_root_password"

2. My defconfig also contains:
BR2_ROOTFS_OVERLAY="/path/to/my/rootfs_overlay_directory"
and
BR2_ROOTFS_DEVICE_TABLE="/path/to/my/rootfs_overlay_permissions.txt"

3. I have a file
/path/to/my/rootfs_overlay_directory/etc/ssh/sshd_config which
contains (among some other things) "PermitRootLogin yes"
My /path/to/my/rootfs_overlay_permissions.txt file sets appropriate
permissions for the sshd_config file.

For more on the rootfs overlay and file permissions, see the buildroot manual:
https://buildroot.org/downloads/manual/manual.html#rootfs-custom
(about rootfs overlays)
and
https://buildroot.org/downloads/manual/manual.html#makedev-syntax
(syntax for the permissions file)

I think that is all the relevant configuration I needed to be able to
ssh in as root.

Debugging Ideas:
1. get a serial cable so you can see what's happening on the board
2. See if there is already an "sshd_config" file somewhere in your
generated root filesystem, and check what is in it.  I am not an
expert on the various configuration options, but I know you will need
to have an uncommented line with "PermitRootLogin yes" (the default
sshd_config included with openssh does set this).
3. Try your same defconfig except from a more recent version of
buildroot.  I'm branched off of v2018.05 myself, so I can vouch that
ssh root login should work. "-rc3" is the version right before the
final release of v2018.05. Try v2018.05 or even from master.
4. If none of that helps, try posting your entire defconfig back here
to the mailing list.  Maybe someone out there with an Orange Pi Zero
can replicate your build and see if they have the same problem. I
don't have such a board, so I don't think I can help much more if we
get to this point.

Good luck!

>
> Thanks
> ________________________________
> From: Joel Carlson <joelsoncarl@gmail.com>
> Sent: 19 July 2018 19:43:15
> To: Mahin Hannan
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] SSH and Root password
>
> Hello Mahin,
>
> On Thu, Jul 19, 2018 at 12:12 PM, Mahin Hannan <Mahin.hannan@outlook.com>
> wrote:
>> Hi,
>>
>> I am using ver. 2018.05-rc3 for an Orange Pi Zero board.
>>
>> I used the configurations that came with buildroot and added; OpenSSH and
>> root password was added. I also tried using dropbear instead of the
>> former.
>>
>> The issue is, I can't log into the board via SSH because my password is
>> incorrect.
>>
>> I've read the other mailing list queries and followed the given solutions,
>> but it doesn't work.
>>
>> How do I set up a root password for the board?
>
> Is the actual error message about an invalid password?  Or is it
> perhaps "Permission denied"? I know that when I select openssh on my
> boards and have a root password set, I need to have a custom
> sshd_config file on the board with "PermitRootLogin yes" set to be
> able to ssh in as the root user.
>
>>
>> Thanks
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
