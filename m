From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 1 Aug 2013 11:26:33 +0200
Subject: [Buildroot] ccache dependency issues
Message-ID: <CAAXf6LWo29hYTDoGfmoQRV4krkhy_vCy7-irvB1qas6RuGbJsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I have tested following patch successfully:
> http://patchwork.ozlabs.org/patch/256744 tar: avoid ccache chicken and egg problem when bootstrapping tar

This patch changes package/tar/tar.mk to set the host compiler to
HOSTCC_NOCCACHE. Thinking further however, I think there could be a
better solution.

host-ccache is built is part of BASE_PKGS, which comes after the
'dependencies' target. This means that when the dependencies are
built, there will never be a ccache yet. Hence, a more global solution
looks to be:

diff --git a/support/dependencies/dependencies.mk
b/support/dependencies/dependencies.mk
index a2d229c..6fd1df1 100644
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -25,6 +25,7 @@ core-dependencies:
                DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
                $(TOPDIR)/support/dependencies/dependencies.sh

+dependencies: HOSTCC=$(HOSTCC_NOCCACHE) HOSTCXX=$(HOSTCXX_NOCCACHE)
 dependencies: core-dependencies $(DEPENDENCIES_HOST_PREREQ)

 dependencies-source:

Here we force HOSTCC and HOSTCXX to the no-ccache version, only during
the dependencies step. This also fixes the host-tar/ccache chicken-egg
problem (tested), and will also help with other dependencies (for
example I assume that the host-xzcat will suffer from the same issue
when ccache is enabled).

What do you think of this solution?

Loosely related to this: it seems there also is a HOSTCPP variable,
but it is never changed in the context of ccache settings (see e.g.
Makefile), while it is passed to configure scripts of autotools
packages. Shouldn't there be a HOSTCPP_NOCCACHE as well, to be
correct?

Best regards,
Thomas
