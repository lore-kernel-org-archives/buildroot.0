From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Dec 2016 11:33:10 +0100
Subject: [Buildroot] [PATCH] Makefile: generate KBUILD_BUILD_TIMESTAMP
 date whith LANG=C
In-Reply-To: <1481019001-11035-1-git-send-email-jean-baptiste.tredez@basystemes.fr>
References: <1481019001-11035-1-git-send-email-jean-baptiste.tredez@basystemes.fr>
Message-ID: <20161206113310.2f9ebef4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Dec 2016 11:10:01 +0100, Jean-Baptiste Tr?dez wrote:
> Fix kernel reproducible build if LANG=fr_FR.UTF-8 in host system.
> 
> when building linux kernel, scripts/gen_initramfs_list.sh do 'date -d"$KBUILD_BUILD_TIMESTAMP" +%s'
> In buildroot makefile, KBUILD_BUILD_TIMESTAMP="$(shell date -d @$(SOURCE_DATE_EPOCH))"
> if LANG=fr_FR.UTF-8 in host system, it does not work :
> - LANG=C date -d"$(LANG=C date)" : ok
> - LANG=C date -d"$(LANG=fr_FR.UTF-8 date)" : error
> 
> Signed-off-by: Jean-Baptiste Tr?dez <jean-baptiste.tredez@basystemes.fr>

Indeed, seems like the LANG/LC_ALL variables exported in the main
Makefile are not used in the $(shell ...) sub-shells.

However, are you sure it works with LANG=C ? It seems like LC_ALL=C is
needed instead:

thomas at skate:/tmp$ LANG=C date
mardi 6 d?cembre 2016, 11:31:52 (UTC+0100)
thomas at skate:/tmp$ LC_ALL=C date
Tue Dec  6 11:31:59 CET 2016

I also tested with the following test makefile:

====

export LC_ALL=C

foo = $(shell LC_ALL=C date)

all:
	date
	echo "$(foo)"

====

And indeed, the "export LC_ALL" is enough for the direct "date" call to
work. But for the date call whose output is stored in the "foo"
variable, passing again LC_ALL in the sub-shell is necessary.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
