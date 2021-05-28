From: Alexander Dahl <post@lespocky.de>
Date: Fri, 28 May 2021 22:29:32 +0200
Subject: [Buildroot] Verifying linux 5.4.x hashes
In-Reply-To: <20210528195506.GH2788252@scaer>
References: <BN8PR11MB366618492FB8C57A78D7752BFF229@BN8PR11MB3666.namprd11.prod.outlook.com>
 <20210528195506.GH2788252@scaer>
Message-ID: <20210528202931.futcxwo2lokvoact@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Fri, May 28, 2021 at 09:55:06PM +0200, Yann E. MORIN wrote:
> On 2021-05-28 17:15 +0000, Ian Merin via buildroot spake thusly:
> > Hello, -- question about verifying linux kernel hashes.  I see in the
> > linux.hash file there is an entry for the latest 5.4.x version, but I
> > dont see any way to actually download and verify that 5.4.x version
> > against the hash in linux.hash
> 
> Here's a quick summary of our discussion on IRC:
> 
>   - the hash file is shared between linux and linux-headers
>   - it is still possible to select a linux 5.4.x as linux-headers
>   - hence we still ahve a 5.4.x entry even for linux
>   - the hashes for custom version are not checked at all, becasue we
>     can't have all the hashes of all the kernel versions

Maybe not for non official version, but why not for all mainline
kernel versions?

    % git tag | grep -v rc | wc -l
    3025

This would be 3k lines of text currently, big compared to other
buildroot hashes files, but not that huge in general.  If one could
split it up for major releases, I would consider it maintainable,
that's just few hundred lines per kernel version max.

> > What would be the method to have buildroot download the ???latest???
> > 5.4.x kernel and also verify its hash against linux.hash?
> 
> And now a quick summary for that part;
> 
>  1. expand the hash-checking infra to accept custom hashes; that would
>     impact:
>         package/pkg-generic
>         package/pkg-download
>         support/download/dl-wrapper
>         support/download/check-hash
> 
>  2. in linux/Config.in add a new entry for custom version:
>         BR2_LINUX_KERNEL_CUSTOM_VERSION_HASHES="sha256:1234abcd sha512:abcd1234"
> 
> Note that I am not vey fond of the hash being set in the menuconfig, but
> I don't have a definitive better idea.

What about the above one?  Would be quite some work to setup, but once
in place it would be just adding a new hash to the file instead of
replacing the old one.

> One thing to consider, though: people that want to check custom versions
> are probably already using a br2-external tree, so they could very well
> set such hashes in their tree, e.g;

Would of course not apply to custom versions, for mainline only.  But
we all head for mainline first, anyways, don't we? ;-)

Greets
Alex

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210528/a867ad05/attachment.asc>
