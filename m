From: Darcy Watkins <DWatkins@tranzeo.com>
Date: Wed, 13 Feb 2008 11:45:13 -0800
Subject: [Buildroot] pciutils-2.2.6 fails to build for powerpc  405
In-Reply-To: A<mj+md-20080213.180833.12781.albireo@ucw.cz>
References: <D61182AC8012EA4EBC531B3AF23BE1093F1421@tranzeo-mail2.12stewart.tranzeo.com>
	<D61182AC8012EA4EBC531B3AF23BE1095020F0@tranzeo-mail2.12stewart.tranzeo.com>
	A<mj+md-20080213.180833.12781.albireo@ucw.cz>
Message-ID: <D61182AC8012EA4EBC531B3AF23BE109502103@tranzeo-mail2.12stewart.tranzeo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Based on a suggestion from Martin, here is a simpler patch that applies
only to the buildroot project.


--- package/pciutils/pciutils.mk.theorig	2008-02-13
11:15:59.000000000 -0800
+++ package/pciutils/pciutils.mk	2008-02-13 11:17:46.000000000
-0800
@@ -30,6 +30,7 @@ $(PCIUTILS_DIR)/.unpacked: $(DL_DIR)/$(P
 
 $(PCIUTILS_DIR)/.compiled: $(PCIUTILS_DIR)/.unpacked
 	$(MAKE1) CC=$(TARGET_CC) OPT="$(TARGET_CFLAGS)" -C
$(PCIUTILS_DIR) \
+		HOST=$(BR2_ARCH)-`echo $(BR2_GNU_TARGET_SUFFIX) | cut -d
'-' -f 1` \
 		SHAREDIR="/usr/share/misc" \
 		PREFIX=/usr
 	touch $(PCIUTILS_DIR)/.compiled



...and then also delete the existing package/pciutils/pciutils.patch
file since it will no longer be needed.

Regards,

Darcy




-----Original Message-----
From: Martin Mares [mailto:mj at ucw.cz] 
Sent: Wednesday, February 13, 2008 10:15 AM
To: Darcy Watkins
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] pciutils-2.2.6 fails to build for powerpc 405

Hello!

> Included / attached is patch to allow pciutils to cross compile under
> buildroot for non i386 architectures.  I believe that the pciutils
> package will natively compile for non i386 architectures.  It failed
to
> cross compile due to the use of 'uname' on the build machine by the
> configure script to attempt to determine system information that
applies
> to the target machine.

I wonder if it is necessary to perform this magic which will likely
work only with the GNU toolchain.

Wouldn't it be enough to run for example `make HOST=ppc-linux' ?

If it is too cumersome for the buildroot project, I can of course apply
your patch, but on the other hand there is already enough magic in the
configure script, so I obviously tend to avoid adding more :-)

				Have a nice fortnight
-- 
Martin `MJ' Mares                          <mj@ucw.cz>
http://mj.ucw.cz/
Faculty of Math and Physics, Charles University, Prague, Czech Rep.,
Earth
To understand a program you must become both the machine and the
program.
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: diff.txt
Url: http://busybox.net/lists/buildroot/attachments/20080213/d4857253/attachment.txt 
