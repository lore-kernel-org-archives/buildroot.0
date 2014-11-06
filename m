From: Jeff Horn <outforaride@gmail.com>
Date: Thu, 6 Nov 2014 15:42:30 -0800
Subject: [Buildroot] host ldconfig package
Message-ID: <CAM7q1LnRANa1wFbb=5o8yuyYyJrQyU_CUDqTaNwQ7tC7905L-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am using buildroot for one of our i.MX6 based boards and I have it mostly
working ( I can't get video to work ). While troubleshooting freescales
gstreamer plugins I noticed the /etc/ld.so.cache was empty. I found in the
buildroot makefile where ldconfig is called so I manually ran
/sbin/ldconfig -v -r output/target and I see lots of output like this:

/sbin/ldconfig.real: /usr/lib/libGLESv2.so is for unknown machine 40.

It seems the ldconfig on my host (Ubuntu 14.04) cannot handle the tartget
rootfs. I found a post from a year ago with the same issue but I did not
see any resolution.

So, I looked at my current Yocto build and I discovered Yocto builds a
native hacked version of ldconfig and that is what gets called for the
target rootfs. So, I copied that binary over and modified buildroots
Makefile to call that instead and the cache is now populated correctly.

With that all working I created a buildroot host ldconfig package based on
the Yocto code ( I'm using BR2_EXTERNAL) and using that the ld.so.cache
gets populated. I still had to modify the buildoort Makfile to look for the
newly installed host ldconfig.

I guess my question is are others having any issues with image finalization
and ldconfig?

On another note I see others are working on the fsl-gst-plugins and I can
help test that as I REALLY want to get a working image out of buildroot.

Thanks in advance,
Jeff
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141106/ba32f38a/attachment.html>
