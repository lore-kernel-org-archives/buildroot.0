From: Floris Bos <bos@je-eigen-domein.nl>
Date: Fri, 12 Sep 2014 00:18:53 +0200
Subject: [Buildroot] [PATCH 1/1] Adds ipmitool,
 a command-line interface to IPMI-enabled devices.
In-Reply-To: <20140911235734.2b609e11@free-electrons.com>
References: <1410443366-22146-1-git-send-email-bos@je-eigen-domein.nl>
 <20140911235734.2b609e11@free-electrons.com>
Message-ID: <54121FCD.9000004@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 09/11/2014 11:57 PM, Thomas Petazzoni wrote:
> Dear Floris Bos,
>
> The title of the commit should be:
>
> 	ipmitool: new package

Sorry, forgot that line in v2.

> On Thu, 11 Sep 2014 15:49:26 +0200, Floris Bos wrote:
>
>> diff --git a/package/ipmitool/Config.in b/package/ipmitool/Config.in
>> new file mode 100644
>> index 0000000..300a553
>> --- /dev/null
>> +++ b/package/ipmitool/Config.in
>> @@ -0,0 +1,17 @@
>> +config BR2_PACKAGE_IPMITOOL
>> +	bool "ipmitool"
>> +	depends on BR2_USE_MMU # fork()
>> +	select BR2_PACKAGE_OPENSSL
> This looks wrong: I was able to build the ipmitool package without
> openssl. So openssl seems like an optional dependency, not a mandatory
> one. The fact that David Bachelart was also able to build ipmitool
> without openssl seems to confirm this.

Ah, you are right.
You do can build without OpenSSL if you only want to use ipmitool to 
talk to the local BMC using the openipmi kernel driver.
This is typically used to configure it, e.g. to set an 
IP/netmask/gateway address, so the BMC can be remotely accessed.

My own usage does not involve initial configuration of a local BMC, but 
is about sending commands to the BMC of OTHER servers over the network.
This does require it.

>> +IPMITOOL_DEPENDENCIES = openssl
> So this should be handled like readline, as an optional dependency.

Ok, then I'll make an option for "lanplus interface support" in the 
configuration, that adds OpenSSL when selected.

>> +
>> +ifeq ($(BR2_PACKAGE_READLINE),y)
>> +IPMITOOL_DEPENDENCIES += readline
>> +endif
>> +
>> +ifneq ($(BR2_PACKAGE_IPMITOOL_IPMIEVD),y)
> Or, better, use positive logic:
>
> ifeq ($(BR2_PACKAGE_IPMITOOL_IPMIEVD),)

Ok



Yours sincerely,

Floris Bos
