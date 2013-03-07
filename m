From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 07 Mar 2013 21:20:06 +0200
Subject: [Buildroot] [PATCH 1/1] Updated systemd to version 197
In-Reply-To: <5138E042.7030307@petroprogram.com>
References: <1362312574-17701-1-git-send-email-olivier.schonken@gmail.com>
 <5138E042.7030307@petroprogram.com>
Message-ID: <5138E866.5060107@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


[snip..] 

> This will need at least the following additional patch to be able to
> build with uClibc:
>
> http://eric-weiss.de/oe/oe-core/meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
>
> Regards
> Stefan
>


Also, package/systemd/systemd-uclibc-fix.patch needs updating.
src/journal/journald-kmsg.c needs also posix_fallocate workaround.

However, there is a patch for uClibc 0.9.33  that add's
posix_fallocate() function
http://git.uclibc.org/uClibc/patch/?id=5643900913f64c00f1c2958914586708efa5a473

And maybe latest git of uClibc (or at least coming 0.9.34) will contain
that function.
'
So patching 0.9.33 with posix_fallocate and/or requiring at least 0.9.34
for systemd would be good.

Please also add the following:

ifeq
($(BR2_TOOLCHAIN_BUILDROOT)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)$(BR2_TOOLCHAIN_CTNG_uClibc),y)
    SYSTEMD_CONF_OPT += --disable-myhostname
endif

Regards
Stefan
