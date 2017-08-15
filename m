From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Tue, 15 Aug 2017 17:02:35 -0400
Subject: [Buildroot] can't build qt5webkit for raspberry pi 3
In-Reply-To: <20170815114148.42777e85@brock-desktop>
References: <20170815114148.42777e85@brock-desktop>
Message-ID: <20170815210235.3uvthq2bk5zoxluo@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Brock,

On Tue, Aug 15, 2017 at 11:41:48AM -0600, Brock Williams wrote:
> 
> I'm not able to build qt5webkit for a pi 3 from master.  It works for pi
> 2. Here is the error:
> 
> In file included from ./config.h:30:0,
>                  from wtf/CurrentTime.cpp:34:
> ./wtf/Platform.h:323:6: error: #error "Not supported ARM architecture"
>  #    error "Not supported ARM architecture"
>       ^~~~~
> 
> I've attached the defconfig that we are using.  This is based on the
> raspberrypi3_defconfig with what I think is just the minimum to build
> qt5webkit added.  For now we have just configured
> the build down to the pi 2 cpu settings.
> 
> Brock
> 

The CPU of rpi3 has moved from cortex-a8 (armv7) to cortex-a53 (armv8) in the
raspberrypi3_defconfig. And Qt WebKit do not support for armv8.

I have not tested this, but you can update Platform.h to add support for armv8.

In file, build/qt5webkit-5.9.1/Source/WTF/wtf/Platform.h, apply the following
chunk

diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
index 562840cf7..9ce350e54 100644
--- a/Source/WTF/wtf/Platform.h
+++ b/Source/WTF/wtf/Platform.h
@@ -287,6 +287,9 @@
     || defined(__ARM_ARCH_7S__)
 #define WTF_THUMB_ARCH_VERSION 4
 
+#elif defined(__ARM_ARCH_8A__)
+#define WTF_CPU_ARM_TRADITIONAL 1
+
 /* RVCT sets __TARGET_ARCH_THUMB */
 #elif defined(__TARGET_ARCH_THUMB)
 #define WTF_THUMB_ARCH_VERSION __TARGET_ARCH_THUMB

Regards,
Gael
