From: Steve Calfee <stevecalfee@gmail.com>
Date: Thu, 11 Feb 2016 08:12:35 -0800
Subject: [Buildroot] How do folks add packages to an existing rootfs
 during development?
In-Reply-To: <CAF_dkJDw95gyf3WFhfy7_zPgD05W4N0kTmGFLJbWcTCRwj1uKw@mail.gmail.com>
References: <CAF_dkJDw95gyf3WFhfy7_zPgD05W4N0kTmGFLJbWcTCRwj1uKw@mail.gmail.com>
Message-ID: <CAJJ6jxvMBLe7SHxJgYXx0a6sBqrgATuNmc5HcP4aF+wz3JsSrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 11, 2016 at 7:23 AM, Patrick Doyle <wpdster@gmail.com> wrote:
> I have read section 10.7 "Why doesn't Buildroot generate binary
> packages (.deb, .ipkg...)?" in the Buildroot users manual, and I
> understand and appreciate the answer to that question.
>
> My question is slightly different, and it is based on the following scenario:
>
> I am creating a buildroot environment for my custom product.  I have
> generated the rootfs and deployed it to my development board.  Once I
> have done that, I have customized a few things to my liking (e.g.
> hostname, installed my custom application, generated OpenSSH keys,
> etc...).  Now I discover that I also want to add another package to my
> environment.
>
> Option 1:
> Rerun "make menuconfig; make"; generate a new rootfs; flash it on my
> board; and redo the customizations.  (Most of the customizations will
> get easier with time, as I roll them into my configuration, but some
> of them, such as OpenSSH host keys, will just have to change each time
> I do this).
>
> Option 2:
> Rerun "make menuconfig; make" and deploy just the new package.
> Lather, rinse, repeat, until I've figured out what package sets make
> the most sense.  Then do Option 1.
>
> Which option do folks in this community choose in general?
>

When I am doing development, if I have network on the device (even
wifi), I use nfs as both a boot device and as a rootfs. I put my
rootfs on the host in the tftpboot directory. So using your option 2 I
update/add/edit etc a package. Then I simply 'cp
output/target/bin/testapp /tftpboot/testing/bin/' The device does not
even have to be rebooted to use the new app.

If the package is slightly more complicated and might needs some
libraries etc, I just untar the whole rootfs right on top the nfs
destination, just like I do after any fresh build. This can even be
done while the target system is running.

Since there is no package manager you can mess things up and crash the
target. But heck it is development, right. So frequently it is
important to 'make clean; make' and reinstall and reboot the target.
If it still boots and runs you can safely proceed with other
development.

Regards, Steve
