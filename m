From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 09 Sep 2013 18:53:53 +0200
Subject: [Buildroot] [RFC] New feature to handle a custom board folder
In-Reply-To: <OF9A959FD8.FE78AE85-ON86257BDE.00666A59-86257BDE.00670505@rockwellcollins.com>
References: <OF9A959FD8.FE78AE85-ON86257BDE.00666A59-86257BDE.00670505@rockwellcollins.com>
Message-ID: <522DFD21.2060409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Ryan,

On 06/09/13 20:45, Ryan Barnett wrote:
> All,
>
> I would like to introduce a new concept I've got for how the board
> folder is brought into buildroot.  I propose adding a feature to
> buildroot to treat the board folder as a package. In treating the board
> folder as a package, it would allow a board folder to be downloaded
> using currently supported methods of packages (HG/Git/SVN/archives from
> websites). It would be placed as an archive in the DL_DIR and extracted
> to BUILD_DIR/board. I will go into more detail further down about the
> structure.

  Something like this has been proposed in buildroot several times 
already (including by me), and it has been rejected every time. The main 
reasons for rejection is that it adds a lot of complexity, while the 
current setup is already very simple and feature-complete for the user. 
See below for an explanation why your proposal is very complicated.

  The simple way to do it is as follows:

- import buildroot in your VCS;

- create directory 'package/mycompany';

- add 'source package/mycompany/Config.in' to package/Config.in;

- create directory 'board/mycompany';

- create file 'configs/mycompanyboard_defconfig'.


  Since the diff to mainline is limited to a bunch of new files and a 
single line change in package/Config.in, merging is normally not an issue.


> The motivation for this feature is that most of the customization done
> to buildroot in order to support  a project (board) is usually
> contained to a board folder. However, in many work environments in
> which buildroot is used, GIT isn't a preferred version control method
> (mine included) so being able to track mainline of buildroot is very
> difficult.

  That's a situation that we didn't expect, I think. In most company 
environments, buildroot is only occasionally updated. Also, you would 
typically require buildroot to be maintained under the "preferred version 
control method", because you make some changes - cfr. all the changes 
that you're upstreaming now.

  Also, keeping the buildroot integration files for proprietary packages 
outside of the buildroot tree makes your repository a bit messy. Putting 
this stuff inside the buildroot tree is cleaner and more understandable.


> NOTE: I haven't attempted to implement this yet as this an idea that
> is still in its infancies.
>
> Theory
> ---------
> In theory the custom board folder structure would work as follows:
>
> 1. User specifies the custom board folder in menuconfig
>      a. Initial though would to place it as follows in menuconfig
>
> Target Options
>   > Target Board Folder Type
>       > No Custom Board Folder (default)
>       > External Custom Board Folder
>   > Target Board Folder Site Method
>       > Git
>       > HG
>       > SVN
>       > List goes on...
>   > Board folder contains custom applications
>       COMMENTARY: This feature allows the use for downloading and building
>       a company's custom applications that need to place in the release.
>   > (Future Option) Check folder out using method above
>       COMMENTARY: This feature would be useful during development of
>       board folder to allow the actual checkout board folder to the
> BUILD_DIR
>       to allow for modifications tha easily pushed back.
>
> Target Packages
>   > Text editor and viewers
>   > Custom board applications
>      > App A
>      > App B
>
>      COMMENTARY: the custom board applications would only appear when
>      "Board folder contains custom applications" is enabled. The application
>      list from custom board applications would be sourced an applications
> folder
>      within the custom board folder. These apps wouldn't display until
> the board
>      folder is actually extract.

  Because of limitations in the Kconfig tool, this is very difficult to 
do in practice. You need some serious patching of Kconfig, and even then 
it probably doesn't work very well. A patch was submitted that attempted 
to implement this about a year ago IIRC.


>      One issue I see with this is how the makefile structure would handle
>      building without the board folder checked out and the make rules for
> these
>      packages being defined.

  Yeah, that was not even supported by the patch I mentioned above.


> 2. Board folder structure would be as follows:
>
>  > BUILD_DIR
>     > board (new)
>        > kernel-patches
>        > local-skeleton
>        > packages (this would be the board specific packages)
>        > uboot-patches
>        > config files
>     > build
>     > host
>     > target
>
> 3. User says "make board-folder" and the custom board folder is extracted
>
> 4. The user can say "make menuconfig" and their board customization will
>     appear and would be available for selection.
>
> 5. User say "make" and buildroot builds them their system

  This is making things a lot more difficult for the user, compared to 
when everything would just be in the buildroot tree, no?


  Regards,
  Arnout

>
> Summary
> --------
> With adding this feature to buildroot, it will help companies/users easily
> bring in their customization into buildroot with just using a defconfig.
>
> Please provide me with feedback in if this idea is feasible/be useful. I'm
> also very open suggestions to help make this a reality.
>
> -------------------------------------------------------------------------
> 	*Ryan J Barnett* / Software Engineer / Platform SW
> MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
> Phone: 319-263-3880 / VPN: 263-3880 _
> __rjbarnet at rockwellcollins.com_ <mailto:rjbarnet@rockwellcollins.com>_
> __www.rockwellcollins.com_ <http://www.rockwellcollins.com/>
>
>
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
