From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Apr 2018 13:58:53 +0200
Subject: [Buildroot] [RFC PATCH 2/3] download/git: recover dirty cache
In-Reply-To: <20180417103623.GA8142@scaer>
References: <9a7630cb-2e57-c9a4-1002-92abc47d4472@mind.be>
 <5ad5b6a275994_553a2b0a2f22df301567e@ultri4.mail>
 <20180417103623.GA8142@scaer>
Message-ID: <18bb41d4-0463-05a2-81a5-8485d51856ef@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-04-18 12:36, Yann E. MORIN wrote:
> Ricardo, Arnout, All,
> 
> On 2018-04-17 05:56 -0300, Ricardo Martincoski spake thusly:
>> On Tue, Apr 17, 2018 at 05:10 AM, Arnout Vandecappelle wrote:
[snip]
>>> * Removing the shallow fetch should be done in a separate patch (I'm not
>>> entirely convinced yet that it is needed).
> 
> IIRC, Ricardo explained the case in a previous message: there are cases
> where we may miss blobs in a tree.
> 
> But anyway, the current code only works by chance. Let's assume you want
> to use tag v4.17-rc1 from Linus' tree. The code would currently do
> something like (without an existing git cache)
> 
>     mkdir git
>     git init git
>     cd git
>     git remote add origin https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>     git fetch origin --depth 1 v4.17-rc1
>     if ! git fetch origin v4.17-rc1:v4.17-rc1 ; then
>         echo "warning"
>     fi
>     git checkout v4.17-rc1
> 
> The if-block is initially there to fetch special refs created by things
> like gerrit or github PRs. If you do the above, you get the warning,
> i.e. the if-condition is false, i.e. fetching the tag that way fails
> with exit-code 1, and this message:
> 
>     error: cannot update the ref 'refs/heads/v4.17-rc1': Trying to write
>     non-commit object a79c33a10ce2764c62fb8af6cbb571752d55c1c0 to branch
>     refs/heads/v4.17-rc1
>     From https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux
>      ! [new tag]         v4.17-rc1  -> v4.17-rc1  (unable to update local ref)
>      * [new tag]         v4.17-rc1  -> v4.17-rc1
> 
> But since it is in a if-ciondition, we just print a warning, and
> continue.
> 
> Then and the checkout succeeds.
> 
> But! If you didn't try to fetch the special refs, the checkout would
> have failed:
> 
>     error: pathspec 'v4.17-rc1' did not match any file(s) known to git.
> 
> I.e. we have code that just happens to work by chance (or rather, by
> side-effects and luck).
> 
> So, even if the missing-blob problem could be solved another way, our
> shallow fetch is anyway already borked, but we were lucky so far not to
> fall for it...

 Great explanation -- with just a single typo, if-ciondition :-). Would be good
to add that to the commit log (the explanation, not the typo).


> I still think that this shalow-fetch dance is too risky, and that having
> a sane git cache helps so much more in the long run, so much so that we
> should just ditch the shallow fetch support.

 Yeah, given the current sorry state, it's probably better to break it down
completely and then build up something stable again.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
