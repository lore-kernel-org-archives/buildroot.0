From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 14:27:47 +0100
Subject: [Buildroot] [PATCH 1/2] cc-tool: drop BR2_PACKAGE_BOOST_SIGNALS
 select
In-Reply-To: <20190112205026.6173-1-fontaine.fabrice@gmail.com>
References: <20190112205026.6173-1-fontaine.fabrice@gmail.com>
Message-ID: <20190113142747.1e8ca78b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Jan 2019 21:50:25 +0100, Fabrice Fontaine wrote:
> cc-tool depends on signals2 not signals
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

This commit message is a bit terse:

 - Where do you see that cc-tool depends on signals2 not signals?

 - Why it doesn't need to select some BOOST_SIGNALS2 option ?

in cc-tool/boost.m4, I see:

# Look for Boost.Signals.  For the documentation of PREFERRED-RT-OPT, see the
# documentation of BOOST_FIND_LIB above.
BOOST_DEFUN([Signals],
[BOOST_FIND_LIB([signals], [$1],
                [boost/signal.hpp],
                [boost::signal<void ()> s;])
])# BOOST_SIGNALS

# BOOST_SIGNALS2()
# -----------------
# Look for Boost.Signals2
BOOST_DEFUN([Signals2],
[BOOST_FIND_HEADER([boost/signals2.hpp])])

So it's not that clear cut that it uses *only* signals2. A bit of
clarification would be nice. Though indeed, grepping for "signals"
through the code only shows:

src/data/progress_watcher.h:#include <boost/signals2.hpp>
src/data/progress_watcher.h:	typedef boost::signals2::signal<void (uint_t done_size, uint_t full_size)> OnProgress;

So is the check for "Signals" in m4/boost.m4 some dead code ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
