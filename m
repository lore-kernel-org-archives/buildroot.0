From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 03 Jul 2016 22:27:48 +0200
Subject: [Buildroot] [Patch v3 1/3] ninja: new package
In-Reply-To: <1466796149-25218-2-git-send-email-eric.le.bihan.dev@free.fr>
 (Eric Le Bihan's message of "Fri, 24 Jun 2016 21:22:27 +0200")
References: <1466796149-25218-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1466796149-25218-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <871t3ampq3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

 > This new package provides the host variant of Ninja, a small build
 > system with a focus on speed.

 > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
 > ---
 >  package/ninja/ninja.hash |  2 ++
 >  package/ninja/ninja.mk   | 22 ++++++++++++++++++++++
 >  2 files changed, 24 insertions(+)
 >  create mode 100644 package/ninja/ninja.hash
 >  create mode 100644 package/ninja/ninja.mk

 > diff --git a/package/ninja/ninja.hash b/package/ninja/ninja.hash
 > new file mode 100644
 > index 0000000..47ec822
 > --- /dev/null
 > +++ b/package/ninja/ninja.hash
 > @@ -0,0 +1,2 @@
 > +# Locally generated
 > +sha256 51581de53cf4705b89eb6b14a85baa73288ad08bff256e7d30d529155813be19  ninja-v1.7.1.tar.gz
 > diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
 > new file mode 100644
 > index 0000000..f8cada4
 > --- /dev/null
 > +++ b/package/ninja/ninja.mk
 > @@ -0,0 +1,22 @@
 > +################################################################################
 > +#
 > +# ninja
 > +#
 > +################################################################################
 > +
 > +NINJA_VERSION = v1.7.1
 > +NINJA_SITE = $(call github,ninja-build,ninja,$(NINJA_VERSION))
 > +NINJA_LICENSE = Apache-2.0
 > +NINJA_LICENSE_FILES = COPYING
 > +
 > +HOST_NINJA_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)
 > +
 > +define HOST_NINJA_BUILD_CMDS
 > +	(cd $(@D); ./configure.py --bootstrap)
 > +endef
 > +
 > +define HOST_NINJA_INSTALL_CMDS
 > +	$(INSTALL) -m 0755 $(@D)/ninja $(HOST_DIR)/usr/bin/ninja

When the destination filename is passes then the -D option should be
used with install.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
