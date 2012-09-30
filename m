From: Valentine Barshak <gvaxon@gmail.com>
Date: Mon, 01 Oct 2012 00:40:33 +0400
Subject: [Buildroot] [PATCH] openvpn: Fix paths to external utilities
In-Reply-To: <5068A57A.6060703@zacarias.com.ar>
References: <20120930181104.GA2046@gmail.com>
 <5068A57A.6060703@zacarias.com.ar>
Message-ID: <5068AE41.8030809@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/01/2012 12:03 AM, Gustavo Zacarias wrote:
> On 09/30/12 15:11, Valentine Barshak wrote:
>
>> This sets paths to ifconfig, route, netstat and ip
>> in the target root filesystem.
>>
>> Otherwise the paths leak from the host and may not
>> match those on the target.
>>
>> Signed-off-by: Valentine Barshak <gvaxon@gmail.com>
>> ---
>>   package/openvpn/openvpn.mk | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
>> index 03eabcf..b7e13f5 100644
>> --- a/package/openvpn/openvpn.mk
>> +++ b/package/openvpn/openvpn.mk
>> @@ -6,7 +6,11 @@
>>
>>   OPENVPN_VERSION = 2.2.2
>>   OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
>> -OPENVPN_CONF_OPT = --enable-small --disable-plugins
>> +OPENVPN_CONF_OPT = --enable-small --disable-plugins \
>> +			--with-ifconfig-path=/sbin/ifconfig \
>> +			--with-route-path=/sbin/route \
>> +			--with-netstat-path=/bin/netstat \
>> +			--with-iproute-path=/bin/ip
>
> And what happens if i install let's say iproute2 which provides a
> nicer/bigger /sbin/ip instead of using the busybox one?
> Regards.
>

You'll be surprised to see openvpn fail to find it :)

Unless you build on the latest fedora, which has this stuff in 
/usr/sbin. So you won't see any difference, because it has failed to 
find it before.

I'll submit new version with BR2_PACKAGE_IPROUTE2 check.

Thanks,
Val.
