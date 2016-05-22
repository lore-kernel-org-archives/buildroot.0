From: Mauro Condarelli <mc5686@mclink.it>
Date: Sun, 22 May 2016 22:24:03 +0200
Subject: [Buildroot] [PATCH 1/1] Fix config.mak.uname to allow
	cross-compilation
In-Reply-To: <1463948643-21344-1-git-send-email-mc5686@mclink.it>
References: <1463948643-21344-1-git-send-email-mc5686@mclink.it>
Message-ID: <1463948643-21344-2-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Current implementation imperatively sets variables from "uname" output.
This breaks cross-compilation because uname is run on host while target
configuration may be different.

Make current behavior a non-imperative default, so it's possible to
force different values setting make variables.

To cross-compile it will be necessary to explicitly set the various
uname_X variables to values compatible with target.
No change is needed with normal host compilation.
Patch is trivial.

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 config.mak.uname | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/config.mak.uname b/config.mak.uname
index 40d6b29..d933b23 100644
--- a/config.mak.uname
+++ b/config.mak.uname
@@ -1,11 +1,11 @@
 # Platform specific Makefile tweaks based on uname detection
 
-uname_S := $(shell sh -c 'uname -s 2>/dev/null || echo not')
-uname_M := $(shell sh -c 'uname -m 2>/dev/null || echo not')
-uname_O := $(shell sh -c 'uname -o 2>/dev/null || echo not')
-uname_R := $(shell sh -c 'uname -r 2>/dev/null || echo not')
-uname_P := $(shell sh -c 'uname -p 2>/dev/null || echo not')
-uname_V := $(shell sh -c 'uname -v 2>/dev/null || echo not')
+uname_S ?= $(shell sh -c 'uname -s 2>/dev/null || echo not')
+uname_M ?= $(shell sh -c 'uname -m 2>/dev/null || echo not')
+uname_O ?= $(shell sh -c 'uname -o 2>/dev/null || echo not')
+uname_R ?= $(shell sh -c 'uname -r 2>/dev/null || echo not')
+uname_P ?= $(shell sh -c 'uname -p 2>/dev/null || echo not')
+uname_V ?= $(shell sh -c 'uname -v 2>/dev/null || echo not')
 
 ifdef MSVC
 	# avoid the MingW and Cygwin configuration sections
-- 
2.1.4
