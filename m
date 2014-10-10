From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Oct 2014 13:06:19 +0200
Subject: [Buildroot] Problems with uClicbc and libc.so.6
In-Reply-To: <CA+TH9V=mCGn6WtS0RJHV9HHy6wrYBvxSW3aveQWdQWP-9UW0Bg@mail.gmail.com>
References: <CA+TH9VnNeLUgYs5yahr3FNz6+bcz8A_KR_6390kcWUXv7LVxOA@mail.gmail.com>
 <20141009135427.63f010b0@free-electrons.com>
 <CA+TH9VnQmn=7qX9Ao2qST1z3Sr8uVsFBB5xe5ASrNCLBdo9GsQ@mail.gmail.com>
 <20141009150727.441ae173@free-electrons.com>
 <CA+TH9VnFAqd-4ZFQ3Bi2kcDD1rqX-de8BwvErpUxOhaytGF7EA@mail.gmail.com>
 <20141009180201.01d7ff1c@free-electrons.com>
 <CA+TH9Vnoy5ZeGG3h9VOLMFHCF1R3USboHG6jg2TMK1QakWy4Ww@mail.gmail.com>
 <20141009222020.5bd77d67@free-electrons.com>
 <CA+TH9VkiMj5PNJaO1k2fHpEbjY2mgCDO9NmQtny7T4GVPpYX0g@mail.gmail.com>
 <20141010123449.04163d4c@free-electrons.com>
 <CA+TH9V=mCGn6WtS0RJHV9HHy6wrYBvxSW3aveQWdQWP-9UW0Bg@mail.gmail.com>
Message-ID: <20141010130619.41d555b6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Fri, 10 Oct 2014 12:45:28 +0200, Angelo Compagnucci wrote:

> > <dllmap dll="libc" target="libc.so.0" os="!windows"/>
> 
> This is pretty wonderfull! I totally missed that! I'll include it in a
> patch file! May it work also with glibc? If yes, I can tweak a static
> version of that file to include.

No, it won't work with glibc, and it most likely won't work with musl
as well. So you'll need to $(SED) this file in a post install target
hook, depending on the C library being used. Since the default value is
OK for glibc, we only need to handle the uClibc and Musl cases. Maybe
something like:

ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
MONO_LIBC_NAME = libc.so.0
else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
MONO_LIBC_NAME = libc.so
endif

ifneq ($(MONO_LIBC_NAME),)
define MONO_TWEAK_LIBC_NAME
	$(SED) 's,libc.so.6,$(MONO_LIBC_NAME)' $(TARGET_DIR)/etc/mono/config
endef
MONO_POST_INSTALL_TARGET_HOOKS += MONO_TWEAK_LIBC_NAME
endif


> Yes, Thomas, you caught me, I did not understand your comment!
> Actually I really don't know haw to achieve such a dual package in
> one, but if you prompt me a minimal example, I'll work on understand
> it!

I'll have a look.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
