From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 Jun 2016 00:54:15 +0200
Subject: [Buildroot] [v1 1/1] uboot: Add local directory option to
	menuconfig
In-Reply-To: <87lh1pq1br.fsf@dell.be.48ers.dk>
References: <1466994356-15411-1-git-send-email-Aduskett@gmail.com>
 <20160627205746.GC3714@free.fr>
 <045f11b5-1c4c-5082-d138-406559792a72@mind.be>
 <20160627223936.GD3714@free.fr>
 <3dade5a8-fefb-0dcc-e310-f8a67d7bd1c4@mind.be>
 <87lh1pq1br.fsf@dell.be.48ers.dk>
Message-ID: <76677c72-574e-ea3b-230c-fd364ddea108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28-06-16 08:23, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>  >> Well, any two projects would have different workflows, so suggesting a
>  >> "realistic project" uses an automated override-srcdir is just pushing
>  >> the limits too much, IMHO.
> 
>  >  Of course. But it's true that the same workflows are covered by
>  > _OVERRIDE_SRCDIR and _CUSTOM_LOCAL.
> 
> Yes, except that _CUSTOM_LOCAL ends up in the .config, so it easily gets
> committed to version version control, whereas you have to go out of your
> way to shoot yourself in the foot with _OVERRIDE_SRCDIR.

 Except, of course, when you really want to refer to a separately managed local
checkout. Though in that case putting local.mk under version control is equally
easy.

> 
>  >> 
>  >> Besides, my opinion is that having the sources for packages in the
>  >> br2-external tree is bad, and that each package should have its own
>  >> git/hg/svn/bzr tree. But that varies between projects! ;-)
> 
>  >  They are git submodules, of course.
> 
>  >  In my experience referring to tags or shas from a defconfig is really clunky,
>  > it makes updating extremely inflexible. I've implemented scripts to automate the
>  > tagging for some projects; in the end they didn't use it, because the submodule
>  > tag already covers it.
> 
> What is the problem with referring to shas from the defconfig? That
> sounds to me to be no more work than changing the submodule version. Or
> are you just referring to the effort to tag the individual components
> for a release?

 To update the sha, you have to:

- commit in the component repo;
- generate a tag;
- update the .config;
- run a test build;
- make savedefconfig;
- git diff and check that it's OK to commit this;
- commit;
- generate a tag for integration repo;
- push both repos.

=> This really requires a script.


 While with submodules and OVERRIDE_SRCDIR, you do:

- run a test build;
- commit in the component repo;
- commit in the integration repo;
- git push --recurse-submodules

i.e. only the steps that you really want to do by hand.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
