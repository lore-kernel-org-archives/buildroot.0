From: Antony Vennard <antony.vennard@macrium.com>
Date: Tue, 06 Nov 2012 14:02:22 +0000
Subject: [Buildroot] Udev on a live CD system does not appear to populate
	/dev
Message-ID: <5099186E.1030409@macrium.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I'm currently looking at using udev for a live cd environment built with
buildroot, and I'm having trouble getting udev to pick up the machine's
devices.

I have some questions and some details that will (hopefully) help
identify my problem

Firstly, my kernel is configured to use devtmpfs:

681:CONFIG_DEVTMPFS=y
682:CONFIG_DEVTMPFS_MOUNT=y

so as I understand it, /dev should be mounted as a tmpfs by the kernel
and populated with /dev/null, /dev/console etc. Yet, my
buildroot/output/target contains a dev folder with subdirectories
created by buildroot.

So, I tried both creating the entries with target/generic_device_table
for tty0, tty1, console, null. This works, and udev reports it is
scanning for devices and done, yet /dev never picks up e.g. /dev/sda, or
/dev/disk/..., or so on. I have, in this configuration, copied
/usr/lib/udev/rules.d/* to buildroot/output/target/etc/udev/rules.d to
no avail; as far as I can see whatever rules I supply, even from my
Fedora or Ubuntu distributions, do not seem to affect udev.

Wondering if this creation method was wrong, I have then removed all of
the entries in /dev so that the kernel can mount its own devtmpfs. When
booting, /dev/null and /dev/tty1 are reported as missing. I imagine
there is nothing in /dev at this stage

Various possibly related points:
 * I thought udev required udevd, yet I can't see that either running or
available on the ISO, nor can I find a configuration option to create it.
 * I have D-Bus built for the system, as I read udev required it.
 * I can see sda1 in /sys/block/sda/sda1; likewise for other attached
storage devices.

Am I doing anything very wrong? I get the feeling I must be missing
something for this to not work, yet I'm not sure what.

Can anyone offer any advice? Happy to provide config snippets etc.

Using buildroot 2012.08.

Thanks,

Antony


-- 
________________

Macrium? Software is a trading name of Paramount Software UK Ltd, 
Registered in England and Wales Number 02973414
Registered Office: Kilburn House, Manchester Science Park, Lloyd St. North, 
Manchester M15 6SE United Kingdom

The information contained in this e-mail is confidential, privileged, or 
otherwise protected from disclosure. It is intended only for the use of the 
authorized individual as indicated in the e-mail. Any unauthorized 
disclosure, copying, distribution or taking of any action based on the 
contents of this material is strictly prohibited.

If you have received this e-mail in error, please delete it immediately.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 895 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121106/29afbc10/attachment.asc>
