From: Al West <al.west@v-nova.com>
Date: Fri, 17 Apr 2015 09:16:56 +0000
Subject: [Buildroot] ldconfig error on second make as non-root user
In-Reply-To: <20150416172251.GB4405@free.fr>
References: <AMSPR03MB051242A6A47EF9A10143A1CCEE40@AMSPR03MB051.eurprd03.prod.outlook.com>
 <20150416172251.GB4405@free.fr>
Message-ID: <AMSPR03MB0518068A68065822D2E1155CEE30@AMSPR03MB051.eurprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

> Al, All,
> 
> [Please wrap your mails to < ~72-char wide lines]
> 

I think I've corrected that. 

[snip]
> > I can make my target from clean but if afterwards I try just make I
> > get an error with ldconfig complaining that the filename is not
> > absolute.  I think I'm probably doing something wrong somewhere.
> > I am using Fedora 20.
> 
> Can you report on the output of:
>     $ ldconfig --version
> 

[al at f20build buildroot]$ ldconfig --version
ldconfig (GNU libc) 2.18
Copyright (C) 2013 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
Written by Andreas Jaeger.

> [--SNIP--]
> > if [ -x
> > "/home/al/test1/buildroot/output/host/usr/bin/x86_64-buildroot-
> linux-gnu-ldconfig" ]; \ then \
> >
> > /home/al/test1/buildroot/output/host/usr/bin/x86_64-buildroot-
> linux-gnu-ldconfig -r /home/al/test1/buildroot/output/target; \ else \
> >         /sbin/ldconfig -r /home/al/test1/buildroot/output/target; \ fi
> > /sbin/ldconfig: need absolute file name for configuration file when
> > using -r
> > make: *** [target-finalize] Error 1
> 
> Can you try this patch, please:
> 
> diff --git a/Makefile b/Makefile
> index 70d6b4a..1f5a3c9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -583,9 +583,9 @@ endif
>  	mkdir -p $(TARGET_DIR)/var/cache/ldconfig
>  	if [ -x "$(TARGET_CROSS)ldconfig" ]; \
>  	then \
> -		$(TARGET_CROSS)ldconfig -r $(TARGET_DIR); \
> +		$(TARGET_CROSS)ldconfig -r $(TARGET_DIR) -f
> +$(TARGET_DIR)/etc/ld.so.conf; \
>  	else \
> -		/sbin/ldconfig -r $(TARGET_DIR); \
> + 		/sbin/ldconfig -r $(TARGET_DIR) -f
> $(TARGET_DIR)/etc/ld.so.conf; \
>  	fi
>  	( \
>  		echo "NAME=Buildroot"; \
> 

Patch applied and subsequent make is successful :-)  

Thanks,
Al
