From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Nov 2014 08:25:17 +0100
Subject: [Buildroot] host ldconfig package
In-Reply-To: <CAM7q1LnRANa1wFbb=5o8yuyYyJrQyU_CUDqTaNwQ7tC7905L-A@mail.gmail.com>
References: <CAM7q1LnRANa1wFbb=5o8yuyYyJrQyU_CUDqTaNwQ7tC7905L-A@mail.gmail.com>
Message-ID: <20141107082517.416a87ff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeff Horn,

On Thu, 6 Nov 2014 15:42:30 -0800, Jeff Horn wrote:

> I am using buildroot for one of our i.MX6 based boards and I have it mostly
> working ( I can't get video to work ). While troubleshooting freescales
> gstreamer plugins I noticed the /etc/ld.so.cache was empty. I found in the
> buildroot makefile where ldconfig is called so I manually ran
> /sbin/ldconfig -v -r output/target and I see lots of output like this:
> 
> /sbin/ldconfig.real: /usr/lib/libGLESv2.so is for unknown machine 40.
> 
> It seems the ldconfig on my host (Ubuntu 14.04) cannot handle the tartget
> rootfs. I found a post from a year ago with the same issue but I did not
> see any resolution.
> 
> So, I looked at my current Yocto build and I discovered Yocto builds a
> native hacked version of ldconfig and that is what gets called for the
> target rootfs. So, I copied that binary over and modified buildroots
> Makefile to call that instead and the cache is now populated correctly.
> 
> With that all working I created a buildroot host ldconfig package based on
> the Yocto code ( I'm using BR2_EXTERNAL) and using that the ld.so.cache
> gets populated. I still had to modify the buildoort Makfile to look for the
> newly installed host ldconfig.
> 
> I guess my question is are others having any issues with image finalization
> and ldconfig?

Yes, this is a known issue. I remember we discussed it last month at
the Buildroot Developers meeting. At the time, our feeling was that we
would completely get rid of the ldconfig handling, and live without a
ld.so.cache, since ld.so.cache is not strictly needed for runtime
execution. The problem is indeed as you've seen, is that a cross
ldconfig is not something that exists upstream in glibc, and only
hacked versions are available. So either we decide to package such
"hacked" versions, or we give up on having a ld.so.cache entirely.

> On another note I see others are working on the fsl-gst-plugins and I can
> help test that as I REALLY want to get a working image out of buildroot.

I'm adding in Cc some i.MX6 folks from the Buildroot community: Gary,
J?r?me and Luca.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
