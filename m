From: Floris Bos <bos@je-eigen-domein.nl>
Date: Fri, 26 Dec 2014 18:37:15 +0100
Subject: [Buildroot] [PATCH 2/2] libvncserver: add config option for
	tightpng encoding support
In-Reply-To: <20141226180839.53e2df6f@free-electrons.com>
References: <1419554775-11560-1-git-send-email-bos@je-eigen-domein.nl>
 <1419554775-11560-2-git-send-email-bos@je-eigen-domein.nl>
 <20141226180839.53e2df6f@free-electrons.com>
Message-ID: <b66fd2b4894b872b928f81fdf13998ec@to-the-max.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26.12.2014 18:08, Thomas Petazzoni wrote:
> On Fri, 26 Dec 2014 01:46:15 +0100, Floris Bos wrote:
> 
>> +if BR2_PACKAGE_LIBVNCSERVER
>> +
>> +config BR2_PACKAGE_LIBVNCSERVER_TIGHTPNG
>> +	bool "TightPNG encoding support"
>> +	select BR2_PACKAGE_JPEG
>> +	select BR2_PACKAGE_LIBPNG
>> +	help
>> +	  TightPNG encoding speeds up HTML5 based VNC clients like noVNC.
>> +
>> +	  http://wiki.qemu.org/VNC_Tight_PNG
> 
> I've tried to read a bit, but I don't really understand whether JPEG is
> absolutely necessary to get TightPNG support. The webpage you mention
> says "If the client indicates JPEG support by sending a JPEG
> quality pseudo-encoding, then the server can send JPEG, because PNG
> will only replace the basic compression type used in normal tight.",
> which seems to indicate that the JPEG support is only optional.

JPEG and PNG are both necesarry.

Libvncserver will only compile tight.c if HAVE_LIBJPEG

https://github.com/LibVNC/libvncserver/blob/master/libvncserver/Makefile.am#L49

And inside tight.c png is optional, jpeg is not.

> 
>> +endif
>> diff --git a/package/libvncserver/libvncserver.mk 
>> b/package/libvncserver/libvncserver.mk
>> index b26d5b9..8479a62 100644
>> --- a/package/libvncserver/libvncserver.mk
>> +++ b/package/libvncserver/libvncserver.mk
>> @@ -56,4 +56,10 @@ else
>>  LIBVNCSERVER_CONF_OPTS += --without-zlib
>>  endif
>> 
>> +ifeq ($(BR2_PACKAGE_LIBVNCSERVER_TIGHTPNG),y)
>> +LIBVNCSERVER_DEPENDENCIES += libpng
> 
> So we don't really need JPEG support after all, since you don't depend
> on it?

JPEG is added by the existing code:

==
ifeq ($(BR2_PACKAGE_JPEG),y)
LIBVNCSERVER_DEPENDENCIES += jpeg
else
LIBVNCSERVER_CONF_OPTS += --without-jpeg
endif
==

Wasn't sure whether to touch that, was afraid that would change behavior 
for existing users.


Your sincerely,

Floris Bos
