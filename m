From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Mar 2017 19:40:52 +0200
Subject: [Buildroot] [PATCHv2] core: enhance printvars
Message-ID: <20170328174052.7927-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, the output of printvars copntains the name of the variable,
its expanded value and its un-expanded value.

However, most of the time, we need the actual, expanded value, so it can
be re-used from a (non-Buildroot) infrastructure script, like a
post-build script, or a build-farm driver (e.g. a Jenkins job...)

Add two options that a user may set to change the output of printvars:
  - QUOTED_VARS, if set, will quote the value
  - RAW_VARS, if set, will print the unexpanded value

The new output by default only prints the expanded value now.

So that it can be used as such:

    $ make -s printvars VARS=BUSYBOX_VERSION
    BUSYBOX_VERSION=1.26.2

    $ make -s printvars VARS=BUSYBOX_RDEPENDENCIES QUOTED_VARS=YES
    BUSYBOX_RDEPENDENCIES='ncurses util-linux'

    $ make -s printvars VARS=BUSYBOX_FINAL_PATCH_DEPENDENCIES RAW_VARS=YES
    BUSYBOX_FINAL_PATCH_DEPENDENCIES=$(sort $(BUSYBOX_PATCH_DEPENDENCIES))

And it is even possible to directly evaluate it in a shell script:

    eval $(make -s printvars VARS=BUSYBOX_VERSION QUOTED_VARS=YES)

Backward compatibility of the output is not maintained. It is believed
that scripts that depended on the previous output were very fragile to
begin with, because they had to filter the non-formatted output
(splitting on spaces or braces was not really possible, because values
could contain either).

Document printvars and its options in the output of 'make help' and in
the manual.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - add the documentation  (Thomas, Arnout)
  - change the meaning of conmfig variables  (Thomas, Arnout)
  - don't maintain backward compatibility  (Thomas, Arnout)
---
 Makefile                  |  3 ++-
 docs/manual/make-tips.txt | 53 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index cceae92..d3530ad 100644
--- a/Makefile
+++ b/Makefile
@@ -940,7 +940,7 @@ printvars:
 		$(sort $(if $(VARS),$(filter $(VARS),$(.VARIABLES)),$(.VARIABLES))), \
 		$(if $(filter-out environment% default automatic, \
 				$(origin $V)), \
-		$(info $V=$($V) ($(value $V)))))
+		$(info $V=$(if $(QUOTED_VARS),')$(if $(RAW_VARS),$(value $V),$($V))$(if $(QUOTED_VARS),'))))
 
 clean:
 	rm -rf $(TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) \
@@ -1018,6 +1018,7 @@ help:
 	@echo '  source-check           - check selected packages for valid download URLs'
 	@echo '  external-deps          - list external packages used'
 	@echo '  legal-info             - generate info about license compliance'
+	@echo '  printvars              - dump all the variables known to make'
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index 97a3302..691e25f 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -77,3 +77,56 @@ To delete all build products as well as the configuration:
 If +ccache+ is enabled, running +make clean+ or +distclean+ does
 not empty the compiler cache used by Buildroot. To delete it, refer
 to xref:ccache[].
+
+.Dumping the internal make variables:
+
+One can dump all the variables known to make, along with their values:
+
+----
+ $ make -s printvars
+ VARIABLE=value_of_variable
+ ...
+----
+
+It is possible to tweak the output using some variables:
+
+- +VARS+ will limit the listing to variables which names match the
+  specified make-pattern
+- +QUOTED_VARS+, if set to +YES+, will single-quote the value
+- +RAW_VARS+, if set to +YES+, will print the unexpanded value
+
+For example:
+
+----
+ $ make -s printvars VARS=BUSYBOX_%DEPENDENCIES
+ BUSYBOX_DEPENDENCIES=skeleton toolchain
+ BUSYBOX_FINAL_ALL_DEPENDENCIES=skeleton toolchain
+ BUSYBOX_FINAL_DEPENDENCIES=skeleton toolchain
+ BUSYBOX_FINAL_PATCH_DEPENDENCIES=
+ BUSYBOX_RDEPENDENCIES=ncurses util-linux
+----
+
+----
+ $ make -s printvars VARS=BUSYBOX_%DEPENDENCIES QUOTED_VARS=YES
+ BUSYBOX_DEPENDENCIES='skeleton toolchain'
+ BUSYBOX_FINAL_ALL_DEPENDENCIES='skeleton toolchain'
+ BUSYBOX_FINAL_DEPENDENCIES='skeleton toolchain'
+ BUSYBOX_FINAL_PATCH_DEPENDENCIES=''
+ BUSYBOX_RDEPENDENCIES='ncurses util-linux'
+----
+
+----
+ $ make -s printvars VARS=BUSYBOX_%DEPENDENCIES RAW_VARS=YES
+ BUSYBOX_DEPENDENCIES=skeleton toolchain
+ BUSYBOX_FINAL_ALL_DEPENDENCIES=$(sort $(BUSYBOX_FINAL_DEPENDENCIES) $(BUSYBOX_FINAL_PATCH_DEPENDENCIES))
+ BUSYBOX_FINAL_DEPENDENCIES=$(sort $(BUSYBOX_DEPENDENCIES))
+ BUSYBOX_FINAL_PATCH_DEPENDENCIES=$(sort $(BUSYBOX_PATCH_DEPENDENCIES))
+ BUSYBOX_RDEPENDENCIES=ncurses util-linux
+----
+
+The output of quoited raw variables can be reused in shell scripts,
+for example:
+
+----
+ eval $(make -s printvars VARS=BUSYBOX_VERSION RAW_VARS=YES QUOTED_VARS=YES)
+----
-- 
2.9.3
