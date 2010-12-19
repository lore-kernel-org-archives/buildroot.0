From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 19 Dec 2010 21:15:40 +0100
Subject: [Buildroot] [PATCH 2/2] linux: fix linux-% shortcut targets
In-Reply-To: <1292783849-8766-2-git-send-email-bjorn.forsman@gmail.com>
	(=?utf-8?Q?=22Bj=C3=B8rn?= Forsman"'s message of "Sun,
	19 Dec 2010 19:37:29 +0100")
References: <1292783849-8766-1-git-send-email-bjorn.forsman@gmail.com>
	<1292783849-8766-2-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <87d3ox1pub.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:

Hi,

 Bj?rn> linux-% shortcut targets (short for linux26-%) ignores the ouput
 Bj?rn> dir $(O) so that 'make O=output.arm linux-menuconfig' is
 Bj?rn> actually run in the default $(O) directory output/ and not in
 Bj?rn> output.arm/. Fix by passing on $(O).

This is still not correct. You should only pass O= if it was given on
the command line, otherwise BR will look in output/.config for the
configuration for non-out-of-tree-builds. I've added EXTRAMAKEARGS in
the toplevel makefile a while ago to handle it.

Committed with that change.

 Bj?rn> Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
 Bj?rn> ---
 Bj?rn>  linux/linux.mk |    2 +-
 Bj?rn>  1 files changed, 1 insertions(+), 1 deletions(-)

 Bj?rn> diff --git a/linux/linux.mk b/linux/linux.mk
 Bj?rn> index 6636a35..68d2d6d 100644
 Bj?rn> --- a/linux/linux.mk
 Bj?rn> +++ b/linux/linux.mk
 Bj?rn> @@ -200,4 +200,4 @@ endif
 Bj?rn>  endif
 
 Bj?rn>  linux-%:
 Bj?rn> -	$(MAKE) $(subst linux-,linux26-,$@)
 Bj?rn> +	$(MAKE) O=$(O) $(subst linux-,linux26-,$@)
 Bj?rn> -- 
 Bj?rn> 1.7.1

 Bj?rn> _______________________________________________
 Bj?rn> buildroot mailing list
 Bj?rn> buildroot at busybox.net
 Bj?rn> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
