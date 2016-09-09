From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Sep 2016 15:26:23 +0200
Subject: [Buildroot] [PATCH] gst1-rtsp-server: new package
In-Reply-To: <e45482ba-2f3c-18e9-8486-72223e201386@imgtec.com>
References: <1472820821-5130-1-git-send-email-Abhilash.Tuse@imgtec.com>
 <20160908233019.4d3c3890@free-electrons.com>
 <e45482ba-2f3c-18e9-8486-72223e201386@imgtec.com>
Message-ID: <20160909152623.6d8cf9a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 9 Sep 2016 17:52:48 +0530, Abhilash Tuse wrote:

> > Are you sure all of these are mandatory? From a quick look at the
> > configure.ac script, they don't seem to be mandatory, but rather be
> > optional dependencies.  
> The reason why we added this was because internally gst1-rtsp-server 
> tries to create some of the elements of base and good plug-ins.
> 
> Below is test example that I tried(with just gstreamer1+gst1-rtsp-server):
> 
> # test-launch "( audiotestsrc ! audioconvert ! rtpL16pay name=pay0 )"
> stream ready at rtsp://127.0.0.1:8554/test
> 
> ** (test-launch:11): WARNING **: failed to create element 'rtpbin', 
> check your installation

Hum, ok. So it's like *some* plugins are absolutely mandatory for
gst1-rtsp-server to work properly?

If that's the case, then selecting those plugins as you did is good, as
we prefer when things work "out of the box" rather than having to
figure out the runtime dependencies by trial on error.

However, you just selected the main "base", "good" and "bad" plugin
packages, but in fact all the plugins in those packages have
sub-options. So you can build gst1-plugins-base without any plugin
selected I believe, for example. So if some plugins are absolutely
mandatory for gst1-rtsp-server to work, those plugins should be
selected.

For example, I guess the rtpbin element is provided by the
gst1-plugins-good rtp plugin, so you should select
BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTP.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
