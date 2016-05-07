From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 15:23:18 +0200
Subject: [Buildroot] [PATCH 04/34] reproducibility: make rootfs.tar
 reproducible
In-Reply-To: <1462002570-14706-4-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-4-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <20160507152318.017bf013@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 30 Apr 2016 09:49:00 +0200, Gilles Chanteperdrix wrote:

> +define ROOTFS_TAR_CMD
> +	cd $(TARGET_DIR) && { \
> +		find . -\( -! -type d -o -empty -\) -print0 | \
> +		sort -z | \
> +		tar --null -T - -c$(TAR_OPTS)f $@ --mtime=@$(SOURCE_DATE_EPOCH) --numeric-owner; \
> +	}

We normally write such constructs as:

	(cd $(TARGET_DIR) && \
		foo ....)

However, this raises the question of what's needed for all the other
filesystem formats. Will they all have to implement a different
ROOTFS_<foo>_CMD variable ? Or will there be some commonalities that
should be factored out in the common rootfs image infrastructure ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
