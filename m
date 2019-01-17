From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 17 Jan 2019 22:54:19 +0100
Subject: [Buildroot] [PATCH next v2] package/pkg-meson: support
 per-package directories
In-Reply-To: <20181130104003.32337-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 30 Nov 2018 11:40:03 +0100")
References: <20181130104003.32337-1-thomas.petazzoni@bootlin.com>
Message-ID: <87fttr6jck.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > From: Peter Seiderer <ps.report@gmx.net>
 > Currently, package/meson/meson.mk generates a single global
 > cross-compilation.conf file, with the path to the compiler, cflags,
 > ldflags, and various other details. This file is then used when
 > building all meson-based packages.

 > This causes two problems:

 >  - It is not compatible with per-package directories, because with
 >    per-package folders, we need to use a different compiler, and
 >    possibly CFLAGS/LDFLAGS for each package.

 >  - It is not possible to define per package CFLAGS. Indeed, when
 >    cross-compiling, meson doesn't support passing CFLAGS through the
 >    environment, only the CFLAGS from cross-compilation.conf are taken
 >    into account.

 > For this reason, this commit:

 >  - Introduces a per-package cross-compilation.conf, which is generated
 >    by the pkg-meson infrastructure in the "configure" step right
 >    before calling meson. The file is generated in $(@D)/build/, and
 >    because it is generated within a given package "configure" step,
 >    the compiler path is the one of this package.

 >  - Keeps the global cross-compilation.conf in $(HOST_DIR)/etc/meson/,
 >    for the SDK use-case of Buildroot. Since we want the final and
 >    global values of the compiler path, CFLAGS and LDFLAGS, generating
 >    this global cross-compilation.conf is moved to a
 >    TARGET_FINALIZE_HOOKS. If we were keeping this as a
 >    HOST_MESON_POST_INSTALL_HOOKS, it would contain values specific to
 >    the host-meson package.

 > For now, we don't yet support per-package CFLAGS/LDFLAGS, but having
 > such per-package cross-compilation.conf is a necessary preparation to
 > achieve this goal.

 > This commit has been tested by building all Buildroot packages that
 > use meson: json-glib, systemd, enlightenment, at-spi2-core, ncmpc,
 > libmpdclient and ncmpc.

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > [Thomas:
 >  - add extended commit log
 >  - in pkg-meson.mk, re-use variables defined in meson.mk to do the
 >    replacement of CFLAGS/LDFLAGS/CXXFLAGS
 >  - move the generation of the global cross-compilation.conf to a
 >    TARGET_FINALIZE_HOOKS
 >  - testing with per-package folders]
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 > Changes since v1:
 >  - Rework commit title and commit log. Indeed, we don't implement
 >    per-package CFLAGS as part of this commit, contrary to what the
 >    previous commit log was saying. However, having a per-package
 >    cross-compilation.conf is a necessary preparation step to implement
 >    per-package CFLAGS in the future.

Committed, thanks.

-- 
Bye, Peter Korsgaard
