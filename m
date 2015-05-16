From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 16 May 2015 10:06:13 +0200
Subject: [Buildroot] [PATCH] uboot-tools: fix static linking with OpenSSL
In-Reply-To: <87sib0gb28.fsf@dell.be.48ers.dk>
References: <1431464533-15795-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87sib0gb28.fsf@dell.be.48ers.dk>
Message-ID: <5556FA75.60903@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 13/05/2015 10:02, Peter Korsgaard a ?crit :
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Had a patch to U-Boot to use pkg-config to get the OpenSSL link flags
> 
> s/Had/Add/
> 
>> when pkg-config is available. This allows to make sure that static
>  > linking works properly. The patch requires adding $(TARGET_MAKE_ENV)
>  > so that the Buildroot provided pkg-config is used instead of the host
>  > one.
> 
>  > The U-Boot patch has been submitted upstream.
> 
> Thanks!
> 
>  > Fixes:
> 
>  >   http://autobuild.buildroot.org/results/a9f/a9f316cd076a74b8730ce4cdcdb8176da4ed9eb3/
> 
>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
>> + # MXSImage needs LibSSL
>  > + ifneq ($(CONFIG_MX23)$(CONFIG_MX28)$(CONFIG_FIT_SIGNATURE),)
>  > +-HOSTLOADLIBES_mkimage += -lssl -lcrypto
>  > ++HOSTLOADLIBES_mkimage += \
>  > ++	$(shell pkg-config --libs libssl 2> /dev/null || echo "-lssl -lcrypto")


It doesn't work for BR2_SHARED_LIBS only:

http://autobuild.buildroot.net/results/483/48345d936c7972dc27ea12bdccfe0d02bbc4112b/build-end.log

-lcrypto is required for PEM_read_X509 and X509_free symbols.

What's about using 'pkg-config --libs openssl' instead ?

Best regards,
Romain

>  > + endif

> 
> This only works because we have a pkg-config wrapper adding --static to
> the real pkg-config. For people directly using pkg-config this won't fix
> anything.
> 
> But yeah, in the context of Buildroot it does, so committed -
> Thanks.
> 
