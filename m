From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Jun 2016 23:29:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/quagga: Add systemd.service
 file and helper script
In-Reply-To: <a8b926ed-8d9a-ea4e-c268-dd7255ff31f9@gmail.com>
References: <1466269320-23938-1-git-send-email-nroach44@gmail.com>
 <61af7059-9ada-1f88-e03b-a6586d499d18@mind.be>
 <a8b926ed-8d9a-ea4e-c268-dd7255ff31f9@gmail.com>
Message-ID: <551c52e5-fe79-b31d-824f-177ba051575b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23-06-16 05:40, Nathaniel Roach wrote:
> [snip]
>>  So I'd skip the entire case, and instead go straight to ...
>>
>> [snip]
>>> +# Check the binary exists
>>> +if [ -e "$QUAGGA_PATH/$BINARY" ]; then
>>
>>  And this check is redundant as well. Just call it, it will error out
>> automaticaly if the binary doesn't exist.
>>
>>> +  shift # Remove the first argument (binary name)
>>> +  "$QUAGGA_PATH/$BINARY" "$@" # Run the daemon with the remaining
>> arguments
>>
>>  Is there any reason to keep the shim around? I.e., why not exec?
>> Also, the comment is quite redundant.
>>
> How about in the .service file simply ExecStart=/bin/sh -c "/usr/sbin/%i
> ..."?

 Yeah, even better. But add an exec, so

ExecStart=/bin/sh -c "exec /usr/sbin/%i ..."

Alternatively, you may be able to use

ExecStart=/usr/bin/env /usr/sbin/%i ...

BTW I would add a comment above it saying that systemd doesn't allow % to be
used in the command name, only in the arguments.

[snip]
>>> +ExecStart=/usr/sbin/quagga-shim %i --daemon $OPTS -f
> /etc/quagga/%i.conf -i /var/run/quagga/%i.pid
>>
>>  systemd prefers non-forking daemons because then it has better
> control over it.
>> Since you give a --daemon option here, I assume that they are
> perfectly capable
>> of running as a simple service. Can you give that a try?
> 
> Sure, but would systemd's preference still apply with sh/bash in between
> them?

 With exec or env, there is no intermediate (only temporarily).

> 
>>  Two more things...
>>
>> On 18-06-16 19:02, Nathaniel Roach wrote:
>>> +	$(INSTALL) -D -m 644 package/quagga/quagga at .service \
>>> +		$(TARGET_DIR)/usr/lib/systemd/system/bandwidthd.service
>>
>>  I believe it should actually be installed as quagga at .service, and then
>> symlinked from /etc.
>>
>>  I'm not so sure of this, but wouldn't it actually make sense to install all
>> services that are selected in the config? Like
>>
>> QUAGGA_SERVICES_$(BR2_PACKAGE_QUAGGA_ZEBRA) += zebra
>> QUAGGA_SERVICES_$(BR2_PACKAGE_QUAGGA_BGPD) += bgpd
>> ...
>>
>> 	$(foreach service,$(QUAGGA_SERVICES_y),\
>> 		ln -sf ../../../../usr/lib/systemd/system/quagga at .service \
>> 		
>> $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/$(service).service$(sep))
> You're right on how the service is used, except that the symlink would
> be quagga at zebra.service.

 Yes of course.

> I deliberately did not "install" the service file. If we are to do that,
> we'll also need to create environment files and empty configuration
> files for all of the selected daemons.

 OK. Perhaps mention that in the commit message.

 Regards,
 Arnout

>>
>>  Regards,
>>  Arnout
>>
> 
> Thanks,
> 
> Nathaniel
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
