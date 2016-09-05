From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Sep 2016 18:09:04 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-09-02
In-Reply-To: <20160905093047.GB5553@free.fr> (Yann E. MORIN's message of "Mon, 
 5 Sep 2016 11:30:47 +0200")
References: <20160903063033.788551028C6@stock.ovh.net>
 <2181287.8UlWShMbI3@sagittea>
 <20160903203613.2a7f0a32@free-electrons.com>
 <1496256.AqCB2eOqyL@sagittea>
 <20160903232302.40ff0733@free-electrons.com>
 <87vayau5yt.fsf@dell.be.48ers.dk> <20160905093047.GB5553@free.fr>
Message-ID: <87bn02tjkv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> The reason we have preferred https was to ensure data integrity
 >> (E.G. make sure we get the correct tarball), not for privacy.

 > Not sure. If you download the tarball for the tor package, you are
 > most probably flagged as an interesting target by Eve (or any other
 > three-letter agency ;-] ).

If you are really worried about that, then you shouldn't download from
dist.torproject.org at all (https or not):

host -t a dist.torproject.org
dist.torproject.org has address 138.201.14.197
dist.torproject.org has address 78.47.38.226
dist.torproject.org has address 82.195.75.101
dist.torproject.org has address 154.35.132.70
dist.torproject.org has address 38.229.72.16

Which all have .torproject.org reverse DNS.

 >> With the
 >> download hashes this doesn't really matter much, as corruption will be
 >> discovered by the hashes.

 > Hashes are not only about integrity. They are about authenticity as
 > well: be sure that upstream did not update the archive with another
 > re-release.

I see that as integrity, just a question about where the modification
happens - But ok.

 >> I think our options are:
 >> 
 >> - Do nothing. The issue is not so big, and presumably will get smaller
 >> over time as older distributions get updated.

 > That means we basically don't care about such old distributions anymore,
 > and that we should upgrade our autobuilders (or at least locally install
 > a wget that does accepts newer https stuff). That's fine with me.

Why? "Real users" either use something more stable than git head
(E.G. our sources.b.o mirror will normally download a copy of the
tarball within 1-2h of the commit getting pushed) or they know enough to
pass --no-check-certificate in BR2_WGET (or update wget).


 >> - Change HTTPS URLs to HTTP where possible. Notice that these days a
 >> number of websites use HSTS headers to enforce HTTPS. I'm not sure
 >> when HSTS support got added to wget though (not clear from changelog)

 > I would favour we stick to https where upstream provides it.

Any specific reason?


 >> - Pass --no-check-certificate in BR2_WGET to disable the check, working
 >> around the issues.

 > Maybe a note in the manual and (as J?r?me suggested) catch such a failure
 > in our wget wrapper? (but I wouldn't like we do the latter).

This gets somewhat complicated by the fact that we normally
automatically fall back to sources.b.o if upstream cannot be used, so
the error message should only be shown if it was a fatal error.

 > But I would argue against the suggestion to use --no-check-certificate,
 > and rather suggest to install a newer wget.

 > My suggestion would be we do (both):
 >   - add the note in the manual,
 >   - update the affected autobuilders (or at least install a newer wget).

I don't think we really need to update the autobuilders. I don't find it
a big problem that we have a few autobuilder failures the first 1-2h
after pushing a version bump. The error message is quite obvious and it
ensures we won't forget the issue.

But sure, we can add a note in the manual.

-- 
Venlig hilsen,
Peter Korsgaard 
