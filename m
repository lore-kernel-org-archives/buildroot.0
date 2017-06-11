From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Sun, 11 Jun 2017 23:53:44 +0200
Subject: [Buildroot] [PATCH] azure-iot-sdk-c: New package
In-Reply-To: <9904cc2a-a8d8-b3a2-bc4d-dda30196e105@mind.be>
References: <1496945304-8582-1-git-send-email-nerv@dawncrow.de>
 <9904cc2a-a8d8-b3a2-bc4d-dda30196e105@mind.be>
Message-ID: <37120af7-cab4-1758-20a3-46042eb64715@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thank you for your review!
I'm about to send v2, so here some comments inline:

Am 10.06.2017 um 14:03 schrieb Arnout Vandecappelle:
>  Hi Andr?,
> 
> On 08-06-17 20:08, Andr? Hentschel wrote:
>> From: Andr? Hentschel <andre.hentschel@zf.com>
>>
>> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> 
>  Please keep your Signed-off-by e-mail address the same as the author e-mail.

Yes, that was by mistake, done

> 
>> ---
>>  package/Config.in                          |  1 +
>>  package/azure-iot-sdk-c/Config.in          | 14 ++++++++
>>  package/azure-iot-sdk-c/azure-iot-sdk-c.mk | 52 ++++++++++++++++++++++++++++++
> 
>  Please add yourself to DEVELOPERS as well.

done

> [snip]
>> diff --git a/package/azure-iot-sdk-c/Config.in b/package/azure-iot-sdk-c/Config.in
>> new file mode 100644
>> index 0000000..a0fac8d
>> --- /dev/null
>> +++ b/package/azure-iot-sdk-c/Config.in
>> @@ -0,0 +1,14 @@
>> +config BR2_PACKAGE_AZURE_IOT_SDK_C
>> +	bool "azure-iot-sdk-c"
>> +	depends on BR2_INSTALL_LIBSTDCPP
>> +	select BR2_PACKAGE_LIBCURL
>> +	select BR2_PACKAGE_LIBXML2
>> +	select BR2_PACKAGE_OPENSSL
>> +	select BR2_PACKAGE_UTIL_LINUX
>> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>> +	help
>> +	  Microsoft Azure IoT Hub device SDK for C is used
>> +	  to connect devices running C code to Azure IoT Hub.
> 
>  Missing upstream URL. E.g.
> https://docs.microsoft.com/nl-nl/azure/iot-hub/iot-hub-device-sdk-c-intro

done

> 
>> +
>> +comment "azure-iot-sdk-c needs a toolchain w/ C++"
>> +	depends on !BR2_INSTALL_LIBSTDCPP
>> diff --git a/package/azure-iot-sdk-c/azure-iot-sdk-c.mk b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
>> new file mode 100644
>> index 0000000..79d97c1
>> --- /dev/null
>> +++ b/package/azure-iot-sdk-c/azure-iot-sdk-c.mk
>> @@ -0,0 +1,52 @@
>> +################################################################################
>> +#
>> +# azure-iot-sdk-c
>> +#
>> +################################################################################
>> +
>> +AZURE_IOT_SDK_C_VERSION = lts_03_2017
> 
>  This is a branch, not a tag. Please use 2017-03-24 instead.
> 
>  However, that branch doesn't seem to have received any commits since its
> release, so I wonder if it doesn't make more sense to use the 2017-06-02 tag.

I use 2017-05-05 now, because newer versions will need some fixes (maybe as patches), so let's start with a cleaner version that just works.

> 
>> +AZURE_IOT_SDK_C_SITE = https://github.com/Azure/azure-iot-sdk-c
>> +AZURE_IOT_SDK_C_SITE_METHOD = git
>> +AZURE_IOT_SDK_C_GIT_SUBMODULES = YES
> 
>  Argh, annoying... It looks like most of the dependencies could be packaged
> separately, but apparently parson can't :-( Oh well.
> 
> 
>> +AZURE_IOT_SDK_C_LICENSE = MIT
>> +AZURE_IOT_SDK_C_LICENSE_FILES = LICENSE
>> +AZURE_IOT_SDK_C_INSTALL_STAGING = YES
>> +AZURE_IOT_SDK_C_DEPENDENCIES = libxml2 openssl libcurl util-linux
>> +AZURE_IOT_SDK_C_CONF_OPTS = -Dskip_samples=ON
>> +
>> +AZURE_IOT_SDK_C_LIBS =
> 
>  No need.

done, good to know

> 
>> +ifeq ($(BR2_STATIC_LIBS),y)
> 
>  This should be
> ifeq ($(BR2_SHARED_LIBS),)
> 
> i.e. in the SHARED_STATIC case you also want to install the static libraries.
> 
>> +AZURE_IOT_SDK_C_LIBS += uamqp/libuamqp.a c-utility/libaziotsharedutil.a \
>> +	iothub_client/libiothub_client.a iothub_client/libiothub_client_mqtt_ws_transport.a \
>> +	iothub_client/libiothub_client_amqp_ws_transport.a \
>> +	iothub_client/libiothub_client_http_transport.a \
>> +	iothub_client/libiothub_client_amqp_transport.a \
>> +	iothub_client/libiothub_client_mqtt_transport.a \
>> +	iothub_service_client/libiothub_service_client.a serializer/libserializer.a umqtt/libumqtt.a
>> +endif # Static enabled
> 
>  Comment not needed here.
> 
>> +
>> +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> 
> ifeq ($(BR2_STATIC_LIBS),)
> 
>> +AZURE_IOT_SDK_C_LIBS += uamqp/libuamqp.so c-utility/libaziotsharedutil.so \
>> +	iothub_client/libiothub_client.so iothub_client/libiothub_client_mqtt_ws_transport.so \
>> +	iothub_client/libiothub_client_amqp_ws_transport.so \
>> +	iothub_client/libiothub_client_http_transport.so \
>> +	iothub_client/libiothub_client_amqp_transport.so \
>> +	iothub_client/libiothub_client_mqtt_transport.so \
>> +	iothub_service_client/libiothub_service_client.so serializer/libserializer.so umqtt/libumqtt.so
>> +endif # Shared enabled
>> +
>> +define AZURE_IOT_SDK_C_INSTALL_STAGING_CMDS
>> +	$(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
>> +		$(INSTALL) -D -m 0755 $(@D)/$(l) $(STAGING_DIR)/usr/lib/
>> +	)
>> +	cp -a $(@D)/c-utility/inc/* $(STAGING_DIR)/usr/include/
>> +	cp -a $(@D)/iothub_client/inc/* $(STAGING_DIR)/usr/include/
> 
>  Why are these custom commands needed? I had a quick look at the CMakeLists.txt
> and it doesn't look like it does anything special.
> 
>  If they are needed, please explain in a comment or the commit message.

Depending on the version the install target either installs only files which no one is interested in (sample libs or something) or it fails because they removed the install target


> 
>  Regards,
>  Arnout
> 
>> +endef
>> +
>> +define AZURE_IOT_SDK_C_INSTALL_TARGET_CMDS
>> +	$(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
>> +		$(INSTALL) -D -m 0755 $(@D)/$(l) $(TARGET_DIR)/usr/lib/
>> +	)
>> +endef
>> +
>> +$(eval $(cmake-package))
>>
> 
