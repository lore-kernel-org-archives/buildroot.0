From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Sep 2016 19:08:33 +0200
Subject: [Buildroot] [PATCH 3/3] python3: Compile host-python3 statically
In-Reply-To: <1474032631-21311-1-git-send-email-fpa@sbtaqua.com>
References: <1474032631-21311-1-git-send-email-fpa@sbtaqua.com>
Message-ID: <20160916190833.7c776697@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please wrap the text in your commit messages to a reasonable line width
(72 characters).

On Fri, 16 Sep 2016 15:30:31 +0200, Frederik Aalund wrote:
> The previous behaviour was to compile host-python3 with `--enable-shared` as is done for the target python installation. The problem is that if the host *already* has a python installation, then host-python3 will be called with the system `libpython3.5.so`. So even though the $(HOST_DIR) python executable is called, the system .so is used.

This should not be the case. All host binaries we build are built with
-Wl,-rpath,$(HOST_DIR)/usr/lib, which means that they should look up
libraries in $(HOST_DIR)/usr/lib *before* looking at /usr/lib.

Can you double check what "readelf -a output/host/usr/bin/python" says
about this? readelf should show you this rpath encoded into the Python
binary. If that's not the case, then this is the problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
