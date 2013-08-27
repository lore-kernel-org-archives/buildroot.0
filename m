From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Aug 2013 22:55:22 +0200
Subject: [Buildroot] [PATCH] package/Makefile.in: fix ABI name for
	EABIhf targets
In-Reply-To: <1377283216-31225-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 23 Aug 2013 20:40:16 +0200")
References: <1377283216-31225-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ob8ij1l1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The current code to set ABI on ARM does the following:
 Thomas> ifeq ($(BR2_arm)$(BR2_armeb),y)
 Thomas> ... set ABI without 'hf' suffix ...
 Thomas> else ifeq ($(BR2_ARM_EABIHF),y)
 Thomas> ... set ABI with 'hf' suffix ...
 Thomas> endif

 Thomas> But since $(BR2_arm)$(BR2_armeb) will always be 'y' in the cases where
 Thomas> BR2_ARM_EABIHF is 'y', it means that the 'else' part of the condition
 Thomas> will never be used.

 Thomas> Fix this by appending 'hf' to the ABI variable when BR2_ARM_EABIHF is
 Thomas> selected.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas> I wondering how the EABIhf stuff could have worked. Is this something
 Thomas> I mismerged when rebasing my patch series? Anyway, if my analysis is
 Thomas> correct, it's certainly something that should be part of 2013.08.
 Thomas> ---
 Thomas>  package/Makefile.in | 8 +++-----
 Thomas>  1 file changed, 3 insertions(+), 5 deletions(-)

 Thomas> diff --git a/package/Makefile.in b/package/Makefile.in
 Thomas> index e753d6b..e93d3ba 100644
 Thomas> --- a/package/Makefile.in
 Thomas> +++ b/package/Makefile.in
 Thomas> @@ -46,12 +46,10 @@ ABI=gnueabi
 Thomas>  else
 Thomas>  ABI=eabi
 Thomas>  endif
 Thomas> -else ifeq ($(BR2_ARM_EABIHF),y)
 Thomas> -ifeq ($(LIBC),uclibc)
 Thomas> -ABI=gnueabihf
 Thomas> -else
 Thomas> -ABI=eabihf
 Thomas>  endif
 Thomas> +
 Thomas> +ifeq ($(BR2_ARM_EABIHF),y)
 Thomas> +ABI:=$(ABI)hf
 Thomas>  endif

I prefer to keep all the ARM stuff inside the arm/armeb test, so I moved
it above the endif and applied, thanks!

-- 
Bye, Peter Korsgaard
