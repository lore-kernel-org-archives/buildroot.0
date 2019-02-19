From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Feb 2019 21:09:28 +0100
Subject: [Buildroot] [git commit] core/pkg-infra: restore completeness
 of packages files lists
In-Reply-To: <20190208083943.3BB41884AC@busybox.osuosl.org> (Peter Korsgaard's
 message of "Fri, 8 Feb 2019 09:40:53 +0100")
References: <20190208083943.3BB41884AC@busybox.osuosl.org>
Message-ID: <871s43v8uf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=3c8f0d9efae92772c90521322a083e4f73985dd1
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > In commit 7fb6e782542f (core/instrumentation: shave minutes off the
 > build time), the built stampfile is used as a reference to detect files
 > installed by a package.

 > However, packages may install files keeping their mtime intact, and we
 > end up not detecting this. For example, the internal skeleton package
 > will install (e.g.) /etc/passwd with an mtime of when the file was
 > created in $(TOP_DIR), which could be the time the git repository was
 > checked out; that mtime is always older than the build stamp file, so
 > files installed by the skeleton package are never accounted for to that
 > package, or to any other package for that matters.

 > We switch to an alternate solution, which consists of storing some extra
 > metadata per file, so that we can more reasily detect modifications to
 > the files. Then we compare the state before the package is installed (by
 > reusing the existing list) and after the package is installed, compare
 > that to list any new file or modified files (in reality, ignoring
 > untouched and removed files). Finally, we store the file->package
 > association in the global list and store the new stat list as the global
 > list.

 > The format used for the .stat file is:

 > mtime:inode:perms:filetype:size,filename

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
 > Cc: Trent Piepho <tpiepho@impinj.com>

 > [Peter: rename files, reformat, only look for files and symlinks and pass
 > 	LC_ALL=C to comm as pointed out by Thomas De Schampheleire]

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
