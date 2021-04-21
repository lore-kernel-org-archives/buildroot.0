From: Ivan Castell <icastell@circontrol.com>
Date: Wed, 21 Apr 2021 10:16:21 +0000
Subject: [Buildroot] Default makefile rule when the packages are disabled in
 buildroot configuration
Message-ID: <AM6PR05MB5928D117A458385E6FFCCA97A3479@AM6PR05MB5928.eurprd05.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all! Suppose we have two different .mk buildroot makefiles, pkgname1.mk and pkgname2.mk, with this particular content:

$ cat pkgname1.mk
FOO1_PKG_NAME = pkgname1

ifeq ($(BR2_PACKAGE_FOO1),y)

$(FOO1_PKG_NAME)-clean:
    $(MAKE) -C $(FOO_BUILD_DIR) clean
$(FOO1_PKG_NAME)-all:
    $(MAKE) -C $(FOO1_BUILD_DIR) all
$(eval $(generic-package))

endif

$ cat pkgname2.mk
FOO2_PKG_NAME = pkgname2

ifeq ($(BR2_PACKAGE_FOO2),y)

$(FOO2_PKG_NAME)-clean:
    $(MAKE) -C $(FOO_BUILD_DIR) clean
$(FOO2_PKG_NAME)-all:
    $(MAKE) -C $(FOO2_BUILD_DIR) all
$(eval $(generic-package))

endif

As you can see, the idea is not allowing the user to call the internal targets of the package if this package is disabled in the buildroot configuration (.config)

When pkgname1 and pkgname2 are enabled in buildroot .config (BR2_PACKAGE_FOO1 and BR2_PACKAGE_FOO2 are set to 'y') the rules can be executed and work as expected:

$ make pkgmane1-all
$ make pkgmane1-clean
$ make pkgmane2-all
$ make pkgmane2-clean

However, if we try to make a target when the related variable BR2_PACKAGE_FOO1 or BR2_PACKAGE_FOO2 is disabled in buildroot .config, you get this error:

$ make pkgname1-clean
make: *** No rule to make target 'pkgname1-clean'.  Stop.

We added a .DEFAULT rule in case BR2_PACKAGE_FOO1 or BR2_PACKAGE_FOO2 is disabled in buildroot .config, to avoid the issue:

$ cat pkgname1.mk
FOO1_PKG_NAME = pkgname1

ifeq ($(BR2_PACKAGE_FOO1),y)

$(FOO1_PKG_NAME)-clean:
    $(MAKE) -C $(FOO_BUILD_DIR) clean
$(FOO1_PKG_NAME)-all:
    $(MAKE) -C $(FOO1_BUILD_DIR) all
$(eval $(generic-package))

else
.DEFAULT:
    $(info BR2_PACKAGE_FOO1 is disabled)
endif

$ cat pkgname2.mk
FOO2_PKG_NAME = pkgname2

ifeq ($(BR2_PACKAGE_FOO2),y)

$(FOO2_PKG_NAME)-clean:
    $(MAKE) -C $(FOO_BUILD_DIR) clean
$(FOO2_PKG_NAME)-all:
    $(MAKE) -C $(FOO2_BUILD_DIR) all
$(eval $(generic-package))

else
.DEFAULT:
    $(info BR2_PACKAGE_FOO2 is disabled)
endif

Problem appears when both pkgname1 and pkgname2 are disabled in buildroot .config, as we get this warning:

package/pkgname1/pkgname1.mk: warning: overriding recipe for target '.DEFAULT'
package/pkgname2/pkgname2.mk: warning: ignoring old recipe for target '.DEFAULT'

That happens because make tool finds two different .DEFAULT rules defined. Yes, this issue is close related with make tool, but also with buildroot as it is related with the way builroot organizes makefiles for the .mk packages.

In this particular case, can you suggest the proper / most convenient way to set a (different) .DEFAULT rule for every single buildroot makefile .mk (package)?
Thanks!

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210421/bca952bf/attachment.html>
