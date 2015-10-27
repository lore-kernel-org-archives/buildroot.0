From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Oct 2015 22:59:43 +0100
Subject: [Buildroot] Recommended way of working on project
In-Reply-To: <CAHsRNLiVzUfg7YhRwRedC3oYpc9QTSSvxFaCduvcMDp3pFqehg@mail.gmail.com>
References: <CAOcYpt0a2g1t9euFaFJGwifAQen-mf8yeXP8Xh5A=RUYgPtXgA@mail.gmail.com>
 <CAHsRNLiVzUfg7YhRwRedC3oYpc9QTSSvxFaCduvcMDp3pFqehg@mail.gmail.com>
Message-ID: <562FF3CF.8090502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27-10-15 21:11, Gabe Evans wrote:
> Hi David,
> 
> I've used several strategies for different projects we've deployed in
> production and BR2_EXTERNAL is what I've settled on. It's by far the best
> option for the majority of projects. I would only recommend forking
> Buildroot when making changes you plan to merge upstream. Otherwise,
> you're likely to make upgrading to future releases difficult.
> 
> Is there a specific package you're trying to tweak that's resulted in
> you having to make changes in multiple packages depending on it?
> 
> Some of the ways I've added customizations to a package without necessarily
> copying the entirety into my own tree include:
> 
> 1. Making small tweaks to code by using patches in BR2_GLOBAL_PATCH_DIR.

 That's indeed another good way to make changes, but doesn't help if you want to
change some configure or install option.

> 
> 2. Using a different source by creating a custom package that only adjusts
>    the <PACKAGE>_SOURCE/SITE of the original package.

 Note that this is not possible for _VERSION, _INSTALL_STAGING/TARGET,
_SITE_METHOD and probably a few others.

> 3. Adding an additional build step to a package by doing the same as #2 to
>    add a pre/post hook to the original package.
> 
> This has made maintenance trivial and in cases where there's a conflict,
> I'm able to focus my attention on a couple lines instead of on the
> entirety of the package.

 But doesn't that make things more complicated? I mean, you don't have an
overview of what's really happening, and when you look at the package.mk file
you don't see those overrides so you don't understand why it's behaving differently.

 Also, when you merge with upstream and something relevant has changed, there
will _not_ be a merge conflict but instead things go wrong in unexpected ways.

 So I'm not in favour of this approach. But if it works for you, by all means
continue doing so!

 Regards,
 Arnout

> Hopefully others can chime in on any other
> pitfalls there could be with this strategy.
> 

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
