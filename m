From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Apr 2016 23:05:07 +0200
Subject: [Buildroot] [PATCH RFC] core/pkg-download: ignore hashes from
	mirror for VCS downloads
In-Reply-To: <57141122.7050805@mind.be> (Arnout Vandecappelle's message of
 "Mon, 18 Apr 2016 00:41:38 +0200")
References: <1460931432-13459-1-git-send-email-yann.morin.1998@free.fr>
 <57141122.7050805@mind.be>
Message-ID: <877ffsc7p8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 04/18/16 00:17, Yann E. MORIN wrote:
 >> When a download via a VCS method fails, Buildroot attempts the download
 >> from the backup mirror (if any is set). Such a download is done with the
 >> wget helper.
 >> 
 >> Given a package that has a .hash file for relase tarballs, which also
 >> allows the user to use a random revision from a VCS, the normal download
 >> wrapper will not check for hashes, on the assumption that maybe they are
 >> not reproducible [*].
 >> 
 >> However, when the download fails (for any reason: network error,
 >> upstream removed the revision, old machine with incomplete set of CA
 >> certificates...), the backup download now proceeds over with http (or
 >> https) with the wget wrapper. The wget wrapper *always* checks for
 >> hashes, and when a .hash file is present but no hash is found for the
 >> download, this is considered an error.
 >> 
 >> However, when we download from the backup mirror for a main download
 >> that should have been done with git, we in this situation have no hash
 >> for the download. Thus, we should not fail on a missing hash for that
 >> download.
 >> 
 >> Add a test for the site-method in the backup mirror download; if it was
 >> either one of the VCS method, pass a one-off BR_NO_CHECK_HASH_FOR
 >> variable set to contain the tarball to download.

 >  Even though this looks like a bit of a hack, I see no better way of
 > handling the situation.

 >  However, the same should also be done for PRIMARY_SITE IMHO.

Agreed. I moved the variable handling to the beginning of DOWNLOAD_INNER
so it is set when we handle BR2_PRIMARY_SITE as well and committed,
thanks.

-- 
Bye, Peter Korsgaard
