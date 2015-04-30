From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 01:20:08 +0200
Subject: [Buildroot] [PATCH] php: fpm sapi: install startup script
In-Reply-To: <5542A99C.5060409@je-eigen-domein.nl>
References: <1430422567-14903-1-git-send-email-bos@je-eigen-domein.nl>
 <5542901D.30403@mind.be> <5542A99C.5060409@je-eigen-domein.nl>
Message-ID: <5542B8A8.20100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/01/15 00:15, Floris Bos wrote:
> Hi,
> 
> On 04/30/2015 10:27 PM, Arnout Vandecappelle wrote:
>> On 04/30/15 21:36, Floris Bos wrote:
>>> When PHP's FastCGI Process Manager SAPI is selected:
>>>
>>> - install a startup script.
>>> - install a simple configuration, using the ondemand process manager
>>>   that only starts children when the website is actually being used.
>>  Correct me if I'm wrong, but what is still missing is the configuration of the
>> webserver to actually use this, right? You still have to update your webserver
>> configuration to point to /var/run/php-fpm.sock to handle php scripts, right?
> 
> Correct.
> Although I am thinking about submitting a subsequent patch that adds an option
> to enable it in the webserver configuration.
> 
> I know that may go against the "tradition" that buildroot only does the
> compiling, and the user has to do his own configuration.

 No, the tradition is that as much as possible it works out of the box, but in
the most simple way. As long as it is easy to customize in post-build and/or
overlay.

> But things like enabling PHP in a webserver configuration is one of those
> annoying repetitive tasks that I really like to see handled by ticking a box.

 I fully agree.

> 
>>  If so, perhaps that could be explained in the help text in php/Config.in.
>>
>>
>>  It may also be good to explain in the commit log why you don't use the provided
>> default config file
> 
> The stock php-fpm config is good for illustrative purposes only.
> It is unfit for multi-user systems, as it listens to a TCP socket with no
> authentication, allowing any local user that knows how to connect to
> 127.0.0.1:9000 to elevate privileges and execute arbitrary code as the php user.
> And it uses a pm that keeps a minimum number of PHP children resident at all
> times, making it not the best choice for embedded systems either.

 I fully agree, just thought it should be mentioned in the commit message.

> 
>>> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
>>> ---
>>>  package/php/php-fpm.conf | 14 ++++++++++++++
>>>  package/php/php.mk       | 15 +++++++++++++++
>>>  2 files changed, 29 insertions(+)
>>>  create mode 100644 package/php/php-fpm.conf
>>>
>>> diff --git a/package/php/php-fpm.conf b/package/php/php-fpm.conf
>>> new file mode 100644
>>> index 0000000..2ffe595
>>> --- /dev/null
>>> +++ b/package/php/php-fpm.conf
>>> @@ -0,0 +1,14 @@
>>> +[www]
>>> +# Only start children when there are requests to be processed
>>> +pm = ondemand
>>> +# Terminate them again after there haven't been any for 2 minutes
>>> +pm.process_idle_timeout = 120s
>>> +# Maximum number of children processing PHP requests concurrently
>>> +pm.max_children = 32
>>  Isn't that a bit high? Typically embedded web servers will not have the power
>> to handle that many parallel requests efficiently.
> 
> Some of the web applications we use feature an AJAX web interface that uses a
> form of "long polling" to poll for certain events.

 I thought long polling was exactly the opposite: close the connection and poll
again later. But I don't know about these things :-)

> That essentially ties up a PHP process per logged-in user, so I like the number
> a bit higher than usual.
> Doesn't consume much resources (at least not cpu), but does block for 29 seconds
> if no events come in.
> Also scripts that query data from external servers can block as well.
> 
> The number could be made a little lower, as not everybody does stuff like that.
> But it doesn't really harm others either, as extra children are only started if
> all the existing ones are occupied. Not by default.

 However, in a memory-constrained system (which still is one of buildroot's core
targets), it will trigger OOM when there actually are so many children.


> 
> 
>>
>>> +
>>> +listen = /var/run/php-fpm.sock
>>> +listen.owner = www-data
>>> +listen.group = www-data
>>> +user = www-data
>>> +group = www-data
>>> +
>>> diff --git a/package/php/php.mk b/package/php/php.mk
>>> index e4331f2..6c42aba 100644
>>> --- a/package/php/php.mk
>>> +++ b/package/php/php.mk
>>> @@ -251,6 +251,21 @@ PHP_CONF_OPTS += \
>>>  PHP_DEPENDENCIES += jpeg libpng freetype
>>>  endif
>>>  
>>> +ifeq ($(BR2_PACKAGE_PHP_FPM),y)
>>> +define PHP_INSTALL_INIT_SYSV
>>> +	$(INSTALL) -D -m 0755 $(@D)/sapi/fpm/init.d.php-fpm \
>>> +		$(TARGET_DIR)/etc/init.d/S49php-fpm
>>> +endef
>>  There's also a php-fpm.service that you can install for systemd.
> 
> Yes, I noticed that before submitting the patch.
> But I never had much luck with systemd on buildroot.
> 
> The .service file generated by the PHP build did not work as-is when I tried it
> this morning.
> 
> ==
> Konsole output [Unit]
> Description=The PHP FastCGI Process Manager
> After=syslog.target network.target
> 
> [Service]
> Type=simple
> PIDFile=/var/run/php-fpm.pid
> ExecStart=${exec_prefix}/sbin/php-fpm --nodaemonize --fpm-config /etc/php-fpm.conf
> ExecReload=/bin/kill -USR2 $MAINPID
> 
> [Install]
> WantedBy=multi-user.target
> ==
> 
> First problem was that systemd didn't like the ${exec_prefix}

 That should probably have been substituted away by the conf.in -> conf
conversion...

> And I am not sure if we have the syslog.target either.

 I believe journald provides that.

> 
> But another thing I noticed was that my webserver and my other custom
> applications were not starting properly with systemd anymore.
> Seems for some reason /tmp is not world-writable anymore.
> So if your application does not run as root, and wants to create a file in say
> /var/log (that links to /tmp) it fails.

 I guess whoever uses systemd will deal with that.


 Personally, I think it's worthwhile to install the service file even if it is
not working. If nobody actually uses it, there's no harm done. If someone does
use it, they're no worse off than if there was not service file. And they may
give us a patch that fixes the problem.

 Regards,
 Arnout

> Haven't yet figured out what is up with that.
> 
> 
> Yours sincerely,
> 
> Floris Bos
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
