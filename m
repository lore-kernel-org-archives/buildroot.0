From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Mar 2018 17:33:45 +0100
Subject: [Buildroot] [PATCH 2/2] core/instrumentation: shave minutes off
 the build time
In-Reply-To: <20180318161530.GA2478@scaer> (Yann E. MORIN's message of "Sun,
 18 Mar 2018 17:15:30 +0100")
References: <cover.1521146096.git.yann.morin.1998@free.fr>
 <6a793a6dba4f052ca8bbc35edd63df601f46478b.1521146096.git.yann.morin.1998@free.fr>
 <87muz5fp2n.fsf@dell.be.48ers.dk> <20180318161530.GA2478@scaer>
Message-ID: <87efkhfimu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> - It doesn't work for packages using rsync to install,
 >> E.G. skeleton-init-common as rsync also sets the mtime to match the
 >> source files

 > We could maybe tell rsycn not to do that, then?

Yes, possibly.

 >> - It breaks for <pkg>-reinstall

 > Well, we can't guarantee anything except with a clean build from scratch
 > anyway.

True. We could potentionally do a touch on the stamp file before running
find, but it is somewhat icky.

 >> I don't think either of those are really big issues compared to the huge
 >> slowdown, but it is worth noticing.

 > Well, the -reinstall was already not working correctly, because the list
 > pf files before/after would be alsmost the same, and the md5-diff would
 > miss all the laready-installed files for the package.

 > The rsync issue is new, but we can "fix" it in a later patch, then, for
 > those packages like the skeletons, by using the --no-times option for
 > example.

Yes. I guess we cannot use --no-times unconditionally in SYSTEM_RSYNC,
as the mtime shouldn't be touched for source files so OVERRIDE_SRCDIR
doesn't rebuild too much.

 > However, if a third-party package internally uses rsync as its install
 > method, we're screwed. But who would be insane enough to do that? ;-]

And even so, the breakage is not so bad.


 > Alternatively, we could use ctime instead of mtime, maybe? Or check
 > both?

ctime would presumably miss modifications to existing files, so that is
no good.

 >> > +define step_pkg_size_inner
 >> > +	cd $(2); \
 >> > +	find . \( -type f -o -type L \) \
 >> > +		-newer $($(PKG)_DIR)/.stamp_built \
 >> > +		-exec printf '$(1),%s\n' {} + \
 >> > +		>> $(BUILD_DIR)/packages-file-list$(3).txt
 >> 
 >> What find version are you using? My fileutils find (and the busybox
 >> applet) use 'l' for symlinks, so I've changed it to that.

 > Doh, the s/L/l/ is still uncomitted here. Dang...

;)

-- 
Bye, Peter Korsgaard
