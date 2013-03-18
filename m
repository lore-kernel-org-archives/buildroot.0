From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Mon, 18 Mar 2013 12:10:59 -0500
Subject: [Buildroot] target /etc/inittab
In-Reply-To: <20130316195112.67246764@skate>
References: <ADE657CA350FB648AAC2C43247A983F0020980106B97@AUSP01VMBX24.collaborationhost.net>
 <20130316195112.67246764@skate>
Message-ID: <ADE657CA350FB648AAC2C43247A983F0020980106DF3@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday, March 16, 2013 11:51 AM, Thomas Petazzoni wrote:
> On Fri, 15 Mar 2013 12:34:02 -0500, H Hartley Sweeten wrote:
>> I'm using buildroot to create a rootfs for an ep93xx board. This
>> board has 3 serial ports ttyAM0-3. When the rootfs is created I
>> get this in the /etc/inittab:
>> 
>> # Set up a couple of getty's
>> tty1::respawn:/sbin/getty 38400 tty1
>> tty2::respawn:/sbin/getty 38400 tty2
>
> This is strange, we have removed these since
> 7d9d09db673abbedc1cc865c213b742e0450268d, which appeared in 2011.05 it
> seems. Those lines are no longer part of the default skeleton.
>
>> # Put a getty on the serial port
>> ttyAM0::respawn:/sbin/getty -L ttyAM0 57600 vt100 # GENERIC_SERIAL
>> #ttyAM1::respawn:/sbin/getty -L ttyAM1 57600 vt100 # GENERIC_SERIAL
>> #ttyAM2::respawn:/sbin/getty -L ttyAM2 57600 vt100 # GENERIC_SERIAL
>
> These are not coming from Buildroot default skeleton. Maybe you're
> using a modified Buildroot version and not the upstream version?

Thomas,

I'm pretty sure there are no modifications.

$ git status
# On branch master
nothing to commit, working directory clean
$ git log
commit 87854c12d1c81bade3522405ce1ac42d45475263
Author: Samuel Martin <s.martin49@gmail.com>
Date:   Mon Mar 11 18:58:40 2013 +0000

    ussp-push: new package
...

$ grep 'export BR2_VERSION:=' Makefile
export BR2_VERSION:=2013.05-git

I think the ttyAM0 getty is getting created because of my .config.

BR2_TARGET_GENERIC_GETTY_PORT="ttyAM0"

I'm not sure why the commented out ttyAM1 and ttyAM2 getty's
are showing up.

>> The problem is tty1 and tty2. They don't exist on my board and
>> give me issues when the board boots. I can't figure out why they
>> are being added to /etc/inittab and how to prevent theses getty's
>> from showing up.
>
> Just use a recent upstream Buildroot version, those lines are no longer
> present in the default inittab.

Those lines are not in the default inittab in the Buildroot
version I am trying... Strange...

>> Also how do I get a getty on ttyAM1 and ttyAM2?
>
> In a recent upstream Buildroot version, I would do that with a
> post-build script.

It just seems strange that they are getting put into the inittab for some
reason.

> Make sure to do add a # GENERIC_SERIAL comment at the end of those
> additional lines: this # GENERIC_SERIAL is a marker that tells
> Buildroot to modify this line to start a getty on the default tty
> (which is defined in the Buildroot configuration).

Regards,
Hartley
