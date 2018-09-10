From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Sep 2018 17:00:09 +0200
Subject: [Buildroot] [PATCH v5 0/3] Add tainting support to buildroot
In-Reply-To: <CA+_SqVbyxT0xCg-7mtryFm-=GRCqwZo2hPpwNaVe8nG8_wxxbA@mail.gmail.com>
References: <20180909073616.GC2841@scaer>
 <20180909141037.69b16e95@windsurf.home>
 <CA+_SqVbJqv2On+9UPE4pcoyiK1wfDZp=t1h1yMdfVB-CQGp91g@mail.gmail.com>
 <20180909133341.GJ2841@scaer>
 <CA+_SqVafj+DAsaBtSPJkf2bwbmh_3JojRjBrzG0oT6GduKTG4g@mail.gmail.com>
 <20180909142019.GK2841@scaer>
 <CA+_SqVZ8-qKU9AxV+kAo6ch4QGKtPJWKS_jOGKMGPjsVTTp5mA@mail.gmail.com>
 <20180909185518.GA2409@scaer>
 <CA+_SqVa2EiU2OXNoc0O=o7GwB0wW15jMjmnY60LL6bKV2PSeRQ@mail.gmail.com>
 <CA+_SqVbyxT0xCg-7mtryFm-=GRCqwZo2hPpwNaVe8nG8_wxxbA@mail.gmail.com>
Message-ID: <20180910150009.GA2674@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2018-09-10 09:50 +0200, Angelo Compagnucci spake thusly:
> > Last one, I promise!
[--SNIP--]
> I just pushed o POC on my local branch if you want to have a look.
> It's what I mean for tainting applied to a package with a more robust
> ad correct approach that the npm case:
> https://github.com/angeloc/buildroot/commits/watchtower

So, here is my last stance on the subject, in which I tried to summarise
my position.

Why would the "tainted" flag be set?

  - unknown licensing information: it is better to use the existing
    licensing infrastructure, which is made for this very purpose:
    FOO_LICENSE := $(FOO_LICENSE), Unknown (external data used)

  - non-reproducible packages in Buildroot: I don't think we should
    accept packages in Buildroot that would taint the build; and if we
    were, we could hide them behind !BR2_REPRODUCIBLE (with or without
    a comment stating "foo is not reproducible");

  - packages that are in a br2-external, or in a private fork: I believe
    that people who do non-reproducible packages either don't care,
    have no choice, or both. If they did care, they would not create
    tainting packages; if they did care but still had no choice, they
    could also decide to hide them behind !BR2_REPRODUCIBLE;

  - packages with a list of external resources, like we have for
    nodejs/npm: we can't know if that list references reproducible
    resources or not.

That last point is very important: there *are* people that do care about
the reproduciblity of a build, and thus have already taken care that
BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL *does* point to stable and
reproducible set of nodejs modules [0]. Patch 3 in the series would mark
for them that the build is tainted when it is not; since those people do
care, the tainted flag would be most important to them, but by always
marking their build as tainted, the flag becomes useless to the very
people that do care...

Yes, a lot of people will just use a non-stable list, and they even
probably do not care either. I do not want to have to impose that
limitation unto those who know what they are doing.

So, I still conclude that we do not need to have a tainted flag.

[0] For example, consider an explicit and complete list such as (spitted
    for readability):
        BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="
            http://internal-server/node/mod-1
            http://internal-server/node/mod-2
            http://internal-server/node/mod-3
            http://internal-server/node/mod-4
        "
    and that all the dependencies of those modules *are* present in that
    list, leaving npm no chance to download anything.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
