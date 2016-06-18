From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 22:58:01 +0200
Subject: [Buildroot] [PATCH] elfutils: do not override ELFUTILS_CFLAGS
 variable
In-Reply-To: <1466268206-62239-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1466268206-62239-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160618225801.2a290a33@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Jun 2016 17:43:26 +0100, Vicente Olivert Riera wrote:

>  # sparc64 needs -fPIC instead of -fpic
>  ifeq ($(BR2_sparc64),y)
> -ELFUTILS_CFLAGS += -fPIC
> +ELFUTILS_CFLAGS = -fPIC

This change is wrong, += should be kept here.

>  # elfutils gets confused when lfs mode is forced, so don't
> -ELFUTILS_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
> +ELFUTILS_CFLAGS += $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))

Either you change to += like you propose, or you move the assignment
earlier. Changing to += is fine for me, but you should not change the
conditional assignment to = in the sparc64 condition.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
