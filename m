From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Jan 2010 08:59:11 +0100
Subject: [Buildroot] Customize package makefile seems broken
In-Reply-To: <hi5jb1$cra$1@ger.gmane.org>
References: <hi5jb1$cra$1@ger.gmane.org>
Message-ID: <20100108085911.28fd62bb@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 7 Jan 2010 21:22:42 +0000 (UTC),
Grant Edwards <grant.b.edwards@gmail.com> a ?crit :

> I haven't figured out why two of the 6 files aren't getting copied,
> but the mislocation appears to be due to a bug in customize.mk:

Because *.a files are removed from $(TARGET_DIR) as a final cleanup.

See target-finalize: in the main Makefile:

target-finalize:
ifeq ($(BR2_HAVE_DEVFILES),y)
        ( scripts/copy.sh $(STAGING_DIR) $(TARGET_DIR) )
else
        rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/lib/pkgconfig
        find $(TARGET_DIR)/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
        find $(TARGET_DIR)/usr/lib \( -name '*.a' -o -name '*.la' \) -print0 | xargs -0 rm -f
endif

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
