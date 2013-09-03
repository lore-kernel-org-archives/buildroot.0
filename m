From: =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>
Date: Tue, 03 Sep 2013 10:15:55 +0200
Subject: [Buildroot] Build reproducibility
In-Reply-To: <87r4d6775s.fsf@dell.be.48ers.dk>
References: <1377851505-23498-1-git-send-email-jezz@sysmic.org>
 <CAAXf6LVmyWojaBTfpTpZsNcXr+bCSkFMT__iYQjTAvO9ryEqnw@mail.gmail.com>
 <2d076e17ea7c855166044994876e2add@sysmic.org>
 <20130830145254.1e5a1f53@skate>
 <CAAXf6LVPfKZP+3k1AfXek28Y6bgVwxbJ4iPYRq6nihry=egaig@mail.gmail.com>
 <5224B8C9.7060609@mind.be> <87r4d6775s.fsf@dell.be.48ers.dk>
Message-ID: <e9a540ee2cb82c94c8fa139d228bcde0@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-09-03 08:26, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
> Hi,
>
>  Arnout>  What is much more likely to happen is that there is some 
> optional
>  Arnout> dependency in the package's configure or build system that 
> is not
>  Arnout> expressed in Config.in or pkg.mk. Most reviewers do not run 
> a
>  Arnout> configure --help', and even then it is easy to miss 
> something. Since
>  Arnout> the dependency is optional, the build will not fail either 
> way. Only,
>  Arnout> when user A builds it, TLS support is included, but when 
> user B builds
>  Arnout> it, it is not... That's the kind of lack of reproducability 
> we really
>  Arnout> need to avoid.
>
> Indeed.
>
>  Arnout>  Note that doing more randomized build order in the 
> autobuilder also
>  Arnout> will not capture the latter scenario. You would have to 
> compare the
>  Arnout> build result - but binary differences are likely because of 
> changing
>  Arnout> timestamps or changing optimizations depending on memory 
> randomness.
>
> Exactly. I don't have any good ideas about how to detect this 
> (besides
> building all packages in clean staging dirs, E.G. only populated with
> its explicit dependencies like afaik OE lite can do, but that would
> require quite some work), anyone?

I may have an idea to detect cases where a package has a non declared 
dependency.

Inotify may help us to know which files are accessed during build of 
one package.
Especially, we can know which files in staging/ are accessed. If we 
knew which
package own which file under staging and we may find what are 
dependencies
of a package

I already made a system to monitor which files are installed by each
package 
(http://comments.gmane.org/gmane.comp.lib.uclibc.buildroot/53094). It
may be adapted to detect owner of staging/ files

So, process would be:

   make allyespackageconfig
   make        # And monitor which package create which file in staging/
   for PKG in $PACKAGES[@]; do
      make $PKG-dirclean
      make $PKG # And monitor which files are accessed in staging/
      # process result to get $PKG dependencies
   done

It would not fix automatically the problem, but an autobuilder may send
notifications. Inotify instrumentation may stay in a separate patch or 
branch
to not be intrusive in Buildroot.

Do you think it would be useful?

(I will not have enough time to implement this until end of October, at
least)

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
