From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 May 2015 10:02:07 +0200
Subject: [Buildroot] [PATCH] uboot-tools: fix static linking with OpenSSL
In-Reply-To: <1431464533-15795-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 12 May 2015 23:02:13 +0200")
References: <1431464533-15795-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87sib0gb28.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Had a patch to U-Boot to use pkg-config to get the OpenSSL link flags

s/Had/Add/

> when pkg-config is available. This allows to make sure that static
 > linking works properly. The patch requires adding $(TARGET_MAKE_ENV)
 > so that the Buildroot provided pkg-config is used instead of the host
 > one.

 > The U-Boot patch has been submitted upstream.

Thanks!

 > Fixes:

 >   http://autobuild.buildroot.org/results/a9f/a9f316cd076a74b8730ce4cdcdb8176da4ed9eb3/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> + # MXSImage needs LibSSL
 > + ifneq ($(CONFIG_MX23)$(CONFIG_MX28)$(CONFIG_FIT_SIGNATURE),)
 > +-HOSTLOADLIBES_mkimage += -lssl -lcrypto
 > ++HOSTLOADLIBES_mkimage += \
 > ++	$(shell pkg-config --libs libssl 2> /dev/null || echo "-lssl -lcrypto")
 > + endif

This only works because we have a pkg-config wrapper adding --static to
the real pkg-config. For people directly using pkg-config this won't fix
anything.

But yeah, in the context of Buildroot it does, so committed -
Thanks.

-- 
Bye, Peter Korsgaard
