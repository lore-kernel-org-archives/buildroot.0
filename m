From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Feb 2017 18:07:22 +0100
Subject: [Buildroot] [PATCH v3 2/5] package: add generic support for lz
	archives
In-Reply-To: <c885b432-86b6-860a-c020-cd73f05ff581@mind.be>
References: <0f0805c9d18137c555b446d6b6e7dd2c68d6e770.1486930542.git.baruch@tkos.co.il>
 <1e78e6f82883e4ba95766459a39cbd2d49934152.1486930542.git.baruch@tkos.co.il>
 <20170215221520.41e4c66e@free-electrons.com>
 <83572997-616f-8bec-fadb-0a59bbf847ed@mind.be>
 <20170216174124.GB4986@free.fr> <87efyxg5df.fsf@dell.be.48ers.dk>
 <20170216221119.GE4986@free.fr>
 <c885b432-86b6-860a-c020-cd73f05ff581@mind.be>
Message-ID: <20170217170722.GA3470@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-02-17 08:43 +0100, Arnout Vandecappelle spake thusly:
> On 16-02-17 23:11, Yann E. MORIN wrote:
> > Peter, All,
> > 
> > On 2017-02-16 23:03 +0100, Peter Korsgaard spake thusly:
> >>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> >>  > Actually, there is a use-case for being able to specify some of those,
> >>  > at least the downloaders: git, wget, svn, scp...
> >>
> >>  > I use a script that is called in lieue of each downloader:
> >>
> >>  >     BR2_WGET="/path/to/wrapper wget --passive-ftp -nd -t 3"
> >>  >     BR2_GIT="/path/to/wrapper git"
> >>  >     and so on...
> >>
> >>  > That script is responsible for memorising, for each package, whether it
> >>  > was downloaded from the primary mirror, the official site, or the backup
> >>  > mirror, then acts according to where the package was downloaded:
> > [--SNIP--]
> >> Nice, but presumably you could also simply create a directory with
> >> wget/git/svn/.. symlinks to your wrapper and prepend that to your path
> >> before running buildroot, and then change the wrapper to do its stuff
> >> and call further in the path for the real tool, similar to the recently
> >> added date wrapper for reproducable builds?
> > 
> > Indeed, that would be doable, if a little bit more involved in the
> > wrapper. But not something overly complex either.
> > 
> > So, overriding the downloaders is in fact not strictly required.
> 
>  Actually, for the downloaders there *are* useful options to override, e.g.
> proxies, authentication, certificate stores, ... The configuration variables are
> not the most convenient way to use those (especially since you may need to use
> different options for different packages, e.g. internal vs. external),

Besides, options valid in a location may well be invalid in another. For
example, proxies can be different, even in an enterprise network (i.e.
location- or destination-based proxies). So those should be in the
environment of the user doing the build, not in the configuration.

Sme goes for the certificate stores (just to re-use your examples): an
enterprise proxy could well be an MITM proxy, so would need its certs to
be used. Or as you said, an internal server may require a set of certs
and another server another set, so that would need different options
per-package. Which we already offer, by the way...

> but it's
> the only thing we have now. Apart from wrapper scripts, of course.

I come to believe that using wrappers in those conditions is the best
answer we can suggest.

IMHO, setting site-local options in the config is toxic.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
