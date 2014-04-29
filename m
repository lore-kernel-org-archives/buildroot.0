From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Apr 2014 20:37:44 +0200
Subject: [Buildroot] [PATCH] Create /dev/null device node when building
 a cpio rootfs
In-Reply-To: <1398784378-20251-2-git-send-email-dan.moulding@rackwareinc.com>
References: <1398784378-20251-1-git-send-email-dan.moulding@rackwareinc.com>
 <1398784378-20251-2-git-send-email-dan.moulding@rackwareinc.com>
Message-ID: <535FF178.2090507@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/04/14 17:12, Dan Moulding wrote:
> This allows mdev to be used for automatic device creation, even if the
> kernel doesn't support devtmpfs. The programs that run before mdev
> (e.g. init) expect /dev/null to already exist.
> 
> Signed-off-by: Dan Moulding <dan.moulding@rackwareinc.com>
> ---
>  fs/cpio/cpio.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
> index 771306c..8648ed9 100644
> --- a/fs/cpio/cpio.mk
> +++ b/fs/cpio/cpio.mk
> @@ -22,6 +22,7 @@ define ROOTFS_CPIO_ADD_INIT
>  endef
>  
>  PACKAGES_PERMISSIONS_TABLE += /dev/console c 622 0 0 5 1 - - -$(sep)
> +PACKAGES_PERMISSIONS_TABLE += /dev/null c 666 0 0 1 3 - - -$(sep)

 How is this issue limited to the cpio rootfs? You'll have the same issue
with any rootfs, right?

 So perhaps a better solution is to move /dev/console and /dev/null from
device_table_dev.txt to device_table.txt.

 In fact, on December 13, 2011, Thomas Petazzoni wrote:

> Le Tue, 13 Dec 2011 09:39:34 +0100,
> Arnout Vandecappelle <arnout@mind.be> a ?crit :
> 
>>  If you ask me, it's OK to add /dev entries in the
>> BR2_ROOTFS_DEVICE_TABLE. In fact, I think /dev/console and /dev/null
>> should be put in there.  But I've never gotten around to roll a patch
>> for it.
> 
> FWIW, when I initially introduced (based on prior patches) this
> static /dev vs. devtmpfs vs. mdev vs. udev selection, the mdev and udev
> choices were independent of devtmpfs, i.e there were using a minimal
> device tables with /dev/null and /dev/console. But after discussion on
> the mailing-list, it was decided that it was better to make devtmpfs a
> requirement when mdev and udev were choosen.
> 
> See
> 
>   Message-Id: <f92465f9de8bcd24cf2c974b158a600a84e96422.1291582352.git.thomas.petazzoni@free-electrons.com>
> 
> for the initial patch I proposed on December, 5th 2010.
> 
> And
> 
>  Message-ID: <87r5dgfldw.fsf@macbook.be.48ers.dk>
> 
> for Peter's answer (December, 17th 2010), saying :
> 
> """
>  Thomas> At compile time, only a minimal /dev is created in the filesystem,
>  Thomas> with only "console" and "null". This is done thanks to a small device
>  Thomas> table in target/generic/device_table_mdev_udev.txt. This is done
>  Thomas> directly at the configuration level (fs/Config.in).  
> 
> While I agree we need the minimal device table for /etc/shadow and
> similar permissions, do we really need to support mdev/udev without
> devtmpfs? It's been in the kernel now for close to 2 years, it's very
> small and it simplifies (and speeds up) the boot sequence quite a lot.
> """


 IOW this approach was suggested before but not really picked up.


 Note that if we do that, we can revert e1ebae70 and perhaps even
10a130f9. Actually, 10a130f9 can probably already be reverted, since
e1ebae70 should have the same effect.

 Regards,
 Arnout

>  
>  endif # BR2_ROOTFS_DEVICE_CREATION_STATIC
>  
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
