From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 13:52:59 +0200
Subject: [Buildroot] [PATCH][autobuild] Use last 4 lines of log instead
 of 3 when getting failure reason
In-Reply-To: <1477478717-19209-1-git-send-email-vzakhar@synopsys.com>
References: <1477478717-19209-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20161026135259.425f0f0a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Oct 2016 13:45:17 +0300, Vlad Zakharov wrote:
> Latest versions of make produce a bit different output than older
> versions do. They also print number of line in Makefile where the
> failure occurred.
> 
> E.g. latest make produces the following output:
> ---------------------------------->8------------------------------------  
> GNUmakefile:277: recipe for target 'cgiedit.o' failed
> make[2]: *** [cgiedit.o] Error 1
> package/pkg-generic.mk:201: recipe for target '/home/buildroot/autobuild/run/instance-2/output/build/privoxy-3.0.26/.stamp_built' failed
> make[1]: *** [/home/buildroot/autobuild/run/instance-2/output/build/privoxy-3.0.26/.stamp_built] Error 2
> Makefile:88: recipe for target '_all' failed
> make: *** [_all] Error 2
> make: Leaving directory '/home/buildroot/autobuild/run/instance-2/buildroot'
> ---------------------------------->8------------------------------------  
> 
> When with old version we get something like:
> ---------------------------------->8------------------------------------  
> make[2]: *** [cgiedit.o] Error 1
> make[1]: *** [/home/buildroot/autobuild/run/instance-1/output/build/privoxy-3.0.26/.stamp_built] Error 2
> make: *** [_all] Error 2
> make: Leaving directory `/home/buildroot/autobuild/run/instance-1/buildroot'
> ---------------------------------->8------------------------------------  
> 
> So latest make produce much more "noise" and we have to analyze
> at least 4 last lines of log to be sure that they contain a line
> with failure reason.
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>

I'm a little bit worried about this change, because we did a fairly
similar change in commit 585358277b80dfe18b17b13035675bfe7db48b20,
which I quickly reverted in commit
a616a8c592caf2a9c9ce82ac1cac9681775452d3 because it was breaking
everything. Following 585358277b80dfe18b17b13035675bfe7db48b20, for a
large number of builds, the detected build failure was "all" or
"all-recursive".

So we really want to be extra careful, by testing the logic change on
existing build results first.

Also, another thing that is annoying that we have two places where we
calculate the failure reason: in autobuild-run (on the autobuild slave)
and in import.inc.php (which runs on autobuild.b.o when an autobuild
result is submitted).

Historically, the failure reason was only extracted in import.inc.php,
from the submitted log. But later on, some logic was added in
autobuild-run to extract the reason, which was used to make sure we
keep in build-end.log not just the 500 last lines of the build, but
the entire build log from the beginning of the failing package (which
requires knowing the package that failed building, and therefore
calculating the reason).

It would be great to get rid of this duplication, and have
autobuild-run calculate the reason, store it in a "reason" file,
submitted to autobuild.b.o as part of the tarball, and import.inc.php
simply reads that file. This way we have the reason calculation logic
in just one place.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
