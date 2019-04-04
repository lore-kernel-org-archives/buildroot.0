From: Vadim Kochan <vadim4j@gmail.com>
Date: Fri, 5 Apr 2019 01:08:52 +0300
Subject: [Buildroot] [PATCH] package/gettext-tiny: bump version to add
 --template option
In-Reply-To: <20190404213628.wuudx3nhc7whbqci@vkochan-ThinkPad-T470p>
References: <20190404143132.7416-1-giulio.benetti@micronovasrl.com>
 <20190404221806.20fa9881@windsurf>
 <20190404213628.wuudx3nhc7whbqci@vkochan-ThinkPad-T470p>
Message-ID: <20190404220852.h7acijgiazajy77r@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Again,

On Fri, Apr 05, 2019 at 12:36:28AM +0300, Vadim Kochan wrote:
> Hi Thomas, Giulio, All
> 
> On Thu, Apr 04, 2019 at 10:18:06PM +0200, Thomas Petazzoni wrote:
> > On Thu,  4 Apr 2019 16:31:32 +0200
> > Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:
> > 
> > > Some package(i.e. rygel) uses gettext-tiny msgfmt with --template option
> > > to build, but current version(0.3.1) doesn't support --template flag and
> > > exits giving:
> > > "fopen: No such file or directory"
> > > On master branch they've added support for --template after lot of
> > > modifications, so it's hard to produce a patch to be applied against
> > > 0.3.1.
> > > 
> > > Then bump version to latest master branch commit.
> > > 
> > > Fixes:
> > > http://autobuild.buildroot.net/results/77b/77b1854c914915d3205d915a0f01001f6f3555df/
> > > 
> > > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> > > ---
> > >  package/gettext-tiny/gettext-tiny.hash | 2 +-
> > >  package/gettext-tiny/gettext-tiny.mk   | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > Applied to master, thanks.
> > 
> 
> It causes to fail libglib2 with formatting errors :(,
> just checked with ./utils/test-pkg ...
> 
> Regards,
> Vadim Kochan

The following diff helps .....

----------------------8<------------------------------
diff --git a/package/Makefile.in b/package/Makefile.in
index dc818a2c18..c719d39235 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -159,6 +159,9 @@ TARGET_HARDENED += -D_FORTIFY_SOURCE=2
 endif
 
 TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
+TARGET_CPPFLAGS += -DLIBINTL_NO_MACROS=1
+endif
 TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_HARDENED)
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
@@ -220,6 +223,9 @@ UNZIP := $(shell which unzip || type -p unzip) -q
 APPLY_PATCHES = PATH=$(HOST_DIR)/bin:$$PATH support/scripts/apply-patches.sh $(if $(QUIET),-s)
 
 HOST_CPPFLAGS  = -I$(HOST_DIR)/include
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),)
+HOST_CPPFLAGS += -DLIBINTL_NO_MACROS=1
+endif
 HOST_CFLAGS   ?= -O2
 HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
---------------------->8------------------------------

Regards,
Vadim Kochan
