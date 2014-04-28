From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Apr 2014 18:10:38 +0200
Subject: [Buildroot] [PATCH] Makefile: target-purgelocales: add
	dependencies
In-Reply-To: <87tx9dx0c0.fsf@dell.be.48ers.dk>
References: <1398356679-1438-1-git-send-email-fabio.porcedda@gmail.com>
 <20140424184136.572de3d0@skate>
 <CAHkwnC8p7E8inhY7w+WiFcsZ-_mO26rdTFB8xKvgDrG2bSj0Uw@mail.gmail.com>
 <535DEBEC.80605@mind.be> <87tx9dx0c0.fsf@dell.be.48ers.dk>
Message-ID: <20140428181038.6d83619a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Arnout,

On Mon, 28 Apr 2014 11:36:15 +0200, Peter Korsgaard wrote:

>  >  My personal preference is to have a single rule (e.g. target-finalize)
>  > that performs everything that is post-targets and pre-rootfs. There isn't
>  > much that needs to be done so parallelisation doesn't make sense. And I
>  > think it's much easier to understand which steps are executed and in
>  > which order if they are all put together in a single rule rather than
>  > spread out over several.
> 
>  >  To make things more readable, we can put the commands into separate
>  > variables. For instance:
> 
>  > define TARGET_PURGE_LOCALES
>  > 	rm -f $(LOCALE_WHITELIST)
>  > 	...
>  > endef
> 
>  > define TARGET_PURGE_DEVFILES
>  > 	rm -rf $(TARGET_DIR)/usr/include ...
>  > ...
>  > endef
> 
>  > ifneq ($(BR2_PACKAGE_GDB),y)
>  > define TARGET_PURGE_GDB
>  >         rm -rf $(TARGET_DIR)/usr/share/gdb
>  > endef
>  > endif
> 
>  > target-finalize: $(TARGETS)
>  > 	$(TARGET_PURGE_LOCALES)
>  > 	$(TARGET_PURGE_DEVFILES)
>  > 	$(TARGET_PURGE_GDB)
>  > 	$(TARGET_PURGE_DOC)
>  > ...
> 
> Yes, that looks nice and clear to me too.

Yes, agreed, this looks a lot nicer than a long chain of targets that
simply depend on each other to avoid any parallelization.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
