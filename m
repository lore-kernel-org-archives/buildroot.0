From: Philippe Reynes <tremyfr@yahoo.fr>
Date: Sun, 30 Mar 2014 20:02:21 +0100 (BST)
Subject: [Buildroot] [PATCH] Makefile: move fs/common.mk above
	external.mk
In-Reply-To: <87ppl7gwdz.fsf@dell.be.48ers.dk>
References: <1395583071-10016-1-git-send-email-tremyfr@yahoo.fr>	<87ha6kk5bi.fsf@dell.be.48ers.dk>	<1395944229.86315.YahooMailNeo@web28802.mail.ir2.yahoo.com>
 <87ppl7gwdz.fsf@dell.be.48ers.dk> 
Message-ID: <1396206141.79285.YahooMailNeo@web28804.mail.ir2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi peter,

I think I understand the issue now (thanks to Thomas and Yann).
The filesystem target depend on target-finalize, and target-finalize
depends on targets. 

grep -n target-finalize Makefile
513:$(TARGETS_ROOTFS): target-finalize
515:target-finalize: $(TARGETS)

So even if we move fs/common.mk above external.mk,
the filesystem targets will always be done after targets.
So I think that this change should be safe.

Best regards,
Philippe



Le , Peter Korsgaard <jacmet@uclibc.org> a ?crit :
 
>>>>> "Philippe" == Philippe Reynes <tremyfr@yahoo.fr> writes:

> Hi Peter,
> I've done a little test before sending this patch.
> I've used this useless fs :

> define ROOTFS_USERFS_CMD
>? ?  echo "Nothing to do" ; \
>? ?  touch $@
> endef

> $(eval $(call ROOTFS_TARGET,userfs))

> In the file $(BR2_EXTERNAL)/fs/common.mk

> Without my patch, the file rootfs.userfs is not created.
> With my patch, the file rootfs.userfs is created.

> I could have missed something.
> Do you have an idea of what may failed ?

The specific issue I mentioned was about the externally defined rootfs
getting created before
 target-purgelocales / target-generatelocales gets
called. The easiest way to check that is to use a glibc toolchain and
enable BR2_ENABLE_LOCALE_PURGE / BR2_GENERATE_LOCALE, and then stick an
echo statement in each of them.


-- 
Bye, Peter Korsgaard
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140330/ee1b7964/attachment.html>
