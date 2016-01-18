From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2016 20:45:52 +0100
Subject: [Buildroot] [PATCH] support/download: support older bazaar
	versions
In-Reply-To: <1453040769-32040-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 17 Jan 2016 15:26:09 +0100")
References: <1453040769-32040-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87wpr6658v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > In efe7f68 (support/download: generate reproducible Bazaar archives),
 > bzr was instructed to store files with the timestamp set to the date
 > they were last modified in the repository, instead of the current date,
 > using the --per-file-timestamp option.

 > However, this option has been added only in bzr-2.2 (August 2010) which
 > is not available on older distros.

 > We fix that by not using --per-file-timestamp when the bzr version is
 > older than 2.2, in which case we just generate the archive with the
 > current date set on files.

 > This means the archive is thus non-reproducible, and if a hash is
 > available for that archive, the hash will not match, and Buildroot will
 > try to download from the mirror (if any) or fail (if no mirror).

 > Fixes:
 >     http://autobuild.buildroot.org/results/51f/51f4ff5462c15a85937d411f457096224d00fdcd
 >     http://autobuild.buildroot.org/results/b88/b8828b5fbc16128408c2f44169ac23de7e34d770
 >     http://autobuild.buildroot.org/results/fb4/fb4b0fb2131b40c18273dbe5e51b393cb6df18ec
 >     ...

 > Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > ---
 > Note: as explained above, when the bzr version is too old, then
 > Buildroot may have to fallback to downloading from the mirror. It
 > means we must ensure that we store a reproducible archive on *our*
 > mirror, so affected users can indeed get the archive. Users using
 > their own mirrors, or using local (br2-external) packages, are on
 > their own, of course.

I actually didn't even have bzr installed on sources.buildroot.org, so
we didn't have any bzr-generated archives. I'll get it installed now.
 
 > +# --per-file-timestamps comes with bzr-2.2 (released August 2010),
 > +# so only pass it if bzr is recent enough. We compute versions as:
 > +# major*1000 + minor
 > +bzr_min_version=2002
 > +bzr_version=$(($(bzr --version |
 > +                 sed -r -e '/^Bazaar \(bzr\) ([[:digit:]]+)\.([[:digit:]]+)\..*$/!d;' \
 > +                        -e 's//\1*1000+\2/;'
 > +                )

Doing the replacement in one go is imho easier to understand, so I
changed it to:

sed -r -n 's/^Bazaar \(bzr\) ([[:digit:]]+)\.([[:digit:]]+)\..*$/\1*1000+\2/p'

And committed, thanks!

-- 
Bye, Peter Korsgaard
