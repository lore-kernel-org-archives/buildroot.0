Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106C6C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 13:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3F4A81A5F;
	Sat,  1 Jan 2022 13:32:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b0EbJlhPDfmQ; Sat,  1 Jan 2022 13:32:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0723A81991;
	Sat,  1 Jan 2022 13:32:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72CBF1BF31D
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 13:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EBDF60B93
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 13:32:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id npKO_Eq6YsIg for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 13:32:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 700CC605EE
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 13:32:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b440:9a6c:7abd:86f8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9D1105FE03;
 Sat,  1 Jan 2022 14:32:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641043944;
 bh=7UhzWUugU08EYjSIBnClfUwJo2gpjEsdKzZft3OStl8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mHLJdrN4hOxAsj9S4jsif/ihN3MyVDMj0ZD9uMENtLj1SYfPDEF/Mp/lj8fQa6JLO
 oYuXnY6t4tphP09OZlNfKIi92vd6PG7XuFTg7tje0cWkby3QTpE0kZgNwFadxmgFF1
 ITxLbN24UilwmLrdijI0KiMRO59go8/l9YcPY3uNhqUYTARypa5FMdlR1ZlvuknOwP
 LfkAxXDHBvNihmBGdDWkzI+9PplnMo1MEGTIXIcDnc3UYErq059vlAwNJtMnn3x9Cj
 3lqFtK+kDzMNvg9rMUJlBugU/fMSqPQ+JE1g8aHCl/LSRoG3HTjvLMg0YDKqhrs/ri
 6T3DBhy2ICAFQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 14:32:18 +0100
Date: Sat, 1 Jan 2022 14:32:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20220101133218.GI3390456@scaer>
References: <20211223090800.1716321-1-troglobit@gmail.com>
 <20211223090800.1716321-2-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211223090800.1716321-2-troglobit@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 1/3] package/makedevs: allow recursive on
 directory with dangling symlinks
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Joachim, All,

On 2021-12-23 10:07 +0100, Joachim Wiberg spake thusly:
> When using BR2_ROOTFS_DEVICE_TABLE to change ownership of /etc, like so:
> 
>   /etc        r  -1 root     wheel     - - - - -
> 
> makdevs fails due to it trying to chown() a dangling symlink:

*makedevs   *its (really "its", and really not "it's")

Applied to master, thanks.

Regards,
Yann E. MORIN.

>   makedevs: chown failed for /src/myLinux/output/build/buildroot-fs/ext2/target/etc/mtab: No such file or directory
>   makedevs: line 25: recursive failed for /src/myLinux/output/build/buildroot-fs/ext2/target/etc: No such file or directory
>   make[2]: *** [fs/ext2/ext2.mk:63: /src/myLinux/output/images/rootfs.ext2] Error 1
>   make[1]: *** [Makefile:84: _all] Error 2
>   make[1]: Leaving directory '/src/myLinux/buildroot'
> 
> This patch changes chown() to lchown() in two cases in makedevs.c when
> the argument can be a symlink, dangling or not.
> 
> In case the recursive operation includes a chmod() as well, explicitly
> exclude symlinks that are dangling, because chmod() always operates on
> the link target.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
> ---
>  package/makedevs/makedevs.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
> index c57b964f5c..2796cd5e78 100644
> --- a/package/makedevs/makedevs.c
> +++ b/package/makedevs/makedevs.c
> @@ -440,11 +440,13 @@ void bb_show_usage(void)
>  int bb_recursive(const char *fpath, const struct stat *sb,
>  		int tflag, struct FTW *ftwbuf){
>  
> -	if (chown(fpath, recursive_uid, recursive_gid) == -1) {
> +	if (lchown(fpath, recursive_uid, recursive_gid) == -1) {
>  		bb_perror_msg("chown failed for %s", fpath);
>  		return -1;
>  	}
> -	if (recursive_mode != -1) {
> +
> +	/* chmod() is optional, also skip if dangling symlink */
> +	if (recursive_mode != -1 && tflag == FTW_SL && access(fpath, F_OK)) {
>  		if (chmod(fpath, recursive_mode) < 0) {
>  			bb_perror_msg("chmod failed for %s", fpath);
>  			return -1;
> @@ -628,7 +630,7 @@ int main(int argc, char **argv)
>  				if (mknod(full_name_inc, mode, rdev) < 0) {
>  					bb_perror_msg("line %d: can't create node %s", linenum, full_name_inc);
>  					ret = EXIT_FAILURE;
> -				} else if (chown(full_name_inc, uid, gid) < 0) {
> +				} else if (lchown(full_name_inc, uid, gid) < 0) {
>  					bb_perror_msg("line %d: can't chown %s", linenum, full_name_inc);
>  					ret = EXIT_FAILURE;
>  				} else if (chmod(full_name_inc, mode) < 0) {
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
