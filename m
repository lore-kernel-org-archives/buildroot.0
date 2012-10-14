From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Oct 2012 12:43:14 +0200
Subject: [Buildroot] [PATCH 00/13] Add support for a project directory
In-Reply-To: <20121014104601.568a3d10@skate>
References: <20121013231344.17317.92930.stgit@localhost>
 <20121014103518.4fb1089d@skate> <20121014104601.568a3d10@skate>
Message-ID: <507A9742.7030301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/10/12 10:46, Thomas Petazzoni wrote:
> On Sun, 14 Oct 2012 10:35:18 +0200, Thomas Petazzoni wrote:
>
>> So I'll have a look, but my initial impression is one of fairly high
>> skepticism, to say the least.
>
> Ok, I had a look, and I'm going to NAK this.
>
> All what this stuff is adding can already be done with the current
> Buildroot, by putting the configuration files in a board/something/foo
> directory, and adjusting the Buildroot configuration.

  It doesn't even have to be in a board/something/foo directory, it can
easily be out of tree.  The only problem is that you have to write down
a fairly long path for each of the relevant config options.  So what
patches 1 to 7 do is nothing more than changing the defaults.

  Perhaps the name should be changed to CONFIG_DIR because it really just
contains configuration.  However, CONFIG is already pretty overloaded
(buildroot config, pkg-config, autoconf) so I don't like to use it.

>  It just adds a
> useless layer with a fuzzy concept of "project" that we had in the
> past, and was a terrible idea.

  That it didn't work in the past doesn't mean it's a terrible idea :-)

> Moreover, the introduction text states that "Many buildroot users
> prefer to keep their project's customizations separate from buildroot
> itself", but the patch set doesn't solve this problem at all:

  It's not a "problem", because it is already possible now - I've done
it for my last four buildroot projects (without any modification to
stock buildroot), and I find it _much_ more convenient than before to
upgrade buildroot - particularly if I just want to test that particular
project against current master.  But the main advantage is that you can
nicely separate the things which are proprietary from the things that
are potentially upstreamable (because those are still applied in the
buildroot tree itself).


>   * Custom packages are not taken into account

  In $(PROJECT_DIR)/project.mk, add:

BR2_PACKAGE_FOO=y
include package/foo/foo.mk


  As I mentioned in my first mail, the setting of BR2_PACKAGE_FOO=y
could be automated, but I'm in fact not convinced that it's worth it.


>   * Additional patches added to existing packages are not taken into
>     account

  You can add a post-patch hook in project.mk.  It's a bit more involved,
that's why I propose to automate that in the package infrastructure.
But I haven't needed that up to now so I don't have a solution ready,
and I'm not going to spend time on it if it will be NAK'd anyway :-)

  For the things that do frequently need patches (linux, u-boot, ...)
we already have config options, so we could just add PROJECT_DIR-based
defaults for those as well.


>   * Modification to the recipes of existing packages are not taken into
>     account. And it is very common for a project that you need to
>     slightly upgrade or adjust the recipe of a few existing packages.

  Indeed.  Those changes should still go in the buildroot tree itself.


> So even with this additional complexity,

  Complexity? The diffstat of patches 1-7 is:
  8 files changed, 30 insertions(+), 2 deletions(-)

  The ones after that are more involved, I agree.


> the most annoying problems are
> not solved. So I really do prefer to keep things as it is: people have
> to use version control systems to keep their changes cleanly separated
> from the base Buildroot version.

  Version control doesn't really solve it, in my experience.

>A half-working solution is not going
> to help our users to understand how to properly use Buildroot.
>
> If we want to really separate the project specificities, then we need
> to introduce a real concept of "layers" like OpenEmbedded has, which
> allows to also override package recipes, add new custom packages, etc.
> But I am not sure we want to go down this road.

  I'm pretty sure we don't want to go down that road.  I don't believe
the possibility of overriding package recipes is warranted.  I also
don't think it's very useful in our context to have several layers.
The only thing I want is to keep the customizations (i.e. configuration,
skeleton, etc.) in a separate directory tree from buildroot.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
