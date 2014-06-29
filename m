From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 29 Jun 2014 10:07:45 +0200
Subject: [Buildroot] [PATCH v2] uclibc: enable parallel building of
	libraries
In-Reply-To: <1403886360-32033-1-git-send-email-abrodkin@synopsys.com>
References: <1403886360-32033-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <CAAXf6LU3yfD-6mUJ+smNhVDyChPCFv53s7PPVFJYm0A6cdGMgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey,

On Fri, Jun 27, 2014 at 6:26 PM, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
> The use of MAKE1 for uClibc dates back 10 years:
>
> commit 8e5fb3fb4ab09b4dc04fe7cb3f7becce6514117b
> Author: Eric Andersen <andersen@codepoet.org>
> Date:   Sat Dec 11 13:01:10 2004 +0000
>
>     Add initial BR2_JLEVEL support, with some exceptions for apps that
>     have broken 'make -j' support
>
> Since that time there were lots of improvements in uClibc that seem to allow
> parallel building of libs finally.
>
> Unfortunately uClibc tests have dependences on previously built files,
> that's why tests left with MAKE1.
>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
>
> Cc: Anton Kolesov <akolesov@synopsys.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> In v2 uClibc tests are left with MAKE1 because there're strict
> dependences.
> ---
>  package/uclibc/uclibc.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index b42fe55..28a8a08 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -494,13 +494,13 @@ endef
>  endif
>
>  define UCLIBC_BUILD_CMDS
> -       $(MAKE1) -C $(@D) \
> +       $(MAKE) -C $(@D) \
>                 $(UCLIBC_MAKE_FLAGS) \
>                 PREFIX= \
>                 DEVEL_PREFIX=/ \
>                 RUNTIME_PREFIX=/ \
>                 all
> -       $(MAKE1) -C $(@D)/utils \
> +       $(MAKE) -C $(@D)/utils \
>                 PREFIX=$(HOST_DIR) \
>                 HOSTCC="$(HOSTCC)" hostutils
>         $(UCLIBC_BUILD_TEST_SUITE)

There are other occurrences of MAKE1 in uclibc.mak: for the oldconfig
step (in SETUP_DOT_CONFIG), configure commands, installation commands,
and menuconfig step.
I think these should be replaced by MAKE too (and tested, of course).

Best regards,
Thomas
