From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 21:45:30 +0200
Subject: [Buildroot] [PATCHv2] infra: add the transient download
 mechanism
In-Reply-To: <20200930173030.2461586-1-yann.morin.1998@free.fr>
References: <20200930173030.2461586-1-yann.morin.1998@free.fr>
Message-ID: <20200930214530.6b964a45@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Sep 2020 19:30:30 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> People have been hollering for a long time, asking for a way to be able
> to trigger a build that will always get the current HEAD (or whatever it
> is called outside of git) of a branch, whatever the conditions, so that
> they can trigger automated builds (e.g. in a CI or whatever) to test
> their greatest and latest changes, by pushing again and again ad libitum
> on the same branch, without having the need to update the sha1 in the
> .mk of the affected package.

[...]

I'm all happy with the implementation, but I still disagree on one bit,
which is present in both the commit log and the documentation, so I'll
comment on the documentation.

> +  obvious being the *lack of reproducibility*. Besides, it has its own
> +  pitfalls that one must be aware of as well:
> +  ** when two builds are running in parallel on the same machine, there
> +     is a TOCTOU race for each build to download and extract the archive,
> +     so each build may not get what it downloaded, but what the other
> +     build did download;

This is not a pitfall, it is what we expect from the feature. The
feature is "grab" whatever is currently available on the Git repository
for that package. It is pretty clear that it is not guarantee that we
grab what existed in the Git repository at the moment the user hits
"Enter" after typing the make command. There is no way we could
atomically snapshot all Git trees of all packages to ensure that what
we build is a consistent view of what existed at the moment the build
was started.

So I think this pitfall is needlessly worrying, and does not actually
point to an actual problem. Or more precisely, the problem you're
pointing is *exactly* what the transient download mechanism aims at
doing.

So to me, the wording of your pitfall is a bit as if the wget(1) man
page had an entry like this:

BUGS

	WARNING: wget might download data from remote servers to your
	local machine!!

> +  ** as a consequence, legal-info is not reliable when a package is
> +     transient;

*That* I believe is the real pitfall.

> +  ** if a branch is pushed to an automated build bot (in a CI for
> +     example), and then re-pushed to while the build is still in
> +     progress, the build may get the wrong version of the branch.

This is also *NOT* a pitfall, it is what we ask the transient download
mechanism to do.

Once this is fixed, I'll be happy to apply the patch!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
