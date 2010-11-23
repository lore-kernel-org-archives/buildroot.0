From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Nov 2010 23:39:52 +0100
Subject: [Buildroot] Makefile for user applications
In-Reply-To: <0C11C5BF0B29FD43A8D0250F711D497F7F6CC9DB5A@ex01-ubitronix.ubitronix.local>
References: <0C11C5BF0B29FD43A8D0250F711D497F7F6CC9DB5A@ex01-ubitronix.ubitronix.local>
Message-ID: <20101123233952.13e6f2a6@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Nov 2010 12:18:39 +0100
Abhishek Ashtekar <Abhishek.Ashtekar@ubitronix.com> wrote:

>  Actually I just want the makefile to copy the binary from the package to /targert/usr/bin
> 
>  However it goes to download myapp 1.0 Downloading ....... To a sourceforge.net  link and stops.

Yes, both the GENTARGETS and AUTOTARGETS infrastructure always download
the package source code if it's not already in the cache.

If you want a package that just copies a single tarball, you have to
make a manual Makefile.

Something like:

===================================================================
$(TARGET_DIR)/usr/bin/myapp: /somewhere/myapp
	install -m 755 $^ $@

myapp: $(TARGET_DIR)/usr/bin/myapp

ifeq ($(BR2_PACKAGE_MYAPP),y)
TARGETS+=myapp
endif
===================================================================

We might extend the package infrastructure in the future to support
this kind of thing.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
