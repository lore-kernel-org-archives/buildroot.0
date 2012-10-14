From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Oct 2012 15:57:44 +0200
Subject: [Buildroot] [PATCH 00/13] Add support for a project directory
In-Reply-To: <20121014145539.4f456877@skate>
References: <20121013231344.17317.92930.stgit@localhost>
 <20121014103518.4fb1089d@skate> <20121014104601.568a3d10@skate>
 <507A9742.7030301@mind.be> <20121014145539.4f456877@skate>
Message-ID: <507AC4D8.7020209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/10/12 14:55, Thomas Petazzoni wrote:
> Arnout,
>
> On Sun, 14 Oct 2012 12:43:14 +0200, Arnout Vandecappelle wrote:
>
>>> All what this stuff is adding can already be done with the current
>>> Buildroot, by putting the configuration files in a board/something/foo
>>> directory, and adjusting the Buildroot configuration.
>>
>>    It doesn't even have to be in a board/something/foo directory, it can
>> easily be out of tree.  The only problem is that you have to write down
>> a fairly long path for each of the relevant config options.
>
> Come on, it's just something like:
>
> 	$(TOPDIR)/../myproject/linux.config

  Except that I want the flexibility to have the buildroot tree in a different
place (e.g. a shared directory).  That said, it's still easy:

  $(MYPROJECT_DIR)/linux.config

  The issue is that it has to be filled in in many places.  I'm just trying
to make it easier.  And I'm also trying to establish a default policy,
so it's easier for users to understand how to use buildroot.

[snip]
> I still don't get what this patch set adds that you can't do with the
> existing Buildroot infrastructure.

  As I wrote several times already, all of this can already be done with the
current infrastructure (with one exception: 'make savedefconfig' saving
to a different file than 'defconfig').  It just provides simpler defaults.

[snip]
> I really would prefer to _document_ how to properly use the existing
> Buildroot infrastructure to cleanly separate custom stuff from
> Buildroot, rather than introducing more mechanisms on top of it.

  Well, that documentation would be:

  - Define all the custom paths to $(PROJECT_DIR)/foo.config
  - Write a Makefile that does 'make -C <buildroot_dir> PROJECT_DIR=<project_dir>'

  And people will wonder why all those paths aren't already
$(PROJECT_DIR)/foo.config by default.


[snip]
> It's not a question of diffstat. It's a question of "is this mechanism
> easy to grasp for newcomers and can it be immediately understood" and
> "does this mechanism adds any value over what Buildroot already
> provides"?

  IMHO, it is.

  I could do the following: I write a section in the documentation about
how to save your customization.  This section will have two alternatives:
in-tree configuration or out-of-tree configuration.  Then I can post a
second patch that removes the parts of the out-of-tree documentation that
become unnecessary when this patch series is implemented.


>>> the most annoying problems are
>>> not solved. So I really do prefer to keep things as it is: people have
>>> to use version control systems to keep their changes cleanly separated
>>> from the base Buildroot version.
>>
>>    Version control doesn't really solve it, in my experience.
>
> Why so?

  Mainly because customers for some obscure reason want to use svn.


[snip]


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
