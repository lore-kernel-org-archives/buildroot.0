From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat,  3 Oct 2015 23:18:17 +0200
Subject: [Buildroot] [PATCH v2 0/4] legal-info: save the external-toolchain
	source archive
Message-ID: <1443907101-5290-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

during the Buildroot Developer Days in October last year, prompted by
Thomas De Schampheleire, we discussed a way to improve 'make
legal-info' to collect the external toolchain source code.

The external toolchain is a special package because
TOOLCHAIN_EXTERNAL_SITE/SOURCE points to a file that is indeed a binary
archive. The "actual" source code is usually provided by toolchain vendors
as a separate file.

During the BDD we stated [1]:

  We'll need to add a FOO_ACTUAL_SOURCES to the infrastructure: if set (to a
  tarball URL) it forces 'make legal-info' to download that tarball and
  store in the tarball directory instead of the FOO_SOURCE tarball.

I submitted a first patchset in January [2], which got some comments
and change requests by Arnout. One of them was to cleanup to trailing
slash in all FOO_SITE variables, for which I submitted a separate
patchset, now in v4 [3].

The two patchset are pretty much indepent anyway, and this one rebases
seamlessly on top of the slash-removal one.

Now it's time to revive this patchset. Changes are quite minor, however.

The core change is in patch 1. I added two variables to the pkg-generic infra:
FOO_ACTUAL_SOURCE_TARBALL and FOO_ACTUAL_SOURCE_SITE, which default to the
value of the good old FOO_SOURCE and FOO_SITE. Then I use the new variables
for the legal-info processing.

If these variables are overridden, which will be the case for external
toolchains, they trigger an extra $(call DOWNLOAD,...) to fetch the actual
package source tarball.

Patches 2 and 3 set the TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL to
appropriate values in external-toolchain.mk for most toolchains.
TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_SITE is never set because it happens to be
equal to TOOLCHAIN_EXTERNAL_SITE in all the cases I implemented.

Patch 4 documents it all in the manual.

The current solution works fine according to all my tests.

There are a few improvements that might be done.

The first limitation it that there's no "actual" version of
FOO_EXTRA_DOWNLOADS. Thus Blackfin toolchains, which use that feature,
cannot be handled in a complete way. Arnout proposed FOO_ACTUAL_SOURCE
to become a list of files rather than a single file. It should work,
but I prefer to add it later and the the bulk of the changes up and
running first.

The other is there's no provision for extracting the license files
from the downloaded tarball, which would be a nice addition. I'd leave
that for the future as well. It's a separate feature, after all.

That's all folks, here's the code. Be aware that some toolchains are
not yet implemented: Blackfin for the reason stated above, musl
because there seem to be no complete source code tarball.

Regards,
Luca

[1] http://www.elinux.org/Buildroot:DeveloperDaysELCE2014#State_of_legal-info_infrastructure.2C_improvements_to_be_made.3F
[2] http://lists.busybox.net/pipermail/buildroot/2015-January/116303.html
[3] http://lists.busybox.net/pipermail/buildroot/2015-October/140813.html

Luca Ceresoli (4):
  legal-info: allow to declare the actual sources for binary packages
  toolchain-external: mass-define actual source tarball for known
    patterns
  toolchain-external: define actual sources for arago toolchains
  docs/manual: document new actual source package variables

 Makefile                                           |  1 -
 docs/manual/adding-packages-generic.txt            | 19 ++++++++++++++++++
 package/pkg-generic.mk                             | 23 +++++++++++++++++-----
 toolchain/toolchain-external/toolchain-external.mk | 12 +++++++++++
 4 files changed, 49 insertions(+), 6 deletions(-)

-- 
1.9.1
