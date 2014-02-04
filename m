From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Feb 2014 15:18:56 +0100
Subject: [Buildroot] [PATCH] pkg-download: make sure git downloads fail
	for unknown versions
In-Reply-To: <1391521016-6990-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 4 Feb 2014 14:36:56 +0100")
References: <1391521016-6990-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874n4f6jvz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The current git download helper creates the tarball by doing:
 >     git archive <version> | gzip -c > <tarball>

 > Unfortunately, even if "git archive" fails and returns a non-zero
 > error code, gzip ignores that, compresses nothing, and returns success
 > (zero error code). The consequence of this behavior is that when the
 > git version provided in the package is incorrect, we are not failing
 > during the download step, but later on when trying to extract the
 > tarball (which was incorrectly created as a result of the failing git
 > archive).

 > To fix this, we change the tarball creation logic to:

 >    git archive -o <tarball>.tmp <version> &&
 >    gzip -c <tarball>.tmp > <tarball> &&
 >    rm -f <tarball>.tmp

 > If the build is interrupted during the "gzip" command, we may leave
 > the .tmp file behind us, but this also happens with wget downloads,
 > and is generally not considered a problem, since this temporary file
 > will be overwritten next time we attempt to do download this package.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

This could probably be handled without a temporary file using bash's
pipefail support, but as we're planning on moving the download helpers
to seperate shell scripts .. - Committed, thanks.

-- 
Bye, Peter Korsgaard
