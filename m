From: Avery Pennarun <apenwarr@gmail.com>
Date: Tue, 22 Jan 2013 16:11:04 -0500
Subject: [Buildroot] [RFC v1] Prototype implementation of per-package
 out of tree build
In-Reply-To: <1358713538-4364-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358713538-4364-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHqTa-00en6nZEq8+K696uyaTckQoGP8ThK2J-sXYATTzcOTbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 20, 2013 at 3:25 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> There has recently been some interest in improving the support for
> overriden packages by doing out of tree build of all packages. Since I
> had the beginning of a prototype working, I cleaned it up, made
> numerous fixes to make it work apparently properly, and share it with
> the community.

I'm a little nervous about the out-of-tree stuff in general: my
experience is that out-of-tree builds don't work with quite a lot of
packages, so while it would work with the key stuff (particularly the
kernel and the toolchain, probably) it would always end up a little
flakey.

On the other hand, I've been thinking about a totally different
approach that people might find interesting.  What if we made a local
git repo out of every tree?  Basically:

 - extract the tarball
 - git init
 - git add .
 - git commit -m 'initial tarball $filename'
 - git am /path/to/relevant/patches  # apply the patches and commit them in git

Then if you want to share files between, say, host-* and target-*, you
can use the git_new_worktree script to make a second checkout from the
same git repo.

If someone is working in one of the trees and makes a change, it's
then easy to 'git checkout .' in the other tree and get the same
changes.  So your builds can be identical, but there's no need for the
hackery around read-only files, etc.  And there's a 'git clean' to
guaranteed wipe out all the non-source files (to rebuild without
having to erase and re-extract/re-patch the directory, so it's
faster), 'git diff' to tell you if any of your source files have been
changed, etc.

Using git for the patch queue also makes it easy to update or add
patches using 'git rebase'.  For example, sometimes I've patched a
particular package and notice a bug in my patch, so I would like to
patch the patch.  The way I do this is to 'git am' the patch sequence,
then modify the code, then 'git rebase -i' to merge and rearrange the
patches, then 'git format-patch' to re-extract the set of patches and
drop them back into buildroot.

If buildroot did all this explicitly and automatically as part of the
build process, it would grow a dependency on git.  But on the other
hand, it could automate a lot of neat stuff, like extracting patches.
And "out of tree" builds could just be "in tree" builds with a
different worktree pointing at the same local git repo.

This is just an idea, but it has a lot of potential I think.  I
already do it manually when working on packages inside buildroot, so I
know it works in essence.  And git is so fast that there's basically
no overhead.

Have fun,

Avery
