From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 16 Jan 2020 11:15:39 +0100
Subject: [Buildroot] [PATCH] infra: add the transient download mechanism
In-Reply-To: <20200116110306.5c91286b@windsurf>
References: <20200115203753.12110-1-yann.morin.1998@free.fr>
 <534f269547ead6d86e7a571978b54d79cd24cd0d.camel@orolia.com>
 <20200116103120.7b41295a@windsurf>
 <CAOf5uwmX0vdPFW9s9fC64Q7DFvQGCWdSqZy4GjEPrryy8Sa9ZA@mail.gmail.com>
 <20200116110306.5c91286b@windsurf>
Message-ID: <CAOf5uw=m8DVBh_o0WLyR2__7OkhkXMVv-VX7JJ2Rm7WyJs1csw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

On Thu, Jan 16, 2020 at 11:03 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Thu, 16 Jan 2020 10:56:53 +0100
> Michael Nazzareno Trimarchi <michael@amarulasolutions.com> wrote:
>
> > We are using a similar setup of Nicolas. Right now we have
> > CI and reproducible build using external tools. What I would like to solve
> > with buildroot is:
> >
> > - make the build reproducible
> > - implement topic build on custom patch using CI
> > - make tagging and branching easy
>
> Could you give more details, because these items are quite vague/fuzzy,
> and I don't understand from a very practical point of view what you
> mean. Could you describe some example workflow, what would be your
> expectation of Buildroot's behavior, etc.
>
Suppose you have this manifest

<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <remote  name="amarula-gitea"
           fetch=".."
           review="https://gerrit-review.amarulasolutions.com" />

  <remote  name="prj"
           fetch="ssh://server1/home/gitrepos/"
           revision="master" />

  <default revision="prj2"
           remote="amarula-gitea"
           sync-j="4"
           sync-c="true" />

  <project path="app1" name="smile" remote="prj" />
  <project path="buildroot" name="prj/buildroot" />
  <project path="linux" name="prj/linux" />
  <project path="build" name="prj/build" >
    <copyfile src="root.mk" dest="Makefile" />
  </project>
  <project path="library/lib1" name="prj/lib1" />
  <project path="u-boot" name="prj/u-boot" />
</manifest>

This one describe the project and we have override part for the
project in the manifest. For each version we can tag
and each repo and create a snapshot manifest of the project.
Manifest will have revison set to revision="refs/tags/<some tag>"

If I need to emit a release starting from some tag I can branch it and
apply patch on top of this branch and everything
can be stored as a separed manifest. Using jenkins trigger on topic
upload on gerrit we can easily build a version with some
patchset applied and if we want to re-build some version we can just
use the right tagged manifest

Michael

> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
