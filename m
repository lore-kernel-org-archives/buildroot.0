From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Nov 2019 22:05:34 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/qemu: add host-python as an
 explicit dependency
In-Reply-To: <20191111213154.19409-2-avraham.shukron@gmail.com>
References: <20191111213154.19409-1-avraham.shukron@gmail.com>
 <20191111213154.19409-2-avraham.shukron@gmail.com>
Message-ID: <20191112220534.531a470f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Nov 2019 23:31:46 +0200
Avi Shukron <avraham.shukron@gmail.com> wrote:

> qemu requires python in its configre script. Yet host-python was
> not listed as one of the package's dependencies. If no other package
> requested host-python, then configuring this package will fail since
> it won't find any executable named python in the host dir.
> 
> In order to reproduce this issue you must not have python2 installed
> on your host machine.
> 
> Signed-off-by: Avi Shukron <avraham.shukron@gmail.com>

qemu needs python 2 *or* python 3, so we can do something like this:

QEMU_DEPENDENCIES = host-pkgconf libglib2 zlib pixman $(if $(BR2_PACKAGE_PYTHON3),host-python3,host-python)

This way, if you have Python 3.x enabled for the target (and therefore
you are already building host-python3), it will use host-python3.

Could you test this in a configuration that has BR2_PACKAGE_QEMU=y and
BR2_PACKAGE_PYTHON3=y, and check it works properly ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
