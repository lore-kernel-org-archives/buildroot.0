From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Oct 2018 14:54:15 +0200
Subject: [Buildroot] [PATCH 2/5] download/git: re-run the backend with a
 lock to the git tree
In-Reply-To: <20180910225228.56cdb555@windsurf>
References: <cover.1534972250.git.yann.morin.1998@free.fr>
 <b5a3123305e1d4cef3cbdb17985e73161d13f407.1534972250.git.yann.morin.1998@free.fr>
 <20180910225228.56cdb555@windsurf>
Message-ID: <20181014125415.GG31509@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-09-10 22:52 +0200, Thomas Petazzoni spake thusly:
> On Wed, 22 Aug 2018 23:10:55 +0200, Yann E. MORIN wrote:
> > The access-pattern to the git repository must be entirely atomic.
> > 
> > This atomicity is currently guaranteed by the caller, from a higher
> > level. But this is not optimum, and it is better that the backend does
> > the locking it needs by itself, so that other backends from other builds
> > can still download for the same package (e.g. another build uses a wget
> > download for that package).
> 
> I'd like to challenge the complexity vs. benefit of this patch and
> PATCH 3/5. Basically, you replace a single $(FLOCK) call in dl-wrapper,
> by 30 additional lines in the git-specific wrapper (including a
> non-trivial trick that consists in calling itself), for a benefit that
> is very, very limited. A download of the exact same package, from
> another download method, happening at the same time. Can occur yes, but
> is it really worth the additional complexity? I doubt it.
> 
> So at this point, I am not really enthusiastic about 2/5 and 3/5, but
> perhaps you'll have some convincing arguments ?

So, the use-case I have is that I get 9 parallel jobs on the same
machine, with 6 of them retrieving the kernel from a very fast http/1.1
server, and the three others getting theirs from a rather slow and big
git repository.

Downloading the 6 http in parallel takes under 2 minutes, while each git
download takes about 20 to 30 minutes.

Scheduling (not) helping, it happens that, when a git one gets scheduled
first, the 6 http/1.1 ones are stalled, when they could in fact proceed,
and even finish before the first git download is done. And if scheduling
is really mad at you, then it will schedule the two other git downloads
before any of the http/1.1 ones.

So yes, it helps tremendously: some builds finish earlier and can go to
CI earlier.

Note that one may argue that BR2_DL_DIR should be set in the environment,
so that it points to the non-default location, so that it gets reused
everytime, thus alleviating the need for a big download. Yes, right, but
there are use-cases where this is not wanted.

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
