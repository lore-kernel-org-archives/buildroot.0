From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Dec 2018 16:39:15 +0100
Subject: [Buildroot] [PATCH v2] package/pkgconf: add patch to restore
 pre-1.5.3 behavior for sysroot prefixing
In-Reply-To: <20181218214443.19888-1-thomas.petazzoni@bootlin.com>
References: <20181218214443.19888-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181221163915.53685772@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 18 Dec 2018 22:44:43 +0100, Thomas Petazzoni wrote:
> Prior to the bump to version 1.5.3 in commit
> 4e423669399ad8389edd81761ea5c9cc26bf312d, we had a patch on pkgconf
> that ensures only some variables containing paths were prefixed by the
> sysroot directory when queried through pkg-config. This patch was
> dropped as part of the 1.5.3 bump, but it turns out we really need
> something like this, or a significant number of changes need to be
> done to existing packages.
> 
> Indeed, pkg-config has no notion of which variable/path gets used at
> build time vs. which variable/path gets used at runtime. Prefixing
> with the sysroot the paths used at build time works and is desirable,
> but prefixing the paths used at runtime doesn't work.
> 
> This commit should fix a large number of remaining build failures
> related to pkgconf 1.5.3, and should allow reverting a significant
> number of workarounds.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Changes since v1:
>  - Fix the pkgconf patch description, which was meaningless, as
>    noticed by Yann.
>  - Don't initialize the add_sysroot variable to true to later set its
>    value unconditionally to false, as noticed by Yann.
> ---
>  ...th-the-sysroot-a-subset-of-variables.patch | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch

Since this patch has been on the mailing list for a few days, and that
Arnout, Yann and Peter all gave their approval for going in this
direction to try to fix the pkg-config related issues, I've applied.
This will allow us to see if the autobuilders are happier.

If it is successful, my personal preference would be to revert all the
pkg-config 1.5.3 related fixes from Fabrice that we have applied so
far, since they should normally no longer be needed. Does everyone
agree with this proposal ?

However, I would probably wait for a few days before doing this.
Fabrice fixes will not cause any problem in combination with my
pkg-config change, so let's first see if my pkg-config change really
solves the remaining problems. If it does, then we can proceed with
reverting the fixes from Fabrice.

However, I will mark the remaining pkg-config related fixes from
Fabrice pending in patchwork as Superseded.

Best regards,


Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
