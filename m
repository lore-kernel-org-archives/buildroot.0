From: Philippe Reynes <tremyfr@yahoo.fr>
Date: Thu, 27 Mar 2014 18:17:09 +0000 (GMT)
Subject: [Buildroot] [PATCH] Makefile: move fs/common.mk above
	external.mk
In-Reply-To: <87ha6kk5bi.fsf@dell.be.48ers.dk>
References: <1395583071-10016-1-git-send-email-tremyfr@yahoo.fr>
 <87ha6kk5bi.fsf@dell.be.48ers.dk>
Message-ID: <1395944229.86315.YahooMailNeo@web28802.mail.ir2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

I've done a little test before sending this patch.
I've used this useless fs :

define ROOTFS_USERFS_CMD
??? echo "Nothing to do" ; \
??? touch $@
endef

$(eval $(call ROOTFS_TARGET,userfs))

In the file $(BR2_EXTERNAL)/fs/common.mk

Without my patch, the file rootfs.userfs is not created.
With my patch, the file rootfs.userfs is created.

I could have missed something.
Do you have an idea of what may failed ?

Regards,
Philippe









Le Mercredi 26 mars 2014 22h39, Peter Korsgaard <jacmet@uclibc.org> a ?crit :
 
>>>>> "Philippe" == Philippe Reynes <tremyfr@yahoo.fr> writes:


> The file external.mk was included before fs/common.mk,
> so it was impossible to add rootfs target to external.
> This change move fs/common.mk before external.mk, so
> now rootfs target may be added to external.

> Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
> ---
>? Makefile |? ? 3 +--
>? 1 files changed, 1 insertions(+), 2 deletions(-)

> diff --git a/Makefile b/Makefile
> index d49d7bf..07e6c74 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -391,6 +391,7 @@ include $(sort $(wildcard package/*/*.mk))
>? include boot/common.mk
>? include linux/linux.mk
>? include system/system.mk
> +include fs/common.mk

>? include $(BR2_EXTERNAL)/external.mk

> @@ -408,8 +409,6 @@ ifeq ($(BR2_ECLIPSE_REGISTER),y)
>? TARGETS+=toolchain-eclipse-register
>? endif

> -include fs/common.mk
> -

Hmm, does that really work? Does the locale data get correctly purged /
generated before the filesystem images are generated?

-- 
Bye, Peter Korsgaard
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140327/8e1fef56/attachment.html>
