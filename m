From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Sep 2012 21:14:41 +0200
Subject: [Buildroot] Buildroot customizations as a git submodule?
In-Reply-To: <CAHQn0kgXzCNf560jUw_AF82tSuOpHqUWu04yfisxf2Ac1iYPdQ@mail.gmail.com>
References: <CAHQn0kgXzCNf560jUw_AF82tSuOpHqUWu04yfisxf2Ac1iYPdQ@mail.gmail.com>
Message-ID: <504F8DA1.3040405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/11/12 16:06, Daniel Nystr?m wrote:
> How do you folks on this mailing list manage your customizations on Buildroot?
>
> I was thinking maybe I could keep all my customizations as a git
> submodule residing in board/<company>/<project>?
>
> Can I add new software packages without touching the original BR
> source files or directories? How about defconfigs?
>
> It would be really awesome if this could be achieved so one did not
> have to make changes to BR at all.

  My usual approach is the following:

- packages and other changes which can be upstreamed I apply directly to the
buildroot tree (in a project-specific branch);

- private (closed source) packages, board-specific kernel patches, config files
etc. are kept out of tree, and included using the local.mk mechanism.

  I don't bother with Config.in for the private packages, because there is
usually nothing to configure there.  The BR2_PACKAGE_XXX symbols are enabled
unconditionally in the project's local.mk file.

  The buildroot defconfig is also kept in the project directory, as well
as a Makefile that uses this defconfig by calling 'make defconfig' with
the BR2_DEFCONFIG=... option.  If the project uses several buildroot
configurations (it usually does), then I generate them in different output
directories.

  I'm planning to post some patch to facilitate this once it becomes a bit
more clear what is generic.


  Note that this only applies when you don't share packages between different
projects.  If you do, then you do need Config.in and there's no other option
than to modify buildroot itself.  There is a patch floating on the list to
support out-of-tree Config.in inclusion, but it was rejected.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
