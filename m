From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Apr 2012 16:45:16 +0200
Subject: [Buildroot] [PATCH 04/22] kconfig: do not use HOST_LOADLIBES anymore
In-Reply-To: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
References: <cover.1334673910.git.thomas.petazzoni@free-electrons.com>
Message-ID: <31de136ce5b40f5607e1ab4b7c02623d7c85dbca.1334673910.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/kconfig/Makefile.br                      |    4 ++--
 support/kconfig/patches/10-br-build-system.patch |   12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/support/kconfig/Makefile.br b/support/kconfig/Makefile.br
index c24b6b5..2f8b6ba 100644
--- a/support/kconfig/Makefile.br
+++ b/support/kconfig/Makefile.br
@@ -22,10 +22,10 @@ host-cxxobjs := $(addprefix $(obj)/,$(sort $(foreach m,$(__hostprogs),$($(m)-cxx
 HOST_EXTRACFLAGS += -I$(obj)
 
 $(host-csingle): %: %.c
-	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $< $(HOST_LOADLIBES) -o $(obj)/$@
+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $< -o $(obj)/$@
 
 $(host-cmulti): %: $(host-cobjs) $(host-cshlib)
-	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $(addprefix $(obj)/,$($(@F)-objs)) $(HOST_LOADLIBES) $(HOSTLOADLIBES_$(@F)) -o $(obj)/$@
+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $(addprefix $(obj)/,$($(@F)-objs)) $(HOSTLOADLIBES_$(@F)) -o $(obj)/$@
 
 $(host-cxxmulti): %: $(host-cxxobjs) $(host-cobjs) $(host-cshlib)
 	$(HOSTCXX) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCXXFLAGS_$@) $(addprefix $(obj)/,$($(@F)-objs) $($(@F)-cxxobjs)) $(HOSTLOADLIBES_$(@F)) -o $(obj)/$@
diff --git a/support/kconfig/patches/10-br-build-system.patch b/support/kconfig/patches/10-br-build-system.patch
index 85125e5..c5d9a75 100644
--- a/support/kconfig/patches/10-br-build-system.patch
+++ b/support/kconfig/patches/10-br-build-system.patch
@@ -3,10 +3,10 @@
  foo.h       |   12 ++++++++++++
  2 files changed, 65 insertions(+)
 
-Index: config/Makefile.br
+Index: kconfig/Makefile.br
 ===================================================================
 --- /dev/null
-+++ config/Makefile.br
++++ kconfig/Makefile.br
 @@ -0,0 +1,53 @@
 +src := .
 +top_srcdir=../../
@@ -32,10 +32,10 @@ Index: config/Makefile.br
 +HOST_EXTRACFLAGS += -I$(obj)
 +
 +$(host-csingle): %: %.c
-+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $< $(HOST_LOADLIBES) -o $(obj)/$@
++	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $< -o $(obj)/$@
 +
 +$(host-cmulti): %: $(host-cobjs) $(host-cshlib)
-+	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $(addprefix $(obj)/,$($(@F)-objs)) $(HOST_LOADLIBES) $(HOSTLOADLIBES_$(@F)) -o $(obj)/$@
++	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@) $(addprefix $(obj)/,$($(@F)-objs)) $(HOSTLOADLIBES_$(@F)) -o $(obj)/$@
 +
 +$(host-cxxmulti): %: $(host-cxxobjs) $(host-cobjs) $(host-cshlib)
 +	$(HOSTCXX) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCXXFLAGS_$@) $(addprefix $(obj)/,$($(@F)-objs) $($(@F)-cxxobjs)) $(HOSTLOADLIBES_$(@F)) -o $(obj)/$@
@@ -61,10 +61,10 @@ Index: config/Makefile.br
 +
 +FORCE:
 +.PHONY: FORCE clean distclean
-Index: config/foo.h
+Index: kconfig/foo.h
 ===================================================================
 --- /dev/null
-+++ config/foo.h
++++ kconfig/foo.h
 @@ -0,0 +1,12 @@
 +#ifndef __KCONFIG_FOO_H
 +#define __KCONFIG_FOO_H
-- 
1.7.4.1
