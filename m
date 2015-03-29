From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 15:17:06 +0200
Subject: [Buildroot] [PATCH 1/2] jack2: use -j only when is
 PARALLEL_JOBS is defined
In-Reply-To: <1427614534-32460-1-git-send-email-fabio.porcedda@gmail.com>
References: <1427614534-32460-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150329151706.7cdc6db6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Sun, 29 Mar 2015 09:35:33 +0200, Fabio Porcedda wrote:
> When top-level parallel makefile is being used the PARALLEL_JOBS is
> empty but the build system of jack2 does not accept a -j without an
> argument so don't use the -j option when PARALLEL_JOBS is empty.

This is not quite true. PARALLEL_JOBS is empty because your
recommendation of using:

	make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN`+1))

for top-level parallel build is maybe not the most appropriate one.

In addition, even when top-level parallel build is used, using purely
sequential build in each package may not be the good solution. Imagine
you have a number of packages to build, and one of them is particularly
long: if you don't build this package in parallel, the build time may
be increased.

So I believe that with the introduction of top-level parallel build, we
need a way of calculating a default reasonable BR2_JLEVEL, preferably
taking into account the make -jX value passed to the top-level make. We
indeed need to play on the number of jobs at the top-level, and the
number of jobs at the per-package level.

Also, your patch series does not handle all packages that use
$(PARALLEL_JOBS) :

package/boost/boost.mk: (cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+1 \
package/boost/boost.mk: (cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+1 \
package/boost/boost.mk: (cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q -d+1 \
package/boost/boost.mk: (cd $(@D) && ./bjam -j$(PARALLEL_JOBS) -d+1 \
package/cmake/cmake.mk:                 --parallel=$(PARALLEL_JOBS) -- \
package/jack2/jack2.mk: (cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS))
package/midori/midori.mk:       (cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS))
package/qt/qt.mk:               MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" ./configure \
package/qt5/qt5base/qt5base.mk:         MAKEFLAGS="$(MAKEFLAGS) -j$(PARALLEL_JOBS)" \

We probably need to convert all of these to:

	$(if $(PARALLEL_JOBS),-j$(PARALLEL_JOBS))

like is done for the global $(MAKE) variable.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
