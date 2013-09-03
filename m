From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Sep 2013 18:54:05 +0200
Subject: [Buildroot] Build reproducibility
In-Reply-To: <e9a540ee2cb82c94c8fa139d228bcde0@sysmic.org>
References: <1377851505-23498-1-git-send-email-jezz@sysmic.org>
 <CAAXf6LVmyWojaBTfpTpZsNcXr+bCSkFMT__iYQjTAvO9ryEqnw@mail.gmail.com>
 <2d076e17ea7c855166044994876e2add@sysmic.org>
 <20130830145254.1e5a1f53@skate>
 <CAAXf6LVPfKZP+3k1AfXek28Y6bgVwxbJ4iPYRq6nihry=egaig@mail.gmail.com>
 <5224B8C9.7060609@mind.be> <87r4d6775s.fsf@dell.be.48ers.dk>
 <e9a540ee2cb82c94c8fa139d228bcde0@sysmic.org>
Message-ID: <20130903185405.08314f46@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

(Your e-mail client has wrapped the e-mail in a somewhat weird fashion,
leaving only one word one every two lines. Ah, yes a Roundcube Webmail!)

On Tue, 03 Sep 2013 10:15:55 +0200, J?r?me Pouiller wrote:
> I may have an idea to detect cases where a package has a non declared 
> dependency.
> 
> Inotify may help us to know which files are accessed during build of 
> one package.
> Especially, we can know which files in staging/ are accessed. If we 
> knew which
> package own which file under staging and we may find what are 
> dependencies
> of a package
> 
> I already made a system to monitor which files are installed by each
> package 
> (http://comments.gmane.org/gmane.comp.lib.uclibc.buildroot/53094). It
> may be adapted to detect owner of staging/ files

This indeed looks interesting. I'm not sure it's really easy to do (on
one side, we need to get the list of files that are installed/owned by
each package, and then whenever a file is accessed, check whether this
file is owned by a package which is part of the dependencies of the
currently built package), but if it's possible, it would quite
certainly raise a number of interesting warnings/issues.

>    make allyespackageconfig

Note that an allyespackageconfig doesn't build all packages: they are
some choices in the Buildroot Config.in options, and some packages
depend on the value of those choices. Hence, in a given configuration,
it is not possible to really enable and test all packages.

>    make        # And monitor which package create which file in
> staging/ for PKG in $PACKAGES[@]; do
>       make $PKG-dirclean
>       make $PKG # And monitor which files are accessed in staging/
>       # process result to get $PKG dependencies

I don't think we should try to infer automatically the dependencies,
but at least show a report of files that were accessed even though they
don't belong to packages that are part of the dependencies.

>    done
> 
> It would not fix automatically the problem, but an autobuilder may
> send notifications. Inotify instrumentation may stay in a separate
> patch or branch to not be intrusive in Buildroot.
> 
> Do you think it would be useful?

It might certainly be useful to do some experiments around this idea
and see if it brings a reasonable result (both in terms of code to
merge, and in terms of warnings/issues that we are able to discover and
fix).

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
