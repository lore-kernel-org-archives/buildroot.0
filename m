From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 22:52:28 +0200
Subject: [Buildroot] [PATCH 2/5] download/git: re-run the backend with a
 lock to the git tree
In-Reply-To: <b5a3123305e1d4cef3cbdb17985e73161d13f407.1534972250.git.yann.morin.1998@free.fr>
References: <cover.1534972250.git.yann.morin.1998@free.fr>
 <b5a3123305e1d4cef3cbdb17985e73161d13f407.1534972250.git.yann.morin.1998@free.fr>
Message-ID: <20180910225228.56cdb555@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Arnout.

On Wed, 22 Aug 2018 23:10:55 +0200, Yann E. MORIN wrote:
> The access-pattern to the git repository must be entirely atomic.
> 
> This atomicity is currently guaranteed by the caller, from a higher
> level. But this is not optimum, and it is better that the backend does
> the locking it needs by itself, so that other backends from other builds
> can still download for the same package (e.g. another build uses a wget
> download for that package).

I'd like to challenge the complexity vs. benefit of this patch and
PATCH 3/5. Basically, you replace a single $(FLOCK) call in dl-wrapper,
by 30 additional lines in the git-specific wrapper (including a
non-trivial trick that consists in calling itself), for a benefit that
is very, very limited. A download of the exact same package, from
another download method, happening at the same time. Can occur yes, but
is it really worth the additional complexity? I doubt it.

So at this point, I am not really enthusiastic about 2/5 and 3/5, but
perhaps you'll have some convincing arguments ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
