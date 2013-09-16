From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Sep 2013 20:34:07 +0200
Subject: [Buildroot] [PATCHv2 1/4] core: introduce the BR2_EXTERNAL
 variable
In-Reply-To: <OF0FD99CA0.0DD1D9C1-ON86257BE8.005A4297-86257BE8.005B1032@rockwellcollins.com>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1379185433-8770-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF0FD99CA0.0DD1D9C1-ON86257BE8.005A4297-86257BE8.005B1032@rockwellcollins.com>
Message-ID: <20130916203407.63509990@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Mon, 16 Sep 2013 11:34:39 -0500, Ryan Barnett wrote:

> Per our chat on IRC, putting BR2_EXTERNAL into the generated makefile
> isn't quite working out like I expected. I'm losing the BR2_EXTERNAL
> variable definition.
> 
> Here are the steps I'm taking after applying your v2 of this patch to
> a git clone of the mainline of buildroot. The buildroot clone is not
> in the directory of ~/tmp but elsewhere.
> 
> make O=~/tmp/build_xm BR2_EXTERNAL=~/tmp/buildroot 
> rc_beagle_xm_min_defconfig
> cd ~/tmp/build_xm
> make

Ah, right. The below patch fixes that:

diff --git a/Makefile b/Makefile
index 799c529..5d942bd 100644
--- a/Makefile
+++ b/Makefile
@@ -59,6 +59,8 @@ else
 BR2_EXTERNAL = $(TOPDIR)/support/dummy-external/
 endif
 
+EXTRAMAKEARGS += BR2_EXTERNAL="$(BR2_EXTERNAL)"
+
 # Compute the full local version string so packages can use it as-is
 # Need to export it, so it can be got from environment in children (eg. mconf)
 export BR2_VERSION_FULL:=$(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlocalversion)
@@ -95,7 +97,7 @@ MAKEOVERRIDES =
 override O:=$(O)
 CONFIG_DIR:=$(O)
 # we need to pass O= everywhere we call back into the toplevel makefile
-EXTRAMAKEARGS = O=$(O)
+EXTRAMAKEARGS += O=$(O)
 NEED_WRAPPER=y
 endif
 



-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
