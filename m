From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Sat, 23 Sep 2017 19:30:04 -0400
Subject: [Buildroot] [PATCH 0/3] Fix Qt WE run-time issue on RPI3
Message-ID: <20170923233007.13772-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This patch serie fixes a run-time issue with Qt WebEngine on a RPI3.

	# cd /usr/lib/qt/examples/webengine/quicknanobrowser/
	# ./quicknanobrowser https://www.buildroot.org/
	(...)
	#0 0x0000742c63de <unknown>
	#1 0x0000742d0c38 <unknown>
	#2 0x0000749d7bde <unknown>
	#3 0x0000749e3c70 <unknown>
	#4 0x00007530227c <unknown>
	#5 0x000075302480 <unknown>
	#6 0x0000752fb1e4 <unknown>
	#7 0x00007430f878 <unknown>
	#8 0x0000742d5fee <unknown>
	#9 0x0000742d6f44 <unknown>
	#10 0x0000742d721e <unknown>
	#11 0x0000742d7ad6 <unknown>
	#12 0x0000742d57b2 <unknown>
	#13 0x0000742e74f6 <unknown>
	#14 0x0000742f6a74 <unknown>
	#15 0x0000742f41dc <unknown>

	Received signal 6
	#0 0x0000742c63de <unknown>
	#1 0x0000742c66a0 <unknown>
	#2 0x0000725b5d10 <unknown>
	[end of stack trace]
	qml: Render process exited with code 256 (abnormal exit)

The first patch converts the raspberrypi post-image script so it handles many
arguments.

The second patch adds the new optional argument --gpu_mem_XXX to raspberrypi
post-image script; XXX is the amount of memory available on board 256/512/1024.

The third patch adds the additional argument --gpu_mem_1024=200 to post-image
script for the raspberrypi3_qt5we config.

Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>

Regards,
Ga?l PORTAY (3):
  raspberrypi: post-image.sh handles many arguments
  raspberrypi: post-image.sh add new gpu_mem option
  configs/raspberrypi3_qt5we: set gpu-mem to 200

 board/raspberrypi/post-image.sh      | 47 +++++++++++++++++++++---------------
 configs/raspberrypi3_qt5we_defconfig |  2 +-
 2 files changed, 29 insertions(+), 20 deletions(-)

-- 
2.13.2
