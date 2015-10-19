From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Mon, 19 Oct 2015 09:51:17 +0200
Subject: [Buildroot] What environment do I need for event input?
In-Reply-To: <11e8982a7594f3e29171373bc8a2b26@cweb29.nm.nhnsystem.com>
References: <11e8982a7594f3e29171373bc8a2b26@cweb29.nm.nhnsystem.com>
Message-ID: <5624A0F5.4010304@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/10/2015 01:31, Jay wrote:
> I need "/dev/input/event*" for irda remote controler.
> ?I tested kernel 4.1.7 and buildroot 2015.08.1.  
> ?Of course, on custon kernel configuration, I enabled "Device Drivers --&gt; Input device suppor --&gt; Event interface"
> ?I have tested budilroot system configuration. ie) like these combinations 
> ?Init system ("systemd") /dev managaement (auto selected with udev)
> ?Init system ("Busybox") /dev management ("Dynamic using devtmpfs only")
> ?Init system ("Busybox") /dev management ("Dynamic using mdev")
> ?Init system ("Busybox") /dev management ("Dynamic using eudev")
> ? 
> ?And, Init system ("Busybox") /dev management ("Static using device table")
> ?In case of using "Static device table", in directory of "output/taget/dev/input/" exists,  
> ?but, on target system still does not show.

Are you sure your evdev devices are detected ? is /sys/class/input empty ?

If it isn't empty, you can still read the available evdev devices in
/sys/class/input and creates these nodes manually:

mkdir -m 660 -p /dev/input
for dev in /sys/class/input/*/dev; do
    if [ ! -f "$dev" ]; then
        echo "no evdev devices"
        break
    fi
    IFS=: read major minor < "$dev"
    dev=${dev%/dev}
    dev=${dev#/sys/class/input/}
    mknod -m 660 "/dev/input/$dev" c "$major" "$minor"
done
