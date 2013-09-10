From: rjbarnet at rockwellcollins.com <rjbarnet@rockwellcollins.com>
Date: Mon, 9 Sep 2013 20:28:46 -0500
Subject: [Buildroot] [RFC] New feature to handle a custom board folder
In-Reply-To: <522DFD21.2060409@mind.be>
References: <OF9A959FD8.FE78AE85-ON86257BDE.00666A59-86257BDE.00670505@rockwellcollins.com>
 <522DFD21.2060409@mind.be>
Message-ID: <OF2ECAD1BD.151B023E-ON86257BE1.007A6B99-86257BE2.00082227@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout -

Thanks for the feedback. Please see my responses to your comments below.

Arnout Vandecappelle <arnout@mind.be> wrote on 09/09/2013 11:53:53 AM:

>   Hi Ryan,
>
> On 06/09/13 20:45, Ryan Barnett wrote:
> > All,
> >
> > I would like to introduce a new concept I've got for how the board
> > folder is brought into buildroot.  I propose adding a feature to
> > buildroot to treat the board folder as a package. In treating the 
board
> > folder as a package, it would allow a board folder to be downloaded
> > using currently supported methods of packages (HG/Git/SVN/archives 
from
> > websites). It would be placed as an archive in the DL_DIR and 
extracted
> > to BUILD_DIR/board. I will go into more detail further down about the
> > structure.
>
>   Something like this has been proposed in buildroot several times
> already (including by me), and it has been rejected every time. The main
> reasons for rejection is that it adds a lot of complexity, while the
> current setup is already very simple and feature-complete for the user.
> See below for an explanation why your proposal is very complicated.

During my search of the mailing list archives I did not come across any
of this proposals. I probably didn't come up with the correct search
terms to find this however.

>
>   The simple way to do it is as follows:
>
> - import buildroot in your VCS;
>
> - create directory 'package/mycompany';
>
> - add 'source package/mycompany/Config.in' to package/Config.in;
>
> - create directory 'board/mycompany';
>
> - create file 'configs/mycompanyboard_defconfig'.

Yes - currently this is the way that we are doing this. However, the 
problem
my company faces is that we have to spread buildroot configurations for 
boards over
multiple different repositories. This means that we have around 10-15 
different
check-in's of buildroot. For various reasons, there are things in the 
board
folder that have to be kept in the different repositories. Allowing the 
board
folder to be checked out from a configuration file would help us eliminate 
this
need to have so many different version of buildroot in our environment.

In proposing this idea - I was hoping that I could remove the reasons for 
keeping
so many versions of buildroot in different repositories.

>   Since the diff to mainline is limited to a bunch of new files and a
> single line change in package/Config.in, merging is normally not an 
issue.

In my ideal world, managing the diff to mainline would be easy with GIT 
but
using SVN it not quite as easy though possible.

> > The motivation for this feature is that most of the customization done
> > to buildroot in order to support  a project (board) is usually
> > contained to a board folder. However, in many work environments in
> > which buildroot is used, GIT isn't a preferred version control method
> > (mine included) so being able to track mainline of buildroot is very
> > difficult.
>
>   That's a situation that we didn't expect, I think. In most company
> environments, buildroot is only occasionally updated. Also, you would
> typically require buildroot to be maintained under the "preferred 
version
> control method", because you make some changes - cfr. all the changes
> that you're upstreaming now.

I agree that buildroot be maintained under the "preferred VCS" as things
stand now. However, if the only modifications made to buildroot are
limited to a "board folder", the requirement to maintain the whole
of buildroot in the "preferred VCS" could be removed.

Another motivation for this is that during a development cycle for a board
we would like to easily track mainline. So we could constantly follow
buildroot mainline - using git- until we have to lock it down which is 
when
we go to verification of the board/software where we lock the board down 
to
a specific stable release of buildroot.

As for changes that would make to mainline (minus board folder and custom
packages), it would become easy for us to submit patches to mainline.

We have gone through the development process a couple times with the board
folder method you mentioned above, but our biggest challenge we always run
into is trying to distinguish "our" changes from buildroot's because we 
have
usually merged in some sort of patches from mainline buildroot and have 
trouble distinguishing what changes were ours vs. ones that came from you 
guys.
Since SVN doesn't have a good way to import GIT patches and make sure you 
know that those changes were from an external source (other than to go 
through the SVN Log).

>   Also, keeping the buildroot integration files for proprietary packages
> outside of the buildroot tree makes your repository a bit messy. Putting
> this stuff inside the buildroot tree is cleaner and more understandable.

Agreed with more understandable but reason above could be modification of 
why it might now always be the cleanest.

> >      COMMENTARY: the custom board applications would only appear when
> >      "Board folder contains custom applications" is enabled. The 
application
> >      list from custom board applications would be sourced an 
applications
> > folder
> >      within the custom board folder. These apps wouldn't display until
> > the board
> >      folder is actually extract.
>
>   Because of limitations in the Kconfig tool, this is very difficult to
> do in practice. You need some serious patching of Kconfig, and even then
> it probably doesn't work very well. A patch was submitted that attempted
> to implement this about a year ago IIRC.

This was my fear but I was hoping for the best.

Do you guys have any other ideas for this problem? I would really like 
hear other
ways that could possibly lead to compromise. One idea that is coming to 
mind
now as I type response is to treat the various things that are usually 
board
specific as packages.

I was thinking that packages could be added for the following:
 * Extend Rootfs Overlay to allow downloading of an overlay
 * Allow downloading of configs
 * Allow downloading of kernel patches
 * Allow downloading of u-boot patches
     COMMENTARY: I don't know if there could be a more generic 
implementation
     of this where any application that allows custom patches, could 
utilize
     the downloading of patches from some site.
 * Package that allows building of "custom app"
     COMMENTARY: this custom app would probably build more than just one
     application but could install by copying to a "install" directory 
which
     would then be overlaid to the target.

I understand that this may add more complications to buildroot and deviate 
a
bit from the current "simple" way buildroot works now. I hope though that 
I've
illustrated that this "simple" method isn't always so simple for companies 
that
don't have the ability to use GIT as their preferred VCS.

> > 5. User say "make" and buildroot builds them their system
>
>   This is making things a lot more difficult for the user, compared to
> when everything would just be in the buildroot tree, no?
>
>
>   Regards,
>   Arnout

Bottom line: the motivation  for these changes is to 1) reduce the number 
of
modified version of builroot we have and 2) allow me to take a snapshot of
buildroot and use it without custom modification to it.

At the end of the day I'm probably digging myself into a hole here but I 
hope
I've illustrated my reasoning behind this and hopefuly can make case for
something like this being incorporated into buildroot. Maybe someday I'll 
be
able to achieve my nirvana of having a buildroot where the only changes 
that
need to be made are to a "defconfig".

Thanks,
-Ryan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130909/09db20ef/attachment-0001.html>
