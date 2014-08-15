From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 15 Aug 2014 19:22:19 +0200
Subject: [Buildroot] [PATCH 2/2 v3] support/download: fix the git helper
	output file format
In-Reply-To: <2205cccc9b1580208e604067224448da94599151.1407343550.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 6 Aug 2014 18:47:53 +0200")
References: <cover.1407343550.git.yann.morin.1998@free.fr>
 <2205cccc9b1580208e604067224448da94599151.1407343550.git.yann.morin.1998@free.fr>
Message-ID: <87ppg11xdg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The git helper uses gzip to compress the intermediate tarball. But gzip
 > removes the source file, and create a new file named by appending .gz to
 > the original file name.

 > Thus, we end up with output.gz, while the download wrapper expects jsut
 > output, and thus believes the downlaod failed.

 > Fix that by storing the tar from git to a temporary file, then pipe this
 > file to gzip's stdin, and redirect gzip's stdout to the output file.

 > Reported-by: Graham Newton <gnewton@peavey-eu.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Seiderer <ps.report@gmx.net>
 > ---
 >  support/download/git | 4 ++--
 >  1 file changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/support/download/git b/support/download/git
 > index d451530..ff6b5c3 100755
 > --- a/support/download/git
 > +++ b/support/download/git
 > @@ -34,6 +34,6 @@ if [ ${git_done} -eq 0 ]; then
 >  fi
 
 >  GIT_DIR="${basename}" \
 > -${GIT} archive --prefix="${basename}/" -o "${output}" --format=tar "${cset}"
 > +${GIT} archive --prefix="${basename}/" -o "${output}.tmp" --format=tar "${cset}"
 
 > -gzip "${output}"
 > +gzip <"${output}.tmp" >"${output}"

Don't we then end up with a bunch of foo.tmp files?

-- 
Bye, Peter Korsgaard
