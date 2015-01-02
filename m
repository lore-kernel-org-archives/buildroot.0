From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri,  2 Jan 2015 12:43:31 +0100
Subject: [Buildroot] [RFC 0/4] legal-info: save the external-toolchain
	source archive
Message-ID: <1420199015-16907-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

during the latest Buildroot Developer Days in October 2014, prompted by
Thomas De Schampheleire, we discussed a way to improve 'make legal-info' to
collect the external toolchain source code.

The external toolchain is a special package because
TOOLCHAIN_EXTERNAL_SITE/SOURCE points to a file that is indeed a binary
archive. The "actual" source code is usually provided by toolchain vendors
as a separate file.

During the BDD we stated [1]:

  We'll need to add a FOO_ACTUAL_SOURCES to the infrastructure: if set (to a
  tarball URL) it forces 'make legal-info' to download that tarball and
  store in the tarball directory instead of the FOO_SOURCE tarball.

I took the duty of implementing the above idea, and sketched a working
implementation in the next few days. Unfortunately, due to a enduring lack
of time, that work is still sitting half-baked on my hard disks.

I'm not totally happy with the approach, and I'm not even sure this the best
way to reach the goal. So I thought I'd send this RFC and see your comments.
If there is a real interest in going forward, maybe I (or anybody else) can
either complete the job or write a different implementation, as I elaborate
below.

Now to the implementation details.

Patch 1 is a simple cleanup and may be applied even without successive
patches.

The core change is in patch 2. I added two variables to the pkg-generic infra:
FOO_ACTUAL_SOURCE_TARBALL and FOO_ACTUAL_SOURCE_SITE, which default to the
value of the good old FOO_SOURCE and FOO_SITE. Then I use the new variables
for the legal-info processing.

If these variables are overridden, which will be the case for external
toolchains, they trigger an extra $(call DOWNLOAD,...) to fetch the actuel
package source tarball.

Patches 3 and 4 set the TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL to
appropriate values in external-toolchain.mk for most toolchains.
TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_SITE is never set because it happens to be
equal to TOOLCHAIN_EXTERNAL_SITE in all the cases I implemented.

The current solution works, but it shows some drawbacks.

First, the "actual source" is downloaded by 'make legal-info', not 'make
source'. This might be good for most users: after all, you don't need the
toolchain source code for daily development, only when releasing. These files
are large, hundreds of MBs, so saving time and bandwidth seems nice. however,
this diverges from the well-defined feature of 'make source', which is
supposed to download everything needed to later work offline.

Additionally, there's no "actual" version of FOO_EXTRA_DOWNLOADS. Thus
Blackfin toolchains, which use that feature, cannot habdled in a complete way.
Of course adding TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_EXTRA_DOWNLOADS is possible,
but I wonder if we want to add so any variables to the package infra.

Finally, there is no provision for extracting the license files from the
downloaded tarball, which would be a nice addition.

Overall, if we want this feature to complete and well-done, I feel it might
be a bit awkward and complex. Especially because this is done for one package
only.

It would be interesting to try a totally different implementation that does
not touch the generic package infra, but does all in hooks inside the
toolchain-external package. I haven't had a look at it, but it might be
simpler and maybe implement EXTRA_DOWNLOADS in a nice way as well.

That's all folks, here's the code. Be aware that it still misses docs and some
toolchains are not yet implemented (musl, Blackfin).

Regards,
Luca

[1] http://www.elinux.org/Buildroot:DeveloperDaysELCE2014#State_of_legal-info_infrastructure.2C_improvements_to_be_made.3F

Luca Ceresoli (4):
  legal-info: remove FOO_MANIFEST_TARBALL and FOO_MANIFEST_SITE defaults
  legal-info: allow to declare the actual sources for binary packages
  toolchain-externel: mass-define actual source tarball for known
    patterns
  toolchain-external: define actual sources for arago toolchains

 Makefile                                           |  1 -
 package/pkg-generic.mk                             | 25 ++++++++++++++++------
 toolchain/toolchain-external/toolchain-external.mk | 10 +++++++++
 3 files changed, 28 insertions(+), 8 deletions(-)

-- 
1.9.1
