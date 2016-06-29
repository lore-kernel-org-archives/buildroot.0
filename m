From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Jun 2016 08:44:28 +0200
Subject: [Buildroot] [v1 1/1] uboot: Add local directory option to
	menuconfig
In-Reply-To: <76677c72-574e-ea3b-230c-fd364ddea108@mind.be> (Arnout
 Vandecappelle's message of "Wed, 29 Jun 2016 00:54:15 +0200")
References: <1466994356-15411-1-git-send-email-Aduskett@gmail.com>
 <20160627205746.GC3714@free.fr>
 <045f11b5-1c4c-5082-d138-406559792a72@mind.be>
 <20160627223936.GD3714@free.fr>
 <3dade5a8-fefb-0dcc-e310-f8a67d7bd1c4@mind.be>
 <87lh1pq1br.fsf@dell.be.48ers.dk>
 <76677c72-574e-ea3b-230c-fd364ddea108@mind.be>
Message-ID: <87vb0sijeb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> Yes, except that _CUSTOM_LOCAL ends up in the .config, so it easily gets
 >> committed to version version control, whereas you have to go out of your
 >> way to shoot yourself in the foot with _OVERRIDE_SRCDIR.

 >  Except, of course, when you really want to refer to a separately managed local
 > checkout. Though in that case putting local.mk under version control is equally
 > easy.

Exactly.

>> >  In my experience referring to tags or shas from a defconfig is really clunky,
 >> > it makes updating extremely inflexible. I've implemented scripts to automate the
 >> > tagging for some projects; in the end they didn't use it, because the submodule
 >> > tag already covers it.
 >> 
 >> What is the problem with referring to shas from the defconfig? That
 >> sounds to me to be no more work than changing the submodule version. Or
 >> are you just referring to the effort to tag the individual components
 >> for a release?

 >  To update the sha, you have to:

 > - commit in the component repo;
 > - generate a tag;

Why? You can just select the sha in the .config.

 > - update the .config;
 > - run a test build;

Or just let the continous integration system do this. That way you are
also sure it is clean build from pristine sources.


 > - make savedefconfig;
 > - git diff and check that it's OK to commit this;
 > - commit;
 > - generate a tag for integration repo;

Why the tag?

> - push both repos.

I think people would normally push the component changes earlier/more
often than the buildroot .config is changed, but ok.

 > => This really requires a script.

I don't really think so, but ok - Some might. It will end up being quite
a lot of scripts if you have many local components.


 >  While with submodules and OVERRIDE_SRCDIR, you do:

 > - run a test build;
 > - commit in the component repo;
 > - commit in the integration repo;
 > - git push --recurse-submodules

Without the tags above, this looks pretty similar to me. You don't
manually need to adjust the git hash in the .config, but you instead
gain the complications of sub modules and you basically need a buildroot
branch per project.

But anyway, both work flows are supported with override - So we're fine.

-- 
Venlig hilsen,
Peter Korsgaard 
