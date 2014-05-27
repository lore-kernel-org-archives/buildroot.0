From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 May 2014 11:12:30 +0200
Subject: [Buildroot] [PATCH] dropbear: fix missing directory with systemd
In-Reply-To: <1400861026-5987-1-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Fri, 23 May 2014 18:03:46 +0200")
References: <1400861026-5987-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87r43fegap.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > With the current systemd unit files, the folder '/etc/dropbear' is not
 > created, which caused dropbear to fail to create its keys and then
 > accept connections.

 > This add a new file which is used by systemd to create the correct
 > directory structure.

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > ---
 >  package/dropbear/dropbear.mk            | 3 +++
 >  package/dropbear/dropbear_tmpfiles.conf | 1 +
 >  2 files changed, 4 insertions(+)
 >  create mode 100644 package/dropbear/dropbear_tmpfiles.conf

 > diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
 > index 2ac6211..f176f7c 100644
 > --- a/package/dropbear/dropbear.mk
 > +++ b/package/dropbear/dropbear.mk
 > @@ -49,6 +49,9 @@ define DROPBEAR_INSTALL_INIT_SYSTEMD
 >  	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 >  	ln -fs ../dropbear.service \
 >  		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/dropbear.service
 > +	mkdir -p $(TARGET_DIR)/usr/lib/tmpfiles.d
 > +	$(INSTALL) -D -m 644 package/dropbear/dropbear_tmpfiles.conf \
 > +		$(TARGET_DIR)/usr/lib/tmpfiles.d/dropbear.conf

Why the tmpfiles dance and not just a mkdir -p
$(TARGET_DIR)/etc/dropbear? It is not really specific to systemd, so we
could just do it in _INSTALL_TARGET_CMDS (and remove the mkdir in
S50dropbear).

-- 
Bye, Peter Korsgaard
