From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Mar 2012 23:17:59 +0200
Subject: [Buildroot] Need an advice while porting Links with FrameBuffer
	support
In-Reply-To: <CAPEB33zYC=NcZk__9PG3RWJQKwnurkvRCO+3jAzGCpjCO7PTrw@mail.gmail.com>
References: <CAPEB33zYC=NcZk__9PG3RWJQKwnurkvRCO+3jAzGCpjCO7PTrw@mail.gmail.com>
Message-ID: <201203252318.00107.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 23 March 2012 21:19:02 MERCADIER Johann wrote:
> Hi all,
>   I currently try to port the Links webrowser for using it with the
> native-framebuffer only.
>   Then I had to add the "libgpm", a library needed for mouse device.
>   From there I had to correct one of the file from this library which used
> an old header file "stropts.h" (STREAMS interface).
> 
>   So now I'm confuse as I don't know where to put the patch? If I send this
> patch to the maintener of the libGPM waiting after it could take ages
> before we could get a working version.

 You do both: include a patch in buildroot and send it upstream.  It's a
good idea to document the upstream status of the patch in the patch
itself (i.e. in package/libgpm/libgpm-....patch - remember that patch
files should always start with an explanation of what the patch is about,
including a Signed-off-by line).

 If you get feedback from upstream you can incorporate it in the buildroot
patch as well.


> My 2nd asking is about GIT use. Do I
> have to create a new branch for each of my "issues"? Here is want I
> intended to do, but I will prefer to have a good advice before doing wrong
> thing...
> i) create a branch for LINK
>    modify package/Config.in
>    create package/links/Config.in
>    create package/links/link.mk
> 
> ii) create a branch for patching libgpm and work in it
>     Do what is needed
>     Create the patch
> 
> iii) Back to the LINK branch
>     make
>     check if it works as it should be (Test on the target)
>     create patchs
>     Send them
> 
> iv) Back to master
> 
> Is that a good way to proceed or thing can be made easier or in a better
> way?
> All suggestions are welcome!

 There are several approaches.

1. The manual way.  Like you describe above.  It's a bit simpler though to
do both patches on the links branch, and do a 'git send-email master' when
you're finished with them.  git send-email will see that there are two
patches on top of master: one adding libgpm, and one adding links.  The
disadvantage of this approach that it is more difficult to make
modifications to the first patch (it requires 'git rebase' and 'git amend').

2. Use quilt.  This stores your modifications as patches, outside of git,
instead of as a branch in git.  Never used it myself so can't comment on
it further.

3. Use topgit (tg).  This stores each patch in a separate branch, and
tracks dependencies between them.  It's slightly complex to understand
what is happening under the hood, and you're sometimes exposed to it.
Also, you shouldn't use 'git send-email' in this case, but 'tg mail'
(I got bitten by that one once :-).  But I like topgit a lot.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
