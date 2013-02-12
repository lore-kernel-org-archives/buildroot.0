From: Stephan Hoffmann <sho@relinux.de>
Date: Tue, 12 Feb 2013 09:38:56 +0100
Subject: [Buildroot] [RFC] Removing CLEAN_CMDS and
	UNINSTALL_(STAGING|TARGET)_CMDS
In-Reply-To: <1360363083-28747-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360363083-28747-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5119FFA0.2090804@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 08.02.2013 23:37, schrieb Thomas Petazzoni:
> Hello,
>
> This is an RFC patch set to discuss whether or not we should keep the
> <pkg>_CLEAN_CMDS, <pkg>_UNINSTALL_TARGET_CMDS and
> <pkg>_UNINSTALL_STAGING_CMDS. It is a topic that has been discussed at
> various times in the past months/years.
Hello Thomas,

the "make <pkg>-clean" handling we have is practically useless, since
some packages implement it more or less and others only remove the stamp
files or whatever. So we could either repair it or remove it.

Since the only reason to clean a package is that one has changed the
configuration "make <pkg>-dirclean" does as well. So I opt for removing
the <pkg>-clean target and the <pkg>_CLEAN_CMDS.

>
> A lot of packages don't implement them, we generally don't ask for
> them to be implemented when reviewing packages, and the uninstall
> commands are generally never updated when a package version is bumped,
> which means that they are probably bitrotting pretty quickly. We also
> have no automated way of testing these commands.
>
> That said, it is true that the <pkg>-clean target might be useful for
> some use cases. However, is <pkg>-uninstall really useful, considering
> that it doesn't take into account the removal of the reverse
> dependencies?
From buildroot's concept of defining the packages with Kconfig I did not
see the point of uninstall at all. It could either be called
automatically after removing packages from .config or, when make
<package>_uninstall is called, update .config afterwards. Both does not
seem practicable to me.

So I opt for removing this, too.


Regards

Stephan
> Again, this patch set is not meant to be applied as is, it is here to
> get the discussion started. Sending the patches with it is simply a
> way to ensure that the discussion is considered seriously :-)
>
> Best regards,
>
> Thomas
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
