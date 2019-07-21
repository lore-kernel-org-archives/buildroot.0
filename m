From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 21 Jul 2019 21:01:10 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-07-20
In-Reply-To: <20190721060040.4E27586230@whitealder.osuosl.org>
References: <20190721060040.4E27586230@whitealder.osuosl.org>
Message-ID: <20190721210110.0b3620b0@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *,

On Sun, 21 Jul 2019 06:00:34 -0000, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> Build statistics for 2019-07-20

[...]

>      sparc64 |                  libv4l-1.16.5 | NOK | http://autobuild.buildroot.net/results/79c1e1b7a1bc53c1e9b2ae0c9acb443e6d2e2994 |     

make[4]: Entering directory '/home/buildroot/build/instance-1/output/build/libv4l-1.16.5/utils/qv4l2'

[...]

  CXXLD    qv4l2
libtool: warning: library '/home/buildroot/build/instance-1/output/host/bin/../sparc64-buildroot-linux-gnu/sysroot/usr/lib/libQt5Widgets.la' was moved.
libtool:   error: cannot find the library '' or unhandled argument '/libQt5Gui.so'
Makefile:571: recipe for target 'qv4l2' failed


From host/sparc64-buildroot-linux-gnu/sysroot/usr/lib/libQt5Widgets.la:

	# Libraries that this one depends upon.
	dependency_libs='-latomic /libQt5Gui.so /libQt5Core.so -lpthread -lrt -lpthread -ldl '

This can be fixed by reverting 'qt5: Remove *.la/*.prl fixup script' ([1]), and adding

	-e "s:\/lib\([a-zA-Z0-9_-]*\)\.so:-l\1:g"

to the sed statement, resulting in the following dependency_libs line:

	# Libraries that this one depends upon.
	dependency_libs='-latomic -lQt5Gui -lQt5Core -lpthread -lrt -lpthread -ldl '

Regards,
Peter

[1] https://git.buildroot.net/buildroot/commit/?id=428e5276e4df0b4bbd75df38565298ad53ea4f8b
