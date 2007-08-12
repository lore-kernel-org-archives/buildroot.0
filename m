From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sun, 12 Aug 2007 11:30:21 +0200 (CEST)
Subject: [Buildroot] [RFC] configure options & install targets
Message-ID: <0708121107001.12015@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Noticed a few questionable things the wrapper makefiles do (in this
example package/bison/bison.mk) and wonder:

,----
| --- package/bison/bison.mk	(revision 19307)
| +++ package/bison/bison.mk	(working copy)
|

The canonical place for man, info and doc is under /usr/share, isn't it?

|  		--sysconfdir=/etc \
|  		--datadir=/usr/share \
|  		--localstatedir=/var \
| -		--mandir=/usr/man \
| -		--infodir=/usr/info \
| +		--mandir=/usr/share/man \
| +		--infodir=/usr/share/info \

Stuff is removed using a machete instead of knife :(
See example below.  Is that the intended behavior?

|  $(TARGET_DIR)/$(BISON_TARGET_BINARY): $(BISON_DIR)/$(BISON_BINARY)
|  	$(MAKE) DESTDIR=$(TARGET_DIR) CC=$(TARGET_CC) -C $(BISON_DIR) install
| -	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
| -		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
| +	rm -f $(TARGET_DIR)/share/locale/*/LC_MESSAGES/bison*
| +	rm -f $(TARGET_DIR)/usr/info/bison*
| +	rm -f $(TARGET_DIR)/usr/share/man/man?/bison*
| +	rm -rf $(TARGET_DIR)/usr/share/bison*
| +	rm -rf $(TARGET_DIR)/usr/share/doc/bison*
`----


Cheers,

-- 
Cristian
-------------- next part --------------
A non-text attachment was scrubbed...
Name: bison.mk.patch
Type: text/x-diff
Size: 1576 bytes
Desc: 
Url : http://busybox.net/lists/buildroot/attachments/20070812/4cbcd867/attachment.bin 
