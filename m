From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Apr 2018 11:01:55 +0200
Subject: [Buildroot] [PATCH] autobuild-run: remove only tarballs from
 download dir
In-Reply-To: <5ad3d0cda358d_54de2ad1cbb08c2828316@ultri4.mail>
References: <20180415214257.1e90704a@windsurf.numericable.fr>
 <5ad3d0cda358d_54de2ad1cbb08c2828316@ultri4.mail>
Message-ID: <20180416090155.GA2290@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-04-15 19:23 -0300, Ricardo Martincoski spake thusly:
> On Sun, Apr 15, 2018 at 04:42 PM, Thomas Petazzoni wrote:
[--SNIP--]
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

I think that we should also get rid of a full git clone.

> > Another concern is how to fix those autobuilders that have already
> > removed some random files from their cached Git repositories? Should we
> > ask the people who run those autobuilders to entirely wipe the download
> > folders of their autobuilder instances ? Or do we have a smart (but
> > simple) thing to do to avoid this ?
> I agree with Yann about the ditch + restart for broken git cache.
> But if you want, maybe in one autobuilder instance we can manually remove all
> git caches just to know earlier (before applying Yann's series) that no more
> download issues will occur, since this change to the script prevents corrupting
> new git caches.
> I guess but did not tested this command would be enough:
> rm -r instance-0/dl/*/git
> Your call. I have no preference.
> 
> But leaving at least one instance not fixed (with some git cache broken) can
> help to test Yann's series.

I got my hands on a borked dtv-scan-tables tree, so I can test locally.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
