From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 14:08:02 +0200
Subject: [Buildroot] [PATCH] package/nodejs: use per-build cache
 directories
In-Reply-To: <20181013150558.31065-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 13 Oct 2018 17:05:58 +0200")
References: <20181013150558.31065-1-yann.morin.1998@free.fr>
Message-ID: <875zxrbl99.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When two Buildroot builds run in parallel, and they both happen to call
 > npm at roughly the same time, the two npm instances may conflict when
 > accessing the npm cache, which is by default ~/.npm

 > Although npm is supposed to lock access to the cache, it seems it does
 > sometimes fail to do so properly, bailling out in error, when it would
 > never ever crash at all when not running in parallel. We suspect that
 > the sequence leading to such failures are something like:

 >     npm-1                           npm-2
 >       lock(retry=few, sleep=short)    .
 >       does-stuff()                    .
 >       .                               lock(retry=few, sleep=short)
 >       .                               # can't lock local cache
 >       .                               download-module()
 >       .                                 # can't download
 >       .                                 exit(1)
 >       unlock()

 > As per the docs [0], few = 10, short = 10. So if the first npm (npm-1)
 > takes more than 100s (which can happen behind slow links and/or big
 > modules that contain native code that is compiled), then the second npm
 > (npm-2) will bail out (the download would fail if there is no network
 > access, for example, and only local modules are used).

 > Point npm to use a per-build cache directory, so they no longer compete
 > across builds.

 > That would still need some care when we do top-level parallel builds,
 > though.

 > Note also that the conflicts are not totally eliminated: two or more npm
 > instances may still compete for some other resource that has not yet
 > been identified.

 > But, at least, the conflict window has been drastically shortened now,
 > to the point where it now seldom occurs.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
