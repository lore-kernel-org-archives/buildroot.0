From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jan 2013 21:25:24 +0100
Subject: [Buildroot] [RFC v1] Prototype implementation of per-package out of
	tree build
Message-ID: <1358713538-4364-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

There has recently been some interest in improving the support for
overriden packages by doing out of tree build of all packages. Since I
had the beginning of a prototype working, I cleaned it up, made
numerous fixes to make it work apparently properly, and share it with
the community.

The following patches should be considered as a prototype, I haven't
tested all packages (of course), and there are quite certainly some
corner case issues that haven't been solved. However, I think it's a
good time to get more testing in order to find, and solve those
issues.

It should also not be considered yet that we want this feature in
Buildroot. It is again only a prototype, which aims at solving the
remaining problems, and see if we think it is a good idea to have this
in Buildroot or not.

For those who want to test, the 'out-of-tree' branch is available at:

  git://git.free-electrons.com/users/thomas-petazzoni/buildroot.git

Here is a quick summary of what this patch set does:

 * The tarballs are now extracted in $(O)/src/<pkg>-<version>

 * Each tarball is extracted and patched only once, even if there is
   both a target build and a host build. Once a package has been
   extracted and patched, its source code is changed to not have write
   permissions, in order to catch misbehaving packages in terms of out
   of tree build.

 * The builds continue to be done in $(O)/build/<pkg>-<version> for
   target packages and $(O)/build/host-<pkg>-<version> for host
   packages.

 * A <pkg>_SUPPORTS_OUT_OF_TREE variable defines whether the package
   supports out of tree build or not. By default, it's set to NO, in
   which case the package source code is rsynced from its source
   directory to the build directory at the beginning of the configure
   step. It is set to YES by both the autotools and cmake package
   infrastructures (which have been modified to do out of tree build),
   and by some packages that use the generic infrastructure but
   nonetheless support out of tree build.

 * The override source directory mechanism is updated to take
   advantage of this out of tree support. Now, if you override a
   package that supports out of tree build, the source code is no
   longer rsynced to the build directory. This makes the override
   source directory mechanism a lot more usable for big packages such
   as the Linux kernel.

Amongst the known remaining issues to solve are:

 * The semantic of the 'make <pkg>-dirclean' command. Should it remove
   the build directory and the source directory? Only the build
   directory? If it removes both (which the proposed prototype
   currently does), it is strange because you remove one build variant
   (host or target) and the source directory, but the other build
   variant (target or host) remains.

 * I am not sure on how we want to handle <pkg>-reconfigure and
   <pkg>-rebuild. I guess we want to tell the user to do his changes
   in the package source directory, output/src/<pkg>-<version>. But
   all files in this source directory are marked read-only, so it's
   not very practical.

   In addition to this, for packages that don't support out of tree
   build, we do a rsync at the beginning of the configure step. So if
   the user does "make <pkg>-reconfigure", then the source code gets
   rsynced again from the source directory to the build directory, but
   not if the user does "make <pkg>-rebuild".

Comments, ideas, suggestions are welcome.

Best regards,

Thomas
