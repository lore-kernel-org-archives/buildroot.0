From: Chris Lesiak <chris.lesiak@licor.com>
Date: Tue, 18 Dec 2018 17:03:57 +0000
Subject: [Buildroot] [PATCH v2] package/openssh: Add sysusers.d snippet
In-Reply-To: <06b4ea81-0a24-4242-7525-a142345c516c@mind.be>
References: <20180123232221.6106-1-chris.lesiak@licor.com>
 <20180216181016.8747-1-chris.lesiak@licor.com> <20181216134502.GB2384@scaer>
 <f71a4a61-0cca-0fa3-a9f7-bfbc1d8ad6af@licor.com>
 <20181217181319.GD2951@scaer> <9cf83ac8-2d39-0eb5-92cb-0469eb0a9d6e@mind.be>
 <20181218084937.47142880@windsurf>
 <353c4c5d-5064-f92d-bfd0-5232bad2204a@licor.com>
 <06b4ea81-0a24-4242-7525-a142345c516c@mind.be>
Message-ID: <0e36d98f-f176-1e0e-7088-34343f51569e@licor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 12/18/18 8:32 AM, Arnout Vandecappelle wrote:
>
> On 18/12/2018 15:14, Chris Lesiak wrote:
>
>> In my particular case, /etc is empty on first boot, but retains state
>> after that.? Even if I started with a populated /etc/passwd, when
>> updating /usr (switching in a new version to update the the OS), I might
>> have new services with associated users that I would like to have
>> automatically added to /etc/passwd.
>   That's a very good motivation!
>
>   So you're generating a rootfs with empty /etc? Do you need any other changes to
> make that work? To support this use case, it would be nice if we could add an
> option to the system menu that enables it (this would depend on systemd of
> course), so that it can be used fo force packages to do whatever is needed to
> support empty /etc. And then we can add a post-build check that /etc is really
> empty at the end of the build, so that the autobuilders can detect problems.
>
>   Regards,
>   Arnout


I am happy that you are interested in this use case.? I'll try to 
describe more fully what I am doing and give a summary of the issues I 
had to tackle.

My system has four partitions, with some space reserved before the 
partitions for an MBR, u-boot, and u-boot environment.? The first two 
partitions are for two instances of the root filesystem.? This allows me 
to replace the image on the one I'm not currently running, rewrite the 
MBR so as to swap the two, and then reboot.? I manage that with 
package/fwup.? The first entry in the MBR (not necessarily the one at 
the lowest block address) is always the default root; the second is the 
old root.? The third partition is for /etc and the fourth for /var.? 
Both /etc and /var are empty on first boot and automatically populated.

I have a small custom initramfs that is stored in the /boot directory of 
the root filesystem.? This directory also contains a u-boot? script, the 
kernel zImage and one or more device trees. This initramfs has the 
following features:

 ??? * The initramfs is permanently used (there is no pivot-root) as a 
volatile /.
 ??? * From the root device, mounts /usr on /usr (read-only)
 ??? * From the root device, mounts /boot on /boot (read-only)
 ??? * Mounts the x-mount.etc device (an additional cmdline argument) on 
/etc (read-write)

You see that the only two directories on the root filesystem image that 
I use are /usr and /boot.? When I do an update, I get a completely new 
/usr and /boot with u-boot? script, device tree files, kernel zImage, 
and user-space programs all updated together.

Mounting of /var could have been done in the initramfs, but since it can 
wait until later, I let systemd mount it using a unit file similar to 
tmp.mount.? Without this, I'd have a volatile /var which is sometimes 
desired; I actually prefer that but have a requirement for persistent logs.

Although /etc starts out empty and is automatically populated, I've 
taken some steps to keep even this to a minimum.? The less that is in 
/etc, the less the chance that it will contain something incompatible 
with a future version of /usr.? Many packages require their 
configuration to be in /etc; I'd rather my default configurations could 
live in /usr/lib with the ability to override with a file in /etc.? Most 
packages don't support this so I've had to use various work-arounds.

For avahi, I store its configuration in /usr/share/factory/etc/avahi and 
have a tmpfiles.d snippet to create a link from /etc/avahi.

For sshd, I store my default configuration in 
/usr/share/factory/etc/ssh/, but use the tmpfiles.d snippet to copy from 
/usr/share/factory/etc/ssh to /etc/ssh.? Both the keys and config files 
are stored in this directory, so it must be writable.? I'd rather the 
configuration lived in /usr/lib and only the keys were kept in /etc.

Then there is configuring various service to run without ending up with 
a bunch of links in /etc/systed/system.? Using a rootfs overlay, I have 
a /usr/lib/systemd/system/buildroot.target.wants directory containing 
symbolic links to all of the services that I want to run.? I make 
default.target link to that directory.? That is similar to what systemd 
does with sysinit.target.wants and builtin systemd services.? This 
allows me to have an /etc/systemd/ containing only an empty 
/etc/systemd/system/.? Note that I can still disable these services 
using "systemctl mask".? I think some build infrastructure to make this 
easy to configure would be nice.

-- 
Chris Lesiak
Principal Design Engineer, Software
LI-COR Biosciences
4647 Superior Street
Lincoln, NE 68504 USA
chris.lesiak at licor.com
