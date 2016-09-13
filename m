From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Sep 2016 01:15:34 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-09-11
In-Reply-To: <20160913162316.GA6175@free.fr>
References: <20160912063028.65AFB103B93@stock.ovh.net>
 <CAKmqyKOAaZYPwd3GwvBsz7CwiF93-m=5rh=z6vv9o4RTsHod0A@mail.gmail.com>
 <20160912234452.38288933@free-electrons.com> <20160912215430.GC15314@free.fr>
 <CAKmqyKMu2pkBcZnjOiOOZ3J5FKdZ1h7zYo7QnwqfCYyoKGrMfg@mail.gmail.com>
 <20160913162316.GA6175@free.fr>
Message-ID: <20a87dd8-2582-51ac-b136-80a6e95ce1ca@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-09-16 18:23, Yann E. MORIN wrote:
> Usign -Werror during development is actualy a *good* thing, but not so
> much for releases.
> 
> Consider this hypotetical situation today:
> 
>   - your machine uses gcc-6, the greatest and latest version, which
>     knows of a certain set of warnings;
> 
>   - on your machine, there is no warning in your code, so you slap
>     -Werror on the build flags;
> 
>   - you do a realease of your code, say version 1.0;
> 
>   - days, weeks, months or even years  later, gcc-7 gets released; that
>     version knows of, and detects more warnings;
> 
>   - someone gets version 1.0 of your code (maybe it was the last release
>     you did and the project was complete?);
> 
>   - that someone has gcc-7 on his machine;
> 
>   - your code now does not compile anymore, because those new warnings
>     are treated as errors.
> 
> But those new warnigns are *new*, i.e. your previous compiler did not
> know of them, so they can't make your code any worse than it was with
> the previous compiler. Ergo, there is no point in failing on those new
> warnings *for a release*.

 One could claim that if you make sure you write standard-compliant code, you
will never get any warning so if a new warning comes out from a new compiler it
indicates a bug. With -Werror, this bug will be detected at build time,
typically by someone who at least knows what compilation is, and is therefore
more likely to file a good bug report. Without -Werror, the bug will (maybe) be
detected only at runtime and debugging it is much more difficult.

 However, reality is different.
* Most of the warnings emitted by a compiler don't translate into real bugs.
* Compilers give warnings for things that are perfectly standard-compliant. The
-Wunsafe-formatting in one of the build failures in this thread is a good example.
* Compilers give warnings for coding style issues, e.g. -Wparentheses
* Some warnings are based on code analysis, and that analysis can make wrong
conclusions, and the analysis changes from version to version. E.g.
-Wmaybe-uninitialized.

> 
> (Slight moderation on the above: a new optimisation technique may break
> because of new undefined behaviour or corner case or whatever, true; but
> that is irrelevant: this optimisation technique was not even known to
> your previous compiler either. Ergo, it should not be applied either.)
> 
> In conclusion: -Werror in development is good; -Werror in release is bad.

 Well, actually -Werror is only bad when combined with -Wall. Without -Wall, the
warnings are limited to things which are really, unequivocally wrong, so safe
across compiler versions.


 All of the above deserves a FAQ entry.

 Regards,
 Arnout

> 
> So yes, provide a patch to get rid of -Werror.

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
