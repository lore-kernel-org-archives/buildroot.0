From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 21:57:30 +0200
Subject: [Buildroot] [PATCH 06/20] system: move setting getty to the
 corresponding init systems
In-Reply-To: <f248e93e-1454-009c-29c5-000c04ef2221@mind.be>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <f00f1e7daced126edc573f652b97e9228b347615.1500398733.git.yann.morin.1998@free.fr>
 <f248e93e-1454-009c-29c5-000c04ef2221@mind.be>
Message-ID: <20170722215730.782162ca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Jul 2017 15:11:57 +0200, Arnout Vandecappelle wrote:
> [snip]
> > +define BUSYBOX_SET_GETTY
> > +	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(SYSTEM_GETTY_PORT)::respawn:/sbin/getty -L $(SYSTEM_GETTY_OPTIONS) $(SYSTEM_GETTY_PORT) $(SYSTEM_GETTY_BAUDRATE) $(SYSTEM_GETTY_TERM) #~' \
> > +		$(TARGET_DIR)/etc/inittab
> > +endef  
> [snip]
> > +define SYSVINIT_SET_GETTY
> > +	$(SED) '/# GENERIC_SERIAL$$/s~^.*#~$(shell echo $(SYSTEM_GETTY_PORT) | tail -c+4)::respawn:/sbin/getty -L $(SYSTEM_GETTY_OPTIONS) $(SYSTEM_GETTY_PORT) $(SYSTEM_GETTY_BAUDRATE) $(SYSTEM_GETTY_TERM) #~' \
> > +		$(TARGET_DIR)/etc/inittab
> > +endef  
> 
>  The only difference between these two is that for sysvinit we have to make sure
> it's only 4 characters. But it actually doesn't hurt to do the same for busybox
> as well. So perhaps we can factor the two in a single SYSTEM_SET_GETTY ?

I am not sure if that works, because the semantic of the first field is
not the same between sysvinit and Busybox init.

For sysvinit (http://www.manpages.info/linux/inittab.5.html)

       id     is a unique sequence of 1-4 characters which identifies an entry
	      in inittab (for versions of sysvinit compiled with  libraries  <
	      5.2.18 or a.out libraries the limit is 2 characters).

	      Note:  For  gettys or other login processes, the id field should
	      be the tty suffix of the corresponding tty,  e.g.	 1  for	 tty1.
	      Otherwise, the login accounting might not work correctly.

For Busybox init:

# <id>: WARNING: This field has a non-traditional meaning for BusyBox init!
#
#       The id field is used by BusyBox init to specify the controlling tty for
#       the specified process to run on.  The contents of this field are
#       appended to "/dev/" and used as-is.  There is no need for this field to
#       be unique, although if it isn't you may have strange results.  If this
#       field is left blank, then the init's stdin/out will be used.

Hence, with Busybox init, if you pass a truncated "id", the command
might fail to run as it will try to open a /dev/<something> that
doesn't exist. So, if you truncate ttyAMA0, it will be just ttyA,
Busybox will try to open /dev/ttyA and it will fail.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
