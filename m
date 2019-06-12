From: Sam Bobroff <sbobroff@linux.ibm.com>
Date: Wed, 12 Jun 2019 15:33:53 +1000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-06-10
In-Reply-To: <20190611060050.0BE6687AFF@hemlock.osuosl.org>
References: <20190611060050.0BE6687AFF@hemlock.osuosl.org>
Message-ID: <20190612053352.GA6981@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 11, 2019 at 06:00:42AM -0000, Thomas Petazzoni wrote:
> Hello,

[snip]

> Detail of failures
> ------------------
> 
>  powerpc64le |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/c4e0f6a3c79c9cb083a08f811b7d4838efef50f9 |     

[snip]

This failure building cups seems to be caused by an interaction between
buildroot and the cups package:

a) Buildroot setting the environment variable "GZIP" to "-n", and
b) the cups package internally using a Make variable "GZIP" for the path to
the gzip binary (i.e. "/bin/gzip").

So, when Make executes the rules for "install-data", the existance of
GZIP in Make's environment causes it to export it's value of GZIP into
the environment for the rules. Unfortunately for gzip, which is
expecting to see command line arguments in $GZIP, it now sees it's own
path as a command line option and the build fails with:

gzip: /bin/gzip.gz: Permission denied

I think the real fix should be in cups, because I *think* what all this
means is that it's always a bad idea to use a Make variable called
'GZIP' and they should rename it there. It fails the same way on the
master branch of cups so I've filed a bug report on their github issue
tracker.

However, it's easy to work around on the buildroot side with a hack in
the package file:
CUPS_MAKE_ENV = env -u GZIP
... but it does seem a bit cheeky to sneak a call to "env" in there. Is
there a better way to remove a variable from make's environment?

Should I post a patch for that fix, or a better one, for buildroot to
use before upstream fixes it? (Assuming they do.)

Cheers,
Sam.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190612/028e8b72/attachment.asc>
