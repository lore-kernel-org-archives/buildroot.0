From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Mar 2018 23:36:03 +0100
Subject: [Buildroot] [PATCH] pkg-virtual.mk: explicitly set <pkg>_VERSION /
 _SOURCE for robustness
Message-ID: <20180312223603.21788-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Recently a build failure was reported which was traced back to to the fact
that the user had a TOOLCHAIN_VERSION environment variable set which leads
to a strange looking error message:

toolchain/toolchain/toolchain.mk:40: *** TOOLCHAIN_SITE cannot be empty when
TOOLCHAIN_SOURCE is not.  Stop.

Environment variables automatically gets converted to make variables by GNU
make - E.G. from the manual
(https://www.gnu.org/software/make/manual/html_node/Environment.html):

Variables in make can come from the environment in which make is run.  Every
environment variable that make sees when it starts up is transformed into a
make variable with the same name and value

So we end up in make with TOOLCHAIN_VERSION set to the value of the
environment variable.  As virtual packages do not have a version, there is
no explicit TOOLCHAIN_VERSION = ..  line in toolchain.mk overriding this
value, and the logic in package/pkg-generic.mk sets a default value for
TOOLCHAIN_SOURCE when TOOLCHAIN_VERSION is set, and finally errors out as
TOOLCHAIN_SITE isn't set.

As a workaround, explicitly set <pkg>_VERSION and <pkg>_SOURCE to the empty
string in the virtual package infrastructure.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-virtual.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
index 0de79d49be..05bd63eb18 100644
--- a/package/pkg-virtual.mk
+++ b/package/pkg-virtual.mk
@@ -41,6 +41,11 @@ $$(error No implementation selected for virtual package $(1). Configuration erro
 endif
 endif
 
+# explicitly set these so we do not get confused by environment
+# variables with the same names.
+$(2)_VERSION =
+$(2)_SOURCE =
+
 $(2)_IS_VIRTUAL = YES
 
 # Add dependency against the provider
-- 
2.11.0
