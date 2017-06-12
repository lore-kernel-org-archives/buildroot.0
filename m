From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Jun 2017 00:19:06 +0200
Subject: [Buildroot] [PATCH] [PATCH v3] azure-iot-sdk-c: New package
In-Reply-To: <1497297091-28452-1-git-send-email-nerv@dawncrow.de>
References: <1497297091-28452-1-git-send-email-nerv@dawncrow.de>
Message-ID: <6b4945e5-9f25-f731-bb9b-c2b2c7211aa0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Andre,

On 12-06-17 21:51, Andr? Hentschel wrote:
[snip]
> +# The project only supports building one kind of library.
> +# Further the install target installs the wrong files, so we do it here:
> +ifeq ($(BR2_STATIC_LIBS),y)

 I was going to say: these also have to be installed in the SHARED_STATIC case.
But apparently CMake doesn't build a static library in the SHARED_STATIC case.
Bummer...

> +AZURE_IOT_SDK_C_LIBS += uamqp/libuamqp.a c-utility/libaziotsharedutil.a \
> +	iothub_client/libiothub_client.a iothub_client/libiothub_client_mqtt_ws_transport.a \
> +	iothub_client/libiothub_client_amqp_ws_transport.a \
> +	iothub_client/libiothub_client_http_transport.a \
> +	iothub_client/libiothub_client_amqp_transport.a \
> +	iothub_client/libiothub_client_mqtt_transport.a \
> +	iothub_service_client/libiothub_service_client.a serializer/libserializer.a umqtt/libumqtt.a
> +else
> +AZURE_IOT_SDK_C_LIBS += uamqp/libuamqp.so c-utility/libaziotsharedutil.so \
> +	iothub_client/libiothub_client.so iothub_client/libiothub_client_mqtt_ws_transport.so \
> +	iothub_client/libiothub_client_amqp_ws_transport.so \
> +	iothub_client/libiothub_client_http_transport.so \
> +	iothub_client/libiothub_client_amqp_transport.so \
> +	iothub_client/libiothub_client_mqtt_transport.so \
> +	iothub_service_client/libiothub_service_client.so serializer/libserializer.so umqtt/libumqtt.so
> +endif
> +
> +define AZURE_IOT_SDK_C_INSTALL_STAGING_CMDS
> +	$(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
> +		$(INSTALL) -D -m 0755 $(@D)/$(l) $(STAGING_DIR)/usr/lib/
> +	)
> +	cp -a $(@D)/c-utility/inc/* $(STAGING_DIR)/usr/include/
> +	cp -a $(@D)/iothub_client/inc/* $(STAGING_DIR)/usr/include/

 This is not the location where the CMakeLists.txt installs the headers. Isn't
that going to give problems when there are packages that use this library?

 Regards,
 Arnout

> +endef
> +
> +define AZURE_IOT_SDK_C_INSTALL_TARGET_CMDS
> +	$(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
> +		$(INSTALL) -D -m 0755 $(@D)/$(l) $(TARGET_DIR)/usr/lib/
> +	)
> +endef
> +
> +$(eval $(cmake-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
