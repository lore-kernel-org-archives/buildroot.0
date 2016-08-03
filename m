From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Wed, 3 Aug 2016 19:17:06 +0530
Subject: [Buildroot] [PATCH 1/1] gst1-plugins-bad: hls: allow user to
 select crypto backend
In-Reply-To: <20160803142925.3af9c6b7@free-electrons.com>
References: <1470226767-21018-1-git-send-email-rahul.bedarkar@imgtec.com>
 <20160803142925.3af9c6b7@free-electrons.com>
Message-ID: <57A1F5DA.9020507@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wednesday 03 August 2016 05:59 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 3 Aug 2016 17:49:27 +0530, Rahul Bedarkar wrote:
>
>> +if BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
>> +
>> +choice
>> +	prompt "choose HLS cryptographic backend"
>> +	default BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS_BACKEND_NETTLE
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS_BACKEND_LIBGCRYPT
>> +	bool "libgcrypt"
>> +	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt -> libgpg-error
>> +	select BR2_PACKAGE_LIBGCRYPT
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS_BACKEND_NETTLE
>> +	bool "nettle"
>> +	select BR2_PACKAGE_NETTLE
>> +
>> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS_BACKEND_OPENSSL
>> +	bool "openssl"
>> +	select BR2_PACKAGE_OPENSSL
>> +
>> +endchoice
>
> I'm not sure I want to see a choice for this. Could we instead have
> the .mk file automatically selected the backend according to which
> crypto package(s) are available?

HLS plugin only supports above three crypto backends. If user hasn't 
specified which backend to use then build system tries find nettle or 
libgcrypt or openssl in order. If none of the backend is available then 
HLS plugin gets disabled internally.

Automatically selecting the backend based on which crypto packages are 
available, will work only if atleast one of supported crypto packages 
are selected already. If none of the supported packages are available, 
then we may need to add dependency on one of those crypto packages in 
.mk without selecting them in Config.in. That looks like broken dependency ?

Regards,

Rahul
