From: Desroches, Ludovic <Ludovic.Desroches@atmel.com>
Date: Tue, 8 Mar 2011 12:40:19 +0100
Subject: [Buildroot] alsa-utils and nctp troubles with 2011.02
References: <F41B82AC38A41A41868925971DCBED9E06EEB9E9@rfomb01.corp.atmel.com>
	<20110308111936.0802c04e@surf>
Message-ID: <F41B82AC38A41A41868925971DCBED9E06EEB9EE@rfomb01.corp.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----Original Message-----
From: buildroot-bounces@busybox.net on behalf of Thomas Petazzoni
Sent: Tue 3/8/2011 11:19 AM
To: buildroot at busybox.net
Subject: Re: [Buildroot] alsa-utils and nctp troubles with 2011.02
 
Hello Ludovic,

On Tue, 8 Mar 2011 10:23:47 +0100
"Desroches, Ludovic" <Ludovic.Desroches@atmel.com> wrote:

> >>> alsa-utils 1.0.23 Installing to target
> for i in usr/sbin/alsactl usr/bin/alsamixer usr/bin/amixer usr/bin/aplay usr/bin/speaker-test; do install -D -m 755 /home/ldesroches/buildroot_old/buildroot-2011.02/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/$i /home/ldesroches/buildroot_old/buildroot-2011.02/output/target/$i; done
> if [ -x "/home/ldesroches/buildroot_old/buildroot-2011.02/output/target/usr/bin/speaker-test" ]; then mkdir -p /home/ldesroches/buildroot_old/buildroot-2011.02/output/target/usr/share/alsa/speaker-test; mkdir -p /home/ldesroches/buildroot_old/buildroot-2011.02/output/target/usr/share/sounds/alsa; cp -rdpf /home/ldesroches/buildroot_old/buildroot-2011.02/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/share/alsa/speaker-test/* /home/ldesroches/buildroot_old/buildroot-2011.02/output/target/usr/share/alsa/speaker-test/; cp -rdpf /home/ldesroches/buildroot_old/buildroot-2011.02/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/share/sounds/alsa/* /home/ldesroches/buildroot_old/buildroot-2011.02/output/target/usr/share/sounds/alsa/; fi
> if [ -x "/home/ldesroches/buildroot_old/buildroot-2011.02/output/target/usr/sbin/alsactl" ]; then mkdir -p /home/ldesroches/buildroot_old/buildroot-2011.02/output/target/usr/share/; rm -rf /home/ldesroches/buildroot_old/buildroot-2011.02/output/target/usr/share/alsa/; cp -rdpf /home/ldesroches/buildroot_old/buildroot-2011.02/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/share/alsa/ /home/ldesroches/buildroot_old/buildroot-2011.02/output/target/usr/share/alsa/; fi
> cp: target `/home/ldesroches/buildroot_old/buildroot-2011.02/output/target/usr/share/alsa/' is not a directory: No such file or directory
> make: *** [/home/ldesroches/buildroot_old/buildroot-2011.02/output/build/alsa-utils-1.0.23/.stamp_target_installed] Error 1
> 
> I think it can be simply corrected with :
> 
> --- package/multimedia/alsa-utils/alsa-utils.mk.orig	2011-03-08 11:21:21.000000000 +0100
> +++ package/multimedia/alsa-utils/alsa-utils.mk	2011-03-07 17:35:05.000000000 +0100
> @@ -49,7 +49,8 @@
>  	if [ -x "$(TARGET_DIR)/usr/sbin/alsactl" ]; then \
>  		mkdir -p $(TARGET_DIR)/usr/share/; \
>  		rm -rf $(TARGET_DIR)/usr/share/alsa/; \
> -		cp -rdpf $(STAGING_DIR)/usr/share/alsa/ $(TARGET_DIR)/usr/share/alsa/; \
> +		mkdir -p $(TARGET_DIR)/usr/share/alsa; \
> +		cp -rdpf $(STAGING_DIR)/usr/share/alsa/* $(TARGET_DIR)/usr/share/alsa/; \
>  	fi
>  endef

Hum, strange, it should work as is :

	rm -rf $(TARGET_DIR)/usr/share/alsa/; \

remove the $(TARGET_DIR)/usr/share/alsa directory. And:

	cp -rdpf $(STAGING_DIR)/usr/share/alsa/	$(TARGET_DIR)/usr/share/alsa/; \

copies the $(STAGING_DIR)/usr/share/alsa/ *as* the
$(TARGET_DIR)/usr/share/alsa/ directory.

I just did a test build here and it works fine. And a simple test also
works:

test at buildserver:~/outputs/python$ rm -rf target/usr/share/alsa/
test at buildserver:~/outputs/python$ cp -rdpf host/usr/arm-unknown-linux-gnueabi/sysroot/usr/share/alsa/ target/usr/share/alsa
test at buildserver:~/outputs/python$ 

> - the second one is about ncftp extraction part :
> 
> >>> ncftp 3.2.4 Extracting
> tar: win/bmed/bookmark.c: Cannot hard link to `ncftp-3.2.4/ncftp/bookmark.c': No such file or directory
> tar: Error exit delayed from previous errors
> make: *** [/home/ldesroches/buildroot_old/buildroot-2011.02/output/build/ncftp-3.2.4/.stamp_extracted] Error 2
> 
> Manually, I have no problem to extract this archive. The problem seems to be a path problem since I have ncftp-3.2.4/win/bmed/bookmark.c and ncftp-3.2.4/ncftp/bookmark.c. Do you know how I can correct this problem ?

Well, extracting ncftp just works fine here:

ESC[3m>>> ncftp 3.2.4 DownloadingESC[23m
--2011-03-08 10:17:04--  ftp://ftp.ncftp.com/ncftp/ncftp-3.2.4-src.tar.bz2
           => `/home/test/dl/ncftp-3.2.4-src.tar.bz2'
Resolving ftp.ncftp.com... 209.197.102.38
Connecting to ftp.ncftp.com|209.197.102.38|:21... connected.
Logging in as anonymous ... Logged in!
==> SYST ... done.    ==> PWD ... done.
==> TYPE I ... done.  ==> CWD /ncftp ... done.
==> SIZE ncftp-3.2.4-src.tar.bz2 ... done.
==> PASV ... done.    ==> RETR ncftp-3.2.4-src.tar.bz2 ... 
No such file `ncftp-3.2.4-src.tar.bz2'.

--2011-03-08 10:17:07--  http://sources.buildroot.net//ncftp-3.2.4-src.tar.bz2
Resolving sources.buildroot.net... 88.198.64.109
Connecting to sources.buildroot.net|88.198.64.109|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 450894 (440K) [application/x-bzip2]
Saving to: `/home/test/dl/ncftp-3.2.4-src.tar.bz2'

     0K .......... .......... .......... .......... .......... 11% 9.70M 0s
    50K .......... .......... .......... .......... .......... 22% 9.50M 0s
   100K .......... .......... .......... .......... .......... 34% 9.70M 0s
   150K .......... .......... .......... .......... .......... 45% 9.81M 0s
   200K .......... .......... .......... .......... .......... 56% 9.69M 0s
   250K .......... .......... .......... .......... .......... 68% 9.39M 0s
   300K .......... .......... .......... .......... .......... 79% 9.74M 0s
   350K .......... .......... .......... .......... .......... 90% 9.58M 0s
   400K .......... .......... .......... ..........           100% 9.97M=0.04s

2011-03-08 10:17:07 (9.67 MB/s) - `/home/test/dl/ncftp-3.2.4-src.tar.bz2' saved [450894/450894]

>>> ncftp 3.2.4 Extracting
>>> ncftp 3.2.4 Patching package/ncftp
for file in config.guess config.sub; do for i in $(find /home/test/outputs/python/build/ncftp-3.2.4 -name $file); do cp package/gnuconfig/$file $i; done; done
>>> ncftp 3.2.4 Patching libtool
>>> ncftp 3.2.4 Configuring

Which version of tar do you have on your host machine ? What is your
host distribution ?

Regards,

Thomas


Sorry for the probably bad reply format, I have troubles with my usual mail client.

Thank you for these answers, the problem was coming from too old cp (5.97)and tar (1.16) commands. My host distribution is a Debian 4.0. I have replaced them with more recent version and everything works fine.


Regards,

Ludovic Desroches

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110308/9a4fa073/attachment-0001.html>
