From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 19 Feb 2016 23:38:49 +0100
Subject: [Buildroot] [PATCH] package/syslogd: workaround a compiler bug
 with CS powerpc 2012.03
In-Reply-To: <8760xonw41.fsf@dell.be.48ers.dk>
References: <1455447313-14334-1-git-send-email-romain.naour@gmail.com>
 <8760xonw41.fsf@dell.be.48ers.dk>
Message-ID: <56C79979.9080604@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le 16/02/2016 23:11, Peter Korsgaard a ?crit :

>>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:
>   > The O3 optimization triggers a compiler bug with this toolchain,
>   > change it with 02.
>
>   > Fixes:
>   > http://autobuild.buildroot.net/results/2fb/2fb94ecfdc32761a09da35e6fcbdd512847ec911
>
>   > Signed-off-by: Romain Naour <romain.naour@gmail.com>
>   > ---
>   >  package/sysklogd/sysklogd.mk | 8 ++++++++
>   >  1 file changed, 8 insertions(+)
>
>   > diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
>   > index de2edf4..9e315bc 100644
>   > --- a/package/sysklogd/sysklogd.mk
>   > +++ b/package/sysklogd/sysklogd.mk
>   > @@ -14,6 +14,14 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>   >  SYSKLOGD_DEPENDENCIES = busybox
>   >  endif
>   
>   > +# CS PowerPC 2012.03 triggers compiler bug.
>   > +ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC_E500V2),y)
>   > +define SYSKLOGD_WORKAROUND_COMPILER_BUG
>   > +	$(SED) 's/-O3/-O2/' $(@D)/Makefile
>
> Does this mean that sysklogd isn't using our TARGET_CFLAGS (where we
> most likely pass -Os)?

-O3 is added by SKFLAGS variable which is used as CFLAGS.
TARGET_CFLAGS is not taken into account :-/

>
> Why don't we fix that instead?
We could try to replace SKFLAGS by CFLAGS...

Best regards,
Romain
>
>
