From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Apr 2020 16:43:46 +0200
Subject: [Buildroot] [PATCH] package/mtd: add upstream patch that fixes
 ubiformat return code
In-Reply-To: <20200407095816.3499-1-patrickdepinguin@gmail.com>
References: <20200407095816.3499-1-patrickdepinguin@gmail.com>
Message-ID: <20200407144346.GO22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-04-07 11:58 +0200, Thomas De Schampheleire spake thusly:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> ubiformat returns 255 even on successful format actions, since the upgrade
> of mtd-utils to version 2.1.1.
> 
> Backport an upstream patch that fixes this issue. No new release is made
> yet.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-utils-Fix-return-value-of-ubiformat.patch | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 package/mtd/0001-mtd-utils-Fix-return-value-of-ubiformat.patch
> 
> diff --git a/package/mtd/0001-mtd-utils-Fix-return-value-of-ubiformat.patch b/package/mtd/0001-mtd-utils-Fix-return-value-of-ubiformat.patch
> new file mode 100644
> index 0000000000..b316ecac12
> --- /dev/null
> +++ b/package/mtd/0001-mtd-utils-Fix-return-value-of-ubiformat.patch
> @@ -0,0 +1,60 @@
> +From 95633c4dfe943a701d4fcd809e6cabf4bf8710b8 Mon Sep 17 00:00:00 2001
> +From: Barry Grussling <barry@grussling.com>
> +Date: Sun, 12 Jan 2020 12:33:32 -0800
> +Subject: [PATCH] mtd-utils: Fix return value of ubiformat
> +
> +This changeset fixes a feature regression in ubiformat.  Older versions of
> +ubiformat, when invoked with a flash-image, would return 0 in the case no error
> +was encountered.  Upon upgrading to latest, it was discovered that ubiformat
> +returned 255 even without encountering an error condition.
> +
> +This changeset corrects the above issue and causes ubiformat, when given an
> +image file, to return 0 when no errors are detected.
> +
> +Tested by running through my loading scripts and verifying ubiformat returned
> +0.
> +
> +Signed-off-by: Barry Grussling <barry@grussling.com>
> +Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> +[import into Buildroot]
> +Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> +---
> + ubi-utils/ubiformat.c | 7 +++++--
> + 1 file changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
> +index 64afad2..be40e52 100644
> +--- a/ubi-utils/ubiformat.c
> ++++ b/ubi-utils/ubiformat.c
> +@@ -550,6 +550,7 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
> + 	struct ubi_vtbl_record *vtbl;
> + 	int eb1 = -1, eb2 = -1;
> + 	long long ec1 = -1, ec2 = -1;
> ++	int ret = -1;
> + 
> + 	write_size = UBI_EC_HDR_SIZE + mtd->subpage_size - 1;
> + 	write_size /= mtd->subpage_size;
> +@@ -643,8 +644,10 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
> + 	if (!args.quiet && !args.verbose)
> + 		printf("\n");
> + 
> +-	if (novtbl)
> ++	if (novtbl) {
> ++		ret = 0;
> + 		goto out_free;
> ++	}
> + 
> + 	if (eb1 == -1 || eb2 == -1) {
> + 		errmsg("no eraseblocks for volume table");
> +@@ -669,7 +672,7 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
> + 
> + out_free:
> + 	free(hdr);
> +-	return -1;
> ++	return ret;
> + }
> + 
> + int main(int argc, char * const argv[])
> +-- 
> +2.24.1
> +
> -- 
> 2.24.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
