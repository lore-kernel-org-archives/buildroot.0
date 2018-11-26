From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 19:15:19 +0100
Subject: [Buildroot] [PATCH next v6 05/10] Makefile: define
 TARGET_DIR_WARNING_FILE relative to TARGET_DIR
In-Reply-To: <20181123145815.13008-6-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 23 Nov 2018 15:58:10 +0100")
References: <20181123145815.13008-1-thomas.petazzoni@bootlin.com>
 <20181123145815.13008-6-thomas.petazzoni@bootlin.com>
Message-ID: <87o9abso20.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > In commit 7e9870ce32d6329d9e3d602247fbe1709a2275a4 ("core: introduce
 > intermediate BASE_TARGET_DIR variable"), the definition of
 > TARGET_DIR_WARNING_FILE was changed to use $(BASE_TARGET_DIR) instead
 > of $(TARGET_DIR).

 > However, this change is incompatible with per-package directories, and
 > is in fact not needed.

 > With per-package directories, using $(BASE_TARGET_DIR) means that
 > TARGET_DIR_WARNING_FILE is
 > output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM. Due to this, when
 > skeleton-init-common or skeleton-custom attempt to install it, it
 > fails, because it should be installed to their package per-package
 > target directory, and not the global output/target directory that doesn't
 > exist yet. The failure looks like this:

 > /usr/bin/install -m 0644 support/misc/target-dir-warning.txt /home/thomas/projets/buildroot/output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
 > /usr/bin/install: cannot create regular file '/home/thomas/projets/buildroot/output/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM': No such file or directory
 > make[1]: *** [package/pkg-generic.mk:336: /home/thomas/projets/buildroot/output/build/skeleton-init-common/.stamp_target_installed] Error 1

 > TARGET_DIR_WARNING_FILE is used in three places:

 >  - In skeleton-custom.mk and skeleton-init-common.mk, where as
 >    explained above, using $(TARGET_DIR) fixes the use of
 >    $(TARGET_DIR_WARNING_FILE) in the context of per-package target
 >    directories.

 >  - In fs/common.mk, where it is used as argument to $(notdir ...) to
 >    retrieve just the name of the warning file. So in this case, we
 >    really don't care about the path of the file, just its name.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
