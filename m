From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Sep 2010 09:25:33 +0200
Subject: [Buildroot] dev nodes as regular files
In-Reply-To: <AANLkTikBSYh1WoKXAxVjEv4VvmBnXs-ac9p2f7iTWYOE@mail.gmail.com>
References: <AANLkTikBSYh1WoKXAxVjEv4VvmBnXs-ac9p2f7iTWYOE@mail.gmail.com>
Message-ID: <20100907092533.110fd587@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sergey,

On Tue, 7 Sep 2010 10:59:25 +0400
Sergey Naumov <sknaumov@gmail.com> wrote:

> All device nodes created as regular files with zero length, while
> mknod utility present.
> Does anybody know a reason of this behavior?

Where are you looking at ?

I think you're probably looking at output/target, which obviously does
not contain the correct device files. This is because root priviledges
are required to create device files, and we don't want Buildroot to do
anything as root (that's one of the feature of Buildroot).

Therefore, the device files are only present in the final
filesystem images (created in output/images), they are created using
the 'fakeroot' utility, which as it names says, allows to fake the fact
that we are root, for a particular set of operations.

Therefore, the directory/files in output/target are *NOT* the final
target filesystem. You must use one of the images generated in
output/images. The list of images generated in this directory is
configured using the "Target filesystem options -->" menu in
menuconfig/xconfig.

If you need any other detail, don't hesitate to ask!

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
