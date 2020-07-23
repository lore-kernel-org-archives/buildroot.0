From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 09:44:22 +0200
Subject: [Buildroot] [PATCH 01/12] package/gcr: fix gpg path
In-Reply-To: <20200723010810.3237608-2-aduskett@gmail.com>
References: <20200723010810.3237608-1-aduskett@gmail.com>
 <20200723010810.3237608-2-aduskett@gmail.com>
Message-ID: <20200723094422.2a35adb7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

Thanks for picking up the work on udisks!

On Wed, 22 Jul 2020 18:07:59 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> gnugpg2 does not create /usr/bin/gpg2, instead, /usr/bin/gpg2 is typically
> a symlink to /usr/bin/gpg.
> 
> Buildroot does not create this symlink, so this path is not valid.
> Change the path to /usr/bin/gpg to fix this issue.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Back when gcr was introduced in commit
ec069dcf54cc69c19701a69106acaffdd07023bf, it already had:

+GCR_CONF_ENV = ac_cv_path_GNUPG=/usr/bin/gpg2

so presumably this was working then.

So I think it is probably 86dfb429ae1770550beb49299ef08ef05605c190 that
broke that, as it changed the name of the binaries installed by the
gnupg2 package.

This is the kind of research I would like to see when doing such
changes: don't just fix the current situation, try to find out how we
ended up here, so that we understand since when the problem has been
occurring, whether we need to backport to LTS/stable, etc.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
