From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 15 Sep 2017 14:10:01 -0300 (BRT)
Subject: [Buildroot] [RFC v2] libvirt: new package
In-Reply-To: <20170915020906.7ea90b5e@windsurf>
References: <1505421391-11951-1-git-send-email-casantos@datacom.ind.br>
 <20170915020906.7ea90b5e@windsurf>
Message-ID: <792565591.9585757.1505495401334.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org
> Sent: Thursday, September 14, 2017 9:09:06 PM
> Subject: Re: [Buildroot] [RFC v2] libvirt: new package

> Hello,
> 
> On Thu, 14 Sep 2017 17:36:31 -0300, Carlos Santos wrote:
> 
>> +LIBVIRT_VERSION = 3.7.0
>> +LIBVIRT_SITE = http://libvirt.org/sources
>> +LIBVIRT_SOURCE = libvirt-$(LIBVIRT_VERSION).tar.xz
>> +LIBVIRT_LICENSE = LGPL-2.1+
>> +LIBVIRT_LICENSE_FILES = COPYING
>> +# LIBVIRT_INSTALL_STAGING = YES
> 
> Commented line ?

A leftover from previous editions.

>> +LIBVIRT_DEPENDENCIES = libnl libtirpc libxml2 lvm2 yajl
>> +
>> +ifeq ($(BR2_PACKAGE_EUDEV),y)
>> +LIBVIRT_DEPENDENCIES += eudev libpciaccess
>> +endif
> 
> Why do you handle eudev specifically here? Isn't the udev
> implementation in systemd not suitable?

Probably yes, but I didn't test with systemd, yet.

> I.e, I believe this should be:
> 
> ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> LIBVIRT_DEPENDENCIES += udev libpciaccess
> endif
> 
> And of course, adjust Config.in accordingly.

Done.

>> +LIBVIRT_CONF_ENV += \
>> +	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`" \
>> +	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"
> 
> Why is libtirpc unconditionally necessary? The RPC implementation built
> into the C library is not sufficient ?

Fixed. I was using a uClibc-based toolchain without built-in RPC.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
