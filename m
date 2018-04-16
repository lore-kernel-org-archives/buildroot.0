From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 18:05:24 +0200
Subject: [Buildroot] [PATCH] autobuild-run: remove only tarballs from
 download dir
In-Reply-To: <5ad3d0cda358d_54de2ad1cbb08c2828316@ultri4.mail>
References: <20180415214257.1e90704a@windsurf.numericable.fr>
 <5ad3d0cda358d_54de2ad1cbb08c2828316@ultri4.mail>
Message-ID: <20180416180524.379e9cf4@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 15 Apr 2018 19:23:09 -0300, Ricardo Martincoski wrote:

> > So you're idea is that when we are inside dl/<package>/git/, one of the
> > sub-directories is .git, and therefore we shouldn't remove anything in
> > dl/<package>/git/ ?  
> 
> Yes. My idea is to keep the behavior described in the comment:
> # Remove 5 random files from the download directory. Removing
> # random files from the download directory allows to ensure we
> # regularly re-download files to check that their upstream
> # location is still correct.
> 
> So we keep testing in autobuilders that the upstream location is correct (the
> git fetch fails and therefore the download script fails if the server does not
> respond even in the case we already have the commits and references we need in
> the cache; it is the correct behavior IMO), and we also test the generation of
> tarball, but we do not test the re-download with a clean git cache; this could
> be done later on autobuilder with extra code (maybe remove only 1 git cache
> every run together to 5 tarballs?), but the most important scenario is already
> tested: the use of git cache in the long run.

OK. I think we should indeed remove git caches once in a while. Perhaps
less often than tarballs, indeed.

> It prevents from removing files inside dl/<package>/git
> 
> > 
> > 	if "git" in d:
> > 		d.remove("git")
> > 
> > but perhaps you haven't done this for some good reason ?  
> 
> Yes, we want to eventually remove dl/git/git-2.16.3.tar.xz

Ah, yes, indeed, the git package. OK, got it, makes sense.

> > Another concern is how to fix those autobuilders that have already
> > removed some random files from their cached Git repositories? Should we
> > ask the people who run those autobuilders to entirely wipe the download
> > folders of their autobuilder instances ? Or do we have a smart (but
> > simple) thing to do to avoid this ?  
> 
> I agree with Yann about the ditch + restart for broken git cache.
> But if you want, maybe in one autobuilder instance we can manually remove all
> git caches just to know earlier (before applying Yann's series) that no more
> download issues will occur, since this change to the script prevents corrupting
> new git caches.
> I guess but did not tested this command would be enough:
> rm -r instance-0/dl/*/git
> Your call. I have no preference.

I think we should ditch the autobuilder git caches, to make the
autobuilders a bit more green. They are really red right now :)

I think we'll get bogus git cache once in a while anyway. For example,
my autobuilder instance gets rebooted regularly, without the build
process being interrupted. So there are good chances that a git
download or fetch will be interrupted at some point, leaving the git
cache in a bogus state. We will then see if it gets fixed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
