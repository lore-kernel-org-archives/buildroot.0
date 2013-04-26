From: thomas <thomas.spitz@gmail.com>
Date: Fri, 26 Apr 2013 00:12:25 -0700 (PDT)
Subject: [Buildroot] Dropbear/SFTP
In-Reply-To: <87obd28e73.fsf@dell.be.48ers.dk>
References: <002401cded96$e8b13fa0$ba13bee0$@co.uk>
 <20130108130618.4991dff7@skate> <1366918894609-44233.post@n4.nabble.com>
 <87ip3a9yzi.fsf@dell.be.48ers.dk> <1366919482310-44235.post@n4.nabble.com>
 <871u9y9vqd.fsf@dell.be.48ers.dk>
 <CA+QJksJKDeogdcxtJz8PNwmv-nDQuMpdoLHG55Kq54shV5wWFw@mail.gmail.com>
 <87obd28e73.fsf@dell.be.48ers.dk>
Message-ID: <1366960345226-44260.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

I didn't use the patch but I directly modified
/home/thomas/Armadeus/armadeus-5.2/buildroot/package/openssh/openssh.mk as
follows : 

/#############################################################
#
# openssh
#
#############################################################

OPENSSH_VERSION = 5.9p1
OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
OPENSSH_CONF_OPT = --disable-lastlog --disable-utmp \
		--disable-utmpx --disable-wtmp --disable-wtmpx --disable-strip

OPENSSH_DEPENDENCIES = zlib openssl

define OPENSSH_INSTALL_INITSCRIPT
	$(INSTALL) -D -m 755 package/openssh/S50sshd
$(TARGET_DIR)/etc/init.d/S50sshd
endef

OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_INITSCRIPT

$(eval $(call AUTOTARGETS))/

I also resinstalled openssh to be sure It take account of the modified file.
Nothing changes. sftp-server is still installed in /usr/lib whereas sftp
root at 192.168.1.5 is looking for sftp service on the target in /usr/libexec

Here below a ls from my Armadeus target :
# ls /usr
bin    lib    sbin   share
# ls /usr/lib
libas_devices.so     libncurses.so        libts-1.0.so.0.0.0
libcrypto.so         libncurses.so.5      libts.so
libcrypto.so.1.0.0   libncurses.so.5.7    libz.so
libform.so           libpanel.so          libz.so.1
libform.so.5         libpanel.so.5        libz.so.1.2.5
libform.so.5.7       libpanel.so.5.7      sftp-server
liblzo2.so           libssl.so            ssh-keysign
liblzo2.so.2         libssl.so.1.0.0      ssh-pkcs11-helper
liblzo2.so.2.0.0     libstdc++.so         tc
libmenu.so           libstdc++.so.6       terminfo
libmenu.so.5         libstdc++.so.6.0.13  ts
libmenu.so.5.7       libts-1.0.so.0
# 

Best regards,
Thomas





--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Dropbear-SFTP-tp38207p44260.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
