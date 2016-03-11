From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 12 Mar 2016 00:47:39 +0100
Subject: [Buildroot] [PATCH v2] Makefile: add --no-builtin-rules flag
Message-ID: <1457740059-9618-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When calling 'make', it takes several seconds before anything happens.
This is because all the makefiles that have to be parsed and variables
and rules that have to be evaluated.

One of the rules to be evaluated are the implicit rules that make adds
to check out the *.mk files from RCS etc. This obviously makes no
sense. Therefore, disable the built-in rules.

To avoid breaking package that depend on them, make sure we filter this
out when calling sub-makes. MFLAGS has to be overridden too, otherwise
the sub-make will just use that instead of MAKEFLAGS when MAKEFLAGS is
empty.

Time for 'make help > /dev/null' on my machine (with hot cache):
         before      after
real    0m4.167s   0m3.375s
user    0m3.596s   0m2.928s
sys     0m0.256s   0m0.180s

and for 'make graph-depends' on a large config:
         before      after
real    0m58.417s  0m53.625s
user    0m48.284s  0m43.680s
sys     0m4.076s   0m3.536s

A roughly 10% improvement.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v2: override MFLAGS as well.
---
 Makefile            | 2 ++
 package/Makefile.in | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index f2822a2..bbb2017 100644
--- a/Makefile
+++ b/Makefile
@@ -29,6 +29,8 @@ UMASK = 0022
 ifneq ($(shell umask),$(UMASK))
 .PHONY: _all $(MAKECMDGOALS)
 
+%.mk:
+
 $(MAKECMDGOALS): _all
 	@:
 
diff --git a/package/Makefile.in b/package/Makefile.in
index fbf5485..730810e 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -1,3 +1,4 @@
+MAKEFLAGS += --no-builtin-rules
 ifndef MAKE
 MAKE := make
 endif
@@ -5,6 +6,7 @@ ifndef HOSTMAKE
 HOSTMAKE = $(MAKE)
 endif
 HOSTMAKE := $(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
+HOSTMAKE += MAKEFLAGS="$(filter-out --no-builtin-rules,$(MAKEFLAGS))" MFLAGS=
 
 # If BR2_JLEVEL is 0, scale the maximum concurrency with the number of
 # CPUs. An additional job is used in order to keep processors busy
-- 
2.7.0
