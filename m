From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Mar 2018 10:55:19 +0100
Subject: [Buildroot] [NEXT 20/26] linux: add CPE id
In-Reply-To: <CANQCQpaMEC_smNisciWyapbcLiMh9zccqFqeeAuEHm58t73KpA@mail.gmail.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1519697441-54194-21-git-send-email-matthew.weber@rockwellcollins.com>
 <20180227231826.79f1bdec@windsurf.lan>
 <CANQCQpaMEC_smNisciWyapbcLiMh9zccqFqeeAuEHm58t73KpA@mail.gmail.com>
Message-ID: <20180302105519.23bd18e0@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Feb 2018 22:12:18 -0600, Matthew Weber wrote:

> > How is the CPE database reacting when LINUX_VERSION is some random Git
> > SHA1, from a private Git tree that nobody has access to ?  
> 
> I brought this up to one of my security guys and he had a good point.
> He pointed out that since we keep the reporting seperate from any
> proposed automated CVE analysis.  The user specific analysis could
> manage taking the hash and manually doing the effort to tie that to a
> linux version.

Indeed, you can do it manually, but it kind of removes the whole point
of having automated tools to check which CVEs are applicable to your
system. And the kernel is a very critical part of the system.

> Then looking at the individual CVEs on top of that
> version.  There isn't a good way to include that in the buildsystem
> that we can see but most analysis tools have a way to keep notes with
> a configuration.  For any buildroot automated CVE reporting I don't
> think you'd run into this hash case for linux as there wouldn't be a
> default version selected as a hash (so far at least that I know of)

I'm sorry, I don't understand this last sentence, could you explain ?

> For packages which use hashes, the suggestion was made to use the
> major and minor syntax where we state the version to be the last
> release and the next wildcard field is the minor version and set we
> that to the hash.

CPE IDs have a concept of major and minor version ?

So we would have something like:

FOO_VERSION = f1d2d2f924e986ac86fdf7b36c94bcdf32beec15
FOO_CPE_ID = foo:foo:2.3:f1d2d2f924e986ac86fdf7b36c94bcdf32beec15

Where 2.3 is the closest "release" to
f1d2d2f924e986ac86fdf7b36c94bcdf32beec15 ?

If that's what you propose, then for Linux, we could have a Config.in
option to fill in what is the Linux official release that is the
closest to the custom version being used.

>  So for validating a CPE is correct (pkg-stats
> maintenance), we would just look at the major version.  However for
> the analysis activity where a target CPE report is used to find CVEs,
> they would take into account the major and also go look at the hash
> manually to determine where that falls past the  major.

Not sure I understand what you're proposing here.

> On the buildroot side we could also add CVE_PATCHED items covering
> that delta if we know what they are.  I should do an example of this
> in my next patchset (one of the github packages).

Yes, please do an example, it would probably be easier for me to
understand what you're proposing :)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
