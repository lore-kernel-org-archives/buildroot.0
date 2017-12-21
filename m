From: Ash Charles <ashcharles@gmail.com>
Date: Wed, 20 Dec 2017 23:35:45 -0500
Subject: [Buildroot] Using PRU
In-Reply-To: <1574223358.5559956.1513272846088@mail.yahoo.com>
References: <1574223358.5559956.1513272846088.ref@mail.yahoo.com>
 <1574223358.5559956.1513272846088@mail.yahoo.com>
Message-ID: <CAK8F28kZ91rXbUpHxnMonrh5KSitc5xAUyJZfv01snNzVdWjFw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Dec 14, 2017 at 12:34 PM, James Albert <sjr_ee@yahoo.ca> wrote:
> Hi,
> I'm trying to use buildroot 2017.11 with recent Linux 4.13.16 to use the
> PRUSS on a Beaglebone Black. I think I've turned on all of the PRU, RPMsg
> and remoteproc settings in buildroot and Linux configs. I also built a
> custom device tree with the PRUSS enabled. But the pieces aren't all there,
> and it doesn't look like TI's Hands On training
> (http://processors.wiki.ti.com/index.php/PRU_Training:_Hands-on_Labs). Is
> there somewhere I can find up-to-date instructions on getting the PRUSS
> running when I use buildroot? So much of what I've seen on the web is old
> (UIO-based) or starts with the Beagleboard or TI trees (I want an embedded
> environment, not a whole Debian). You people are doing a great job of
> simplifying, enhancing and refining buildroot, and I thank you. Still, I'm
> finding it a challenge to understand all of the knobs and buttons. If this
> is the wrong forum for asking, let me know.

I was previously able to get the PRU hands-on lab examples working
with a beaglebone.  Looking at your buildroot defconfig, you've got
BR2_PACKAGE_PRU_SOFTWARE_SUPPORT enabled which should build the
examples (though I'd expect BR2_PACKAGE_HOST_TI_CGT_PRU to be enabled
also).  Note the step mentioned in
package/pru-software-support/readme.txt regarding copying the firmware
e.g.
 $ cp /usr/share/pru-software-support/am335x/PRU_gpioToggle/gen/PRU_gpioToggle.out
/lib/firmware/am335x-pru0-fw

From my old notes, I enabled these items in the kernel config. though
it looks like you've got the modules you'd need.
CONFIG_PRUSS_REMOTEPROC=m
CONFIG_RPMSG_PRU=m

And, I needed to modprobe pru_rproc and rpmsg_pru as, for the 4.1
kernel I was using, the remoteproc and rpmsg drivers weren't loaded
automatically.

FWIW, I remember running into some kernel version problems [1]

Also, by way of reference, have you seen [2]?
[1] http://e2e.ti.com/support/arm/sitara_arm/f/791/p/552190/2018113#2018113
[2] http://www.jumpnowtek.com/beaglebone/Working-with-the-BeagleBone-PRUs.html

--Ash
