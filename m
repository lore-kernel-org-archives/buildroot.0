From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Jun 2014 19:34:31 +0200
Subject: [Buildroot] autoconf caching
In-Reply-To: <CAE9DZUT8+z0NF5O6sh=y4svCfQW0bh1Zt4r7OM9fe9nYvk-O0w@mail.gmail.com>
References: <CAE9DZUT8+z0NF5O6sh=y4svCfQW0bh1Zt4r7OM9fe9nYvk-O0w@mail.gmail.com>
Message-ID: <20140605173431.GB3553@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dallas, All,

On 2014-06-05 11:34 -0500, Dallas Clement spake thusly:
> Hi All - I have seen posts on this subject before.  It looks like things
> flamed out.
> 
> http://lists.gnu.org/archive/html/autoconf/2012-11/msg00022.html
> 
> I'm getting killed by autoconf.  My builds take 1.5 hours even with ccache
> turned on.  Most of the cores in my very impressive build machine are
> sitting on their !#@ while autoconf is running.  Most of my packages rely
> on autotools and it seems that most of the time spent is running configure
> scripts.
> 
> Can anyone offer some advice on how to speed things up with autoconf?  Or
> is it a lost cause?

Yes, it is a lost cause.

autoconf implements a way for the user to provide pre-canned answers to
tests, so it looks tempting to just provide such a set of answers,
gathered during the build, so that latter packages profit from the tests
done in previous packages.

We had something like that in the past, since we thought that would be
such a good idea.

Turned out it is not, after all.

The underlying problem is that the naming of variables is not consistent
across packages, so two packages may use two different variables for the
same test. While this is sub-optimal, it causes no much harm, it is just
not as fast as it could be.

But since the naming is inconsistent, it means that two packages may
also use the same variable for two different tests. This is causing much
more pain, since the results from a previous package would pollute the
tests for a latter package.

The result is that caching autoconf tests is a really bad idea, in fact.

As Baruch suggested, you may want to give a spin at top-level parallel
builds. This is turned off by default (see top-level Makefile, lines 46
to 60).

However, if you have a mostly-linear chain of dependency (aka a deep
dependency tree), you'll gain nothing, or close to nothing. If your
dependency tree is wide (as opposed to deep), then you may get a
noticeable speed up.

Also notice that top-level parallel builds are bad for reproducibility,
since you then no longer guarantee the ordering of non-dependent package
builds, and there might be hideen (unknown to Buildroot) dependencies
that would kick in one build but not in another, even though using the
same .config file.

So, besides getting a yet-faster machine, there's not much you can do to
speed up the build...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
