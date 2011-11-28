From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Mon, 28 Nov 2011 09:07:54 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <CAAXf6LVDR+9KnTJP36-hugA51QTikDsQ2ESO4c3C9-L8UJgqBA@mail.gmail.com>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98><20111122230429.2bef52c2@skate><005d01cca963$b9a61eb0$0400a8c0@dspcgrnzks9p98><20111122232914.76a86e7d@skate><006101cca967$050bb240$0400a8c0@dspcgrnzks9p98><CAAXf6LVFSZpPxtsu9DmiEtw9LjNtdEWGQ+zdBQhscRAZ67vu_Q@mail.gmail.com><001001ccaa28$4b7515c0$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LVDR+9KnTJP36-hugA51QTikDsQ2ESO4c3C9-L8UJgqBA@mail.gmail.com>
Message-ID: <001e01ccaddf$81c0f300$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> You can use
> 
> LIBFOO_SITE = file:///home/libfoo.tar.bz2
> 
> (note the three slashes; two from the scheme, the third one for an
> absolute path)

One issue now is that 'make' in Buildroot doesn't seem to find this file and
put it in the download directory.  Here is EtherCAT.mk:

#############################################################
#
# EtherCAT
#
#############################################################
ETHERCAT_VERSION = 1.0
ETHERCAT_SOURCE = etherlabmaster.tar.bz2
ETHERCAT_SITE = file:///home/user1/Desktop/EtherCAT4Atmel
ETHERCAT_INSTALL_STAGING = YES
ETHERCAT_INSTALL_TARGET = YES
ETHERCAT_CONF_OPT = --enable-generic
#####LIBFOO_DEPENDENCIES = libglib2 host-pkg-config

$(eval $(call AUTOTARGETS,package,ethercat))



So you can see that the file is at /home/user1/Desktop/EtherCAT4Atmel/
etherlabmaster.tar.bz2

Now this is the message from 'make' in Buildroot:

user1 at linux-0mmn:~/buildroot-2011.05> make
>>> ethercat 1.0 Extracting
bzcat: Can't open input file
/home/user1/buildroot-2011.05/dl/etherlabmaster.tar.bz2: No such file or
directory.
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors
make: ***
[/home/user1/buildroot-2011.05/output/build/ethercat-1.0/.stamp_extracted]
Error 2
user1 at linux-0mmn:~/buildroot-2011.05>


So it looks like it never copies /home/user1/Desktop/EtherCAT4Atmel/
etherlabmaster.tar.bz2 over to the buildroot-2011.05/dl/ directory.  When I
manually inspect buildroot-2011.05/dl/ I do not see the file there.

Why isn't it getting copied over to dl/ ?


Thanks.
