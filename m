From: Nathaniel Roach <nroach44@nroach44.id.au>
Date: Sun, 8 Dec 2019 00:01:15 +0800
Subject: [Buildroot] [PATCH v2 8/9] package/network-manager: adapt to
 preset-all
In-Reply-To: <816469ae-5aa4-2c09-ee4b-80d8f684c1cd@nroach44.id.au>
References: <816469ae-5aa4-2c09-ee4b-80d8f684c1cd@nroach44.id.au>
Message-ID: <26ebed76-a543-cd7f-de37-5ce696cc182f@nroach44.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(Resending to list as my address has changed and I finally got around to 
sorting it out)

Hi Yann, J?r?my,

On 5/12/19 9:01 pm, Yann E. MORIN wrote:
> J?r?my, Nathaniel, All,
>
> On 2019-11-11 18:24 +0100, J?r?my Rosen spake thusly:
>> NM has three services
>> * NetworkManger.service : the main daemon
>> * NetworkManger-dispatcher.service : a daemon handling network callbacks
>> * NetworkManager-wait-online.service : sync of other services with 
>> network-online
>>
>> Only the first two were activated. We now also enable
>> wait-online. Not enabling it was probably a bug.
>>
>> Note that buildroot adds an alias dbus-org.freedesktop.NetworkManager
>> Adding an alias that is not known upstream is not clean,
>> but I left it for backward compatibility
> Nathaniel, do you remember why you added that alias back in the day?
> (yes, it's been 5 years now...)
>
> I was not able to find any conlusive explanations with a cursory
> duckduckgo search...
>
> Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
>
> Regards,
> Yann E. MORIN.

I couldn't tell you for certain what the reason was, but it was likely 
copied from Debian.

My current machine has it (through no manual intervention of my own):

ls -la /etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service
lrwxrwxrwx 1 root root 53 Dec 28? 2018 
/etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service -> 
/lib/systemd/system/NetworkManager-dispatcher.service

cat /etc/issue
Debian GNU/Linux 10 \n \l

I /suspect/ I also tried setting NetworkManager-wait-online.service in 
multi-user.target.wants and I think it caused a hang. If it's working 
fine now there should be no issue turning it on.


Cheers.

>> ---
>> package/network-manager/network-manager.mk | 7 -------
>> 1 file changed, 7 deletions(-)
>>
>> diff --git a/package/network-manager/network-manager.mk 
>> b/package/network-manager/network-manager.mk
>> index e913d69927..9ec205cc04 100644
>> --- a/package/network-manager/network-manager.mk
>> +++ b/package/network-manager/network-manager.mk
>> @@ -88,16 +88,9 @@ define NETWORK_MANAGER_INSTALL_INIT_SYSV
>> endef
>> define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
>> - mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>> -
>> ln -sf /usr/lib/systemd/system/NetworkManager.service \
>> $(TARGET_DIR)/etc/systemd/system/dbus-org.freedesktop.NetworkManager.service
>> - ln -sf /usr/lib/systemd/system/NetworkManager.service \
>> - 
>> $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/NetworkManager.service
>> -
>> - ln -sf /usr/lib/systemd/system/NetworkManager-dispatcher.service \
>> - 
>> $(TARGET_DIR)/etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service
>> endef
>> $(eval $(autotools-package))
>> -- 2.24.0.rc1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
