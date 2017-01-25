From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jan 2017 13:51:22 +0100
Subject: [Buildroot] Firmware auto-loading does not work
In-Reply-To: <5a5c69bf-efc5-e35c-f95c-d303047320c4@oliseo.fr> ("Guillaume
 GARDET - =?utf-8?Q?Olis=C3=A9o=22's?= message of "Wed, 25 Jan 2017 09:56:19
 +0100")
References: <5a5c69bf-efc5-e35c-f95c-d303047320c4@oliseo.fr>
Message-ID: <874m0ngv5h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Guillaume" == Guillaume GARDET <- Olis?o <guillaume.gardet@oliseo.fr>> writes:

 > Hello,
 > I am using buildroot 2016.05 (with a 2.6.37 kernel) and firmware
 > auto-loading does not work. I need to do it manually (through
 > sysfs). I tried mdev and eudev, both are not working.

 > Is there a known bug about that? In busybox, maybe?

If you have tried both eudev and mdev, then it is unlikely to be a bug
in busybox (mdev). Are you using busybox modprobe applet or kmod?

What mdev or eudev does is just to read the modalias file from the
device in sysfs and call modprobe with the content. Can you verify that
your driver(s) provide sensible modalias data and that the module gets
correctly loaded if you do:

modprobe "$(cat /sysfs/path/to/device/modalias)"

We do have 1 bugfix in mdev module loading since 2016.05 for modalias
data containing spaces, but if you also have problems with eudev then
that cannot be it:

commit b4fc5a180c81689a982d5c595844331684c14f51
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Fri Jul 1 21:56:19 2016 +0300

    package/busybox: support spaces in module aliases in mdev

    The new change which enabled automatic module loading on boot does not handle
    the cases when module alias includes spaces. It prevents modules to be loaded
    since script fails:

      % find /sys/ -name modalias | xargs sort -u
      sort: /sys/devices/platform/Fixed: No such file or directory

    First alias in question is "platform:Fixed MDIO bus".

    Amend the script to support above like cases.

    Fixes: 07f46c2b6dae ("package/busybox: support automatic module loading with mdev")
    Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

-- 
Bye, Peter Korsgaard
