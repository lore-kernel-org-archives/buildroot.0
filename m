From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2021 22:49:46 +0100
Subject: [Buildroot] [git commit branch/2020.11.x]
 utils/checkpackagelib/lib_mk.py: handle 'else' and 'elif' statements
Message-ID: <20210105213307.3A9C68182C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c52d5edae3befad25741c18e27579469bb70774b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

An 'else' or 'elif' clause inside a make conditional should not be indented
in the same way as the if/endif clause. check-package did not recognize the
else statement and expected an indentation.

For example:

ifdef FOOBAR
	interesting
else
	more interesting
endif

would, according to check-package, need to become:

ifdef FOOBAR
	interesting
	else
	more interesting
endif

Treat 'else' and 'elif' the same as if-like keywords in the Indent test, but
take into account that 'else' is also valid shell, so we need to correctly
handle line continuation to prevent complaining about the 'else' in:

ifdef FOOBAR
	if true; \
	    ... \
	else \
	    ... \
	fi
endif

We don't add the 'else' and 'elif' statements to start_conditional, because
it would cause incorrect nesting counting in class OverriddenVariable.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a1bb132a81889b057134669d8b7135168b2f8024)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/checkpackagelib/lib_mk.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 45e37e4598..0278354434 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -16,12 +16,13 @@ from checkpackagelib.lib import Utf8Characters         # noqa: F401
 
 # used in more than one check
 start_conditional = ["ifdef", "ifeq", "ifndef", "ifneq"]
+continue_conditional = ["elif", "else"]
 end_conditional = ["endif"]
 
 
 class Indent(_CheckFunction):
     COMMENT = re.compile(r"^\s*#")
-    CONDITIONAL = re.compile(r"^\s*({})\s".format("|".join(start_conditional + end_conditional)))
+    CONDITIONAL = re.compile(r"^\s*({})\s".format("|".join(start_conditional + end_conditional + continue_conditional)))
     ENDS_WITH_BACKSLASH = re.compile(r"^[^#].*\\$")
     END_DEFINE = re.compile(r"^\s*endef\s")
     MAKEFILE_TARGET = re.compile(r"^[^# \t]+:\s")
@@ -43,7 +44,7 @@ class Indent(_CheckFunction):
         expect_tabs = False
         if self.define or self.backslash or self.makefile_target:
             expect_tabs = True
-        if self.CONDITIONAL.search(text):
+        if not self.backslash and self.CONDITIONAL.search(text):
             expect_tabs = False
 
         # calculate for next line
