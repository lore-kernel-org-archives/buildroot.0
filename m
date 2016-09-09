From: Abhilash Tuse <abhilash.tuse@imgtec.com>
Date: Fri, 9 Sep 2016 17:52:48 +0530
Subject: [Buildroot] [PATCH] gst1-rtsp-server: new package
In-Reply-To: <20160908233019.4d3c3890@free-electrons.com>
References: <1472820821-5130-1-git-send-email-Abhilash.Tuse@imgtec.com>
 <20160908233019.4d3c3890@free-electrons.com>
Message-ID: <e45482ba-2f3c-18e9-8486-72223e201386@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> Are you sure all of these are mandatory? From a quick look at the
> configure.ac script, they don't seem to be mandatory, but rather be
> optional dependencies.
The reason why we added this was because internally gst1-rtsp-server 
tries to create some of the elements of base and good plug-ins.

Below is test example that I tried(with just gstreamer1+gst1-rtsp-server):

# test-launch "( audiotestsrc ! audioconvert ! rtpL16pay name=pay0 )"
stream ready at rtsp://127.0.0.1:8554/test

** (test-launch:11): WARNING **: failed to create element 'rtpbin', 
check your installation


> ifeq ($(BR2_PACKAGE_LIBCGROUP),y)
> GST1_RTSP_SERVER_DEPENDENCIES += libcgroup
> endif
Thank you very much for the comments.
> ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
> GST1_RTSP_DEPENDENCIES += gst1-plugins-base
> endif
This looks good, I'll make the suggested changes and send an updated patch.

Thanks and Regards,
Abhilash

On Friday 09 September 2016 03:00 AM, Thomas Petazzoni wrote:
> Hello,
>
> On Fri, 2 Sep 2016 18:23:41 +0530, Abhilash Tuse wrote:
>> From: Piotr Nakraszewicz <piotr.nakraszewicz@imgtec.com>
>>
>> Based on patch by Phil Edworthy:
>> http://lists.busybox.net/pipermail/buildroot/2010-June/035777.html
>>
>> Reviewed-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
>> Reviewed-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
>> Signed-off-by: Piotr Nakraszewicz <piotr.nakraszewicz@imgtec.com>
>> Signed-off-by: Abhilash Tuse <Abhilash.Tuse@imgtec.com>
> Thanks for your patch! I have two comments, see below.
>
>
>> diff --git a/package/gstreamer1/gst1-rtsp-server/Config.in b/package/gstreamer1/gst1-rtsp-server/Config.in
>> new file mode 100644Are you sure all of these are mandatory? From a quick look at the
>> configure.ac script, they don't seem to be mandator
>>
>> index 0000000..5201a8d
>> --- /dev/null
>> +++ b/package/gstreamer1/gst1-rtsp-server/Config.in
>> @@ -0,0 +1,9 @@
>> +config BR2_PACKAGE_GST1_RTSP_SERVER
>> +	bool "gst1-rtsp-server"
>> +	select BR2_PACKAGE_GST1_PLUGINS_BASE
>> +	select BR2_PACKAGE_GST1_PLUGINS_BAD
>> +	select BR2_PACKAGE_GST1_PLUGINS_GOOD
> Are you sure all of these are mandatory? From a quick look at the
> configure.ac script, they don't seem to be mandatory, but rather be
> optional dependencies. Have you tested a build with just
> gstreamer1+gst1-rtsp-server ? If it works, then they are indeed
> optional dependencies, in which case you want to remove those "select"
> here, and instead in the .mk file do:
>
> ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
> GST1_RTSP_DEPENDENCIES += gst1-plugins-base
> endif
>
>> +++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
>> @@ -0,0 +1,15 @@
>> +################################################################################
>> +#
>> +# gst1-rtsp-server
>> +#
>> +################################################################################
>> +
>> +GST1_RTSP_SERVER_VERSION = 1.8.3
>> +GST1_RTSP_SERVER_SOURCE = gst-rtsp-server-$(GST1_RTSP_SERVER_VERSION).tar.xz
>> +GST1_RTSP_SERVER_SITE = http://gstreamer.freedesktop.org/src/gst-rtsp-server
>> +GST1_RTSP_SERVER_LICENSE = LGPLv2+
>> +GST1_RTSP_SERVER_LICENSE_FILES = COPYING COPYING.LIB
>> +GST1_RTSP_SERVER_INSTALL_STAGING = YES
>> +GST1_RTSP_SERVER_DEPENDENCIES = gstreamer1 gst1-plugins-base gst1-plugins-bad gst1-plugins-good
> In addition, libcgroup is an optional dependency of gst1-rtsp-server,
> so:
>
> ifeq ($(BR2_PACKAGE_LIBCGROUP),y)
> GST1_RTSP_SERVER_DEPENDENCIES += libcgroup
> endif
>
> would be nice to have.
>
> Could you look into these and send an updated patch? The rest of the
> patch looks good.
>
> Thanks a lot!
>
> Thomas
