From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Dec 2016 23:48:34 +0100
Subject: [Buildroot] [PATCH 3/3] efibootmgr: depends on wchar
In-Reply-To: <1480979238-18273-4-git-send-email-nunes.erico@gmail.com>
References: <1480979238-18273-1-git-send-email-nunes.erico@gmail.com>
 <1480979238-18273-4-git-send-email-nunes.erico@gmail.com>
Message-ID: <20161207234834.40f51647@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Dec 2016 00:07:18 +0100, Erico Nunes wrote:

> This "select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT" is slightly
> complicated to handle for the propagated wchar dependency, if the
> unavailability Kconfig "comment" is added.
> Looks like we don't need to always have the wchar dependency as the
> dependency on gettext is optional, however this complicates the mention
> to 'needs wchar' in the Kconfig comment.
> Some packages seem to try to handle this in some smarter way
> (BR2_PACKAGE_LINUX_TOOLS_CPUPOWER) but then the comment is not always
> accurate.
> Please let me know if there is a better way to do this, right now it
> seems to be simpler to just require wchar always.

If you really want to be pedantic, you could write:

	depends on !BR2_NEEDS_GETTEXT || BR2_USE_WCHAR

but it anyway makes the Config.in comment handling a bit annoying. And
it's in fact a bit useless:

 - On glibc, BR2_USE_WCHAR is always 'y', and BR2_NEEDS_GETTEXT is false

 - On musl, BR2_USE_WCHAR is always 'y', and BR2_NEEDS_GETTEXT is false

 - On uClibc, BR2_NEEDS_GETTEXT is 'y', and indeed BR2_USE_WCHAR needs
   to be set.

So in fact, a "depends on BR2_USE_WCHAR" is good enough.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
