From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Nov 2014 21:58:04 +0100
Subject: [Buildroot] [PATCH v3 5/5] package: linux-fusion: use install
 instead of cp
In-Reply-To: <20141118193804.GA8821@fox>
References: <1416244750-24256-1-git-send-email-guido@vanguardiasur.com.ar>
 <1416244750-24256-6-git-send-email-guido@vanguardiasur.com.ar>
 <546A714D.3040402@mind.be> <20141118171709.GD20682@fox>
 <546B9CBF.80905@mind.be> <20141118193804.GA8821@fox>
Message-ID: <546BB2DC.6000502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/11/14 20:40, Guido Mart?nez wrote:
> On Tue, Nov 18, 2014 at 08:23:43PM +0100, Arnout Vandecappelle wrote:
> > On 18/11/14 18:17, Guido Mart?nez wrote:
> >> Hi Arnout, all
> >>
> >> On Mon, Nov 17, 2014 at 11:06:05PM +0100, Arnout Vandecappelle wrote:
> >>> On 17/11/14 18:19, Guido Mart?nez wrote:
> >>>> in order to not depend on the previous permissions of the file
> >>>>
> >>>> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> >>>
> >>> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> >>>
> >>>  There are a few more suspicious cp instances:
> >>>
> >>> board/boundarydevices/nitrogen6x/post-build.sh
> >>> boot/grub/grub.mk
> >>> fs/iso9660/iso9660.mk
> >> I'll take a look at these, thanks.
> >>
> >>>  Also, it would be good to document somewhere (e.g. in the intro mail) why the
> >>> rsync in the toolchain is OK. Or even better, replace it even though it's not
> >>> really necessary - it just feels more consistent and safe.
> >> Yes, this sounds good. Maybe use --chmod on the toolchain and add a
> >> comment there? This way we should be covered in the future if someone
> >> uses 'rsync -a' from there.
> >
> >  Actually the toolchain already uses --chmod=Du+w.
> Yes, but that doesn't have any effect on files, so files under
> output/staging can have just about any mode, and more so when the
> toolchain is preinstalled somewhere.
>
> Changing it to --chmod=u=rwX,go=rX would eliminate that variablity
> (again, we're assuming that there are no 'random' exec bits set, but
> that's reasonable since no files are created with the exec bit set).
>
> This way, at any place within BR we could do 'rsync -a
> $(STAGING_DIR)/... $(TARGET_DIR)/...' and have well-defined modes on the
> target.
>
> That kind of rsync (or any other similar copy) don't exist as of now:
> eveything is done via 'install'. So I don't have a strong opinion for
> changing the rsync or not.

 Not true: there are plenty of instances of 'cp -a' or a variant.

 That's why I think it's safer to do the chmod for the toolchain's rsync
as well.


 Regards,
 Arnout


>
> What do you guys think?
> Thanks!
>


-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
