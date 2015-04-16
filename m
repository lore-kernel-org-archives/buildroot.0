From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Apr 2015 19:22:51 +0200
Subject: [Buildroot] ldconfig error on second make as non-root user
In-Reply-To: <AMSPR03MB051242A6A47EF9A10143A1CCEE40@AMSPR03MB051.eurprd03.prod.outlook.com>
References: <AMSPR03MB051242A6A47EF9A10143A1CCEE40@AMSPR03MB051.eurprd03.prod.outlook.com>
Message-ID: <20150416172251.GB4405@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Al, All,

[Please wrap your mails to < ~72-char wide lines]

On 2015-04-16 16:23 +0000, Al West spake thusly:
> I am having an issue with buildroot when running as a regular user.
> Before I was running as root, but the buildroot documentation
> recommends against this.

Yes, runing as root is dangerou. For example, Buildroot as part of the
build process, runs 'rm' at some points, and even though we are trying
to be safe, bugs happen. Also, packages might do dirty things (e.g.
install in /usr/lib instead of $(DEST_DIR)/usr/lib ) and that would
break your system.

So no, running as root is really, definitiely not good at all.

> I can make my target from clean but if afterwards I try just make I
> get an error with ldconfig complaining that the filename is not
> absolute.  I think I'm probably doing something wrong somewhere.
> I am using Fedora 20.

Can you report on the output of:
    $ ldconfig --version

[--SNIP--]
> if [ -x "/home/al/test1/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-ldconfig" ]; \
> then \
>         /home/al/test1/buildroot/output/host/usr/bin/x86_64-buildroot-linux-gnu-ldconfig -r /home/al/test1/buildroot/output/target; \
> else \
>         /sbin/ldconfig -r /home/al/test1/buildroot/output/target; \
> fi
> /sbin/ldconfig: need absolute file name for configuration file when using -r
> make: *** [target-finalize] Error 1

Can you try this patch, please:

diff --git a/Makefile b/Makefile
index 70d6b4a..1f5a3c9 100644
--- a/Makefile
+++ b/Makefile
@@ -583,9 +583,9 @@ endif
 	mkdir -p $(TARGET_DIR)/var/cache/ldconfig
 	if [ -x "$(TARGET_CROSS)ldconfig" ]; \
 	then \
-		$(TARGET_CROSS)ldconfig -r $(TARGET_DIR); \
+		$(TARGET_CROSS)ldconfig -r $(TARGET_DIR) -f $(TARGET_DIR)/etc/ld.so.conf; \
 	else \
-		/sbin/ldconfig -r $(TARGET_DIR); \
+ 		/sbin/ldconfig -r $(TARGET_DIR) -f $(TARGET_DIR)/etc/ld.so.conf; \
 	fi
 	( \
 		echo "NAME=Buildroot"; \

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
