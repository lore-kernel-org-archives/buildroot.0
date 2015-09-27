From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 27 Sep 2015 11:39:20 +0200
Subject: [Buildroot] [PATCH v2 0/4] Cleanup trailing slashed from FOO_SITE
Message-ID: <1443346764-7433-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

after several months since v1 [0], here's the respin of my patch set to
clean up the form of FOO_SITE variables by removing all trailing slashes.

Those slashes are useless and potentially armful, which led to introducing a
workaround to strip them:

    commit 1cbffbd015106ea90fe49e27433375769dc1035b
    Author: Shawn J. Goff <shawn7400@gmail.com>
    Date:   Fri Apr 12 09:40:30 2013 +0000

        eliminate double slashes caused by FOO_SITE ending in a slash
    
        When a FOO_SITE variable ends in a slash and gets joined with a
        FOO_SOURCE variable like $(FOO_SITE)/$(FOO_SOURCE), the resulting URI
        has a double slash. While double-slashes are fine in unix paths, they
        are reserved in URIs - the part following '//' must be an authority.
    
        Signed-off-by: Shawn J. Goff <shawn7400@gmail.com>
        Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

v1 removed all these slashes but did not add a check to prevent some more
ones from slipping in new pagkages, and of course they did. So I took
Thomas' suggestion to add a check, and here it is.

In this patchset first I remove the slashes that are currently in
Buildroot, then I add a check so it doesn't happen again unnoticed. Finally
I remove the workaround that is not needed anymore and explicitly state in
the manual that trailing slashes are incorrect.

This work has been inspired by this comment from Arnout Vandecappelle [1]:
>>> >> > +else
>>> >> > +ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
>>> >> > +	    $(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE:/=)/$$($(2)$($(PKG)_SITE:/=)_ACTUAL_SOURCE_TARBALL))
> > 
> >  I think the $($(PKG)_SITE:/=) construct was just introduced because for some
> > packages, the _SITE ends with a / and that should be stripped, and we were too
> > lazy to fix the packages. Hm, looks like all the the external toolchain _SITEs
> > end with a /...

[0] http://lists.busybox.net/pipermail/buildroot/2015-March/121502.html
[1] https://patchwork.ozlabs.org/patch/424980/

Luca Ceresoli (4):
  Remove trailing slash from all package site URLs
  pkg-generic: prevent _SITE URLs with a trailing slash
  Download: remove trailing slash cleanup for SITE URLs
  docs/manual: FOO_SITE must not have a trailing slash

 docs/manual/adding-packages-generic.txt          | 6 ++++--
 package/angularjs/angularjs.mk                   | 2 +-
 package/audit/audit.mk                           | 2 +-
 package/c-icap-modules/c-icap-modules.mk         | 2 +-
 package/c-icap/c-icap.mk                         | 2 +-
 package/doxygen/doxygen.mk                       | 2 +-
 package/drbd-utils/drbd-utils.mk                 | 2 +-
 package/ebtables/ebtables.mk                     | 2 +-
 package/ibrcommon/ibrcommon.mk                   | 2 +-
 package/ibrdtn-tools/ibrdtn-tools.mk             | 2 +-
 package/ibrdtn/ibrdtn.mk                         | 2 +-
 package/ibrdtnd/ibrdtnd.mk                       | 2 +-
 package/ipmiutil/ipmiutil.mk                     | 2 +-
 package/libcddb/libcddb.mk                       | 2 +-
 package/libftdi1/libftdi1.mk                     | 2 +-
 package/libpam-radius-auth/libpam-radius-auth.mk | 2 +-
 package/lirc-tools/lirc-tools.mk                 | 2 +-
 package/monkey/monkey.mk                         | 2 +-
 package/mono-gtksharp3/mono-gtksharp3.mk         | 2 +-
 package/mosh/mosh.mk                             | 2 +-
 package/openipmi/openipmi.mk                     | 2 +-
 package/pkg-generic.mk                           | 4 +++-
 package/powertop/powertop.mk                     | 2 +-
 package/python-can/python-can.mk                 | 2 +-
 package/python-pycli/python-pycli.mk             | 2 +-
 package/python-pyxml/python-pyxml.mk             | 2 +-
 package/python-pyyaml/python-pyyaml.mk           | 2 +-
 package/quazip/quazip.mk                         | 2 +-
 package/rapidxml/rapidxml.mk                     | 2 +-
 package/setools/setools.mk                       | 2 +-
 package/sp-oops-extract/sp-oops-extract.mk       | 2 +-
 package/stress-ng/stress-ng.mk                   | 2 +-
 32 files changed, 37 insertions(+), 33 deletions(-)

-- 
1.9.1
