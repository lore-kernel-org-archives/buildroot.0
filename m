From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jan 2019 23:05:35 +0100
Subject: [Buildroot] [PATCH 00/19] support: limit install-time
 instrumentation to current package's files (branch yem/files-list-2)
Message-ID: <cover.1546898693.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Currently, the instrumentation steps, that we run after a package is
installed, get confused about the files that package may have be
responsible for.

The first problem is that all .la files are tweaked after a package is
installed, and thus those files are all then newer than the built
stampfile of that package, and consequently all .la files are accounted
to that package.

The second problem is that, during development and agter a user
requested a package reinstall (but not a rebuild!), then the built
stampfile is much older, and thus all files that have been installed
since the package was last built are accoutned to that package.

Those two problems are caused by 7fb6e782542f, when we switched away
from an md5 comparison between the state before and after the
installation, to a time-based comparison against the bult stampfile.

Furthermore, during development, the list of installed files can get
out of sync with what is really installed. For example, if a user were
to modify the source of a package, and trigger a re-configure, rebuild,
or re-install, then we'd remove the list of previously installed files
before generating the list of currently installed files. If files
installed in the previous installation are no longer installed, they are
still present in the target (or staging or host), but no longer
accounted to the package that instaleld them.

Additionally, when two or more packages install the same file and it has
the same content, we don't care much about which actually installed it,
as they would all have installed the exact same file. The size could be
assigned to any of those packages, and the licensing terms of any of
those package may be applied to that file. The case is mostly prominent
with the fftw familly of packages (soon to come) that install the same
headers and the same utilities.

Finally, there is one prominent file that gets _updated_ (and not
replaced) by many packages: the info page index, which packages update
when they install their own info pages. We currently report that file,
when in fact it does not end up in target, and thus we don't care about
how its content came to be. And more generically, we don't care any file
that we eventually remove as part of our target-finalize cleanups.

This series is thus an attempt at fixing all those issues.

First and foremost, the series addresses the limitation that causes the
first two problems: we do not have a way to know when the install steps
were started (or any other step, for that matters, but we're currently
only interested in the install steps). So, the first few patches make it
so that we can introduce an new timestamp file at the beginning of each
step.

Then, with the information about the beginning of the install step, we
can now limit the .la files tweaking to just those files that were
actually instaleld y a package. And then we use that same stamp file to
limit the listing of installed files accountable to the current package.

Then the series addreses the same-identical-file-from-many-packages. To
do so, it partially restore the md5sum of the files, but this is
limitted to only those files actually touched during the install of the
current package (see above), and is only ran at the end of the install,
not before. As thus, this is much faster than the original situation
that did the md5 of all files before and after, because it now acts on
cache-hot files only.

That part is split in two: first, the formnat of the packages-file-list
files is modified to be more resilient to weird filenames, which then
allows us to expand it with arbitrarily more fields. A python helper is
provided to abstract the new format, and the consumers of those files
are updated to use the helper (with one script being rewritten in
python). Then we make use of this new format to store the md5 of the
files contents, which we eventually use to decide whether to report the
file or not.

Now, files that are missing from the destination directory are no longer
elligible for being reported as being touched by more than ne pacakge
anymore.

And finally, now that we have a dependable check for uniqueness, we can
add an option in the menuconfig to turn the current warning into a hard
error when uniqueness is not met.

Since this is a time-sensitive topic, here are a few timings before and
after this series, over 6 runs on an idle machine, with a configuration:

  - prebuilt glibc toolchain
  - 233 packages, most pretty small and building fast
  - target/:  215MiB, 14922 files, directories, symlinks...
  - staging/: 625MiB, 29029 files, directories, symlinks...
  - host/:    2.1GiB, 44129 files, directories, symlinks...

                best           minutes:seconds          worst   mean
    before:     36:20   36:22   36:23   36:24   36:27   36:28   36:24
    after:      36:29   36:31   36:32   36:33   36:35   36:37   36:33

So, this is a 9s overhead over 2184s (36:24, before), i.e. a mere 0.4%
increase in time over the full build, or just about a 38ms overhead per
package on average. This overhead is real, but is still very far from
the huge one that was choped off by 7fb6e782542f.

Additionally, the time for re-installing the last package does not
suffer from an already large number or size of files already present.
Best result of three builds (to be cache-hot), for one target package
with a staging install, and one for host package:

            skeleton-init-common-reinstall    host-patchelf-reinstall
    before:            8.258s                       4.951s
    after:             4.514s                       5.034s
    delta:             -3.744s                     +0.083s

So, basically, what this means is that, during development, reinstalling
a previous package is faster. This is because, even though we spend (a
little tiny wee bit) more time when lisitings files due to the md5sum
(and really, thats really just a few additional millieconds per package),
we get repaid hundreths-fold because the list is now accurate, and we
can limit ourselves to tweaking only the corresponding .la file, but
also limit the check-bin-arch to only those files actually interesting.

The host packages are still slightly impacted as we can see for
host-patchelf, because the check-bin-arch does not apply to them, so the
gain from running check-bin-arch only on just-installed files can't
apply to host packages. Still, the impact is minor.

I'd like to particularly thank Nicolas Cavallari for their valuable
input about the issues they encountered with the previous and current
situations. Many thanks! :-)


Regards,
Yann E. MORIN.


The following changes since commit 8e928a8389d88e0f64f04ee1b3aa4985dcfd373f

  Makefile, manual, website: Bump copyright year (2019-01-06 21:30:34 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to c7478b1fd1c92508f346f1a8626374d742c9c327

  core: add optional failure when 2+ packages touch the same file (2019-01-07 23:04:09 +0100)


----------------------------------------------------------------
Yann E. MORIN (19):
      infra/pkg-generic: display MESSAGE before running PRE_HOOKS
      infra/pkg-generic: create $(@D) before running PRE_HOOKS
      infra/pkg-generic: introduce new stampfile at the beginning of all steps
      infra/pkg-generic: use \0 to separate .la files as they are found
      infra/pkg-generic: tweak only .la files installed by the current package
      infra/pkg-generic: only list files installed by the current package
      infra/pkg-generic: offload same-package filtering to check-uniq-file
      support/check-uniq-files: decode as many strings as possible
      support: add parser in python for packages-file-list files
      support: rewrite check-bin-arch in python
      support: introduce new format for packages-file-list files
      infra/pkg-generic: store md5 of just-installed files
      support/check-uniq-file: invert condition logic
      support/check-uniq-files: don't report files of the same content
      support/check-uniq-files: use argparse to enfore required options
      core: check unique files in the corresponding finalize step
      core: check for unique target files after all our cleanups
      core: ignore non-unique files that have disapeared
      core: add optional failure when 2+ packages touch the same file

 Config.in                        |   8 ++
 Makefile                         |  22 ++++-
 package/pkg-generic.mk           |  41 +++++---
 support/scripts/brpkgutil.py     |  38 ++++++++
 support/scripts/check-bin-arch   | 205 +++++++++++++++++++++------------------
 support/scripts/check-uniq-files |  69 +++++++------
 support/scripts/size-stats       |  14 +--
 7 files changed, 255 insertions(+), 142 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
