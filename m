From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 07 Jul 2011 12:09:20 +0200
Subject: [Buildroot] asking for advice on improving our buildroot setup
Message-ID: <1310033360.2076.18.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

we are successfully using buildroot for quite a while now. However our
setup is somewhat akward and I'd like to improve it. Now that we have
updated to the latest buildroot I dare to ask for advice here on how you
would implement the following scenario:

We are building factory images, USB rescue images and update images for
our Raumfeld evices. In order to do this we need to build, for each
target platform (2 platforms currently):

 (1) a kernel and initramfs with some basic tools
 (2) an ext2 rootfs that contains factory tests as well
     as tools to format the flash and unpack a tar.gz
     rootfs on it
 (3) the actual rootfs of the devices as tar.gz
     this includes a kernel and modules and this kernel
     may be different from the kernel built in step 1

So what we are doing currently is that we are running full independent
buildroot builds for each of the steps listed above and then build our
images from the results of those runs. That is we pick up the kernel
with initramfs from step 1, combine it with the ext rootfs that is
created in step 2 and add the rootfs.tar.gz from step 3.

Actually step 3 is even performed twice for the ARM platform because we
need two different rootfs for two different hardware types (Controller
and Speaker/Connector).

As you can imagine this build consumes a lot of time and disk space.
Currently I can think of two ways to improve this:

(1) Add an initial step that builds a toolchain and then use that
    toolchain from the following steps. This would save the time
    to rebuild the toolchain for each of the steps.

(2) Combine all steps and build different rootfs from within the
    same buildroot tree. I read that this would be supported. But
    I would like to get advice from you first. Is there a chance
    that this will work for the described setup?


Thanks,
Sven

-- 
Sven Neumann
Head of RAUMFELD Software Development

Lautsprecher Teufel GmbH | B?lowstr. 66 | 10783 Berlin | Germany
Tel: +49 (0)30-300 930 153 | s.neumann at raumfeld.com
