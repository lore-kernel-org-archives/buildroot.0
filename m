From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2020 23:36:40 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/{collectd, domoticz,
 shairport-sync}: fix mosquitto dependencies
In-Reply-To: <20200819120506.137013-2-titouan.christophe@railnova.eu>
References: <20200819120506.137013-1-titouan.christophe@railnova.eu>
 <20200819120506.137013-2-titouan.christophe@railnova.eu>
Message-ID: <20200827233640.4e579129@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 19 Aug 2020 14:05:06 +0200
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> In 4fc62e1eb6b3adbfc3d3eb7f841275ae8cd1b424, we removed arch/toolchain
> dependencies from the mosquitto library (MMU, !STATIC, SYNC4), and moved
> them to the mosquitto broker only.
> 
> All the packages modified here only need the mosquitto library, so they
> shouldn't have those depends anymore; but this was never done before.
> 
> Moreover, domoticz and shairport-sync both use the mosquitto threaded
> API, so we make them dependent on the newly introduced symbol
> BR2_PACKAGE_MOSQUITTO_WITH_THREADING.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

I think this mixes two different things. One is dropping the
dependencies that are no longer needed following
4fc62e1eb6b3adbfc3d3eb7f841275ae8cd1b424. This should be the first
patch in the series.

Also, regarding the threading, nothing needs to be done: both
shairport-sync and domoticz already have a dependency on
BR2_TOOLCHAIN_HAS_THREADS_NPTL. The only thing that could be worthwhile
doing, is *within* the 1.6.11 version bump patch, update the
BR2_TOOLCHAIN_HAS_THREADS_NPTL comments in domoticz and shairport-sync
packages. Like:

-  	# pthread_condattr_setclock
+	# pthread_condattr_setclock, and threading support needed in
+	# mosquitto
  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL

and something similar for shairport-sync.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
