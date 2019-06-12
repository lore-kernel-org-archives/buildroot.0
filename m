From: Sam Bobroff <sbobroff@linux.ibm.com>
Date: Wed, 12 Jun 2019 17:02:01 +1000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-06-10
In-Reply-To: <20190612084927.4e224933@windsurf>
References: <20190611060050.0BE6687AFF@hemlock.osuosl.org>
 <20190612053352.GA6981@tungsten.ozlabs.ibm.com>
 <20190612084927.4e224933@windsurf>
Message-ID: <20190612070200.GB6981@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 12, 2019 at 08:49:27AM +0200, Thomas Petazzoni wrote:
> Hello Sam,
> 
> First of all, thanks for the investigation. Adding Atharva, Arnout and
> Yann in Cc, since the issue is due to BR2_REPRODUCIBLE=y.
> 
> On Wed, 12 Jun 2019 15:33:53 +1000
> Sam Bobroff <sbobroff@linux.ibm.com> wrote:
> 
> > >  powerpc64le |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/c4e0f6a3c79c9cb083a08f811b7d4838efef50f9 |       
> > 
> > [snip]
> > 
> > This failure building cups seems to be caused by an interaction between
> > buildroot and the cups package:
> > 
> > a) Buildroot setting the environment variable "GZIP" to "-n", and
> > b) the cups package internally using a Make variable "GZIP" for the path to
> > the gzip binary (i.e. "/bin/gzip").
> > 
> > So, when Make executes the rules for "install-data", the existance of
> > GZIP in Make's environment causes it to export it's value of GZIP into
> > the environment for the rules. Unfortunately for gzip, which is
> > expecting to see command line arguments in $GZIP, it now sees it's own
> > path as a command line option and the build fails with:
> > 
> > gzip: /bin/gzip.gz: Permission denied
> > 
> > I think the real fix should be in cups, because I *think* what all this
> > means is that it's always a bad idea to use a Make variable called
> > 'GZIP' and they should rename it there. It fails the same way on the
> > master branch of cups so I've filed a bug report on their github issue
> > tracker.
> > 
> > However, it's easy to work around on the buildroot side with a hack in
> > the package file:
> > CUPS_MAKE_ENV = env -u GZIP
> > ... but it does seem a bit cheeky to sneak a call to "env" in there. Is
> > there a better way to remove a variable from make's environment?
> 
> Dropping the GZIP environment variable is maybe not going to work well
> either: the reason why GZIP = -n is because of BR2_REPRODUCIBLE=y. The
> -n option of gzip tells gzip to not store the file name and timestamp,
> which is necessary for reproducible builds. Of course, it all depends
> if the files that are being compressed by the cups build end up on the
> target. If they don't, we can live without the -n option. However, if
> they end up on the target, we really need to keep the -n option.

Ah, right. So that hack is no good, and it suggests that no hack on
the buildroot side can work as long as GZIP is being overwritten by the
package's build system. I'll have a go hacking the build system in cups
to rename the GZIP variable but hopefully their upstream will fix it
soon :-)

At least some of the compressed files are part of some kind of test data,
so I'll see if they're the only ones and could perhaps be left out
entirely.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190612/22a470e2/attachment.asc>
