From: Nathaniel Roach <nroach44@gmail.com>
Date: Thu, 12 May 2016 10:20:40 +0800
Subject: [Buildroot] [PATCH 1/1] package/quagga: Fix directories and
 permissions
In-Reply-To: <20160511233309.1ea81a24@free-electrons.com>
References: <1462953673-1190-1-git-send-email-nroach44@gmail.com>
 <20160511233309.1ea81a24@free-electrons.com>
Message-ID: <5733E878.4090700@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 12/05/16 05:33, Thomas Petazzoni wrote:
> Hello,
>
> I'm adding in Cc: Baruch, since he has done most of the recent updates
> to the Quagga package. Baruch, could you review/test this patch,
> according to your knowledge of Quagga?
>
> I'm also adding some comments below.
>
>> Quagga runs as the "quagga" user, but it also needs to modify files
>> in /etc and /var - config files, pid files and vty sockets for vtysh.
> Does it really need to write in /etc ? If that's the case, then it
> seems a bit wrong, and we have a bigger problem. What happens if /etc
> is read-only ?
If you're using vtysh to configure Quagga, yes, it absolutely needs 
write permissions to the config folder, as it's more than likely you'd 
want to save your config. (Running commands in vtysh is very similar to 
Cisco routers, there's a "running-config" and a "startup-config" - 
commands are saved into running, but are not copied into startup by default)

The daemons themselves don't write to /etc unless you tell it to:

$sudo vtysh
...
charon# copy run start
Building Configuration...
Configuration saved to /etc/quagga/zebra.conf
Configuration saved to /etc/quagga/ospfd.conf
[OK]

It needs write permissions to the folder as it moves the old config and 
writes a new one, rather than just overwriting.

In the instance that /etc/ is RO, the user simply won't be able to save 
an updated configuration.

>
>
> On Wed, 11 May 2016 16:01:13 +0800, Nathaniel Roach wrote:
>
>> diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
>> index 6b98367..3592aee 100644
>> --- a/package/quagga/quagga.mk
>> +++ b/package/quagga/quagga.mk
>> @@ -10,7 +10,11 @@ QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
>>   QUAGGA_DEPENDENCIES = host-gawk
>>   QUAGGA_LICENSE = GPLv2+
>>   QUAGGA_LICENSE_FILES = COPYING
>> -QUAGGA_CONF_OPTS = --program-transform-name=''
>> +QUAGGA_CONF_OPTS = \
>> +  --program-transform-name='' \
>> +  --sysconfdir=/etc/quagga \
>> +  --localstatedir=/var/run/quagga
> Indentation should be one tab for those lines. But why isn't
> sysconfdir=/etc appropriate? Is it because quagga writes to some files
> in /etc? If that's the case, as said above, I'm believe it's bad.
Ah, editor settings strikes again.
>
>> +define QUAGGA_PERMISSIONS
>> +	/etc/quagga r 600 quagga quagga - - - - -
>> +	/etc/quagga d 755 quagga quagga - - - - -
> Hum, does this actually work?
Yup, unfortunately wildcards don't, and I didn't feel that adding a line 
for each daemon was appropriate. (There's one for each daemon, and it's 
only installed if that daemon is selected, hence why I need to 
effectively do a wildcard chmod here)
>
>> +	/var/run/quagga d 755 quagga quagga - - - - -
>> +endef
>> +
>>   ifeq ($(BR2_PACKAGE_QUAGGA_SNMP),y)
>>   QUAGGA_CONF_ENV += ac_cv_path_NETSNMP_CONFIG=$(STAGING_DIR)/usr/bin/net-snmp-config
>>   QUAGGA_CONF_OPTS += --enable-snmp=agentx
>> @@ -50,4 +64,10 @@ ifeq ($(BR2_arc),y)
>>   QUAGGA_CONF_OPTS += --disable-pie
>>   endif
>>   
>> +define QUAGGA_INSTALL_INIT_SYSTEMD
>> +	mkdir -p $(TARGET_DIR)/usr/lib/tmpfiles.d
> This mkdir -p is useless, as $(INSTALL) -D creates all sub-directories
> needed to be able to copy to the destination path.
Huh, thanks! I believe I copied this from somewhere else, but I'll take 
it out in the next revision.
>
>> +	$(INSTALL) -D -m 644 package/quagga/quagga_tmpfiles.conf \
>> +		$(TARGET_DIR)/usr/lib/tmpfiles.d/quagga.conf
>> +endef
>> +
>>   $(eval $(autotools-package))
>> diff --git a/package/quagga/quagga_tmpfiles.conf b/package/quagga/quagga_tmpfiles.conf
>> new file mode 100644
>> index 0000000..ad82cc6
>> --- /dev/null
>> +++ b/package/quagga/quagga_tmpfiles.conf
>> @@ -0,0 +1,2 @@
>> +d /var/run/quagga/ 1755 quagga quagga -
>> +
> Thanks!
>
> Thomas
Cheers, Nathaniel
