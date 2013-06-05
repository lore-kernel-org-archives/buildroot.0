From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Jun 2013 21:14:51 +0200
Subject: [Buildroot] [PATCH 2/2] sunxi-boards: set a default board
In-Reply-To: <1370449270-22014-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 5 Jun 2013 18:21:10 +0200")
References: <1370449270-22014-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1370449270-22014-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87d2s0cqtw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The default configuration doesn't set any board, but the
 Thomas> sunxi-boards.mk file errors out if no board is defined. This causes a
 Thomas> large number of build failures in the autobuilders, such as
 Thomas> http://autobuild.buildroot.org/results/b92/b928edc07f0939531d76833a17c851889ae06677/build-end.log.

 Thomas> The proposed approach to solve this is to set a default board. An
 Thomas> alternative approach would have been to remove the check that ensures
 Thomas> that a board has been set, but I believe it's less obvious for the
 Thomas> user.

That won't help as it then just fails when it tries to build/install.


 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/sunxi-boards/Config.in | 1 +
 Thomas>  1 file changed, 1 insertion(+)

 Thomas> diff --git a/package/sunxi-boards/Config.in b/package/sunxi-boards/Config.in
 Thomas> index d9fd852..d8c82e0 100644
 Thomas> --- a/package/sunxi-boards/Config.in
 Thomas> +++ b/package/sunxi-boards/Config.in
 Thomas> @@ -13,6 +13,7 @@ config BR2_PACKAGE_SUNXI_BOARDS
 Thomas>  if BR2_PACKAGE_SUNXI_BOARDS
 Thomas>  config BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE
 Thomas>  	string ".fex file to compile"
 Thomas> +	default "a10/hackberry.fex"

Hmm, how is this different that what we do for the barebox/u-boot/linux
configurations?

If people forget to set a sensible _FEX_FILE they now silently get the
wrong stuff (if they don't build for hackberry) instead of a clear error
message.

Wouldn't it make more sense to blacklist the package or preseed
BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE to a sensible value in the autobuilder
scripts?

-- 
Bye, Peter Korsgaard
