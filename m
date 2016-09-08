From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Sep 2016 23:12:50 +0200
Subject: [Buildroot] [FYI] jemalloc and valgrind
In-Reply-To: <D7C5A212-77BA-44BA-9FDE-35F0CA5FAA86@exablox.com>
References: <D7C5A212-77BA-44BA-9FDE-35F0CA5FAA86@exablox.com>
Message-ID: <20160908231250.6aceffd2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 8 Sep 2016 13:54:00 -0700, Charles Hardin wrote:
> So, we hit an oddity on a ?debug? build which turned out to be that if we have
> valgrind installed - jemalloc would race

What do you mean by "would race" ?

> and if it got build before valgrind then
> it would not detect it.
> 
> I?ll try to make this a format patch later - but this is off another tree and so simple
> that if someone wants to add it - I would suggest you do.

It would be better if you could make an official patch, since your
patch below looks almost good, it only needs a proper commit log +
correct submission.

> 
> diff --git a/package/jemalloc/jemalloc.mk b/package/jemalloc/jemalloc.mk
> index 7086dfa..71d6200 100644
> --- a/package/jemalloc/jemalloc.mk
> +++ b/package/jemalloc/jemalloc.mk
> @@ -11,5 +11,10 @@ JEMALLOC_LICENSE = BSD-2c
>  JEMALLOC_LICENSE_FILES = COPYING
>  JEMALLOC_INSTALL_STAGING = YES
>  
> +ifeq ($(BR2_PACKAGE_VALGRIND),y)
> +JEMALLOC_DEPENDENCIES += valgrind
> +JEMALLOC_CONF_OPTS += --enable-valgrind

Please add:

else
JEMALLOC_CONF_OPTS += --disable-valgrind

> +endif

Also, for good measure:

HOST_JEMALLOC_CONF_OPTS += --disable-valgrind

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
