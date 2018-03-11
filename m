From: Charles Hardin <charles.hardin@storagecraft.com>
Date: Sun, 11 Mar 2018 00:15:06 +0000
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: add the macros
 to install docker-proxy
In-Reply-To: <87zi3fc1yz.fsf@dell.be.48ers.dk>
References: <20180116214046.10605-1-charles.hardin@storagecraft.com>,
 <87zi3fc1yz.fsf@dell.be.48ers.dk>
Message-ID: <D16DD98E-33CF-423C-9AF0-FF07AFF5374E@storagecraft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It got decoupled go with the other package - it supersedes this one.

Sent from my iPhone

On Mar 10, 2018, at 8:47 AM, Peter Korsgaard <peter@korsgaard.com> wrote:

>>>>>> "Charles" == Charles Hardin <ckhardin@exablox.com> writes:
> 
>> During the bringup of some of the network within the containers,
>> an error was show about missing the docker-proxy - so, add the
>> definitions to build the proxy
> 
>> Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>
> 
> Hmm, but is libnetwork bundled with the docker-engine 17.05.0-ce git
> repo? Christian Stewart recently contributed a patch for docker-proxy
> where it gets downloaded and built separately from docker-engine:
> 
> http://lists.busybox.net/pipermail/buildroot/2018-March/214923.html
> 
> What are the pro/cons here?
> 
>> ---
>> package/docker-engine/docker-engine.mk | 16 ++++++++++++++++
>> 1 file changed, 16 insertions(+)
> 
>> diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
>> index 8928f072e7..94552b1201 100644
>> --- a/package/docker-engine/docker-engine.mk
>> +++ b/package/docker-engine/docker-engine.mk
>> @@ -87,6 +87,20 @@ endef
> 
>> ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
> 
>> +define DOCKER_ENGINE_BUILD_PROXY
>> +    cd $(@D)/gopath/src/github.com/docker/docker; \
>> +        $(DOCKER_ENGINE_MAKE_ENV) \
>> +        $(HOST_DIR)/bin/go build -v \
>> +            -o $(@D)/bin/docker-proxy \
>> +            -tags "$(DOCKER_ENGINE_BUILD_TAGS)" \
>> +            -ldflags "$(DOCKER_ENGINE_GLDFLAGS) $(DOCKER_ENGINE_GLDFLAGS_$(call UPPERCASE,$(target)))" \
>> +            github.com/docker/libnetwork/cmd/proxy
>> +endef
>> +
>> +define DOCKER_ENGINE_INSTALL_PROXY
>> +    $(INSTALL) -D -m 0755 $(@D)/bin/docker-proxy $(TARGET_DIR)/usr/bin/docker-proxy
>> +endef
>> +
>> define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
>>    $(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.service \
>>        $(TARGET_DIR)/usr/lib/systemd/system/docker.service
>> @@ -113,12 +127,14 @@ define DOCKER_ENGINE_BUILD_CMDS
>>            -ldflags "$(DOCKER_ENGINE_GLDFLAGS) $(DOCKER_ENGINE_GLDFLAGS_$(call UPPERCASE,$(target)))" \
>>            github.com/docker/docker/cmd/$(target)
>>    )
>> +    $(DOCKER_ENGINE_BUILD_PROXY)
>> endef
> 
>> define DOCKER_ENGINE_INSTALL_TARGET_CMDS
>>    $(foreach target,$(DOCKER_ENGINE_BUILD_TARGETS), \
>>        $(INSTALL) -D -m 0755 $(@D)/bin/$(target) $(TARGET_DIR)/usr/bin/$(target)
>>    )
>> +    $(DOCKER_ENGINE_INSTALL_PROXY)
>> endef
> 
>> $(eval $(generic-package))
>> -- 
>> 2.14.3 (Apple Git-98)
> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> -- 
> Bye, Peter Korsgaard
> 
