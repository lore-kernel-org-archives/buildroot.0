From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 7 Jul 2010 15:11:50 -0500
Subject: [Buildroot] [PATCH] linux: rebuild after reconfiguring kernel
In-Reply-To: <20100707140932.63e1eb19@surf>
References: <201007061130.52946.hartleys@visionengravers.com>
	<20100707140932.63e1eb19@surf>
Message-ID: <0D753D10438DA54287A00B02708426976373A92CA9@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, July 07, 2010 5:10 AM, Thomas Petazzoni wrote:
> Hello!
>
> On Tue, 6 Jul 2010 11:30:52 -0700
> H Hartley Sweeten <hartleys@visionengravers.com> wrote:
>
>> diff --git a/linux/linux.mk b/linux/linux.mk
>> index 593a1b4..a014f55 100644
>> --- a/linux/linux.mk
>> +++ b/linux/linux.mk
>> @@ -139,6 +139,7 @@ linux26: host-module-init-tools $(LINUX26_DEPENDENCIES) $(LINUX26_DIR)/.stamp_in
>>  
>>  linux26-menuconfig linux26-xconfig linux26-gconfig: $(LINUX26_DIR)/.stamp_configured
>>  	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) $(subst linux26-,,$@)
>> +	$(Q)touch $@
>
> Unless I'm missing something, this change is going to create a
> linux26-menuconfig file or a linux26-xconfig file, which is not
> correct, and is not going to retrigger the build step of the kernel.

Argh... Your correct.  The .stamp_configured file is the one that needs touched.

> We are already handling the fact that the kernel should be rebuilt when
> its configuration is changed. This is done through the following
> dependency :
>
> $(LINUX26_DIR)/.stamp_compiled: $(LINUX26_DIR)/.stamp_configured $(LINUX26_DIR)/.config
>
> So, when the kernel .config is changed, the build step is restarted.
>
> Which exact issue are you facing ? Can you provide an example ?

Your correct, when the .config file is changed the kernel does rebuild.

The strange thing is, yesterday it didn't work and I haven't changed anything.
I would do:

$ make linux26-menuconfig

Change something in the config, then:

$ make

Or

$ make linux26

And the kernel would not rebuild.  But if I did:

$ touch output/build/linux-2.6.34/.stamp_configured
$ make

It would.

Oh well, it's working now...

Regards,
Hartley
