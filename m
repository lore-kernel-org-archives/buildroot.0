From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Feb 2014 11:09:46 +0100
Subject: [Buildroot] Kernel image format :  kernel image is not rebuild
In-Reply-To: <39AACAAA6258427B9662537ABA591922@JohanW7>
References: <39AACAAA6258427B9662537ABA591922@JohanW7>
Message-ID: <20140205110946.0f131ddd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Wed, 5 Feb 2014 10:35:02 +0100, Sagaert Johan wrote:

> If i change the kernel image format from zImage to uImage buildroot does not make the uImage.
> If only does it if I remove the stamps in the target kernel so buildroot is forced to recompile the kernel.
> Then it generates the uImage.
> Likewise if I change it to uImage with appended DTB, I must first force the kernel to be rebuild.

This is the expected behavior. Buildroot does not try to be smart by
detecting what should be rebuilt depending on the changes you made in
the configuration. For example, if you change configuration options
related to a library, it is impossible to know if those changes should
force the rebuild of all the reverse dependencies of this library or
not. Therefore, Buildroot takes a simple solution: it does not try to
do any detection, and leaves it to the user.

So if you have change the kernel configuration in terms of image
formats, then you should do:

	make linux-rebuild

Which will force Buildroot to restart the build and installation steps
of the kernel. There is no need to manually remove stamp files, the
"make <pkg>-rebuild" target is here for this purpose.

See: http://buildroot.org/downloads/manual/manual.html#rebuild-pkg.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
