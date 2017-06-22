From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Thu, 22 Jun 2017 17:14:22 +0200
Subject: [Buildroot] [PATCH] [PATCH v3] azure-iot-sdk-c: New package
In-Reply-To: <6b4945e5-9f25-f731-bb9b-c2b2c7211aa0@mind.be>
References: <1497297091-28452-1-git-send-email-nerv@dawncrow.de>
 <6b4945e5-9f25-f731-bb9b-c2b2c7211aa0@mind.be>
Message-ID: <f5b63059-ec73-e8f1-b79d-787de45fa14c@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 13.06.2017 um 00:19 schrieb Arnout Vandecappelle:
>  Hi Andre,
> 
> On 12-06-17 21:51, Andr? Hentschel wrote:
> [snip]
>> +# The project only supports building one kind of library.
>> +# Further the install target installs the wrong files, so we do it here:
>> +ifeq ($(BR2_STATIC_LIBS),y)
> 
>  I was going to say: these also have to be installed in the SHARED_STATIC case.
> But apparently CMake doesn't build a static library in the SHARED_STATIC case.
> Bummer...
> 
>> +AZURE_IOT_SDK_C_LIBS += uamqp/libuamqp.a c-utility/libaziotsharedutil.a \
>> +	iothub_client/libiothub_client.a iothub_client/libiothub_client_mqtt_ws_transport.a \
>> +	iothub_client/libiothub_client_amqp_ws_transport.a \
>> +	iothub_client/libiothub_client_http_transport.a \
>> +	iothub_client/libiothub_client_amqp_transport.a \
>> +	iothub_client/libiothub_client_mqtt_transport.a \
>> +	iothub_service_client/libiothub_service_client.a serializer/libserializer.a umqtt/libumqtt.a
>> +else
>> +AZURE_IOT_SDK_C_LIBS += uamqp/libuamqp.so c-utility/libaziotsharedutil.so \
>> +	iothub_client/libiothub_client.so iothub_client/libiothub_client_mqtt_ws_transport.so \
>> +	iothub_client/libiothub_client_amqp_ws_transport.so \
>> +	iothub_client/libiothub_client_http_transport.so \
>> +	iothub_client/libiothub_client_amqp_transport.so \
>> +	iothub_client/libiothub_client_mqtt_transport.so \
>> +	iothub_service_client/libiothub_service_client.so serializer/libserializer.so umqtt/libumqtt.so
>> +endif
>> +
>> +define AZURE_IOT_SDK_C_INSTALL_STAGING_CMDS
>> +	$(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
>> +		$(INSTALL) -D -m 0755 $(@D)/$(l) $(STAGING_DIR)/usr/lib/
>> +	)
>> +	cp -a $(@D)/c-utility/inc/* $(STAGING_DIR)/usr/include/
>> +	cp -a $(@D)/iothub_client/inc/* $(STAGING_DIR)/usr/include/
> 
>  This is not the location where the CMakeLists.txt installs the headers. Isn't
> that going to give problems when there are packages that use this library?
> 

AFAICT the CMakeLists.txt installs the totally wrong headers, what exactly do you mean here?
