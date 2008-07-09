From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 9 Jul 2008 13:29:26 +0200
Subject: [Buildroot] Forcing a kernel rebuild
In-Reply-To: <1215542557.6277.21.camel@kokopelli>
References: <1215542557.6277.21.camel@kokopelli>
Message-ID: <20080709112926.GA27321@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 08, 2008 at 11:42:37AM -0700, Brian Beattie wrote:
>I'm doing some kernel module development and need to rebuild the kernel
>modules.  Now I can do this by setting the environment to use the
>buildroot cross compiler and running make from within the
>project_{ARCH}/${BOARD}/linux-2.4.24 directory, but I'd really like to
>just run make from the buildroot directory and have all the cross
>compile stuff taken care of.
>
>If there is currently a way to force the kernel modules to be rebuilt I
>have not found it, so I added some targets to target/linux/Makefile.in*
>so that a "make linux26-touch" will touch .configured in the kernel
>directory forcing a kernel and kernel modules recompile for the next
>"make".  I have attached a patch for this and would be interested is
>discussing this approach.  I'm open to any to get this functionality.

I think you could simply
$ rm -f project_*/*/linux*/.modules_installed
$ make linux26-modules

Alternatively, i suggest to add a
index 22bbcb9..fd9844e 100644
--- a/target/linux/Makefile.in
+++ b/target/linux/Makefile.in
@@ -256,6 +256,9 @@ linux26-config: host-sed $(LINUX26_DIR)/.configured
 linux26-update:
        cp -dpf $(LINUX26_DIR)/.config $(LINUX26_KCONFIG)
 
+linux26-force:
+       touch $(LINUX26_DIR)/.configured
+
 # This has been renamed so we do _NOT_ by default run this on 'make
 # clean'
 linux26clean:
        rm -f $(LINUX26_KERNEL) $(LINUX26_DIR)/.configured


(which i did now) so you can
make linux26-force && make linux26
