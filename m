From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Jun 2021 10:00:27 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/usbguard: new package
In-Reply-To: <YMr7rEglLSLHV4Qs@kb-xps>
References: <20210608123210.143113-1-kamel.bouhara@bootlin.com>
 <20210608123210.143113-2-kamel.bouhara@bootlin.com>
 <d34796dd-05b2-634f-210e-bafbfa51d4ff@mind.be> <YMr7rEglLSLHV4Qs@kb-xps>
Message-ID: <4c818000-875b-9c8b-505c-aa9e15188faa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17/06/2021 09:37, Kamel Bouhara wrote:
> On Wed, Jun 16, 2021 at 11:42:49PM +0200, Arnout Vandecappelle wrote:
>>
>>
>> On 08/06/2021 14:32, Kamel Bouhara wrote:
>>> usbguard is a software framework to implement USB
>>> device blacklisting and whitelisting based on their
>>> attributes.
>>>
>>> More info. on: https://usbguard.github.io/
>>>
>>> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
>>
>>  v3 never came, but I applied to master after all. The default is deny all, so
>> that's OK. I just mentioned in the help text that rules.conf has to be created.
>>
> 
> Sorry, I've been busy lately.
> 
>> [snip]
>>> +config BR2_PACKAGE_USBGUARD
>>> +	bool "usbguard"
>>> +	depends on BR2_USE_WCHAR # glib2
>>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
>>> +	depends on BR2_USE_MMU # glib2
>>> +	depends on BR2_PACKAGE_PROTOBUF
>>
>>  The glib2 is wrong here, and the depends on protobuf should be a select (and
>> propagating its dependencies). I changed it like that.
>>
> 
> I have to admit it's another bad copy pasting but the dependencies are
> still relevant.

 What do you mean with "the dependencies are still relevant"? Do you mean that
it does depend on wchar, threads and MMU even though it doesn't select glib2? In
that case, please send a follow-up patch to add those dependencies (there should
probably already be a few autobuilder failures now that you can refer to).


> I tough the select was only reserved to libraries.

 No, there are even cases of select for runtime dependencies of programs that
are exec'd.

 But in this case: protobuf actually *is* a library. Not all libraries start
with lib - we generally follow the upstream name, which sometimes does and
sometimes doesn't have lib.


 Regards,
 Arnout

> 
>>  Applied to master with those two changes, thanks.
> 
> Ack, thanks.
> 
> Kamel
> 
>>
>>  It would be nice to add dbus support, but if someone needs that they can do it.
>>
>>  Regards,
>>  Arnout
>>
>>> +	select BR2_PACKAGE_LIBQB
>>> +	help
>>> +	  The USBGuard software framework
>>> +
>>> +	  https://usbguard.github.io/
>>> +
>>> +comment "usbguard needs a glibc toolchain w/ threads and wchar"
>>> +	depends on BR2_USE_MMU
>>> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
>>> diff --git a/package/usbguard/S20usbguard b/package/usbguard/S20usbguard
>>> new file mode 100644
>>> index 0000000000..b16d7b4aa2
>>> --- /dev/null
>>> +++ b/package/usbguard/S20usbguard
>>> @@ -0,0 +1,37 @@
>>> +#!/bin/sh
>>> +#
>>> +# Start psplash
>>> +#
>>> +
>>> +PIDFILE=/var/run/$NAME.pid
>>> +
>>> +start() {
>>> +    printf "Starting usbguard daemon: "
>>> +    test -d /var/log/usbguard || mkdir -p /var/log/usbguard
>>> +    start-stop-daemon -b -S -q -m -p $PIDFILE --exec /usr/sbin/usbguard-daemon -- -f -s -c /etc/usbguard/usbguard-daemon.conf
>>> +    [ $? = 0 ] && echo "OK" || echo "FAIL"
>>> +}
>>> +
>>> +stop() {
>>> +    printf "Stopping usbguard daemon: "
>>> +    start-stop-daemon -K -q -p $PIDFILE
>>> +    [ $? = 0 ] && echo "OK" || echo "FAIL"
>>> +}
>>> +
>>> +case "$1" in
>>> +    start)
>>> +	start
>>> +	;;
>>> +    stop)
>>> +	stop
>>> +	;;
>>> +    restart|reload)
>>> +	stop
>>> +	start
>>> +	;;
>>> +    *)
>>> +	echo "Usage: $0 {start|stop|restart}"
>>> +	exit 1
>>> +esac
>>> +
>>> +exit $?
>>> diff --git a/package/usbguard/usbguard.hash b/package/usbguard/usbguard.hash
>>> new file mode 100644
>>> index 0000000000..fd77acc75a
>>> --- /dev/null
>>> +++ b/package/usbguard/usbguard.hash
>>> @@ -0,0 +1,3 @@
>>> +# Locally calculated
>>> +sha256  5617986cd5dd1a2d311041648a1977d836cf4e33a4121d7f82599f21496abc42  usbguard-1.0.0.tar.gz
>>> +sha256  a45d0bb572ed792ed34627a72621834b3ba92aab6e2cc4e04301dee7a728d753  LICENSE
>>> diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
>>> new file mode 100644
>>> index 0000000000..72e9e6459a
>>> --- /dev/null
>>> +++ b/package/usbguard/usbguard.mk
>>> @@ -0,0 +1,50 @@
>>> +################################################################################
>>> +#
>>> +## usbguard
>>> +#
>>> +################################################################################
>>> +
>>> +USBGUARD_VERSION = 1.0.0
>>> +USBGUARD_SITE = https://github.com/USBGuard/usbguard/releases/download/usbguard-$(USBGUARD_VERSION)
>>> +USBGUARD_LICENSE = GPL-2.0+
>>> +USBGUARD_LICENSE_FILES = LICENSE
>>> +USBGUARD_CONF_OPTS= --with-bundled-catch --with-bundled-pegtl \
>>> +		    --disable-debug-build --without-dbus --without-polkit \
>>> +		    --disable-seccomp --disable-umockdev --disable-systemd
>>> +
>>> +USBGUARD_DEPENDENCIES += libqb protobuf
>>> +
>>> +ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
>>> +USBGUARD_CONF_OPTS += --with-crypto-library=openssl
>>> +USBGUARD_DEPENDENCIES += libopenssl
>>> +endif
>>> +ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
>>> +USBGUARD_CONF_OPTS += --with-crypto-library=gcrypt
>>> +USBGUARD_DEPENDENCIES += libgcrypt
>>> +endif
>>> +ifeq ($(BR2_PACKAGE_LIBSODIUM),y)
>>> +USBGUARD_CONF_OPTS += --with-crypto-library=sodium
>>> +USBGUARD_DEPENDENCIES += libsodium
>>> +endif
>>> +
>>> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>>> +USBGUARD_CONF_OPTS += --enable-systemd
>>> +USBGUARD_DEPENDENCIES += systemd
>>> +endif
>>> +
>>> +ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
>>> +USBGUARD_CONF_OPTS += --enable-seccomp
>>> +USBGUARD_DEPENDENCIES += libseccomp
>>> +endif
>>> +
>>> +ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
>>> +USBGUARD_CONF_OPTS += --enable-libcapng
>>> +USBGUARD_DEPENDENCIES += libcap-ng
>>> +endif
>>> +
>>> +define USBGUARD_INSTALL_INIT_SYSV
>>> +	$(INSTALL) -m 0755 -D package/usbguard/S20usbguard \
>>> +		$(TARGET_DIR)/etc/init.d/S20usbguard
>>> +endef
>>> +
>>> +$(eval $(autotools-package))
>>> --
>>> 2.30.2
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at busybox.net
>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> --
> Kamel Bouhara, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
> 
