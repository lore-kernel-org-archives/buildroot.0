From: Robin Jarry <robin.jarry@6wind.com>
Date: Sat, 12 Sep 2020 13:44:20 +0200
Subject: [Buildroot] [PATCH v4 1/2] support/scripts/pycompile: fix .pyc
 original source file paths
In-Reply-To: <20200911211543.GB10548@scaer>
References: <20200904112908.21686-1-julien.floret@6wind.com>
 <20200910083252.7102-1-robin.jarry@6wind.com>
 <20200910083252.7102-2-robin.jarry@6wind.com>
 <20200911211543.GB10548@scaer>
Message-ID: <20200912114420.mm4qyzw6jbncuiaw@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

2020-09-11, Yann E. MORIN:
[snip]
> This...
[snip]
> ... and this is scary to me... :-(
> 
> I understand the reasoning: no need to re-compile a file that was
> already compiled and has not changed. This is an understandable
> optimisation, and one that was already present in the previous script.
> 
> Still, having to poke into the internals sounds a bit too invasive to
> me, especially as those internals are version-specific (as your
> coditional code demonstrates).

Yes that is not very pretty and it will certainly be a burden to carry
in the long run. I made the effort to implement this so that the
previous incremental build feature was preserved.

> Can't we instead use ctime or mtime to detect whether a file needs
> updating?

I am not sure it would be reliable given that buildroot may change the
mtime of .py files in $(TARGET_DIR). But yes, it could be possible.
I think it would be safer to remove this feature completely.

> Alternatively, how much time do we actually shave off the build with
> this optimisation? I've done a simple build with this defconfig:
[snip]
> The build takes 3min 40s, and the pre-compilation takes less than a
> second. Of course, adding more python module will only increase the
> pre-compile duration.
> 
> I think the duration gain is negligible, while the intricacies of the
> code to detect whether pre-compilation should occur is probably too much
> of a burden, maintenance-wise.
> 
> So, it is my opinion we should rop this.

I agree, byte compiling python code is very fast and even if every
python package is selected, the time it takes to compile all .py files
will be completely negligible compared to the full duration of the
build. The --force option could be removed in my opinion.

> Of course, no need to reend for now: I'd like the opinion from the other
> maitnainers,, and maybe we can leave the topic open for others to review
> as well. Also, if we decide to drop it, I can do that pretty easily when
> applying...

I don't mind doing a v5 with --force removed or with a different (less
reliable?) way to determine if .py files should be recompiled.

Cheers,

-- 
Robin
