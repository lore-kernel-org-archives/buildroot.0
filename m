From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jun 2013 10:49:21 +0200
Subject: [Buildroot] how does buildroot avoid requireing root?
In-Reply-To: <1372466836.28302.157.camel@localhost>
References: <1372466836.28302.157.camel@localhost>
Message-ID: <20130629104921.12fc15ea@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear John Stile,

On Fri, 28 Jun 2013 17:47:16 -0700, John Stile wrote:
> I am confused about how buildroot creates busybox.
> 
> There are notes that one must ensure that busybox setuid root.
> 
> Performing this operation must be performed as root:
>    chown 0.0 /bin/busybox; chmod 4755 /bin/busybox
> 
> Yet when I use buildroot I never become root.
> 
> How does buildroot accomplish this?
> 
> In output/build/busybox-1.18.5 I see applets/install.sh calls:
>   install -m 755 busybox $prefix/bin/busybox || exit 1
> 
> but I don't see how this becomes setuid?
> 
> On my embedded system, I see:
> -rwsr-xr-x    1 root     root        605876 Jun 28  2013 /bin/busybox*

We use a combination of 'fakeroot' and 'makedevs'. From
http://man.he.net/man1/fakeroot:
   
       	fakeroot runs a command in an environment wherein it
       	appears to  have root  privileges  for  file
       	manipulation.  This is useful for allowing users to
       	create archives (tar, ar, .deb etc.) with files in them
       	with root  permissions/ownership. Without  fakeroot one
       	would need to have root privileges to create the
       	constituent files of  the archives  with the correct
       	permissions  and ownership, and then pack them up, or
       	one would have to  construct  the  archives  directly,
       	without using  the archiver.

	fakeroot  works  by  replacing  the file manipulation library
       	functions (chmod(2), stat(2) etc.) by ones that
       	simulate  the effect  the  real library  functions would
       	have had, had the user really been root. These wrapper
       	functions are  in  a shared
       	library  /usr/lib/libfakeroot.so* which is loaded
       	through the LD_PRELOAD mechanism of the dynamic loader.
       	(See ld.so(8))

Basically, we use fakeroot to run the following commands:

	makedevs
	tar cf rootfs.tar output/target

And what makedevs does is that it reads some permission and device
tables to create device files and adjust permissions. Those
device/permission tables are constructed from system/device_table.txt
(and system/device_table_dev.txt for devices) and also from individual
package .mk files that use the <pkg>_PERMISSIONS and <pkg>_DEVICES
mechanism. From package/busybox/busybox.mk:

define BUSYBOX_PERMISSIONS
/bin/busybox                     f 4755 0 0 - - - - -
/usr/share/udhcpc/default.script f 755  0 0 - - - - -
endef

Here you see that we tell Buildroot to make Busybox a setuid binary.

Does that answer your question?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
