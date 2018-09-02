From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 2 Sep 2018 19:09:33 +0200
Subject: [Buildroot] Analysis of build results for 2018-09-01
In-Reply-To: <20180902161152.394d55d8@windsurf>
References: <20180902060016.0253C2071E@mail.bootlin.com>
 <20180902161152.394d55d8@windsurf>
Message-ID: <CAPi7W82ZVt_1L52Y23_L7Ck6tmHh7bfpoYJrfgfQxJSmFJg15Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Le dim. 2 sept. 2018 ? 16:11, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
a ?crit :

> Hello,
>
> On Sun,  2 Sep 2018 08:00:16 +0200 (CEST), Thomas Petazzoni wrote:
>
> >       branch |  OK | NOK | TIM | TOT |
> >    2018.02.x |  10 |   0 |   0 |  10 |
> >    2018.05.x |  16 |   0 |   0 |  16 |
> >       master | 158 |   4 |   1 | 163 |
>
> Wow, results over the last few days on the master branch are pretty
> amazing: http://autobuild.buildroot.net/stats.php. Four build failures
> per day, on a total of 150-170 build successes. Nice!
>
> Let's have a look at the build failures for yesterday.
>
> >          arm |                   boost-1.67.0 | NOK |
> http://autobuild.buildroot.net/results/808d1690240a4395cb0d953b77425fe31a85aeaf
> |
>
> This is another instance of:
>
> libboost_atomic shouldn't have been installed: missing select in
> boost/Config.in
>
> This is happening on ARM Cortex-M4. Fabrice: there are still a few
> patches on Boost from you in patchwork. Is one of them fixing this ?
>
Nope, I didn't succeed in fixing this issue yet. libboost_atomic is
selected because boost wrongly assumes that lock-free atomic ints are not
available. However, I don't understand why the detection fails.
This seems to happen only when statically linking on ARM Cortex M4 but also
on atom (
http://autobuild.buildroot.net/results/2163706e22c994c2e1fb6f73db3697703ebefe3e),
mips64 (
http://autobuild.buildroot.net/results/aeedc994f6a451e441b389375dc47e637d16e3b3),
arc700 ...
I will continue to work on this.

However, in patchwork, I would advise to apply or comment the patch 960723
which is fixing another issue linked to the wrong selection of
boost_thread/boost_chrono by boost_context.

> >     mips64el |                domoticz-4.9700 | NOK |
> http://autobuild.buildroot.net/results/9428b0aaae95288cf1d1cce0ca2492ae06b77960
> |
>
> Fixed by:
>
>
> https://git.buildroot.org/buildroot/commit/package/domoticz?id=19b04d844277467fcd9c605f6b7ee57d979a630a
>
> >       x86_64 |                 host-libsodium | TIM |
> http://autobuild.buildroot.net/results/83ece99f846bbb6398b9f2cf6a4cccbae595e86e
> |
>
> Ah, it's the timeout occurring on Julien's machine during the configure
> step of this package. Weird.
>
> >         m68k |                      php-7.2.9 | NOK |
> http://autobuild.buildroot.net/results/69cf9326539c8df8fa50c5e7acb2ce3bb985ede2
> | ORPH
>
> Fixed by:
>
>
> https://git.buildroot.org/buildroot/commit/?id=45215ffc8a75377228a477bebbf2ad9c78d40a35
>
> >      powerpc |                       qt-4.8.7 | NOK |
> http://autobuild.buildroot.net/results/fcf04ffdc27bb73fdeca0cc70a0dc09bcf3ec0d5
> | ORPH
>
> Fixed by:
>
>
> https://git.buildroot.org/buildroot/commit/?id=75f975f8ad7b9f8dee8f1de9ce3243d69763637b
>
> Conclusion: on 4 build failures and one timeout:
>
>  - 3 build failures are already fixed
>
>  - 1 build failure on Boost remains to be fixed
>
>  - the timeout is really mysterious.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180902/ac9045d3/attachment.html>
