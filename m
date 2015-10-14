From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 23:14:29 +0200
Subject: [Buildroot] [PATCHv3] system: add options for /bin /sbin and
 /lib to be symlinks into /usr
In-Reply-To: <1441397852-23461-1-git-send-email-yann.morin.1998@free.fr>
References: <1441397852-23461-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151014231429.15d741b0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri,  4 Sep 2015 22:17:32 +0200, Yann E. MORIN wrote:
> systemd is increasingly expecting things to live in /usr/bin, /usr/sbin
> or /usr/lib nad not in /bin, /sbin or /lib. It has inherited those
> expectations from a Fedora change:
>     https://fedoraproject.org/wiki/Features/UsrMove
> 
> Note however, that systemd does support /usr being on a separate
> filesystem; it just expects an initramfs to mount it before the final
> switchroot over to the actual rootfs.
> 
> But the traditional use-case for Buildroot is not to boot with an
> initramfs; although that is totally feasible, that's probably not what
> is commonly done in the vast majority of cases.
> 
> However, a lot of packages still install stuff directly into /bin,
> /sbin or /lib, which systemd may need early-on in the boot process,
> even before it may have a chance to mount /usr. Even though we can
> tell systemd, at configure-time, where it should expect programs to
> be at runtime, it does not make sense to go head-first against an
> upstream wa^Hill.
> 
> Add an option so that /bin, /sbin and /lib be symlinks to /usr/bin
> and /usr/sbin. That option is forcibly enabled when the init system
> is systemd.
> 
> Note: we need not handle /lib32 or /lib64, as they already are symlinks
> to /lib, which means they will automatically be redirected to /usr/lib,
> as /usr/lib32 and /usr/lib64 already are.
> 
> Furthermore, this means we're no longer supporting a split-usr setup, so
> the corresponding configure options have been removed as well for
> systemd and, when using a merged /usr, for eudev as well.
> 
> In Buildroot, we decided (with this patch) not to support a split-usr
> when systemd is used as an init system. This is a design decision, not
> a systemd issue. Thus the select is with BR2_INIT_SYSTEMD rather than
> with BR2_PACKAGE_SYSTEMD.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Mike Williams <mike@mikebwilliams.com>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Cc: Baruch Siach <baruch@tkos.co.il>
> 
> ---
> Changes v2 -> v3:
>   - only conditionally drop the split-usr options for eudev  (Vicente)
>   - add this missing history log  (Vicente)
>   - add a rationale on why this is the init system that selects
>     merged-usr, not the package  (Arnout).

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
