From: Sushi Sensei <sinestado@gmail.com>
Date: Thu, 20 Sep 2007 15:45:55 -0300
Subject: [Buildroot] squashfs 2.6.20 patch not work in 2.6.22
Message-ID: <a63ecaf0709201145j7897c16an796e02ea506da39c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

to make work squashfs in 2.6.22 use 2.6.20 patch and modifiy
fs/sqashfs/inode.c :

1) add #include <linux/interrupt.h>
2) near to the end comment the refference to SLAB_CTOR_VERIFY and
SLAB_CTOR_CONSTRUCTOR


static void init_once(void * foo, struct kmem_cache * cachep, unsigned long
flags)
{
        struct squashfs_inode_info *ei = foo;

//      if ((flags & (SLAB_CTOR_VERIFY|SLAB_CTOR_CONSTRUCTOR)) ==
//
SLAB_CTOR_CONSTRUCTOR)
                inode_init_once(&ei->vfs_inode);
}


this may work in the future 2.6.23
-- 
------------------------------------------------------
--- Timeo Danaos et dona ferentes ---
------------------------------------------------------
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070920/4e4e4000/attachment.htm 
