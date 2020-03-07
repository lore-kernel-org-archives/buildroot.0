From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Mar 2020 09:06:10 +0100
Subject: [Buildroot] [PATCH v3] package/qt5base: fix building with
 correct optimization
In-Reply-To: <e57befe8-282b-d4c6-528e-4b26438d59b6@mind.be> (Arnout
 Vandecappelle's message of "Thu, 23 Jan 2020 23:33:31 +0100")
References: <20191125112614.93405-1-giulio.benetti@benettiengineering.com>
 <e57befe8-282b-d4c6-528e-4b26438d59b6@mind.be>
Message-ID: <878skc8u8d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 25/11/2019 12:26, Giulio Benetti wrote:
 >> Qt5 has predefined optimization flags depending if you're building for
 >> size, for debug etc. These flags are defined in
 >> mkspecs/common/gcc-base.conf:
 >> 
 >> QMAKE_CFLAGS_OPTIMIZE      = -O2
 >> QMAKE_CFLAGS_OPTIMIZE_FULL = -O3
 >> QMAKE_CFLAGS_OPTIMIZE_DEBUG = -Og
 >> QMAKE_CFLAGS_OPTIMIZE_SIZE = -Os
 >> 
 >> Then, in the same file, they use them to set
 >> QMAKE_CFLAGS_RELEASE/QMAKE_CXXFLAGS_RELEASE:
 >> 
 >> QMAKE_CFLAGS_RELEASE       += $$QMAKE_CFLAGS_OPTIMIZE
 >> QMAKE_CXXFLAGS_RELEASE    += $$QMAKE_CFLAGS_RELEASE
 >> 
 >> At this point there is our chance to override QMAKE_CFLAGS_OPTIMIZE_* in
 >> qmake.conf, but it's too late, because QMAKE_CFLAGS_RELEASE is already
 >> set(i.e. -O2) so trying to add or remove QMAKE_CFLAGS_OPTIMIZE(that is
 >> reset now on) from QMAKE_CLAGS_RELEASE in
 >> common/features/default_post.prf won't work:
 >> 
 >> optimize_size {
 >> !isEmpty(QMAKE_CFLAGS_OPTIMIZE):!isEmpty(QMAKE_CFLAGS_OPTIMIZE_SIZE)  {
 >> QMAKE_CFLAGS_RELEASE -= $$QMAKE_CFLAGS_OPTIMIZE
 >> QMAKE_CXXFLAGS_RELEASE -= $$QMAKE_CFLAGS_OPTIMIZE
 >> QMAKE_CFLAGS_RELEASE += $$QMAKE_CFLAGS_OPTIMIZE_SIZE
 >> QMAKE_CXXFLAGS_RELEASE += $$QMAKE_CFLAGS_OPTIMIZE_SIZE
 >> }
 >> } else: optimize_full {
 >> !isEmpty(QMAKE_CFLAGS_OPTIMIZE):!isEmpty(QMAKE_CFLAGS_OPTIMIZE_FULL)  {
 >> QMAKE_CFLAGS_RELEASE -= $$QMAKE_CFLAGS_OPTIMIZE
 >> QMAKE_CXXFLAGS_RELEASE -= $$QMAKE_CFLAGS_OPTIMIZE
 >> QMAKE_CFLAGS_RELEASE += $$QMAKE_CFLAGS_OPTIMIZE_FULL
 >> QMAKE_CXXFLAGS_RELEASE += $$QMAKE_CFLAGS_OPTIMIZE_FULL
 >> }
 >> }

 >  This stuff is complicated...

 >> 
 >> So let's reset:
 >> QMAKE_CFLAGS_RELEASE
 >> QMAKE_CFLAGS_DEBUG
 >> QMAKE_CXXFLAGS_RELEASE
 >> QMAKE_CXXFLAGS_DEBUG
 >> in our qmake.conf.in since the only assignment done in
 >> mkspecs/common/gcc-base.conf only regards optimization.

 >  But that's a really elegant solution!

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
