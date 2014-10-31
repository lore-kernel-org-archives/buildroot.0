From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Fri, 31 Oct 2014 17:06:08 +0100
Subject: [Buildroot] [PATCH v2 1/3] skeleton: add support for
	/etc/ld.so.conf.d/*.conf files
In-Reply-To: <20141031164156.6a386482@free-electrons.com>
References: <1414768749-15134-1-git-send-email-jezz@sysmic.org>
 <20141031164156.6a386482@free-electrons.com>
Message-ID: <1731151.ja2FFkUW1C@aquila>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 31 October 2014 16:41:56 Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
> 
> On Fri, 31 Oct 2014 16:19:07 +0100, J?r?me Pouiller wrote:
> > +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> > +define GENERATE_LD_SO_CONF_FILE
> > +	ls $(TARGET_DIR)/etc/ld.so.conf.d/*.conf > /dev/null 2>&1 && \
> > +	    echo "Usage of /etc/ld.so.conf.d/*.conf files with musl libc is not
> > supported"
> We should error out here.
User may fix problem by providing correct file in an overlay. However, I 
haven't a strong opinion about that.


> Does musl supports /etc/ld.so.conf ? 
I have checked in sources and it seems it doesn't :( .  It use a file called 
/etc/ld-musl-${ARCH}.path (with ARCH={arm,x86,...}). Syntax of this file is 
same than $LD_LIBRARY_PATH (paths separated with ':').

> If so, then I believe we should
> simply not use the /etc/ld.so.conf.d/ feature of glibc, and instead
> keep using /etc/ld.so.conf only, like MySQL was doing.
> 
> If you don't want to see repeated entries, you can do something like:
> 
> 	grep -q "^/usr/lib/mysql$" $(TARGET_DIR)/etc/ld.so.conf ||
> 		echo "/usr/lib/mysql" >> $(TARGET_DIR)/etc/ld.so.conf
> 
> We could even imagine having a make function to do that.
The two options have their drawbacks. I have no strong opinion.


-- 
J?r?me Pouiller, Sysmic
