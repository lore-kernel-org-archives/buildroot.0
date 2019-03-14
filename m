From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 11:13:11 +0100
Subject: [Buildroot] [PATCH v2 02/13] qt5: Convert to generic target
 install command
In-Reply-To: <20190314094024.1961-3-anaumann@ultratronik.de>
References: <20190314094024.1961-1-anaumann@ultratronik.de>
 <20190314094024.1961-3-anaumann@ultratronik.de>
Message-ID: <20190314111311.48cda006@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andreas,

On Thu, 14 Mar 2019 10:40:13 +0100
Andreas Naumann <anaumann@ultratronik.de> wrote:

> This converts the numerous and complex target install steps of almost all Qt5
> related packages to a single rsync call with a pre-filtered list of files from
> the packages staging to the target path.
> The list is created from files in which were created, or have changed, in staging
> after the .stamp_built was made. In order to avoid useless files in target, all
> *.prl, *.la files and the folders /usr/include and /usr/lib/cmake and /usr/doc
> are ignored.

One issue with this approach is that if you do a complete build, and
then do "make qt5base-reinstall", then the date of the .stamp_built
file of qt5base has not changed, and will be older than the one of all
other packages that have been built after qt5base. Therefore, the rsync
that you do will copy again not only the files from qt5base, but also
the ones from all other packages that have been built after qt5base.

I'm really not sure this is what we want to do, we will most likely end
up in TARGET_DIR with a bunch of files we didn't want to see there.

I continue to believe we want to find a solution where "make
INSTALL_ROOT=$(TARGET_DIR) install" and "make
INSTALL_ROOT=$(STAGING_DIR) install" works properly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
