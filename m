From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Aug 2019 23:44:15 +0200
Subject: [Buildroot] [git commit] package/qt5/qt5base: build with
 correct optimization
In-Reply-To: <20190803101658.4213A822B4@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 3 Aug 2019 12:19:35 +0200")
References: <20190803101658.4213A822B4@busybox.osuosl.org>
Message-ID: <87ftljk5ow.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=7c0aa83527e0b0179f9e3f73a3e63df1fdc5a6e6
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Qt5 has predefined optimization flags depending if you're building for
 > size, for debug etc. These flags are defined in
 > mkspecs/common/gcc-base.conf:

 > QMAKE_CFLAGS_OPTIMIZE      = -O2
 > QMAKE_CFLAGS_OPTIMIZE_FULL = -O3
 > QMAKE_CFLAGS_OPTIMIZE_DEBUG = -Og
 > QMAKE_CFLAGS_OPTIMIZE_SIZE = -Os

 > Then, in common/features/default_post.prf, they add those flags to
 > QMAKE_CFLAGS_RELEASE/QMAKE_CXXFLAGS_RELEASE depending on various build
 > options (optimize_size, optimize_full, optimize_debug):

 > optimize_size {
 >     !isEmpty(QMAKE_CFLAGS_OPTIMIZE):!isEmpty(QMAKE_CFLAGS_OPTIMIZE_SIZE)  {
 >         QMAKE_CFLAGS_RELEASE -= $$QMAKE_CFLAGS_OPTIMIZE
 >         QMAKE_CXXFLAGS_RELEASE -= $$QMAKE_CFLAGS_OPTIMIZE
 >         QMAKE_CFLAGS_RELEASE += $$QMAKE_CFLAGS_OPTIMIZE_SIZE
 >         QMAKE_CXXFLAGS_RELEASE += $$QMAKE_CFLAGS_OPTIMIZE_SIZE
 >     }
 > } else: optimize_full {
 >     !isEmpty(QMAKE_CFLAGS_OPTIMIZE):!isEmpty(QMAKE_CFLAGS_OPTIMIZE_FULL)  {
 >         QMAKE_CFLAGS_RELEASE -= $$QMAKE_CFLAGS_OPTIMIZE
 >         QMAKE_CXXFLAGS_RELEASE -= $$QMAKE_CFLAGS_OPTIMIZE
 >         QMAKE_CFLAGS_RELEASE += $$QMAKE_CFLAGS_OPTIMIZE_FULL
 >         QMAKE_CXXFLAGS_RELEASE += $$QMAKE_CFLAGS_OPTIMIZE_FULL
 >     }
 > }

 > Since this default_post.prf is included *after* our qmake.conf file,
 > these flags override our optimizations flags, which is not good.

 > However, our qmake.conf file is included *after* gcc-base.conf, so we
 > can simply reset those variables to have the empty value, and our
 > optimization flags will be used.

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 > [Thomas: completely change the approach, by simply resetting the
 > QMAKE_CFLAGS_OPTIMIZE_* variables in qmake.conf]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.0, thanks.

-- 
Bye, Peter Korsgaard
