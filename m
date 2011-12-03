From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Dec 2011 19:40:00 +0100
Subject: [Buildroot] Device files and Buildroot
In-Reply-To: <CAHUNapQdgYL7a6DdKW4COasRKUREmvfhJEncAW_OaWp4TA_2yQ@mail.gmail.com>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <001c01ccb07c$85e85190$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LUnHUAQk_4j2fyjE_tYum+U-i08aUKksK__tLOu0XgMeA@mail.gmail.com>
 <201112020734.00122.minimod@morethan.org>
 <001201ccb10b$22c23010$0400a8c0@dspcgrnzks9p98>
 <CAAu5YTas_VmvbHEkwOZqVZ3iD+sy4nYdmykMKZAagtAEYViYHA@mail.gmail.com>
 <001601ccb112$a16043b0$0400a8c0@dspcgrnzks9p98>
 <1322847199.55324.YahooMailNeo@web161204.mail.bf1.yahoo.com>
 <002f01ccb11c$9a835280$0400a8c0@dspcgrnzks9p98>
 <CABkKHSbDDD8rFU5UhYpR7tCcJWNXtbUNNNbmHU2yfjt23zzgWg@mail.gmail.com>
 <003e01ccb120$6f8f16a0$0400a8c0@dspcgrnzks9p98>
 <CABkKHSacRwGaT0ajXySqPeV0aFzGthxLykC7LXOsut4SPjNsmA@mail.gmail.com>
 <20111203092553.0acf80a5@skate>
 <CAHUNapQdgYL7a6DdKW4COasRKUREmvfhJEncAW_OaWp4TA_2yQ@mail.gmail.com>
Message-ID: <20111203194000.1c6a1bc7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 3 Dec 2011 07:53:51 -0500,
Trevor Woerner <twoerner@gmail.com> a ?crit :

> Excellent write-up. Does buildroot's /dev handling also tweak
> /etc/fstab? I would assume /dev would only need to be mounted in the
> non-static cases.

Two cases here :

 * Static /dev. In this case /dev is part of the root filesystem
   itself, so there is no need for anything special in /etc/fstab.

 * Dynamic /dev (either with devtmpfs only, or with devtmpfs+mdev or
   devtmpfs+udev). In this case, we use the CONFIG_DEVTMPFS_MOUNT
   kernel option, which tells the kernel to automatically mount the
   devtmpfs filesystem at boot time. So the root filesystem simply
   contains a /dev directory, completely empty. Nothing is needed
   in /etc/fstab: the kernel will mount devtmpfs in /dev automatically.
   The only special case here is when the root filesystem is an
   initramfs: for some reason, the kernel does not mount devtmpfs
   automatically in this case, but Buildroot installs a special /init
   wrapper script, which mounts devtmpfs before starting the real init.
   But even in this case, nothing special is needed in /etc/fstab.

Does that answer your question?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
