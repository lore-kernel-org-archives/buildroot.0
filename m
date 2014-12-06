From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Dec 2014 13:53:09 +0100
Subject: [Buildroot] [PATCH 4/4] pkg-download: check hasahes for locally
 cached files
In-Reply-To: <20141206124441.GC9544@free.fr>
References: <cover.1417475935.git.yann.morin.1998@free.fr>
 <e1cc728a60b6a250ea395ee429dba7f470b1f8a8.1417475935.git.yann.morin.1998@free.fr>
 <20141202093148.1a1f7db7@free-electrons.com>
 <20141203185157.GG4152@free.fr> <20141206124441.GC9544@free.fr>
Message-ID: <20141206135309.016c7151@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 6 Dec 2014 13:44:41 +0100, Yann E. MORIN wrote:

> Please also note that this in fact does not change the current
> behaviour. Even today, we are checking the hashes for locally cached
> files, so this solution adds no overhead.
> 
> To understand why, here's a summary of what happened before and after
> thise series:
> 
>     before:                         after:
> 
>     check if file is cached         check if the file is cached
>     if not cached,                  if cached,
>         download the file               check the hashes
>     check the hashes                    if match,
>                                             stop
>                                         rm cached file
>                                     downlaod file
>                                     check hashes
> 
> So, as you can see, in case the file is already cached locally, and the
> hashes match, we don't do much more than today, except the checks are
> not done in the same order, which allows us to attempt a re-download in
> case of hash mismatch.

define DOWNLOAD_WGET
        test -e $(DL_DIR)/$(2) || \
        $(EXTRA_ENV) support/download/wrapper wget \
                $(DL_DIR)/$(2) \
                '$(call qstrip,$(1))' && \
        $(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
endef


Hum, the construct 

	test -e <foo> || download && check-hash

is not very easy to understand in terms of priorities, but indeed,
regardless of whether the download is executed or not, the check-hash
part is executed.

Thanks for the explanation!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
