From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jul 2015 16:26:31 +0200
Subject: [Buildroot] [PATCH v9 04/15] busybox: applets as individual
 binaries
In-Reply-To: <20150718144637.22cee806@free-electrons.com>
References: <1436905227-26937-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1436905227-26937-5-git-send-email-clayton.shotwell@rockwellcollins.com>
 <20150718144637.22cee806@free-electrons.com>
Message-ID: <20150718142631.GB3504@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Clayton, Thomas, All,

On 2015-07-18 14:46 +0200, Thomas Petazzoni spake thusly:
> On Tue, 14 Jul 2015 15:20:16 -0500, Clayton Shotwell wrote:
[--SNIP--]
> > diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> > index 6b2abca..4942e75 100644
> > --- a/package/busybox/busybox.mk
> > +++ b/package/busybox/busybox.mk
> > @@ -50,9 +50,37 @@ BUSYBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG_FRAG
> >  BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
> >  BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
> >  
> > +ifeq ($(BR2_PACKAGE_BUSYBOX_INDIVIDUAL_BINARIES),y)
> > +define BUSYBOX_PERMISSIONS
> > +	/usr/share/udhcpc/default.script f 755  0  0 - - - - -
> > +endef
> > +
> > +# Set permissions on all applets with BB_SUID_REQUIRE and BB_SUID_MAYBE. The
> > +# permissions are pulled from the applets.h file that is generated during
> > +# the build and used to determine all of the possible applets. The permissions
> > +# file is generated and added to the list of device tables used by makedevs to
> > +# set file permissions.
> > +define BUSYBOX_MAKEDEV_PERMISSIONS
> > +	if [ -f $(@D)/.buildroot_permissions ]; then \
> > +		rm $(@D)/.buildroot_permissions; \
> > +	fi; \
> > +	touch $(@D)/.buildroot_permissions; \
> > +	for app in `grep -r -e "APPLET.*BB_SUID_REQUIRE\|APPLET.*BB_SUID_MAYBE" $(@D)/include/applets.h \
> > +			| sed -e 's/,.*//' -e 's/.*(//'`; \
> > +	do \
> > +		temp=`grep -w $${app} $(@D)/busybox.links`; \
> > +		if [ -n "$${temp}" ]; then \
> > +			echo "$${temp} f 4755 0  0 - - - - -" >> $(@D)/.buildroot_permissions; \
> > +		fi; \
> > +	done
> > +endef
> > +BUSYBOX_POST_INSTALL_TARGET_HOOKS += BUSYBOX_MAKEDEV_PERMISSIONS
> > +BR2_ROOTFS_DEVICE_TABLE += $(BUSYBOX_DIR)/.buildroot_permissions
> > +else
> 
> I'm sorry but I don't like this. I don't think any Buildroot package
> *modifies* a BR2_<something> option, that's really a hack. I think the
> only reasonable solution is to have a real permission table, containing
> the list of all applets that may need SUID root. However, I don't
> remember if we error out when a file mentioned in a permission table
> does not exist. I've added Yann in Cc to discuss that further. Maybe we
> need a special syntax in the permission table to say "change the
> permission of this file if it exists, otherwise ignore".

Well, I had a cursory look at makedev.c, and it seems a missing file is
treated as an error:

  482         } else if (type == 'f') {
  483             struct stat st;
  484             if ((stat(full_name, &st) < 0 || !S_ISREG(st.st_mode))) {
  485                 bb_perror_msg("line %d: regular file '%s' does not exist", linenum, full_name);
  486                 ret = EXIT_FAILURE;
  487                 goto loop;
  488             }

So, either we filter-out missing applets (Hurck!) or we add a mode to
makedev to ignore missing files, something along the lines of:

    diff --git a/package/makedevs/makedevs.c b/package/makedevs/makedevs.c
    index 53ff6fe..8a66fa3 100644
    --- a/package/makedevs/makedevs.c
    +++ b/package/makedevs/makedevs.c
    @@ -479,9 +479,11 @@ int main(int argc, char **argv)
     				ret = EXIT_FAILURE;
     				goto loop;
     			}
    -		} else if (type == 'f') {		
    +		} else if (type == 'f' || type == 'F') {
     			struct stat st;
     			if ((stat(full_name, &st) < 0 || !S_ISREG(st.st_mode))) {
    +				if (type == 'F')
    +					continue; /* Ignore optional files */
     				bb_perror_msg("line %d: regular file '%s' does not exist", linenum, full_name);
     				ret = EXIT_FAILURE;
     				goto loop;

(Of course 'F' is just a place-holder, we might need a better type...)

Totally untested; needs update in the documentation as well. Might be
worth sending to Busybox too (like for the recursive option) sicne
Busybox is our upstream for that makedev.c file (but was a long time
ago, might no longer apply cleanly...)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
